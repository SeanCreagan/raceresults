<?php

	$hostname = "localhost";
	$username = "nensa";
	$password = "";
	$database = "dbnamehere";


	$conn = mysqli_connect("$hostname","$username","$password","$database") or die(mysqli_error());
	//mysqli_select_db("$database", $conn) or die(mysqli_error());

?>
