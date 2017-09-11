
<?php
 require_once('auth.php');
include("connection.php");
 $usern=$_SESSION['SESS_USERNAME'];
$join_idig=$_GET['join_idig'];
$tid=$_GET['tid'];

$kqry="Delete FROM private_member WHERE pvt_id='$join_idig'";

 $mqry=mysql_query($kqry);
 

?>
 