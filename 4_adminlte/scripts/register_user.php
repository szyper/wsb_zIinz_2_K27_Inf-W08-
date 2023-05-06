<?php
session_start();
//	echo "<pre>";
//		print_r($_POST);
//	echo "</pre>";

foreach ($_POST as $value){
	if (empty($value)){
		$error = 1;
		$_SESSION["error"] = "Wypełnij wszystkie pola!";
		echo "<script>history.back();</script>";
		exit();
	}
}
