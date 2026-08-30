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
	echo '<div id="LoginBanner">'.$u.'<a href="logout.php"><img class="logoutimg" src="images/Log-Out-icon.png" alt="logout"/></a></div>';
	echo '<head><title> Hello '.$u.'</title></head>';

	require_once "db.php";
	$ISBN = mysql_real_escape_string($_GET['ISBN']);
	
	$result1 = mysql_query("SELECT booktitle, isbn FROM Books WHERE isbn='$ISBN'");
	$row = mysql_fetch_row($result1);
	echo '<div id="confmessage">Confirm Remove reservation of Book: '.$row[0].'<br/>'; 
	echo('<form method="post"><input type="hidden" '); 
	echo('name="isbn" value="'.htmlentities($row[1]).'">'.'<br/>'); 
	echo('<input type="submit" value="Remove?" name="remove">');
	echo('<a href="viewReserved.php">Cancel</a>');	
	echo('</form></div>');
	
	if ( isset($_POST['remove']) && isset($_POST['isbn']) )
	{
		mysql_query("Update Books Set Reserved = 'N' where ISBN = '$ISBN'");
		mysql_query("Delete from Reservations where ISBN = '$ISBN' AND Username='$u'");
		
		echo '<div id="message">The reservation has been removed<br/><a href="viewReserved.php">Back</a></div>';
	}
?>
<div id="backhome"> 
	<a href="home.php"><img class="homeicon" src="images/homeicon.png" alt="homeicon"/></a></p>
</div>
</body>
</html>
