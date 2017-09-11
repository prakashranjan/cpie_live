<?php

require_once('../auth.php');
 include("../connection.php");	
 include("../commonfun.php");
include("channel_comment_script.php");	
	        $usern=$_SESSION['SESS_USERNAME'];
	       
		// anon = anonymous


	//	if(isset($_POST['anon'])){
          //  $anon=1;
        //}else{
         //   $anon=0;
       // }	

 
$comment_post_id= $_GET['comment_post_id']; 

$sql="select comment_count from channel_post where image_id='$comment_post_id'";
$result=  mysql_query($sql) or die;


 if($result){
     $res=  mysql_fetch_row($result);
     if($res!=0){
          $qry="SELECT * FROM channel_comments WHERE image_id='$comment_post_id'  ORDER BY comment_id ";
        magic($qry);
         
         
         
     }
     
     
     
 }

