<?php
 require_once('auth.php');
include("connection.php");
include("vcommon.php");

  $usern=$_SESSION['SESS_USERNAME'];
 $tid=  addslashes($_GET['tid']);
 if($tid==""){exit();}
 
 $kqry="SELECT category FROM topic WHERE topic_id='$tid'";
 $mqry=mysql_query($kqry);
 $jqry=mysql_fetch_row($mqry);
 
 
 $jql="SELECT fav_id FROM favourites WHERE username='$usern' AND topicid='$tid'";
 $dar=mysql_query($jql);
 $heart=array();
 if ($par=mysql_fetch_row($dar))
 { $tql="DELETE from favourites where username='$usern' and topicid='$tid'";
 $tar=mysql_query($tql);
 $mqlm="update topic set hearts= hearts-1 where topic_id='$tid'";
				$karo=mysql_query($mqlm);
	
                
	 $heart[0]=1;
 

}
else
{
 $sql="INSERT INTO favourites (username,topicid,category) VALUES ('$usern','$tid','$jqry[0]')";
			     $toname=mysql_query($sql);
				$mql="update favourites set views= views+1 where username='$usern' and topicid='$tid'";
				$kar=mysql_query($mql);
                                $mqlm="update topic set hearts= hearts+1 where topic_id='$tid'";
				$karo=mysql_query($mqlm);

        $heart[0]=2;
        
                


 
}
$mqlq="select hearts from  topic where topic_id='$tid'";
				$karq=mysql_query($mqlq);
                                $res=  mysql_fetch_row($karq);
       
        $heart[1]=$res[0];
 
 echo json_encode($heart);


 
 

 ?>
 