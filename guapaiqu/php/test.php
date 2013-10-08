<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script src="../js/rollups/md5.js"></script>
<script src="../js/rollups/sha3.js"></script>
<script src="../js/jquery.js"></script>
<script>
$(document).ready(function(){
  $("#submit").click(function(){


	alert("Hello! I am an alert box!");
    $("#target").submit();
  });
});
</script>
</head>

<body>
<form id="target" name="target" method="post" action="">
  <label>新密码 
  <input type="text" name="newpasswd" />
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
