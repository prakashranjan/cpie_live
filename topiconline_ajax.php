<?php 
 require_once('auth.php');
include("connection.php");
include("vcommon.php");

 $usern=$_SESSION['SESS_USERNAME'];
	$member_id=$_SESSION['SESS_MEMBER_ID'];
$tid=cleankar($_GET['tid']);
$time=time();
if($tid==""){exit();}
//Start session
    
$session=session_id();

$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);

$kqry=" SELECT  distinct mem_id FROM user_online where topic_id='$tid' and time > ($time-900) LIMIT 0,10 ";
     $kresult=mysql_query($kqry);
				
                while($krow = mysql_fetch_row($kresult))
				{ 
				$qry=" SELECT username,thumbnail FROM member where mem_id='$krow[0]'";
				  $result=mysql_query($qry);
					$row = mysql_fetch_row($result);
					echo'<li><a id="'.$krow[0].'M" href="profile?un='.$row[0].'" class="ubuntu"><img  height="30" src="'.$row[1].'"> $'.$row[0].'</a></li>';
				
				}



?>
