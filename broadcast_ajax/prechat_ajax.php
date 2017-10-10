<?php 
/*exit();
//there is some problem with prechat throughout application

//require_once('../auth.php');
 //include("../connection.php");	
  //include("../commonfun.php");
   
	
	        $usern=$_SESSION['SESS_USERNAME'];
	        
			
 $tid=$_GET['tid'];
 $n=0;
 $y=-1;
 $mart=0;

echo'<div class="chat">';

				$sqlchat="SELECT category FROM section WHERE section_id='$tid'";
				$tnme=mysql_query($sqlchat);
				$ro = mysql_fetch_row($tnme);
                
$logchat="SELECT log FROM member WHERE username='$usern'";
				$logtnme=mysql_query($logchat);
				$logro = mysql_fetch_row($logtnme);				


                $qry="SELECT * FROM channel_post WHERE category='$ro[0]' AND event > '$logro[0]' ORDER BY image_id DESC  ";
                require("channel_common_chat_script.php");
				   
            $qry0="Update member set log = NOW() WHERE username='$usern'";
               $done=mysql_query($qry0);

//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);

?>
<?php
function get_basename($filename)
{
    return preg_replace('/^.+[\\\\\\/]/', '', $filename);
}
*/

?>