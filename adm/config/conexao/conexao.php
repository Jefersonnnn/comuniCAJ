<?php
	$username 		= getenv('C9_USER');
	$password 		= "";
	$hostname	 	= getenv('IP');
	$databasename   = "c9";
	$dbport = 3306;
	
	/*
	
	Hostname - $IP (The same local IP as the application you run on Cloud9)
Port - 3306 (The default MySQL port number)
User - $C9_USER (Your Cloud9 user name)
Password - "" (No password since you can only access the DB from within the workspace)
Database - c9 (The database username)
	
	*/
	
	

	//connect to database
	$mysqli = new mysqli(@$hostname, $username, $password, $databasename, $dbport) or die("MySQL: Não foi possível conectar-se ao servidor");
	
?>

