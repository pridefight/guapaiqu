<?php
session_start(); 
if(isset($_SESSION['uid']))
{
  unset($_SESSION['uid']);
  //session_destroy();
}
if(isSet($_COOKIE["guapaiqucookie"]))
{
  setcookie ("guapaiqucookie", '', time() - (3600 * 24 * 7));
}
header('Refresh: 0; URL=../index.php');
?>