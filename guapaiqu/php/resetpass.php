<?php
header("Content-Type: text/html; charset=utf-8");
require_once  "guapai-config.php";
$resetcode="";
$email="";
if(isset($_GET['resetcode']))
{
  $resetcode = $_GET['resetcode'];
  $mysqli=new mysqli(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);  //connect to db
  $result = $mysqli->query("SELECT email FROM passwdresetcode where resetcode = '$resetcode'");
  if($result->num_rows > 0)
  {
	while($row = $result->fetch_array())
	{
	    $email = $row['email'];
	}  
    if(isset($_POST['newpasswd']))
	{
	   $newpass = $_POST['newpasswd'];
	   $updateflag = $mysqli->query("UPDATE LoginInfo SET passwd='$newpass' WHERE email='$email'");
	   if($updateflag)
	   {
	      echo "密码更新成功！";
		  $deleteflag = $mysqli->query("DELETE FROM passwdresetcode WHERE resetcode='$resetcode'");
		  if($deleteflag)
		  {
		     echo "数据库复原成功!";
		  }
		  header('Refresh: 1; URL=index.php');
		  exit;
	   }
	   else
	   {
	      echo "密码更新失败!";
		  header('Refresh: 1; URL=index.php');
		  exit;
	   }
	}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>更新密码</title>
<script src="../js/rollups/md5.js"></script>
<script src="../js/rollups/sha3.js"></script>
<script src="../js/jquery.js"></script>
<script>
$(document).ready(function(){
  $("#submit").click(function(){
    var password = $('[name=newpasswd]').val();
	var hash = CryptoJS.MD5(password);
    $('[name=newpasswd]').val(hash);
    $("#target").submit();
  });
});
</script>
</head>

<body>
<form id="target" name="uppassform" method="post" action="">
  <label>新密码 
  <input type="password" name="newpasswd" />
  </label>
  <p>
    <label>重复新密码
    <input type="password" name="renewpasswd" />
    </label>
  </p>
  <p>
    <label>
    <input type="submit" id="submit" name="submit" value="更新密码" />
    </label>
  </p>
</form>
</body>
</html>

<?php
  }
  else{
     echo "该链接已失效!";
	 exit;
  }
}
else{
echo "您没有权限访问本页面!";
exit;
}
?>