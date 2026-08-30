<html>
<head>  
	<meta charset="UTF-8">
	<link rel="stylesheet" href="StyleSheet.css" type="text/css"/>
</head>
<body>
	<div id= "header">
		<font color="green" face="arial" size="7">Library</font>	
	</div>
<?php
	session_start();
	$u =$_SESSION['user'];
	echo '<head><title> Hello '.$u.'</title></head>';
	echo '<div id="LoginBanner">'.$u.'<a href="logout.php"><img class="logoutimg" src="images/Log-Out-icon.png" alt="logout"/></a></div>';

?>

<div id="searchbook">
	
	<a href="SearchandReserve.php"><img class="searchBook" src="images/Search Search.png" alt="Search"/><br/>
	<font color="red" face="arial" size="5">Search and Reserve Book </font></a>
</div>
<div id="viewreserved">
	<a href="viewReserved.php"><img class="searchBook" src="images/search-engine-optimization.png" alt="Search"/><br/>
	<font color="red" face="arial" size="5">View reserved</font></a>
</div>
</body>
</html>