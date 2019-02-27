<?php
	/*
This script is use to upload any Excel file into database.
Here, you can browse your Excel file and upload it into 
your database.

Download Link: http://www.discussdesk.com/import-excel-file-data-in-mysql-database-using-PHP.htm

Website URL: http://www.discussdesk.com
*/
?>
<html>
<head>

</head>
<body>

<?php
/************************ YOUR DATABASE CONNECTION START HERE   ****************************/

include 'class.mysql.pdo.php';
global $DB;

/************************ YOUR DATABASE CONNECTION END HERE  ****************************/


set_include_path(get_include_path() . PATH_SEPARATOR . 'Classes/');
include 'PHPExcel/IOFactory.php';

// This is the file path to be uploaded.
$inputFileName = $_GET['file']; 

try {
	$objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
} catch(Exception $e) {
	die('Error loading file "'.pathinfo($inputFileName,PATHINFO_BASENAME).'": '.$e->getMessage());
}


$allDataInSheet = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
$arrayCount = count($allDataInSheet);  // Here get total count of row in that Excel sheet
function findspecific($specific){
    switch ($specific) {
        case "Onco Hematologist":
            return 4;
            break;
        case "Paediatricians":
            return 3;
            break;
        case "Paediatric ICU":
            return 3;
            break;
        case "Neurologists":
            return 2;
            break;
        case "Gynaecologist":
            return 9;
            break;
        case "Intensivists":
            return 5;
            break;
        case "Rheumatologist":
            return 7;
            break;
        case "Others":
            return 10;
            break;
        case "IVF":
            return 11;
            break;
        case "General Physicians":
            return 6;
            break;
        default:
            return 2;
    }
}
print_r($allDataInSheet);die;
for($i=2;$i<=$arrayCount;$i++){
$firstname = trim($allDataInSheet[$i]["H"]);
//$lastname = trim($allDataInSheet[$i]["F"]);
    if (strstr(trim($allDataInSheet[$i]["I"]), 'A')){
        $classification = 1;
    } else if (strstr(trim($allDataInSheet[$i]["I"]), 'B')){
        $classification = 2;
    } else if (strstr(trim($allDataInSheet[$i]["I"]), 'C')){
        $classification = 3;
    }
    $specification = findspecific(trim($allDataInSheet[$i]["J"]));
    $qualification = trim($allDataInSheet[$i]["J"]);
    $userid = trim($allDataInSheet[$i]["M"]);
    $query = "insert into doctors (first_name,last_name,doctor_class,specialty,user_id) values ('$firstname','$lastname','$classification','$specification','$userid')";
    if(!empty($firstname)){
        $DB->query($query);
        echo "Doctor: ".$firstname." ".$lastname." uploaded</br>";
    }
}

?>
<a href="/import/upload.php">Go Back</a>
<body>
</html>