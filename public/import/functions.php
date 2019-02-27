<?php
function getStateId($statecode) {
    global $DB;
    $sqlexe = $DB->query("select * from state where state_code='".$statecode."'");
    return $sqlexe[0]['id'];
}
function getBUId($bucode) {
    global $DB;
    $sqlexe = $DB->query("select * from business_unit where business_unit_code='".$bucode."'");
    if($sqlexe){
        return $sqlexe[0]['id'];
    } else {
        return 0;
    }
}
function division($num) {
    if($num == 0 || $num == 3) {
        return 1;
    } else {
        return 2;
    }
}
function role($role) {
    if($role == "Requester") {
        return 6;
    } else if($role == "Verifier-1" || $role == "Verifier-2") {
        return 7;
    } else if($role == "Approver-1" || $role == "Approver-2" || $role == "Approver-3") {
        return 8;
    }
}
function getPCAId($pca) {
    global $DB;
    $sqlexe = $DB->query("select * from pca where pca_code in (".$pca.")");
    $pcaid = array();
    foreach($sqlexe as $sqlexes){
        $pcaid[] = $sqlexes['id'];
    }
    return implode(',',$pcaid);
}
function getStateIdUsingPca($pcaid) {
    global $DB;
    $sqlexe = $DB->query("select * from pca where id in (".$pcaid.")");
    $pcaid = array();
    foreach($sqlexe as $sqlexes){
        $pcaid[] = $sqlexes['state_id'];
    }
    return implode(',',array_unique($pcaid));
}
function getDivisionIdUsingPca($pcaid) {
    global $DB;
    $sqlexe = $DB->query("select * from pca where id in (".$pcaid.")");
    $pcaid = array();
    foreach($sqlexe as $sqlexes){
        $pcaid[] = $sqlexes['division_id'];
    }

    return implode(',',array_unique($pcaid));
}
?>
