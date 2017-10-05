<?php 
require_once('auth.php');
 include("connection.php");	
	 include("commonfun.php");
         include("vcommon.php");
         
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
 if($tid=="" || $mark==""){exit();}
 $mark=$mark*6;
 $end=6;
$n=0;
$mart=1;



echo'<div class="chat">';

				$sqlchat="SELECT category FROM topic WHERE topic_id='$tid'";
				$tnme=mysql_query($sqlchat);
				$ro = mysql_fetch_row($tnme);
                                
                                
				
                $qry="SELECT * FROM testblob WHERE category='$ro[0]' ORDER BY image_id DESC LIMIT $mark , $end ";
                require_once "common_chat_script.php";
            
if($y==-1 && $mart===1) 
{echo"<script>  $('#loadmore').hide(); </script>";}


if($mark==0){
                                    //if favourite topic then update pichla_view time
      $mjql=mysql_query("select fav_id from favourites where category='$ro[0]' and username='$usern'");
      if(mysql_num_rows($mjql)==1){
          $run_on=mysql_fetch_row($mjql);
          $getnow=  mysql_query("select NOW()");
          $getnowrun=mysql_fetch_row($getnow);
          
           $mjql_on=mysql_query("Update favourites set pichla_view='$getnowrun[0]' where fav_id='$run_on[0]' "); 
           $mjqlf_on=mysql_query("Update member set fav_log='$getnowrun[0]' where mem_id='$memid' "); 
      }

                                    
                                }





//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
?>