

function sortDropdown($sel) {
    let $options = $sel.find(`option:not(:first-child)`);
    $options.detach().sort((a, b) => {
        let at = $(a).text();
        let bt = $(b).text();
        return (at > bt) ? 1: ((at < bt) ? -1 : 0);
    });
    $options.appendTo($sel);
}
function setDropdowns(sourceSegment, targetSegment, transition) {
    $('.search .source_segment select').val(sourceSegment);
    $('.search .target_segment select').val(targetSegment);
    $('.search .transition select').val(transition);
}
function showError(e) {
    console.error(e);

    let modal = "#error";
    let $modal = $(modal);
    $modal.modal('show');

    $(`${modal} .modal-title`).text(`Error Status ${e.status}`);
    $(`${modal} .modal-body`).html(e.responseText);
    $(`${modal} .modal-body`).find("br").remove();
}
function randomTransition() {
    let $options = $('.search .transition select').find('option');
    let $random = $options.eq(~~(Math.random() * $options.length));
    $random.prop('selected', true);
    $('.search .transition select').trigger("change");
}

function sortTables() {
    $('.sort').click(function() {
        let $table = $(this).parents("table");
        let on = $table.attr("id").slice(0, -1);
        $('.sort i').remove();
        let col = $(this).index();
        let dir = $(this).attr("dir");
        if (!dir) {
            $table.find('tbody tr').sort((a, b) => {
                return $(a).find('td').eq(col).text().localeCompare($(b).find('td').eq(col).text());
            }).appendTo($table.find('tbody'));
            $(this).attr("dir", 1);
            $(this).append(`<i class='bi bi-arrow-down'></i>`);
        }
        else if (dir == 1) {
            $table.find('tbody tr').sort((a, b) => {
                return -$(a).find('td').eq(col).text().localeCompare($(b).find('td').eq(col).text());
            }).appendTo($table.find('tbody'));
            $(this).attr("dir", -1);
            $(this).append(`<i class='bi bi-arrow-up'></i>`);
        }
        else if (dir == -1) {
            $table.find('tbody tr').sort((a, b) => {
                return $(a).attr(on) - $(b).attr(on);
            }).appendTo($table.find('tbody'));
            $(this).removeAttr("dir");
            $(this).find('i').remove();
        }
    });
}


async function submitPair() {
    let transition = $(`.submit .transition input`).val();
    if (transition.includes(",")) transition = transition.split(",");
    else if (transition.includes(" → ")) transition = transition.split(" → ");
    else return;
    let [source_language, target_language] = transition;

    let headers = {
        mode: 'insert',
        table: 'pair',
        output: true,
        data: {
            source_segment: $('.submit .source_segment input').val(),
            target_segment: $('.submit .target_segment input').val(),
            source_language: source_language,
            target_language: target_language,
            environment: $('.submit .environment input').val(),
            notes: $('.submit .notes input').val(),
        }
    };
    if (!headers.data.source_segment
    ||  !headers.data.target_segment
    ||  !headers.data.source_language
    ||  !headers.data.target_language
    ) {
        return;
    }
    let result = await $get(url, headers);
    if (result) {
        await loadPairs();
        $(`[pair='${result}']`).addClass("focus")
        setTimeout(() => {
            $(`[pair='${result}']`).removeClass("focus")
        }, 2000)
    }
}
async function submitTransition() {
    let headers = {
        mode: 'insert',
        table: 'transition',
        data: {
            source_language: $('#transition .source_language input').val(),
            target_language: $('#transition .target_language input').val(),
            citation: $('#transition .citation input').val(),
        }
    };
    if (!headers.data.source_language || !headers.data.target_language) return;
    let result = await $get(url, headers);
    if (result) $("#transitions").click()
}

async function loadPairs(transition) {
    if (!transition) transition = localStorage.getItem("transition");
    let headers = {
        mode: "list",
        table: "pairs",
        data: {
            transition: transition
        }
    };
    if ($(".search .source_segment select").val()) headers.data.source_segment = $(".search .source_segment select").selected();
    if ($(".search .target_segment select").val()) headers.data.target_segment = $(".search .target_segment select").selected();
    let $table = $("#pairs tbody");
    $table.empty();
    if (!headers.data.source_segment && !headers.data.target_segment && !headers.data.transition) return;

    let rows = await $getJSON(url, headers);
    if (!rows) return;
    console.log(`${rows.size()} rows loaded`)

    $table.empty();
    rows && rows.forEach(row => {
        let $tableRow = $(jsonToTableRow(row, "pair", mode() === 'edit'));
        $table.append($tableRow);
    });

    if (mode() === "view") {
        $("#pairs tbody .source_segment, #pairs tbody .target_segment").each(function() {
            let link = `graph.html?segment=${$(this).text().replace(" → ", ",")}`;
            $(this).html(`<a href='${link}' target='_blank'>${$(this).text()}</a>`);
        });
        $("#pairs tbody .transition").each(function() {
            let link = `graph.html?transition=${$(this).text().replace(" → ", ",")}`;
            $(this).html(`<a href='${link}' target='_blank'>${$(this).text()}</a>`);
        });
    }

    if (mode() === "edit") {
        $('#pairs tbody td:not(.submit)').off("click")
        $('#pairs tbody td:not(.submit)').on("dblclick", function() {
            let $td = $(this);
            let text = $td.text();
            let $input = $(`<input class='edit' value='${text}' />`);
            if ($(this).hasClass("environment") || $(this).hasClass("notes")) {
                $input = $(`<textarea class='edit'>${text}</textarea>`);
            }
            $input.width($td.width());
            $td.html($input);
            $input.select();
            $input.dblclick(e => {
                return false;
            });
            $input.blur(async function() {
                let newText = $(this).val();
                let $tr = $(this).parents("tr");
                $td.text(newText);
                if (text !== newText) {
                    let headers = {
                        mode: "update",
                        table: "pair"
                    }
                    let transition = $tr.find('.transition').text();
                    if (transition.includes(",")) transition = transition.split(",");
                    else if (transition.includes(" → ")) transition = transition.split(" → ");
                    else return;

                    let [source_language, target_language] = transition;

                    headers.data = {
                        id: $tr.attr("pair"),
                        source_segment: $tr.find('.source_segment').text(),
                        target_segment: $tr.find('.target_segment').text(),
                        source_language: source_language,
                        target_language: target_language,
                        environment: $tr.find('.environment').text(),
                        notes: $tr.find('.notes').text(),
                    };

                    let result = await $get(url, headers);
                    if (result) loadPairs();
                }
            });
            $input.keydown(e => {
                if (e.which === 13) $input.blur();
            });
        });
    }

    // if (mode() === "view") {}
    // if (mode() === "edit") {}
}

async function loadData() {
    let headers = {mode: 'list', table: 'segments'};
    let segments = await $getJSON(url, headers);
    segments = segments.map(segment => {
        return {id: segment.id, value: segment.value};
    });
    $(".search .source_segment select").html(jsonToOptions(segments));
    $(".search .target_segment select").html(jsonToOptions(segments));

    headers = {mode: 'list', table: 'transitions'};
    let transitions = await $getJSON(url, headers);
    transitions = transitions.map(transition => {
        return {id: transition.id, value: transition.value};
    });
    $(".search .transition select").html(jsonToOptions(transitions));

    let transition = localStorage.getItem("transition");
    $(".search select").on("keyup", function(e) {
        if (e.which === 27) {
            $(this).val("").trigger("change");
        }
    })
    $(".search select").on("change", async () => {
        let transition = $(".search .transition select").find("option:selected").text();
        localStorage.setItem("transition", transition);
        loadPairs(transition);
    });
    if (transition) {
        $(".search .transition select").selectOption(transition).trigger("change");
    }

    $(".submit .transition input").focus(function() {
        $(this).val($(".search .transition select").selected()).select();
    });

    $("input").on("focus", e => {
        keyboard.setOptions({
            inputName: $(e)[0].target.id
        });
    });

    sortTables();
}
function modalFunctionality() {

    if (mode() === "edit") {
        $(document).on("click", "#pairs .plus", () => {
            submitPair();
        });
        $(document).on("keyup", "#pairs thead input", e => {
            if (e.which === 13) $('#pairs .plus').click();
        });
        $(document).on("click", "#pairs .ex", async function(e) {
            $(this).parents("tr").remove(); // doing this here since it doesn't have to wait for result

            let button = e.target;
            let id = button.getAttribute('data-bs-id');

            let headers = {mode: "remove", table: "pair", data: {id: id}};
            let result = await $get(url, headers);

            if (result) loadPairs();
        });

        $("#segmentsModal, #languagesModal").click(async function() {
            let modal = "#tagsInput";
            let $modal = $(modal);
            $modal.modal('show');
            let table = $(this).text();
            $(`${modal} .modal-title`).text(table);
            table = table.toLowerCase();
            let headers = {mode: "list", table: table};
            let entries = await $getJSON(url, headers);
            entries = JSON.stringify(entries).escapeHTML();
            $(`${modal} .modal-body`).html(`<input name='tags' id='tags' value='${entries}' data-role="tagsinput" class="form-control">`);
            table = table.slice(0, table.length-1);
            let tagInput = document.querySelector('#tags');
            let tagify = new Tagify(tagInput, {hooks: {
                beforeRemoveTag: tags => {
                    return new Promise(async (resolve, reject) => {
                        let headers = {
                            mode: "remove",
                            table: table,
                            data: {
                                id: tags[0].data.id,
                            }
                        };
                        let response = await $get(url, headers);
                        !response.includes(`Fatal error`) ? resolve() : reject()
                    })
                }
            }});
            tagify.on('add', async e => {
                let headers = {
                    mode: "insert",
                    table: table,
                    data: {
                        value: e.detail.data.value,
                    }
                };
                await $get(url, headers);
            }).on('edit:updated', async e => {
                let headers = {
                    mode: "update",
                    table: table,
                    data: {
                        id: e.detail.data.id,
                        value: e.detail.data.value,
                    }
                };
                await $get(url, hedaers);
            });

            $modal.on('hide.bs.modal', e => {
                // loadPairs();
            });
        });
    }

    $("#transitionsModal").click(async function() {
        let modal = "#tagsInput";
        let $modal = $(modal);
        $modal.modal('show');
        let table = $(this).text();
        $(`${modal} .modal-title`).text(table);
        table = table.toLowerCase();
        let headers = {mode: "list", table: table};
        let entries = await $getJSON(url, headers);
        entries = entries.map(entry => {
            let [source, target] = entry.value.split(" → ")
            return {
                id: entry.id,
                source_language: source,
                target_language: target,
                citation: entry.citation
            };
        });

        table = table.slice(0, table.length-1);

        let $transitionsTable = $(jsonToTable(entries, "transitions"));

        if (mode() === "edit") {
            $transitionsTable.find("thead").append(`<tr>
                <th><span id='transition_source_language_span'></span></th>
                <th><span id='transition_target_language_span'></span></th>
                <th><span id='transition_citation_span'></span></th>
                <th><button class='plus'></button></th>
            </tr>`);
        }

        $transitionsTable.find("thead tr").each(function() {
            $(this).prepend(`<th></th>`);
        });
        $transitionsTable.find("tbody tr").each(function() {
            $(this).prepend(`<td class=''><button class='view' transition='${$(this).attr("transition")}'></button></td>`);
        });
        $(`${modal} .modal-body`).html($transitionsTable);

        $(`${modal} .modal-body tbody`).each(function(elem, index) {
            let arr = $.makeArray($("tr", this).detach());
            arr.reverse();
            $(this).append(arr);
        });

        sortTables();

        if (mode() === "view") {
            $("#transitions tbody .source_language, #transitions tbody .target_language").each(function() {
                let link = `graph.html?language=${$(this).text()}`;
                $(this).html(`<a href='${link}' target='_blank'>${$(this).text()}</a>`);
            });
        }
        if (mode() === "edit") {
            $('#transition_source_language_span').html(`<input type='text' id='transition_source_language' />`);
            $('#transition_target_language_span').html(`<input type='text' id='transition_target_language' />`);
            $('#transition_citation_span').html(`<input type='text' id='transition_citation' />`);

            $('#transitions .plus').click(() => {
                submitTransition();
            });

            $('#transitions tbody td:not(.submit,.view-td)').off("click")
            $('#transitions tbody td:not(.submit,.view-td)').click(function() {
                let $td = $(this);
                let text = $td.text();
                let $input = $(`<input class='edit' value='${text}' />`);
                $td.html($input);
                $input.select();
                $input.click(e => {return false;});
                $input.blur(async function() {
                    let newText = $(this).val();
                    let $tr = $(this).parents("tr");
                    $td.text(newText);
                    if (text !== newText) {
                        let headers = {
                            mode: "update",
                            table: "transition"
                        }
                        headers.data = {
                            id: $tr.attr("transition"),
                            source_language: $tr.find('.source_language').text() || newText,
                            target_language: $tr.find('.target_language').text() || newText,
                            citation: $tr.find('.citation').text() || newText,
                        };
                        let result = await $get(url, headers);
                        if (result) loadPairs();
                    }
                });
                $input.keydown(e => { if (e.which === 13) $input.blur(); });
            });
        }

        $('#transitions .view').click(async function(e) {
            let transitionId = $(this).attr("transition");
            let transition = $(`.search .transition select option[value='${transitionId}']`).text();
            $(".search .transition select").val(transitionId).trigger("change");
            $modal.modal('hide');
        });

        if (mode() === "edit") {
            $('#transitions .ex').click(async e => {
                let button = e.target;
                let id = button.getAttribute('data-bs-id');
                let headers = {mode: "remove", table: "transition", data: {id: id}};
                let result = await $get(url, headers);
                if (result) $("#transitions").click();
            });
        }

        $modal.on('hide.bs.modal', e => {
            // loadPairs();
        });

    });
}
function mode() {
    return window.location.pathname.split("/").slice(-1)[0] || "view";
}
$(() => {
    $.ajaxSetup({cache: false});

    loadData();
    modalFunctionality();

    $("[rel='import']").each(async function() {
        let url = $(this).attr("href");
        let result = await $get(url);
        $(this).replaceWith(result);
    });

    $("#about").click(() => {
        let modal = "#aboutModal";
        let $modal = $(modal);
        $modal.modal('show');
        let table = $(this).text();
        $(`${modal} .modal-title`).text(table);
    });


    $(document).on("dblclick", ".environment", function() {
        $(this).toggleClass("noverflow")
    });


    $(document).on("click", "a", function() {
        if ($(this).attr("href").includes("graph.html")) {
            let $iframe = $(`<iframe src='${$(this).attr("href")}'>`) 
            // $("body").append($iframe);
            let modal = "#graphModal";
            let $modal = $(modal);
            $modal.modal('show');
            let title = $(this).text();
            $(`${modal} .modal-title`).text(title);

            $(`${modal} .modal-body`).html($iframe);

            window.addEventListener('message', e => {
                $(`${modal} .modal-title`).text(e.data);
            });

            $modal.on('hide.bs.modal', e => {
                $iframe.remove();
            });
            
            return false;
        }
    });

    let router = new Router({
        mode: 'history',
        root: 'bos',
        page404: path => {
            console.log('"/' + path + '" Page not found');
        }
    });
    router.add(`view`, () => {
        $(`[href='view']`).hide()
        $(`.submit`).hide()
        $("#keyboard, #segmentsModal, #languagesModal").hide()
    });
    router.add(`edit`, () => {
        $(`[href='edit']`).hide();
    });

    router.addUriListener();

    router.navigateTo(mode());
});