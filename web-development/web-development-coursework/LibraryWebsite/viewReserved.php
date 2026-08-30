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

	$sql = mysql_query("Select BookTitle, Author, Edition, Bookyear, ISBN from Books join Reservations using(ISBN) where username='$u'");
	echo '<table id="viewreservedbooks" border="1">' . "\n";
			echo '<tr class = "tablerow"><th>';
			echo'Book title';
			echo ('</th><th>');
			echo 'Author';
			echo ('</th><th>');
			echo 'Edition';
			echo ('</th><th>');
			echo 'Year';
			echo ('</th><th>');
			echo  'Reserve'; 
			echo ('</th></tr>');
	while ($row = mysql_fetch_row($sql)) 
		{
			echo '<tr class = "tablerow2"><td>';
			echo($row[0]);
			echo ("</td><td>");
			echo($row[1]);
			echo ("</td><td>");
			echo($row[2]);
			echo ("</td><td>");
			echo($row[3]);
			echo ("</td><td>");
			echo('<a href="remove.php?ISBN='.htmlentities($row[4]).'">Remove Reservation</a>'); 
			echo ("</td></tr>");
		}
		echo '<tr><td colspan="5"><a href="home.php">Back</a></td></tr>';
		echo '</table>';
?>
<div id="backhome"> 
	<a href="home.php"><img class="homeicon" src="images/homeicon.png" alt="homeicon"/></a></p>
</div>
</body>
</html>