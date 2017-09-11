<?php
 require_once('auth.php');
include("connection.php");
 $usern=$_SESSION['SESS_USERNAME'];
$join_idal=$_GET['join_idal'];
$tid=$_GET['tid'];

$kqry="Update private_member SET allow=1 WHERE pvt_id='$join_idal'";
 $mqry=mysql_query($kqry);
 

?>
 

