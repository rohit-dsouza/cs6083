<?php
session_start();
$servername = "localhost"; 
$username = "root";
$password = " ";
$dbname = "DB_Proj_1";
$conn = mysqli_connect($servername, $username, $password, $dbname);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$usr = $psw = $usrtype =  " ";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $usr = $_POST["uname"];
  $psw = $_POST["psw"];
  $usrtype = $_POST["usr"];
}

$sql = "Select * From Student Where sname = '$usr'";

$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_assoc($result);

if (password_verify($psw, $row[spwd])) {
	$_SESSION['sid'] = $row[sid];
	header('Location: student.php');
	exit();
}
else {
	echo "<a href='login.html'>Login Unsuccessful. Please check username and password. Click to try again.</a>";
}

mysqli_close();
?>