<?php
session_start(); 
include("header.html");
$i = 0;
$usid = $_SESSION['sid'];
$servername = "localhost"; 
$username = "root";
$password = " ";
$dbname = "DB_Proj_1";
$conn = mysqli_connect($servername, $username, $password, $dbname);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "<H2>Messages</H2><hr>";
$sql = "Select * From `Messages` Where Messages.msgto='$usid' OR Messages.msgfrom='$usid'";
if(mysqli_query($conn, $sql)) {
	$res = mysqli_query($conn, $sql);
	while ($row = mysqli_fetch_assoc($res)) {
		$i = $i + 1;
		echo "<u>Message #".$i."</u><br>";
		if ($row['msgfrom']==$usid) {
			$sql1 = "Select * From `Student` Where sid='".$row['msgto']."'";
			$temp = mysqli_query($conn, $sql1);
			$cur = mysqli_fetch_assoc($temp);
			echo "Message From: You <br>";
			echo "Message To: ".$cur['sid']."-".$cur['sname']."<br>";
			echo "Message Time: ".$row['msgtime']."<br>";
			echo "Message: ".$row['message']."<br><br>";
			echo "<hr>";
		}
		else {
			$sql1 = "Select * From `Student` Where sid='".$row['msgfrom']."'";
			$temp = mysqli_query($conn, $sql1);
			$cur = mysqli_fetch_assoc($temp);
			echo "Message From: ".$cur['sid']."-".$cur['sname']."<br>";
			echo "Message To: You <br>";
			echo "Message Time: ".$row['msgtime']."<br>";
			echo "Message: ".$row['message']."<br><br>";
			echo "<hr>";
		}
	}
}
mysqli_close();
?>