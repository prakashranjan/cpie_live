<?php 
require_once('auth.php');
 include("connection.php");	
  include("commonfun.php");
    include("vcommon.php");
     require_once('priv_auth.php');
	
	        $usern=$_SESSION['SESS_USERNAME'];
                 $memid=$_SESSION['SESS_MEMBER_ID'];
	        
			
 $tid=cleankar($_GET['tid']);
 if($tid==""){exit();}
 
  $trigo=check_priv_auth($tid);
 
if($trigo==3 || $trigo==null){
    exit();
}
 $n=0;
 $y=-1;
 $mart=0;

echo'<div class="chat">';

				$sqlchat="SELECT category FROM topic WHERE topic_id='$tid'";
				$tnme=mysql_query($sqlchat);
				$ro = mysql_fetch_row($tnme);
                                
                
$logchat="SELECT log FROM member WHERE username='$usern'";
				$logtnme=mysql_query($logchat);
				$logro = mysql_fetch_row($logtnme);				


                $qry="SELECT * FROM testblob WHERE category='$ro[0]' AND event > '$logro[0]' ORDER BY image_id DESC  ";
                require("common_chat_script.php");
				   
            $qry0="Update member set log = NOW() WHERE username='$usern'";
               $done=mysql_query($qry0);

               //if favourite topic then update pichla_view time
      $mjql=mysql_query("select fav_id from favourites where category='$ro[0]' and username='$usern'");
      if(mysql_num_rows($mjql)==1){
          $run_on=mysql_fetch_row($mjql);
          $getnow=  mysql_query("select NOW()");
          $getnowrun=mysql_fetch_row($getnow);
          
           $mjql_on=mysql_query("Update favourites set pichla_view='$getnowrun[0]' where fav_id='$run_on[0]' "); 
           $mjqlf_on=mysql_query("Update member set fav_log='$getnowrun[0]' where mem_id='$memid' "); 
      }

                                    
               
               
//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);

?>
