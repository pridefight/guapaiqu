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
<script src="../js/jquery.js">
</script>
<script src="../js/headerhover.js"></script>
</head>

<body>
<?php
include_once 'navigation.php';
?>

<div id="container">

<div id="left">

<h4>Menu</h4>

<div id="navcontainer">
<ul id="navlist">
<li id="active"><a href="#" id="current">Item one</a></li>
<li><a href="#">Item two</a></li>
<li><a href="#">Item three</a></li>
<li><a href="#">Item four</a></li>
<li><a href="#">Item five</a></li>
</ul>
</div>
</div>


<div id="right">

</div>

<div id="content">
	<h3>Dennis Ritchie</h3>
	<p>Dennis MacAlistair Ritchie (born September 9, 1941; found dead October 12, 2011)[1][2][3][4] was an American computer scientist who "helped shape the digital era."[1] He created the C programming language and, with long-time colleague Ken Thompson, the Unix operating system.[1] Ritchie and Thompson received the Turing Award from the ACM in 1983, the Hamming Medal from the IEEE in 1990 and the National Medal of Technology from President Clinton in 1999. Ritchie was the head of Lucent Technologies System Software Research Department when he retired in 2007. He was the 'R' in K&R C and commonly known by his username dmr.</p>
	<img src="content.jpg" title="Dennis Ritchie" alt="Dennis Ritchie" width="220px" height="250px" border="1px" />	<hr />	
	<h3>Early life</h3>
	<p>Ritchie was born in Bronxville, New York. His father was Alistair E. Ritchie, a longtime Bell Labs scientist and co-author of The Design of Switching Circuits on switching circuit theory. He moved with his family to Summit, New Jersey, as a child, where he graduated from Summit High School.[5]</p>
	<hr />
	<h3>Career</h3>
	<p>Ritchie graduated from Harvard University with degrees in physics and applied mathematics. In 1967, he began working at the Bell Labs Computing Sciences Research Center, and in 1968, he received a PhD from Harvard under the supervision of Patrick C. Fischer, his doctoral dissertation being "Program Structure and Computational Complexity".[6]Ritchie was best known as the creator of the C programming language, a key developer of the Unix operating system, and co-author of the book The C Programming Language, and was the 'R' in K&R (a common reference to the book's authors Kernighan and Ritchie). Ritchie worked together with Ken Thompson, the scientist credited with writing the original Unix; one of Ritchie's most important contributions to Unix was its porting to different machines and platforms.[7]The C language is widely used today in application, operating system, and embedded system development, and its influence is seen in most modern programming languages. Unix has also been influential, establishing concepts and principles that are now precepts of computing.</p>
	<hr />
	<h3>Awards</h3>
	<p>In 1983, Ritchie and Thompson received the Turing Award for their development of generic operating systems theory and specifically for the implementation of the UNIX operating system. Ritchie's Turing Award lecture was titled "Reflections on Software Research".[8] In 1990, both Ritchie and Thompson received the IEEE Richard W. Hamming Medal from the Institute of Electrical and Electronics Engineers (IEEE), "for the origination of the UNIX operating system and the C programming language".[9]In 1997, both Ritchie and Thompson were made Fellows of the Computer History Museum, "for co-creation of the UNIX operating system, and for development of the C programming language."On April 21, 1999, Thompson and Ritchie jointly received the National Medal of Technology of 1998 from President Bill Clinton for co-inventing the UNIX operating system and the C programming language which, according to the citation for the medal, "led to enormous advances in computer hardware, software, and networking systems and stimulated growth of an entire industry, thereby enhancing American leadership in the Information Age".[10][11]In 2005, the Industrial Research Institute awarded Ritchie with its Achievement Award in recognition of his contribution to science and technology, and to society generally, with his development of the Unix operating system.[12]In 2011, Ritchie, along with Thompson, was awarded the Japan Prize for Information and Communications for his work in the development of the Unix operating system.[1</p>
	<hr />
	<h3>Death and legacy</h3>
	<hr />
</div>
</div>

<div id="footer">&copy; <a href="">guapaiqu.com</a> | 喷气机出品 2013</div>



</body>
</html>
 
