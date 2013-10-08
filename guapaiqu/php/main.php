<?php
header("Content-Type: text/html; charset=utf-8");
session_start(); 
if(!isset($_SESSION['uid']))
{
include_once 'autologin.php';
}
if(!isset($_SESSION['uid']))
{
   header('Refresh: 1; URL=index.php');
   exit;
}
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>挂牌去首页</title>
<link rel="stylesheet" href="../css/header.css" type="text/css" />
<link rel="stylesheet" href="../css/mainbody.css" type="text/css" />
<style>
#mainbody{
   margin-top: 50px;
   position: absolute;
}
</style>
<script src="../js/jquery.js">
</script>
<script src="../js/headerhover.js"></script>
</head>

<body>
<?php
include_once 'navigation.php';
?>

<div id="mainbody">
   <a href="testpage2.php">转到页面2</a>
</div>

<div id="footer">&copy; <a href="">guapaiqu.com</a> | 喷气机出品 2013</div>

</body>
</html>
 