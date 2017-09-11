<?php 
 require_once('../auth.php');
include("../connection.php");

 $usern=$_SESSION['SESS_USERNAME'];
	$member_id=$_SESSION['SESS_MEMBER_ID'];
$tid=addslashes($_GET['tid']);
$time=time();

//Start session
    
$session=session_id();

$sql4="Update channel_user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);

$kqry=" SELECT DISTINCT mem_id FROM channel_user_online where topic_id='$tid' AND  time > ($time-900) ";


               $kresult=mysql_query($kqry);
				
                while($krow = mysql_fetch_row($kresult))
				{ 
				$qry=" SELECT username,thumbnail FROM member where mem_id='$krow[0]'";
				  $result=mysql_query($qry);
					$row = mysql_fetch_row($result);
					echo'<li><a id="'.$krow[0].'M" href="profile?un='.$row[0].'" class="ubuntu"><img  height="30" src="'.$row[1].'"> $'.$row[0].'</a></li>';
				
				}



?>
