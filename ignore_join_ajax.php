
<?php
 require_once('auth.php');
include("connection.php");
include("vcommon.php");
require_once('priv_auth.php');
 $usern=$_SESSION['SESS_USERNAME'];
$join_idig=cleankar($_GET['join_idig']);
$tid=cleankar($_GET['tid']);
if($tid!="" && $join_idig!="" ){
     
  $trigo=check_priv_auth($tid);
 
if($trigo==3 || $trigo==null){
    exit();
}
    

$kqry="Delete FROM private_member WHERE pvt_id='$join_idig'";

 $mqry=mysql_query($kqry);
}

?>
 