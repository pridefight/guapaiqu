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
<link href="../css/ui-lightness/jquery-ui-1.10.3.custom.css" rel="stylesheet">
<script src="../js/jquery.js"></script>
<script src="../js/galleria/galleria-1.2.9.min.js"></script>
<script src="../js/headerhover.js"></script>
<script src="../js/jquery.uploadify.min.js" type="text/javascript"></script>
<script src="../js/jquery-ui-1.10.3.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/uploadify.css">
<style>
    #galleria{
      margin:0 auto;width:100%;height:560px;border:1px solid #000; 
      background: #000 
     }
	 #addpic{
	   margin-top:10px;
	 }

</style>
<script>
$(function() {
 $( "#bulkdel-form" ).dialog({
autoOpen: false,
height: 550,
width: 600,
modal: true,
buttons: {
"删除所选": function() {
},
"取消": function() {
$( this ).dialog( "close" );
}
},
close: function() {
}
});
}
);
</script>
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
<div id="albumcontrolpan">
<div id="addpic">
<input id="file_upload" name="file_upload" value="hehe"  type="file" multiple="true">
</div>
        <script type="text/javascript">
                <?php $timestamp = time();?>
                $(function() {
                        $('#file_upload').uploadify({
                                'formData'     : {
                                        'timestamp' : '<?php echo $timestamp;?>',
                                        'token'     : '<?php echo md5('unique_salt' . $timestamp);?>',
										'user'   : '<?= $tuser ?>',
										'album'  :  'default'								
                                },
                                'swf'      : '../img/uploadify.swf',
                                'uploader' : 'uploadify.php',
								 'onUploadSuccess' :  function(file, data, response) {
                                          alert('照片上传成功！');
										  location.reload();
                                     } 
                        });
                });
        </script>
<button id="bulkdel">批量删除</button>
<script>
$( "#bulkdel" ).click(function() {
   $( "#bulkdel-form" ).dialog( "open" );
});
</script>

</div>
<div align="center" id="albumdiv">


<div id="bulkdel-form" title="选择要删除的照片">
</div>


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
 
