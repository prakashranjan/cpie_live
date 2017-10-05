<?php
 require_once('auth.php');
include("connection.php");
 include("vcommon.php");

 $usern=$_SESSION['SESS_USERNAME'];
$join_idal=cleankar($_GET['join_idal']);
$tid=cleankar($_GET['tid']);
if($tid!="" && $join_idal!=""){
$kqry="Update private_member SET allow=1 WHERE pvt_id='$join_idal'";
 $mqry=mysql_query($kqry);
}

?>
 

