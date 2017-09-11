<?php
   /*
$favchannel="favchannel";
$byfollower="follow";
$count=0;
require_once('auth.php');
include("connection.php");
 $usern=$_SESSION['SESS_USERNAME'];
$sql4="SELECT log FROM member where username='$usern'";
 $query4=mysql_query($sql4);
$log=mysql_fetch_row($query4);

 
$sql3="SELECT * FROM notification where worker!='$usern' AND wakt >= '$log[0]' order by wakt";
 $query3=mysql_query($sql3);
 while($row3=mysql_fetch_row($query3))
 {$k=-1;
  
//for fav channel notifications

 $sql="SELECT category FROM favourites where username='$usern' AND topicid='$row3[2]'";
 $query=mysql_query($sql);
 if($row=mysql_fetch_row($query)){
	 
	 $sqln="SELECT notification_id FROM notestatus where notification_id='$row3[0]' AND receiver='$usern'";
 $queryn=mysql_query($sqln);
	 if(!($check=mysql_fetch_row($queryn))){
	 
	  $qry90="INSERT into notestatus (receiver,notification_id,why) values ('$usern','$row3[0]','$favchannel')"; 
	 $run=mysql_query($qry90);}
	$count++;  
	$k=1;
	 
 }
	 
	 //for follow user notifications

  if($k==-1){$sql99="SELECT user2 FROM follow where user1='$usern' AND user2='$row3[1]' AND status=1";
 $query99=mysql_query($sql99);
 if($row99=mysql_fetch_row($query99)){
	 	 $sqlnw="SELECT notification_id FROM notestatus where notification_id='$row3[0]' AND receiver='$usern'";
 $querynw=mysql_query($sqlnw);
	 if(!($check2=mysql_fetch_row($querynw))){
	 
	 $qry92="INSERT into notestatus (receiver,notification_id,why) values ('$usern','$row3[0]','$byfollower')"; 
	 $run=mysql_query($qry92);}
	$count++;
		 
	 	 
	 }
 }

 }

if($count!=0)
{echo $count;

}
 else
	echo'';



	

*/


?>