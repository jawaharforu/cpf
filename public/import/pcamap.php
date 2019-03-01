<?php
include 'class.mysql.pdo.php';
include 'functions.php';
global $DB;
set_include_path(get_include_path() . PATH_SEPARATOR . 'Classes/');
include 'PHPExcel/IOFactory.php';
$inputFileName = "author.xlsx";
try {
	$objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
} catch(Exception $e) {
	die('Error loading file "'.pathinfo($inputFileName,PATHINFO_BASENAME).'": '.$e->getMessage());
}
$allDataInSheet = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
$arrayCount = count($allDataInSheet);
$numberOf = 0;
for($i=2;$i<=$arrayCount;$i++){
    $aggid = explode(",",trim($allDataInSheet[$i]["A"]));
    $pca = explode(",",trim($allDataInSheet[$i]["B"]));
    $v1 = getEmpId(trim($allDataInSheet[$i]["C"]));
    $v2 = getEmpId(trim($allDataInSheet[$i]["D"]));
    $a1 = getEmpId(trim($allDataInSheet[$i]["E"]));
    $a2 = getEmpId(trim($allDataInSheet[$i]["F"]));
    $a3 = getEmpId(trim($allDataInSheet[$i]["G"]));
    $vCount = 0;
    $aCount = 0;
    $verifier = array();
    $approver = array();
    if(!empty($v1)){ $vCount++; $verifier[] = $v1; }
    if(!empty($v2)){ $vCount++; $verifier[] = $v2; }
    if(!empty($a1)){ $aCount++; $approver[] = $a1; }
    if(!empty($a2)){ $aCount++; $approver[] = $a2; }
    if(!empty($a3)){ $aCount++; $approver[] = $a3; }
    foreach($aggid as $aggrementNum) {
        $aggrementid = getaggID(trim($aggrementNum));
        foreach($pca as $pcaCode) {
            $pcaid = getPCASingleId(trim($pcaCode));
            if(!empty($pcaid)) {
                if(getPCAmapId($aggrementid, $pcaid)>0){
                    $qry = "update pca_mapping set verify='$vCount', approval='$aCount', verifier_user_id='".implode(",",$verifier)."', approver_user_id='".implode(",",$approver)."' where agreement_id='".$aggrementid."' and pca_id='".$pcaid."';";
                } else {
                    $qry = "insert into pca_mapping (agreement_id,pca_id,verify,approval,verifier_user_id,approver_user_id) values ('$aggrementid','$pcaid','$vCount','$aCount','".implode(",",$verifier)."','".implode(",",$approver)."');";
                }
                $DB->query($qry);
                echo $i." ".$numberOf++."<br>";
            }
        }
    }
}
?>
