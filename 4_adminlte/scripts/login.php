<?php
if ($_SERVER["REQUEST_METHOD"] == "POST"){
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
		$stmt = $conn->prepare("SELECT * FROM users WHERE email=?");
		$stmt->bind_param("s", $_POST["email"]);
		$stmt->execute();
		$result = $stmt->get_result();
		//print_r($result);

		$user = $result->fetch_assoc();
		//print_r($user);
		//echo $user["password"];

		if (password_verify($_POST["pass"], $user["password"])){
			//echo "zalogowany";
			$_SESSION["logged"]["firstName"] = $user["firstName"];
			$_SESSION["logged"]["lastName"] = $user["lastName"];
			$_SESSION["logged"]["role_id"] = $user["role_id"];
			$_SESSION["logged"]["session_id"] = session_id();
			$_SESSION["logged"]["logo"] = $user["logo"];
			$_SESSION["logged"]["is_active"] = 1;

			//logs
			$address_ip4 = $_SERVER["REMOTE_ADDR"];
			$stmt = $conn->prepare("INSERT INTO `logs` ( `user_id`, `address_ip`, `logged`) VALUES (?, ?, '1');");
			$stmt->bind_param("is", $user["id"], $address_ip4);
			$stmt->execute();

			//echo $_SESSION["logged"]["session_id"];
			header("location: ../pages/logged.php");
			exit();
		}else{
			//echo "niezalogowany";
			$_SESSION["error"] = "Błędny login lub hasło!";
			//logs
			$address_ip4 = $_SERVER["REMOTE_ADDR"];
			$stmt = $conn->prepare("INSERT INTO `logs` ( `user_id`, `address_ip`, `logged`, `message`) VALUES (?, ?, '0', 'błędne hasło');");
			$stmt->bind_param("is", $user["id"], $address_ip4);
			$stmt->execute();
			echo "<script>history.back();</script>";
		}


//	if ($stmt->affected_rows  == 1){
//		$_SESSION["success"] = "Prawidłowo dodano użytkownika $_POST[firstName] $_POST[lastName]";
//	}

		//header("location: ../pages");
	}catch(mysqli_sql_exception $e) {
		$_SESSION["error"] = "Błąd:".$e->getMessage();
		//echo "<script>history.back();</script>";
		exit();
	}
}

header("location: ../pages/");
