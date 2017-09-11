<?php

 require_once('../auth.php');
 include("../connection.php");	
  include("../commonfun.php");
  require '../Zebra_Image.php';
  include_once("broadcastpost_common.php");

$usern=$_SESSION['SESS_USERNAME'];
$mem_id=$_SESSION['SESS_MEMBER_ID'];
$caption=  addslashes($_POST['caption']); 
                        $all_tagy=addslashes($_POST['tagy']);
                      $catin=addslashes($_POST['catin']);
                      $u_ids=  addslashes($_POST['u_ids']);
                      
                     
                      

if($catin=="" ||(($all_tagy=="") &&($u_ids==""))){echo"something went wrong!!"; exit();}
$tn=null;
$anon=  addslashes($_POST['anon2']);
       	
 
 echo $all_tagy."<br>";
 echo $caption."<br>";
 echo $anon."<br>";
 echo $catin."<br>";
 echo $tn."<br>";
 $mebateyga=2;
 
 $chala_kya=broadcastpost_common($usern,$mem_id,$caption,$all_tagy,$catin,$anon,null,null,$mebateyga,$u_ids);
  if($chala_kya==1){echo"------chal gya";
       return 1;}
   else {echo "--------------------------------nhi-chalega";return 0;}
  
 
 
 
 


?>     
