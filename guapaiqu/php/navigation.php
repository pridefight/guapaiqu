<ul class="topnav">
    <li class="logo"><a class="logo" href="#"><img src='../img/logo.png' border='0' width=auto height=auto></a></li>
    <li class="firstpage"><a href="main.php">首页</a></li>
    <li>
        <a href="mypage.php">个人主页</a>
        <ul class="subnav">
            <li><a href="#">个人信息更新</a></li>
            <li><a href="showphotos.php">我的相册</a></li>
            <li><a href="#">我的挂牌</a></li>
            <li><a href="#">我的摘牌</a></li>
            <li><a href="#">我的留言</a></li>
            <li><a href="#">聊天记录</a></li>
        </ul>
    </li>
    <li><a href="about.php">关于本站</a></li>
	<p><a href="#"><?= $_SESSION['uid'] ?></a></p>
	<p><a href="logout.php">退出</a><p>
</ul>