<?php
require_once('auth.php');
include("connection.php");

  $usern=$_SESSION['SESS_USERNAME'];
  $mem_id=$_SESSION['SESS_MEMBER_ID'];
 $tid=addslashes($_GET['tid']);
  $membermark=addslashes($_GET['membermark']);
  $membermark=preg_replace('/\D/', '', $membermark);
  
  $kqrym="SELECT username FROM member WHERE mem_id='$membermark'";
 $mqrym=mysql_query($kqrym);
 if(mysql_num_rows($mqrym)==1){
 $jqrym=mysql_fetch_row($mqrym);
 
 $kqry="SELECT category,user FROM topic WHERE topic_id='$tid' and private=1";
 $mqry=mysql_query($kqry);
 if(mysql_num_rows($mqry)==1){
 $jqry=mysql_fetch_row($mqry);
 
 // for check member
 $sql="select pvt_id,allow,username from private_member where username='$jqrym[0]' AND category='$jqry[0]'";
            $query=mysql_query($sql);
            if(mysql_num_rows($query)==1){
             $rungo=mysql_fetch_row($query);
             //for remove meber
             if($rungo[1]==1){
                 //check creator of group
                  if($jqry[1]!=$rungo[2]){
  
                 
                 
                 //remove
                  $kqryt="DELETE from private_member WHERE pvt_id='$rungo[0]'";
 $mqryt=mysql_query($kqryt) or die;
  if($mqryt){
   show(false);
        }
else{
    
    show(true);
    
 }
                 
                 
             } 
             else{
                 show(true);
             }
             }
             else if($rungo[1]==0){
                 //add
                 //pehle se request kiya hai..
                 $kqryq="Update private_member SET allow=1 , who_add='$mem_id' WHERE pvt_id='$rungo[0]'";
 $mqryq=mysql_query($kqryq) or die;
 
 if($mqryq){
   show(true);
        }
else{
    
    show(false);
    
 }
 
                 
             }
             
             
             
            }
            else if(mysql_num_rows($query)==0){
 
 //for add member
             //pehle se request nhi kiya..
$qry89="INSERT INTO private_member (username,category,allow,who_add) VALUES ('$jqrym[0]','$jqry[0]',1,'$mem_id')";
$result89=mysql_query($qry89) or die;
if($result89){
   show(true);
        }
else{
    
    show(false);
    
 }}}}
 function show($check){
     
     if($check==true){
    echo'<i class="fa fa-minus-circle " title="Remove"  aria-hidden="true"></i>';
        }
else{
    
     echo'<i class="fa fa-plus-circle " title="Add"  aria-hidden="true"></i>';
    
 }
     
     
     
     
 }