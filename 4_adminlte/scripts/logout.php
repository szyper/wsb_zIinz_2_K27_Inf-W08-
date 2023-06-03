<?php
	session_start();
	//echo session_status(); //2
	//echo "<br>".session_id()."<br>";
	session_destroy();
	//echo session_status(); //
	session_start();
	session_regenerate_id();
	//echo "<br>".session_id()."<br>";
	$_SESSION["error"] = "Wylogowano użytkownika";
	header("location: ../pages");