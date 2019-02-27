<?php
include 'class.mysql.pdo.php';
global $DB;
$uploadedStatus = 0;

if ( isset($_POST["submit"]) ) {
	if ( isset($_FILES["file"])) {
		//if there was an error uploading the file
		if ($_FILES["file"]["error"] > 0) {
			echo "Return Code: " . $_FILES["file"]["error"] . "<br />";
		}else {
			if (file_exists($_FILES["file"]["name"])) {
				unlink($_FILES["file"]["name"]);
			}
			$storagename = "discussdesk.xlsx";
			move_uploaded_file($_FILES["file"]["tmp_name"],  $storagename);
			$uploadedStatus = 1;
			header('location:/import/import.php?file='.$storagename);
		}
	} else {
		echo "No file selected <br />";
	}
}
?>
<div class="upload">
    <form action="<?php echo $_SERVER["PHP_SELF"]; ?>" method="post" enctype="multipart/form-data">
        <table style="margin: auto;">
        	<tr>
        		<td colspan="2" style="font:bold 21px arial; text-align:center; border-bottom:1px solid #eee; padding:5px 0 10px 0;"></td>
        	</tr>
        	<tr>
        		<td colspan="2" style="font:bold 15px arial; text-align:center; padding:0 0 5px 0;">Data Uploading System</td>
        	</tr>
        	<tr>
        		<td width="50%" style="font:bold 12px tahoma, arial, sans-serif; text-align:right; border-bottom:1px solid #eee; padding:5px 10px 5px 0px; border-right:1px solid #eee;">Select file</td>
        		<td width="50%" style="border-bottom:1px solid #eee; padding:5px;"><input type="file" name="file" id="file" /></td>
        	</tr>
        	<tr>
        		<td style="font:bold 12px tahoma, arial, sans-serif; text-align:right; padding:5px 10px 5px 0px; border-right:1px solid #eee;">Submit</td>
        		<td width="50%" style=" padding:5px;"><input type="submit" name="submit" /></td>
        	</tr>
        </table>
    	<?if($uploadedStatus==1){
    		echo "<table align='center'><tr><td  ><center>============================= <b>File Uploaded<b/> =============================================</center></td></tr>";
    		echo "<tr><td ><center>============================= <b>Do you want to upload the data <a href='index.php'>Click Here</a> </b>========================</center></td></tr></table>";
    	}?>
    </form>
</div>
<div class="sample" style="text-align: center;font-weight: bolder;">
    <label>Sample File: </label><br /><a href="./discussdesk.xlsx" style="text-decoration: none;">discussdesk.xlsx</a>
</div>