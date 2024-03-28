<?php
error_reporting(E_ERROR);
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

include 'credentials.txt';

$mysqli = new mysqli($hostname, $username, $password, $database);

if ($_GET) {
    if ($_GET["debug"]) {
        printr($_GET);
    }
    extract($_GET);

    switch($mode) {
        case "connect":
            printr($mysqli, "$username@$hostname");
        break;
        case "tables":
            $query = "SHOW TABLES FROM $database";
            echo json_encode(get_tables());
        break;
        case "list":
            switch($table) {
                case "djs":    echo json_encode(get_djs($data));    break;
                case "events": echo json_encode(get_events($data)); break;
            }
        break;
        case "get":
            switch($table) {
                case "all":    echo json_encode(get_djs_events()); break;
                case "djs":    echo json_encode(get_dj($id));      break;
                case "events": echo json_encode(get_event($id));   break;
            }
        break;
        case "lookup":
            switch($table) {
                case "events": echo json_encode(get_events_by_dj($id)); break;
                case "djs":    echo json_encode(get_djs_by_event($id)); break;
            }
        break;
        case "dump":
            switch($format) {
                case "json": echo exportJson(); break;
                case "sql":  echo exportSql(); break;
                case "csv":  echo exportCsv(); break;
            }
        break;
        default: break;
    }
}
function preg_replace_all($find, $repl, $text) {
    while (preg_match($find, $text)) {
        $text = preg_replace($find, $repl, $text);
    }
    return $text;
}
function log_reads($output) {
    $timestamp = date('Y/m/d H:i:s');
    $output = preg_replace("/[\s]+/", " ", $output);
    file_put_contents("log/history-reads.log", "$timestamp\t$output\n", FILE_APPEND);
}
function log_writes($output) {
    $timestamp = date('Y/m/d H:i:s');
    $output = preg_replace("/[\s]+/", " ", $output);
    file_put_contents("log/history-writes.log", "$timestamp\t$output\n", FILE_APPEND);
}
function exportJson() {
    $export = [];
    $export[] = [
        "type" => "database",
        "name" => 'bos'
    ];
    $tables = get_tables();
    foreach($tables as $table) {
        $data = get_query("select * from $table");
        $export[] = [
            "type" => "table",
            "database" => 'bos',
            "table" => $table,
            "data" => $data
        ];
    }
    header('Content-type: Application/JSON');
    return json_encode($export, JSON_PRETTY_PRINT);
}
function exportSql($tables=false, $backup_name=false) {
    GLOBAL $mysqli;
    $mysqli->query("SET NAMES 'utf8'");

    $queryTables = $mysqli->query('SHOW TABLES');
    while($row = $queryTables->fetch_row()) $target_tables[] = $row[0];

    if ($tables !== false) $target_tables = array_intersect($target_tables, $tables);
    foreach ($target_tables as $table) {
        $result        = $mysqli->query('SELECT * FROM '.$table);
        $fields_amount = $result->field_count;
        $rows_num      = $mysqli->affected_rows;
        $res           = $mysqli->query('SHOW CREATE TABLE '.$table);
        $TableMLine    = $res->fetch_row();
        $content       = (!isset($content) ? '' : $content) . "\n\n".$TableMLine[1].";\n\n";

        for ($i = 0, $st_counter = 0; $i < $fields_amount; $i++, $st_counter=0) {
            while ($row = $result->fetch_row()) {
                if ($st_counter % 100 == 0 || $st_counter == 0) {
                    $content .= "\nINSERT INTO ".$table." VALUES";
                }
                $content .= "\n(";
                for ($j = 0; $j < $fields_amount; $j++) {
                    $row[$j] = str_replace("\n", "\\n", addslashes($row[$j]));
                    if (isset($row[$j])) $content .= '"'.$row[$j].'"';
                    else $content .= '""';
                    if ($j < ($fields_amount - 1)) $content.= ',';
                }
                $content .= ")";
                if ((($st_counter + 1) % 100 == 0 && $st_counter != 0) || $st_counter + 1 == $rows_num) $content .= ";";
                else $content .= ",";
                $st_counter = $st_counter + 1;
            }
        }
        $content .= "\n\n";
    }
    $backup_name = $backup_name ? $backup_name : "bos.sql";
    header('Content-Type: application/octet-stream');
    header("Content-Transfer-Encoding: Binary");
    header("Content-disposition: attachment; filename=\"".$backup_name."\"");
    return $content;
}
function exportCsv($tables=false, $backup_name=false) {
    GLOBAL $mysqli;
    $mysqli->query("SET NAMES 'utf8'");

    $queryTables = $mysqli->query('SHOW TABLES');
    while($row = $queryTables->fetch_row()) $target_tables[] = $row[0];

    if ($tables !== false) $target_tables = array_intersect($target_tables, $tables);
    $content = "";

    foreach ($target_tables as $table) {
        $result = $mysqli->query('SELECT * FROM '.$table);

        $content .= "$table\n";
        for ($i = 0; $i < $result->field_count; $i++) {
            while ($row = $result->fetch_row()) {
                for ($j = 0; $j < $result->field_count; $j++) {
                    $row[$j] = str_replace("\n", "\\n", addslashes($row[$j]));
                    if (isset($row[$j])) $content .= '"'.$row[$j].'"';
                    else $content .= '""';
                    if ($j < ($result->field_count - 1)) $content.= ',';
                }
                $content .= "\n";
            }
        }
        $content .= "~~~~~~~\n";
    }
    $backup_name = $backup_name ? $backup_name : "diachron.csv";
    header("Content-Description: File Transfer");
    header("Content-disposition: attachment; filename=\"".$backup_name."\"");
    header("Content-Type: application/csv;");
    return $content;
}
function sanitize($query) {
    // not sure how useful this actually is
    GLOBAL $mysqli;
    return strip_tags(htmlspecialchars($mysqli->real_escape_string(trim($query))));
}
function get_query($query) {
    GLOBAL $mysqli, $debug;
    if ($debug) echo "$query<br>";
    // $query = sanitize($query);
    log_reads($query);
    $result = $mysqli->query($query) or die($mysqli->error);
    while($row = $result->fetch_assoc()) $results[] = $row;
    return $results;
}
function do_query($query) {
    GLOBAL $mysqli, $debug;
    if ($debug) echo "$query<br>";
    // $query = sanitize($query);
    log_writes($query);
    $mysqli->query($query) or die($mysqli->error);
    return $mysqli;
}
function reset_database() {
    $query = "SET FOREIGN_KEY_CHECKS = 0";
    do_query($query);
    $query = "TRUNCATE djs";
    do_query($query);
    $query = "TRUNCATE events";
    do_query($query);
    $query = "TRUNCATE djs_events";
    do_query($query);
    $query = "SET FOREIGN_KEY_CHECKS = 1";
    do_query($query);
}
function array_multisearch($arr, $source, $target) {
    foreach ($arr as $key => $val) {
        if ($val['data']['source'] === $source and $val['data']['target'] === $target) {
            return $key;
        }
    }
}
function count_tables() {
    GLOBAL $database;
    $query = "SHOW TABLES FROM $database;";
    return count(get_query($query));
}
function get_tables() {
    GLOBAL $database;
    $query = "SHOW TABLES FROM $database;";
    foreach(get_query($query) as $row) {
        $results[] = $row["Tables_in_$database"];
    }
    return $results;
}

function get_djs($data=null) {
    $query = "SELECT * from djs";
    return get_query($query);
}
function get_events($data=null) {
    $query = "SELECT * from events";
    return get_query($query);
}
function get_dj($id) {
    $query = "SELECT * from djs WHERE id=$id";
    return get_query($query);
}
function get_event($id) {
    $query = "SELECT * from events WHERE id=$id";
    return get_query($query);
}
function get_djs_events() {
    $query = "SELECT *
FROM djs
INNER JOIN djs_events
ON djs.id = djs_events.dj_id
INNER JOIN events
on events.id = djs_events.event_id";
    return get_query($query);
}
function get_djs_by_event($id) {
    $query = "SELECT djs.*
FROM djs
INNER JOIN djs_events
ON djs.id = djs_events.dj_id
INNER JOIN events
ON events.id = djs_events.event_id
WHERE events.id = $id";
    return get_query($query);
}
function get_events_by_dj($id) {
    $query = "SELECT events.*
FROM djs
INNER JOIN djs_events
ON djs.id = djs_events.dj_id
INNER JOIN events
ON events.id = djs_events.event_id
WHERE djs.id = $id";
    return get_query($query);
}

function printr() {
    foreach (func_get_args() as $i) {
        if (is_array($i) || is_object($i)) {echo "<pre>";  print_r($i); echo "</pre>";}
        else {print_r($i); echo "\t";}
    }
    echo "\n<br>";
}
?>