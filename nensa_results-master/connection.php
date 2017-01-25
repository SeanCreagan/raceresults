<?php

	$hostname = "localhost";
	$username = "nensa";
	$password = "Mas9EiwYjqzNBcqL";
	$database = "nensa_results_2017";


	$conn = mysqli_connect("$hostname","$username","$password","$database") or die(mysqli_error());
	//mysqli_select_db("$database", $conn) or die(mysqli_error());

?>
