<html>
<head>
	<title>Sing up to Library</title>  
	<meta charset="UTF-8">
	<link rel="stylesheet" href="StyleSheet.css" type="text/css"/>
</head>
<body>
	<div id= "header">
		<font color="green" face="arial" size="7">Library</font>	
	</div>

	<div id="NewuserImage">
		<img class="imgnewuser" src="images/books.png" alt="newuserimg"/>
	</div>
	<div id="container2" >
		<h1>Add New User</h1>
		<form method = "post">
			<table>
			<tr><td>User Name:</td><td> <input type="text" name="Username" maxlength="20"></td></tr>
			<tr><td>Password:</td><td> <input type="password" name="Password" maxlength="20"></td></tr>
			<tr><td>Confirm Password:</td><td> <input type="password" name="ConfirmPassword" maxlength="20"></td></tr>
			<tr><td>First Name:</td><td> <input type="text" name="Firstname" maxlength="20"></td></tr>
			<tr><td>Surname:</td><td> <input type="text" name="Surname" maxlength="20"></td></tr>
			<tr><td>Address Line 1: </td><td><input type="text" name="Addressline1" maxlength="30"></td></tr>
			<tr><td>Address Line 2:</td><td> <input type="text" name="Addressline2" maxlength="20"></td></tr>
			<tr><td>City:</td><td> <input type="text" name="City" maxlength="20"></td></tr>
			<tr><td>Telephone:</td><td> <input type="text" name="Telephone" maxlength="10"></td></tr>
			<tr><td>Mobile:</td><td> <input type="text" name="Mobile" maxlength="10"></td></tr>
			<tr><td><input type="submit" value="Add User"/></td><td><a href="login.php">Cancel</a></td></tr>
			</table>
		</form>
	</div>


<?php
	require_once "db.php"; 
	if ( isset($_POST['Username']) && isset($_POST['Password']) && isset($_POST['ConfirmPassword']) 
	&& isset($_POST['Firstname'])&& isset($_POST['Surname'])&& isset($_POST['Addressline1']) 
	&& isset($_POST['Addressline2'])&& isset($_POST['City'])&& isset($_POST['Telephone']) 
	&& isset($_POST['Mobile']))
	{
		$mob = 0;
		$tel = 0;
		$u = mysql_real_escape_string($_POST['Username']);
		$p = mysql_real_escape_string($_POST['Password']);
		$cp = mysql_real_escape_string($_POST['ConfirmPassword']);
		$fn = mysql_real_escape_string($_POST['Firstname']);
		$sn = mysql_real_escape_string($_POST['Surname']);
		$ad1 = mysql_real_escape_string($_POST['Addressline1']);
		$ad2 = mysql_real_escape_string($_POST['Addressline2']);
		$c = mysql_real_escape_string($_POST['City']);
		$tel = mysql_real_escape_string($_POST['Telephone']) + 0;
		$mob = mysql_real_escape_string($_POST['Mobile']) + 0;
		
		if($u == "" || $p == "" || $cp == "" || $fn == "" || $sn == "" || $ad1 == "" || $ad2 == "" || $mob == 0) 
			{ echo '<div id="message"><font color="red" >Error: All fields have to be completed, telephone number is not mandatory</font><br/></div>'; return;}
		
		if($tel != 0 ) $sql = "Insert into Users (Username, Password, Firstname, Surname, Addressline1, Addressline2, City, Telephone, Mobile) 
								Values ('$u', '$p', '$fn', '$sn', '$ad1', '$ad2', '$c', $tel, $mob)";
		else $sql = "Insert into Users (Username, Password, Firstname, Surname, Addressline1, Addressline2, City, Mobile) 
								Values ('$u', '$p', '$fn', '$sn', '$ad1', '$ad2', '$c', $mob)";

		$result = mysql_query("Select Username From Users");
		$IsOK = true;
		$InDatabase = false;
		
		while ($row = mysql_fetch_row($result)) 
		{
			if($row[0] == $u) { $InDatabase = true; break;}
		}
		
		if($InDatabase) { echo '<div id="usermessage"><font color="red" >User already Exists, try another one</font><br/></div>'; $IsOK = false; }
		if($mob < 100000000 || $mob > 999999999) { echo '<div id="mobmessage"><font color="red" >Error: Mobile number not accepted
													</font><br/></div>'; $IsOK = false; }
		
		if($tel >= 10000000) { echo '<div id="telmessage"><font color="red" >Error: Telephone number not accepted, 
										this should be 7 digits or less. No telephone number? Leave this field empty</font></div>'; $IsOK = false; }
		
		if(($p != $cp) || (strlen($p) < 6 )) { echo '<div id="passmessage"><font color="red" >Error: 
												Password is too short or do not match</font><br/></div>'; $IsOK = false; }
		if($IsOK){ 
					mysql_query($sql); 
					session_start();
					$_SESSION['user'] = $u;
					header('Location: home.php');
					exit();
				}
	}

?>

</body>
</html>