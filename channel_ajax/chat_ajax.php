<?php 
require_once('../auth.php');
 include("../connection.php");	
	 include("../commonfun.php");
          include("../vcommon.php");
          $mode_id=$_SESSION['SESS_MODE'];
	        $usern=$_SESSION['SESS_USERNAME'];
	        $firstn=$_SESSION['SESS_FIRST_NAME'];
			$lastn=$_SESSION['SESS_LAST_NAME'];
			$fulln=$firstn." ".$lastn;
			$gender=$_SESSION['SESS_GENDER']; 
			$gender= strtolower($gender);
                                   $memid=$_SESSION['SESS_MEMBER_ID'];
	$y=-1;	
 $tid=cleankar($_POST['tid']);
 $mark=cleankar($_POST['counter']);
 if($tid=="" ||$mark==""){exit();}
 
 $mark=$mark*6;
 $end=6;
$n=0;
$mart=1;



echo'<div class="chat">';

				$sqlchat="SELECT category FROM section WHERE section_id='$tid'";
				$tnme=mysql_query($sqlchat);
				$ro = mysql_fetch_row($tnme);
				
                $qry="SELECT * FROM channel_post WHERE category='$ro[0]' and (mode_id=0 or mode_id='$mode_id' ) ORDER BY image_id DESC LIMIT $mark , $end ";
                require_once "channel_common_chat_script.php";
            
if($y==-1 && $mart===1) 
{echo"<script>  $('#loadmore').hide(); </script>";}



if($mark==0){
                                    //if my class then update pichla_view time
      $mjql=mysql_query("select student_id from stud_member where section_id='$tid' and mem_id='$memid'");
      if(mysql_num_rows($mjql)==1){
          $run_on=mysql_fetch_row($mjql);
         
          
           $mjql_on=mysql_query("Update stud_member set pichla_view=NOW() where student_id='$run_on[0]' "); 
         
      }

                                    
                                }




//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
?>