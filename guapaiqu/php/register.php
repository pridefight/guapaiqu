<?php
require_once  "./guapai-config.php";

/*validation*/
if(!isset($_POST["username"]) || !isset($_POST["email"]) || !isset($_POST["passwd"]) || !isset($_POST["gender"]))
{
   echo "别黑我了，你输入信息不全!";
   exit;
}


//get all passed in paremeters: uid, email, password
$uid = $_POST["username"];
$email = $_POST["email"];
$password = $_POST["passwd"];
$gender = $_POST["gender"];



//get connection to database
$mysqli=new mysqli(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);
// Check connection
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}
else{
/*try to insert into loginInfo table with these info, if failed, register failed, return 
failing message, if succeed, continue inserting a record into other tables, personInfo and personRequire
*/
$transactionFlag = FALSE;
$mysqli->autocommit(FALSE);
$insertLogFlag = $mysqli->query("INSERT INTO LoginInfo (uid, email, passwd) VALUES ('$uid','$email','$password')");
if(!$insertLogFlag)
{
   $mysqli->rollback();
   echo "注册失败,目测已经有该名字或email的用户存在!";
   exit;
}else
{
   $insertLogFlag2 = $mysqli->query("INSERT INTO PersonInfo (uid, gender, selfdescription) VALUES ('$uid', '$gender','nothing yet')");
   if(!$insertLogFlag2)
   {
      $mysqli->rollback();
	  echo "注册失败2!";
	  exit;
   }else
   {
      $insertLogFlag3 = $mysqli->query("INSERT INTO PersonRequire (uid) VALUES ('$uid')");
	  if(!$insertLogFlag3)
	  {
	     $mysqli->rollback();
		 echo "注册失败3!";
		 exit;
	  }else{
		 $transactionFlag=TRUE;
	     $mysqli->commit();
		 echo "注册成功!";
		 header('Refresh: 1; URL=index.php');
	  }
   }
}

/*close database connection*/
$mysqli->close();

//return success message
}
?>


