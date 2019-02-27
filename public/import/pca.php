<?php
include 'class.mysql.pdo.php';
include 'functions.php';
global $DB;
set_include_path(get_include_path() . PATH_SEPARATOR . 'Classes/');
include 'PHPExcel/IOFactory.php';
$inputFileName = "pca.xlsx";
try {
	$objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
} catch(Exception $e) {
	die('Error loading file "'.pathinfo($inputFileName,PATHINFO_BASENAME).'": '.$e->getMessage());
}
$allDataInSheet = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
$arrayCount = count($allDataInSheet);
for($i=2;$i<=$arrayCount;$i++){
    $pcacode = trim($allDataInSheet[$i]["A"]);
    $pcaname = trim($allDataInSheet[$i]["B"]);
    $bu = getBUId(trim($allDataInSheet[$i]["C"]));
    $state = getStateId(trim($allDataInSheet[$i]["D"]));
    $division = division(trim($allDataInSheet[$i]["E"]));
    $query = "insert into pca (pca_name,division_id,state_id,business_unit_id,pca_code) values ('$pcaname','$division','$state','$bu','$pcacode');";
    //if(!empty($bu)){
        //$DB->query($query);
        echo $query."</br>";
    //}
}
?>
