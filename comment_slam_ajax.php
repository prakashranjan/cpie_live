<?php
 require_once('auth.php');
include("connection.php");

  $usern=$_SESSION['SESS_USERNAME'];
 
 $comment_id=$_POST['commentid'];
 
 
 
 
 $jql="SELECT s_id FROM comment_slam WHERE username='$usern' AND comment_id='$comment_id'";
 $dar=mysql_query($jql);
 if(mysql_fetch_row($dar) != 0)   
 { $tql="DELETE from comment_slam where username='$usern' and comment_id='$comment_id'";
	$tar=mysql_query($tql);
	
	$mql5="update comments set eye= eye-1 where  comment_id='$comment_id'";
				$kar5=mysql_query($mql5);
				
				$qry="SELECT eye FROM comments WHERE comment_id='$comment_id'";
                $result=mysql_query($qry);
                $rowori= mysql_fetch_row($result);
				
 echo '<i class="fa fa-thumbs-o-up text-muted" aria-hidden="true"></i> +'.$rowori[0];

}
else
{
 $gety="insert into comment_slam (username,comment_id) Values ('$usern','$comment_id')";
			     $toname=mysql_query($gety) or die;
				
				
                              if($toname){
				$mql56="update comments set eye= eye+1 where comment_id='$comment_id'";
                              $kar56=mysql_query($mql56);}
				
				$qry89="SELECT eye FROM comments WHERE comment_id='$comment_id'";
                $result89=mysql_query($qry89);
                $rowori89= mysql_fetch_row($result89);
                              echo '<i class="fa fa-thumbs-o-up text-success" aria-hidden="true"></i> '.$rowori89[0];
	
	/*$hint="like";
$tidu=$tid;
 $qry456="INSERT INTO notification (worker,channel_id,hint,chat_id) VALUES ('$usern','$tidu','$hint','$chat_id')";
                $result456=mysql_query($qry456);*/
 
}
 
 //Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);


 
 

 ?>