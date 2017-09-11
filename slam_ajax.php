<?php
 require_once('auth.php');
include("connection.php");

  $usern=$_SESSION['SESS_USERNAME'];
 $tid=$_POST['tid'];
 $chat_id=$_POST['chatid'];
 
 
 
 
 $jql="SELECT s_id FROM slam WHERE username='$usern' AND topic_id='$tid' AND chat_id='$chat_id'";
 $dar=mysql_query($jql);
 if ($par=mysql_fetch_row($dar))
 { $tql="DELETE from slam where username='$usern' and topic_id='$tid' and chat_id='$chat_id'";
	$tar=mysql_query($tql);
	
	$mql5="update testblob set eye= eye-1 where  image_id='$chat_id'";
				$kar5=mysql_query($mql5);
				
				$qry="SELECT eye FROM testblob WHERE image_id='$chat_id'";
                $result=mysql_query($qry);
                $rowori= mysql_fetch_row($result);
				
 echo '<i class="fa fa-smile-o fa-2x text-muted" aria-hidden="true"></i><span class="badge text-success">+'.$rowori[0].'</span>';

}
else
{
 $sql="INSERT INTO slam (username,topic_id,chat_id) VALUES ('$usern','$tid','$chat_id')";
			     $toname=mysql_query($sql);
				
				

				$mql56="update testblob set eye= eye+1 where image_id='$chat_id'";
				$kar56=mysql_query($mql56);
				
				$qry89="SELECT eye FROM testblob WHERE image_id='$chat_id'";
                $result89=mysql_query($qry89);
                $rowori89= mysql_fetch_row($result89);
echo '<i class="fa fa-smile-o fa-2x text-success" aria-hidden="true"></i><span class="badge text-success">'.$rowori89[0].'</span>';
	
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