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
	if ( isset($_POST['BookTitle']) || isset($_POST['Author']) || isset($_POST['Category']))
	{
		$b = mysql_real_escape_string($_POST['BookTitle']);
		$a = mysql_real_escape_string($_POST['Author']);
		$c = mysql_real_escape_string($_POST['Category']);
		
		if(strtolower($b) == "all") $sql = mysql_query("Select BookTitle, Author, Edition, Bookyear, ISBN from Books");
		else if($c != "") $sql = mysql_query("Select BookTitle, Author, Edition, Bookyear, ISBN from Books join 
		Categories using(categoryid) where categorydescription Like '$c%' ");
		else if ($b != "" && $a != "") $sql = mysql_query("Select BookTitle, Author, Edition, Bookyear, ISBN 
		From Books where Author like '$a%' or BookTitle like '$b%' ");
		else if($b == "") $sql = mysql_query("Select BookTitle, Author, Edition, Bookyear, ISBN from Books where Author like '$a%'");
		else if($a == "") $sql = mysql_query("Select BookTitle, Author, Edition, Bookyear, ISBN from Books where BookTitle like '$b%'");
		
		$found = false; 
		echo '<table id="searchbooktable">' . "\n";
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
			$found = true;
			echo '<tr class = "tablerow2"><td>';
			echo($row[0]);
			echo ('</td><td>');
			echo($row[1]);
			echo ('</td><td>');
			echo($row[2]);
			echo ('</td><td>');
			echo($row[3]);
			echo ('</td><td>');
			echo('<a href="reserve.php?ISBN='.htmlentities($row[4]).'">Reserve</a>'); 
			echo ('</td></tr>');
		}
		if(!$found) echo'<div id="message"><font color="red" size="5">Sorry, No books were found.</font><br/></div>';
		echo '</table>'; 
	}
?>

<div id="backhome"> 
	<a href="home.php"><img class="homeicon" src="images/homeicon.png" alt="homeicon"/></a></p>
</div>

<div id="bookimage"> 
	<img class="bookimage1" src="images/book3.png" alt="bookimage1.2"/></p>
</div>

<div id="SearchForm">
	<font color="red" face="arial" size="5"> Search book</font> 
	<br/><b>If you want all books from library to be displayed<br/> you have to type "all" in Search by book name section.</b>
	<form method="post"> 
		<p>By Book Name: <input type="text" name="BookTitle"></p>
		<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OR<br/>
		<p>By Author Name: <input type="text" name="Author"></p>
		<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OR<br/>
		<p>By Category: <input type="text" name="Category"></p>
		<p><input type="submit" value="Search"/> 
	</form>
</div>
</body>
</html>
