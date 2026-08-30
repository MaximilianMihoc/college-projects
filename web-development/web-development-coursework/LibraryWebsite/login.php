<html>
<head>
	<title>Library Login page</title>  
	<meta charset="UTF-8">
	<link rel="stylesheet" href="StyleSheet.css" type="text/css"/>
</head>
<body>
	<div id= "header">
		<font color="green" face="arial" size="7">Library</font>	
	</div>

	<div id="container" >
		<img class="login" src="images/login_button.png" alt="logimg"/>
		<form method = "post">
			User Name: <input type="text" name="Username">
			Password: <input type="password" name="Password">
			<input type="submit" value="Login"/>
		</form>
	</div>
	<img class="img1" src="images/user_library.png" alt="image1"/>
	<div id = "NewUser">
		<a href="AddNew.php">
			<h3>Sing Up now</h3>
			<img class="new" src="images/Crystal_Project_Add_user.png" alt="newuser1"/>
		</a>
	</div>
	<div id = "footer">
	
	</div>
	
<?php
require_once "db.php";
if ( isset($_POST['Username']) && isset($_POST['Password']) )
	{
		$u = mysql_real_escape_string($_POST['Username']);
		$p = mysql_real_escape_string($_POST['Password']); 
	
		$sql = mysql_query("Select Username, Password from Users");
		$InDatabase = false;
		while ($row = mysql_fetch_row($sql)) 
		{
			if($row[0] == $u && $row[1] == $p ) $InDatabase = true;
		}
		session_start();
		$_SESSION['user'] = $u;
		if($InDatabase) {
							header('Location: home.php');
							exit();
						}
		
		else echo '<div id="message"><font color="red" >Login fail: User or password incorrect!
					If you do not have an account yet, Sig up for free</font></div>';
		return;
	}
?>

</body>
</html>
