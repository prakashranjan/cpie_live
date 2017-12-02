<?php
 require_once('auth.php');
include("connection.php");
 include("vcommon.php");
 require_once('priv_auth.php');

 $usern=$_SESSION['SESS_USERNAME'];
$join_idal=cleankar($_GET['join_idal']);
$tid=cleankar($_GET['tid']);
if($tid!="" && $join_idal!=""){
     $trigo=check_priv_auth($tid);
 
if($trigo==3 || $trigo==null){
    exit();
}
    
    
$kqry="Update private_member SET allow=1 WHERE pvt_id='$join_idal'";
 $mqry=mysql_query($kqry);
}

?>
 

