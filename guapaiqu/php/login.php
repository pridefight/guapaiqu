<?php
header("Content-Type: text/html; charset=utf-8");
session_start();

require_once  "guapai-config.php";
$uid=$_POST["username"];
$password=$_POST["passwd"];
$post_autologin = 0;
if(isset($_POST['autologin']))
{
   $post_autologin = 1;
}

if(!$uid || !$password)
{
   echo "别想黑我了，输入信息不全!";
   exit;
}

if($post_autologin == 1)  //remember me box checked, need to save cookie
{
	setcookie ('guapaiqucookie', 'usr='.$uid.'&hash='.$password, time() + (3600 * 24 * 7));
}

/*use this two to compare with the database record to see if it exist*/

$mysqli=new mysqli(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);
$result = $mysqli->query("SELECT uid FROM LoginInfo where uid = '$uid' and passwd = '$password'");
if($result->num_rows > 0)
{
   $_SESSION['uid']=$uid;
   header('Refresh: 0; URL=main.php');
}else{
   echo "用户名或密码错误!";
   header('Refresh: 0; URL=index.php');
}

$mysqli->close();
?>