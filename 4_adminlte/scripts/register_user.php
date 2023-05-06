<?php
session_start();
//	echo "<pre>";
//		print_r($_POST);
//	echo "</pre>";

foreach ($_POST as $value){
	if (empty($value)){
		$_SESSION["error"] = "Wypełnij wszystkie pola!";
		echo "<script>history.back();</script>";
		exit();
	}
}

$error = 0;
if (!isset($_POST["terms"])){
	$error = 1;
	$_SESSION["error"] = "Zatwierdź regulamin!";
}

if ($_POST["pass1"] != $_POST["pass2"]){
	$error = 1;
	$_SESSION["error"] = "Hasła są różne!";
}

if ($_POST["email1"] != $_POST["email2"]){
	$error = 1;
	$_SESSION["error"] = "Adresy email są różne!";
}

if ($error != 0){
	echo "<script>history.back();</script>";
	exit();
}


