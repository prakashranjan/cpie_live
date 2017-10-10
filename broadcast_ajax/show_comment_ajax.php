<?php

require_once('../auth.php');
 include("../connection.php");	
 include("../commonfun.php");
include("broadcast_comment_script.php");
   include("../vcommon.php");
	        $usern=$_SESSION['SESS_USERNAME'];
	       
		// anon = anonymous


	//	if(isset($_POST['anon'])){
          //  $anon=1;
        //}else{
         //   $anon=0;
       // }	

 
$comment_post_id= addslashes($_GET['comment_post_id']); 
if($comment_post_id==""){exit();}

$sql="select comment_count from broadcast_post where image_id='$comment_post_id'";
$result=  mysql_query($sql) or die;


 if($result){
     $res=  mysql_fetch_row($result);
     if($res!=0){
          $qry="SELECT * FROM broadcast_comments WHERE image_id='$comment_post_id'  ORDER BY comment_id ";
        magic($qry);
         
         
         
     }
     
     
     
 }

