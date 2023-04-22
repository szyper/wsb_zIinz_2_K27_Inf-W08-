<?php
//	print_r($_GET);
//var_dump($_GET);

require_once "./connect.php";
$sql = "DELETE FROM users WHERE `users`.`id` = $_GET[userIdDelete]";
//$sql = "DELETE FROM users WHERE `users`.`id` = 1";
//$sql = "DELETE FROM users WHERE `users`.`firstName` = 'Janusz'";
$conn->query($sql);
//echo $conn->affected_rows;

if ($conn->affected_rows == 0){
//	header("location: ../3_db/3_db_table_delete.php?userDelete=0");
	header("location: ../3_db/5_db_table_delete_add_update.php?userDelete=0");
}else{
//	header("location: ../3_db/3_db_table_delete.php?userDelete=$_GET[userIdDelete]");
	header("location: ../3_db/5_db_table_delete_add_update.php?userDelete=$_GET[userIdDelete]");
}

