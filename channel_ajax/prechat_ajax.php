<?php 
require_once('../auth.php');
 include("../connection.php");	
  include("../commonfun.php");
   
	$mode_id=$_SESSION['SESS_MODE'];
	        $usern=$_SESSION['SESS_USERNAME'];
                 $memid=$_SESSION['SESS_MEMBER_ID'];
	        
			
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


                $qry="SELECT * FROM channel_post WHERE (category='$ro[0]' AND event > '$logro[0]') and (mode_id=0 or mode_id='$mode_id' ) ORDER BY image_id DESC  ";
                require("channel_common_chat_script.php");
				   
            $qry0="Update member set log = NOW() WHERE username='$usern'";
               $done=mysql_query($qry0);



                                    //if my class then update pichla_view time
      $mjql=mysql_query("select student_id from stud_member where section_id='$tid' and mem_id='$memid'");
      if(mysql_num_rows($mjql)==1){
          $run_on=mysql_fetch_row($mjql);
         
          
           $mjql_on=mysql_query("Update stud_member set pichla_view=NOW() where student_id='$run_on[0]' "); 
         
      }

                                    
                                
               
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);

?>
