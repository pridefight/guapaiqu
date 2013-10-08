<?php
header("Content-Type: text/html; charset=utf-8");

require_once  "guapai-config.php";

if(isset($_POST['mailaddr']))
{
$email = $_POST['mailaddr'];
//check to see whether this email address has registered
$mysqli=new mysqli(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);  //connect to db
$result = $mysqli->query("SELECT email FROM LoginInfo where email = '$email'");
if($result->num_rows > 0)
{
   $randomstring=substr(md5(rand()), 0, 30);   //generate password reset code
   $mysqli->query("DELETE FROM passwdresetcode");
   $resetflag = $mysqli->query("INSERT INTO passwdresetcode (resetcode,email) VALUES ('$randomstring','$email')");
   if(!$resetflag)
   {
      echo "重置码生成失败！极少见的情况，再试一次！";
      exit;
   }
   $reseturlbase="http://192.168.1.106/guapaiqu/php/resetpass.php?resetcode=";
   
   $to = $email;
   $subject = "挂牌去密码重置邮件";
   $message = "您好：\n   这是来自挂牌去网站的密码重置邮件，请尽快重置密码，以保证您的安全！点击以下链接或者拷贝至浏览器地址栏进行：\n   ".$reseturlbase.$randomstring;
   $from = "guapaiqupublic@163.com";
   $headers = "From:" . $from;
   mail($to,$subject,$message,$headers);
   echo "密码重置邮件已发送至邮箱！请前往查收";  
   exit;
}
else{
   echo "该邮箱尚未注册!";
   exit;
}
}
?>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>忘记密码页</title>
</head>

<body>
<form id="target" name="passwdform" method="post" action="">
  <label>注册邮箱
  <input type="text" name="mailaddr" />
  </label>
  <p>
    <label>
    <input type="submit" name="Submit" value="提交密码重置请求" />
    </label>
  </p>
</form>
</body>
</html>

