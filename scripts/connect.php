<?php
  $conn = new mysqli("localhost", "root", "", "wsb_ziinz_2_k27_inf (w08)");
  echo "db";
	echo $conn->connect_errno; //0 -> ok
