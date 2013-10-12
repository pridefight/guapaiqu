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
<script src="../js/jquery.js"></script>
<script src="../js/galleria/galleria-1.2.9.min.js"></script>
<script src="../js/headerhover.js"></script>
<style>
    #galleria{
      margin:0 auto;width:63%;height:540px;border:1px solid #FFE4B5; 
      background: #FFE4B5 
     }
</style>
</head>

<body>
<?php
include_once 'navigation.php';
include_once 'guapai-config.php';
$mysqli=new mysqli(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);
$tuser=$_GET['targetuser'];
$sql = "SELECT  * FROM picmapping WHERE uid='$tuser' ORDER BY picid ASC";
$query = $mysqli->query($sql);
?>

<div id="container">
<div align="center" id="albumdiv">
        <div id="galleria">
<?php
while($row = $query->fetch_array())
{
$file = $row['photo_name'];
$album = $row['album'];
$picpath="../data/userimg/".$tuser."/".$album."/".$file;
echo "<img src='$picpath' />";
}
?>
</div>
        <script>
            Galleria.loadTheme('../js/galleria/themes/classic/galleria.classic.min.js');
            Galleria.run('#galleria');
        </script>
</div>
</div>
<div id="footer">&copy; <a href="">guapaiqu.com</a> | 喷气机出品 2013</div>


</body>
</html>
 
