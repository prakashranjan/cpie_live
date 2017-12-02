<?php
 require_once('../auth.php');
include("../connection.php");
   include("../vcommon.php");

$memid=$_SESSION['SESS_MEMBER_ID'];
 

$term=cleankar($_GET['term']);

 

 
 
if($term!=""){

$y=-1;

                 $kqry="SELECT mem_id,username,thumbnail,fname,lname FROM member where (username like '$term%') and mem_id <> '$memid' ORDER BY views DESC ";

                $kresult=mysql_query($kqry);
				
                while($krow = mysql_fetch_row($kresult))
                {$full=$krow[3]." ".$krow[4];
			
					echo'<div class=" col-lg-4 col-sm-6 panel  " id="'.$krow[0].'usercard" style="padding-bottom:3px;background-color:white;"><div class="panel-heading" style="padding:3px;background-color:#663ce7;border-color:#663ce7;"><a  >
									      <img class="img-circle pull-left" style="height:45px;" src="'.$krow[2].'">
									</a> <a style="color:white;"><h6 class="ubuntu"> &nbsp;$'.$krow[1].'</h6><a role="button" onclick="memberdojs(this.id);" id="'.$krow[0].'todomem" style="font-size:2em;" class="pull-right "  >';
                                        
                                        echo'<i class="fa fa-bullseye"   aria-hidden="true"></i></a> </a> </div> <h6 class="ubuntu"style="color:red;"> '.$full.' </h6></div>';
				 
				 
					
				$y++;
				}
				if($y==-1) 
{echo'<h6 style="text-align:center;">no match found</h6>';}	

//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
}else{exit();}
 ?>
 
        
    
	
	
