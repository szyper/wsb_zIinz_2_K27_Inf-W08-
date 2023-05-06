<?php
session_start();

foreach ($_POST as $value){
	if (empty($value)){
		$_SESSION["error"] = "Wypełnij wszystkie pola!";
		echo "<script>history.back();</script>";
		exit();
	}
}


require_once "./connect.php";

try {
	$stmt = $conn->prepare("");

	$stmt->bind_param("", );

	$stmt->execute();

//	if ($stmt->affected_rows  == 1){
//		$_SESSION["success"] = "Prawidłowo dodano użytkownika $_POST[firstName] $_POST[lastName]";
//	}

	//header("location: ../pages");
}catch(mysqli_sql_exception $e) {
	$_SESSION["error"] = "Błąd:".$e->getMessage();
	echo "<script>history.back();</script>";
	exit();
}
