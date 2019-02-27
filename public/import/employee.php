<?php
include 'class.mysql.pdo.php';
include 'functions.php';
global $DB;
set_include_path(get_include_path() . PATH_SEPARATOR . 'Classes/');
include 'PHPExcel/IOFactory.php';
$inputFileName = "employe.xlsx";
try {
	$objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
} catch(Exception $e) {
	die('Error loading file "'.pathinfo($inputFileName,PATHINFO_BASENAME).'": '.$e->getMessage());
}
$allDataInSheet = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
$arrayCount = count($allDataInSheet);
$em = array();
for($i=2;$i<=$arrayCount;$i++){
    $empid = trim($allDataInSheet[$i]["A"]);
    $empname = trim($allDataInSheet[$i]["B"]);
    $email = trim($allDataInSheet[$i]["C"]);
    $role = role(trim($allDataInSheet[$i]["D"]));
    $pca = getPCAId(trim($allDataInSheet[$i]["E"]));
    if(!empty($pca)){
        $division = getDivisionIdUsingPca($pca);
        $state = getStateIdUsingPca($pca);
    } else {
        $em[] = $empid;
    }
    $passwprd = '$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi';
    $query = "insert into cms_users (employeeid,name,email,id_cms_privileges,division_id,state_id,pca_id,password) values ('$empid','$empname','$email','$role','$division','$state','$pca','$passwprd');";
    if(!empty($pca)){
        //$DB->query($query);
        echo $query."</br>";
    }
}
echo "<pre>";print_r($em);echo "</pre>";
?>
