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
	
	$sql = mysql_query("Select Reserved from Books where ISBN = '$ISBN'");
	$row = mysql_fetch_row($sql);
	if($row[0] == "Y") echo '<div id="message"><font color="red">Sorry, Book is already reserved</font><br/><a href="SearchandReserve.php">Back</a></div>';
	else 
	{
		$result1 = mysql_query("SELECT booktitle, isbn FROM Books WHERE isbn='$ISBN'");
		$row = mysql_fetch_row($result1);
		echo '<div id="confmessage">Confirm Reserving Book: '.$row[0].'<br/>'; 
		echo('<form method="post"><input type="hidden" '); 
		echo('name="isbn" value="'.htmlentities($row[1]).'">'.'<br/>'); 
		echo('<input type="submit" value="Reserve?" name="reserve">');
		echo('<a href="SearchandReserve.php">Cancel</a>');
		echo('</form></div>'); 
		
		if ( isset($_POST['reserve']) && isset($_POST['isbn']) )
		{
			$result = "Insert Into Reservations (ISBN, Username, ReservedDate) Values ('$ISBN', '$u', CURDATE())";
			mysql_query($result);
			mysql_query("Update Books Set Reserved = 'Y' where ISBN = '$ISBN'");
			echo '<div id="message">Book reserved<br/>';
			echo '<a href="SearchandReserve.php">Back</a> </div>';
		}
	}
?>
<div id="backhome"> 
	<a href="home.php"><img class="homeicon" src="images/homeicon.png" alt="homeicon"/></a></p>
</div>
</body>
</html>