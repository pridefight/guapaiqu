<?php
$to = "fengchang_fight@126.com";
$subject = "Test mail";
$message = "Hello! This is a simple email message.";
$from = "guapaiqupublic@163.com";
$headers = "From:" . $from;
mail($to,$subject,$message,$headers);
echo "Mail Sent.";
?>