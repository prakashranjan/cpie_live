<?php

require_once('auth.php');
include("connection.php");
include("commonfun.php");
include("vcommon.php");

$memid=$_SESSION['SESS_MEMBER_ID'];

$user_id=cleankar($_POST['usernom']);
if($user_id=="" || strlen($user_id)<30 ){
    echo"false";
    exit();}
    else{

 $mqryj=mysql_query("SELECT email FROM member WHERE mem_id='$memid'");
 
 if(mysql_num_rows($mqryj)==1){
     $mqryj_run=  mysql_fetch_row($mqryj);
     
     $sheri_q = mysql_query("insert into one_notify (player_id,mem_id,email) values ('$user_id,'$memid','$mqryj_run[0]')");
     if($sheri_q){ 
         echo "true";
         exit();
     }
     else{
         echo "false";
     exit();
     }
     
 }else{
     
     echo "false";
     exit();
 }

    }




?>
