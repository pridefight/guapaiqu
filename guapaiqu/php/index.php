<?php
session_start();

if(!isset($_SESSION['uid']))
{
include_once 'autologin.php';
}

if(isset($_SESSION['uid']))
{
  header('Refresh: 0; URL=main.php');
  exit;
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>挂牌去首页</title>
<link rel="stylesheet" type="text/css" href="../css/loginpagestyle.css" />
<script src="../js/rollups/md5.js"></script>
<script src="../js/rollups/sha3.js"></script>
<script src="../js/jquery.js"></script>
<script src="../js/jquery.validate.min.js"></script>
<script>
(function($,W,D)
{
    var JQUERY4U = {};

    JQUERY4U.UTIL =
    {
        setupFormValidation: function()
        {
            //form validation rules
            $("#target").validate({
                rules: {
                    username: "required",
                    passwd: {
                        required: true,
                        minlength: 6
                    }
                },
                messages: {
                    username: "请输入用户名",
                    passwd: {
                        required: "请输入一个密码",
                        minlength: "密码需至少6位长"
                    }
                }
            });
        }
    }

    //when the dom has loaded setup form validation rules
    $(D).ready(function($) {
	    
        JQUERY4U.UTIL.setupFormValidation();
    });

})(jQuery, window, document);
$(document).ready(function(){
  $("#reg").click(function(){
    var url = "../html/register.html";    
    $(location).attr('href',url);
	$( "#target" ).submit(function( event ) {
      event.preventDefault();
    });
  });
  
  $("#submit").click(function(){
    var loginform = $( "#target" );
	if(loginform.valid()){
      var password = $('[name=passwd]').val();
	  var hash = CryptoJS.MD5(password);
      $('[name=passwd]').val(hash);
      $("#target").submit();
	}else{
			    alert("输入不合法");
	}
  });
});
</script>
</head>
<body>
<section class="login">
	<div class="titulo">快来挂牌，速度摘牌！</div>
	<form action="../php/login.php" id="target" method="post" enctype="application/x-www-form-urlencoded">
    	<input type="text" name="username" required title="用户名为必须" placeholder="用户名" data-icon="U">
        <input type="password" name="passwd" required title="密码为必须" placeholder="密码" data-icon="x">
	    <div class="aut">
         <label>
           <input type="checkbox" name="autologin" value="1" />
           下次自动登录
	     </label>
        </div>
        <div class="olvido">
        	<div class="col"><a href="#" name="register" title="用户注册" id="reg">注册</a></div>
            <div class="col"><a href="forgotpasswd.php" title="重置密码">忘记密码?</a></div>
        </div>

      <a id="submit" href="#" class="enviar" title="用户登陆">登陆</a>
    </form>
</section>
</body>
</html>
