<?php
	$drive          = "mysql";
	$username 		= getenv('C9_USER');
	$password 		= "";
	$hostname	 	= getenv('IP');
	$databasename   = "c9";

	//connect to database
	//$mysqli = new mysqli(@$hostname, $username, $password, $databasename, $dbport) or die("MySQL: Não foi possível conectar-se ao servidor");
	
	try {
	$db = new PDO($drive . ':host=' . $hostname . ';dbname=' . $databasename, $username, $password) or die("PDO: Não foi possivel conectar-se ao servidor");

	} catch (PDOException $e) {
	 print "Error!: " . $e->getMessage() . "<br/>";
	 die();
	}
