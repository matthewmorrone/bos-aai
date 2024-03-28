Object.defineProperty(Object.prototype, "define", {
    configurable: true,
    enumerable: false,
    writable: true,
    value: function(name, value) {
        if (Object[name]) {
            delete Object[name];
        }
        Object.defineProperty(this, name, {
            configurable: true,
            enumerable: false,
            writable: true,
            value: value
        });
        return this;
    }
});
Object.prototype.define("map", function(mapFn) {
    let object = this;
    return Object.keys(object).reduce(function(result, key) {
        result[key] = mapFn(object[key]);
        return result;
    }, {});
});
Object.prototype.define("size", function() {
    return Object.keys(this).length;
});
Object.prototype.define("each", function(fn) {
    for (let k in this) {
        fn && this.hasProperty(k) && fn.call(this, this[k], k);
    }
    return this;
});
Array.prototype.define("each", Array.prototype.forEach)
String.prototype.define('toTitleCase', function() {
    return this.replace(/\w\S*/g, function (txt) {
        return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
    });
});
String.prototype.define('escapeHTML', function() {  
    let replacements = {"<": "&lt;", ">": "&gt;", "&": "&amp;", "'": "&apos;", "\"": "&quot;"};                      
    return this.replace(/[<>&'"]/g, function(character) {  
        return replacements[character];  
    }); 
});
log = console.log.bind(console);
$.fn.selected = function() {
    return $(this).find("option:selected").text();
}
$.fn.byValue = function(text) {
    return $(this).find("option").filter(function() {
        return $(this).text() === text;
    });
}
$.fn.selectOption = function(text) {
    return $(this).byValue(text).prop('selected', true);
}
function get() {
    let qs = document.location.search;
    qs = qs.split('+').join(' ');
    let params = {}, tokens, re = /[?&]?([^=]+)=([^&]*)/g;
    while (tokens = re.exec(qs)) {
        params[decodeURIComponent(tokens[1])] = decodeURIComponent(tokens[2]);
    }
    return params;
}
async function $get(url, data) {
    let result = false;
    try {
        result = await $.get(url, data);
    }
    catch(e) {
        console.error(e);
    }
    return result;
}
async function $getJSON(url, data) {
    let result = false;
    try {
        result = await $.getJSON(url, data);
    }
    catch(e) {
        console.error(e);
    }
    return result;
}



function jsonToOptions(options, id) {
    let result = `<option></option>`;
    options.forEach(option => {
        let [key, val] = [option.id, option.value];
        result += `<option value='${key}'>${val}</option>`;
    });
    return result;
}
function jsonToTable(data, id) {
    let result = ``;
    result += `<table class="table" id='${id}'>`;
    result += `<thead>`;
    result += `<tr>`;
    for (let key in data[0]) {
        if (key === 'id') continue;
        result += `<th class='sort'>${key.replace(/_/g, ' ').toTitleCase()}</th>`;
    }
    result += `<th class='submit'></th>`;
    result += `</tr>`;
    result += `</thead>`;
    result += `<tbody>`;
    for (let  i = 0; i < data.length; i++) {
        result += `<tr ${id.slice(0, id.length-1)}='${data[i]['id']}'>`;
        for (let key in data[i]) {
            if (key === 'id') continue;
            result += `<td class=${key}>${data[i][key]}</td>`;
        }
        result += `</tr>`;
    }
    result += `</tbody>`;
    result += `</table>`;
    return result;
}
function jsonToSelect(options, id) {
    let result = `<select id='${id}'>`;
        result += `<option></option>`;
    options.forEach(option => {
        let [key, val] = [option.id, option.value];
        result += `<option value='${key}'>${val}</option>`;
    });
    result += '</select>';
    return result;
}
function jsonToDataList(options, id) {
    let result = `<input type=text name=${id} list=${id} />`;
        result += `<datalist id='${id}'>`;
    options.forEach(option => {
        let [key, val] = [option.id, option.value];
        result += `<option data-id='${key}'>${val}</option>`;
    });
    result += '</datalist>';
    return result;
}
function jsonToTableRow(data, id, ex) {
    let result = `<tr ${id}='${data['id']}'>`;
    for (let key in data) {
        if (key === 'id') continue;
        result += `<td class='${key} noverflow'>${data[key]}</td>`;
    }
    if (ex) {
        result += `<td class='submit'><button class='ex' data-bs-id="${data['id']}"></button></td>`;
    }
    result += `</tr>`;
    return result;
}

function download(filename, text) {
    let element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
    element.setAttribute('download', filename);
    element.style.display = 'none';
    document.body.appendChild(element);
    element.click();
    document.body.removeChild(element);
}
async function exportData(format) {
    if (!format) return false;
    let headers = {mode: 'dump', format: format};
    if (format === 'json') {
        let data = await $getJSON(url, headers);
        download("bos.json", JSON.stringify(data));
    }
    if (format === 'sql') {
        let data = await $get(url, headers);
        download("bos.sql", data);
    }
    if (format === 'csv') {
        let data = await $get(url, headers);
        data = data.trim();
        data = data.split("~~~~~~~");

        const zip = new JSZip();
        const folder = zip.folder("bos");

        data.forEach(datum => {
            datum = datum.trim();
            datum = datum.split("\n");
            let filename = datum[0]+".csv";
            let contents = datum.slice(1).join("\n");
            if (!filename || !contents) return;
            folder.file(filename, contents);
        });

        zip.generateAsync({type: "blob"}).then(content => {
            saveAs(content, "bos.zip");
        });
    }
}
