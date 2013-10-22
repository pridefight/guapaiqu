<?php
/*
Uploadify
Copyright (c) 2012 Reactive Apps, Ronnie Garcia
Released under the MIT License <http://www.opensource.org/licenses/mit-license.php> 
*/
require_once  "guapai-config.php";
function getRandomString($length = 20 ) {
        $validCharacters = "abcdefghijklmnopqrstuxyvwzABCDEFGHIJKLMNOPQRSTUXYVWZ1234567890_";
        $validCharNumber = strlen($validCharacters);
        $result = "";
        for ($i = 0; $i < $length; $i++) {
            $index = mt_rand(0, $validCharNumber - 1);
            $result .= $validCharacters[$index];
        }
        return $result;
}


// Define a destination
$targetFolder = '/uploads'; // Relative to the root

$verifyToken = md5('unique_salt' . $_POST['timestamp']);

$targetuid= $_POST['user'];
$album= $_POST['album'];

$mysqli=new mysqli(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);


if (!empty($_FILES) && $_POST['token'] == $verifyToken) {
	$tempFile = $_FILES['Filedata']['tmp_name'];
//	$targetPath = $_SERVER['DOCUMENT_ROOT'] . $targetFolder;
	$targetPath = '../data/userimg/'.$targetuid.'/'.$album;
//	$targetFile = rtrim($targetPath,'/') . '/' . $_FILES['Filedata']['name'];
	
	// Validate the file type
	$fileTypes = array('jpg','jpeg','gif','png'); // File extensions
	$fileParts = pathinfo($_FILES['Filedata']['name']);
	
	if (in_array($fileParts['extension'],$fileTypes)) {
	    $randfilename=getRandomString().'.'.$fileParts['extension'];
	    $newtargetFile=rtrim($targetPath,'/') . '/' . $randfilename;
	    while(file_exists($newtargetFile))
		{
		   $randfilename=getRandomString().'.'.$fileParts['extension'];
		   $newtargetFile=rtrim($targetPath,'/') . '/' . $randfilename;
		}
		//upload file to folder
		$rval  = move_uploaded_file($tempFile,$newtargetFile);
		//insert database record
		if($rval){
		$date = date("Y-m-d H:i:s");
		$result = $mysqli->query("INSERT INTO picmapping (uid, album, photo_name, date_added ) VALUES('$targetuid','$album','$randfilename', '$date')");
        if($result)
		{
	       echo '1';
		}else{
		   echo '0';
		}
		}
		else{
		   echo '0';
		}
	} else {
		echo 'Invalid file type.';
	}
}else{
   echo 'Empty input';
}
?>
