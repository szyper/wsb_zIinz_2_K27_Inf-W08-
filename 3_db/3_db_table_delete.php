<!doctype html>
<html lang="pl">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="../css/table.css">
	<title>Użytkownicy</title>
</head>
<body>
<h4>Użytkownicy</h4>
<?php
if (isset($_GET["userDelete"])){
	if ($_GET["userDelete"] == 0){
		echo "<h4>Nie usunięto użytkownika!</h4>";
	}else{
		echo "<h4>Usunięto użytkownika o id=$_GET[userDelete]</h4>";
	}
}
?>
<table>
  <tr>
    <th>Imię</th>
    <th>Nazwisko</th>
    <th>Data urodzenia</th>
    <th>Miasto</th>
    <th>Województwo</th>
    <th>Państwo</th>
  </tr>
<?php
	require_once "../scripts/connect.php";
$sql = "SELECT `u`.`id` `userId`, `u`.`firstName` as `imie`, `u`.`lastName`, `u`.`birthday`, `c`.`city`, `s`.`state`, `co`.`country` FROM `users` u JOIN `cities` c ON `u`.`city_id`=`c`.`id` JOIN `states` s ON `c`.`state_id`=`s`.`id` JOIN `countries` co ON `s`.`country_id`=`co`.`id`;";
  $result = $conn->query($sql);

//  echo $result->num_rows;
  if ($result->num_rows == 0){
    echo "<tr><td colspan='6'>Brak rekordów do wyświetlenia</td></tr>";
  }else{
	  while($user = $result->fetch_assoc()){
		  echo <<< TABLEUSERS
      <tr>
        <td>$user[imie]</td>
        <td>$user[lastName]</td>
        <td>$user[birthday]</td>
        <td>$user[city]</td>
        <td>$user[state]</td>
        <td>$user[country]</td>
        <td><a href="../scripts/delete_user.php?userIdDelete=$user[userId]">Usuń</a></td>
      </tr>
TABLEUSERS;
	  }
  }

  echo "</table>";
  $conn->close();
?>

</body>
</html>
