<?php
//	print_r($_POST);
	foreach ($_POST as $key => $value){
		//echo "$key: $value<br>";
		if (empty($value)){
			//echo "$key<br>";
//			echo "error";
			echo "<script>history.back();</script>";
			exit();
		}
	}

//	echo "ok";
require_once "./connect.php";
$sql = "INSERT INTO `users` (`id`, `city_id`, `firstName`, `lastName`, `birthday`) VALUES (NULL, '$_POST[city_id]', '$_POST[firstName]', '$_POST[lastName]', '$_POST[birthday]');";
$conn->query($sql);

header("location: ../3_db/5_db_table_delete_add_update.php");