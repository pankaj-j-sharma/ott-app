<?php
ini_set('max_execution_time', 0);
error_reporting(0);
if (isset($_POST) and $_SERVER['REQUEST_METHOD'] == "POST") {

    $path = "uploads/"; //set your folder path
    $apk_local="app.apk";

    $tmp = $_FILES['apk_file']['tmp_name'];
	error_log("Uploaded file name :: " . $tmp);
		if (move_uploaded_file($tmp, $path.$apk_local)) 
		{ //check if it the file move successfully.
			error_log('http://'.$_SERVER['SERVER_NAME'] . dirname($_SERVER['REQUEST_URI']). '/uploads/app.apk');
		} else {
			error_log("Failed" . print_r($_FILES["apk_file"]["error"],true));
			echo "failed";
		}
    exit;
}