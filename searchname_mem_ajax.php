<?php
 require_once('auth.php');
include("connection.php");

include("member_common_fun.php");
$memid=$_SESSION['SESS_MEMBER_ID'];

 $tid=addslashes($_GET['tid']);
$term=$_GET['term'];
$kqryj="SELECT category FROM topic WHERE topic_id='$tid' and private=1";
 $mqryj=mysql_query($kqryj);
if(mysql_num_rows($mqryj)==0){
    echo'<h6 style="text-align:center;">no match found</h6>';
    exit();}
 $jqry=mysql_fetch_row($mqryj);

if($term!=""){

$y=-1;

                 $kqry="SELECT mem_id,username,thumbnail,fname,lname FROM member where ((CONCAT(fname, ' ', lname) like '$term%') or (fname like '$term%' or lname like '$term%' )) and mem_id <> '$memid'  ORDER BY views DESC ";

                $kresult=mysql_query($kqry);
				
                while($krow = mysql_fetch_row($kresult))
                {$full=$krow[3]." ".$krow[4];
				 
					echo'<div class=" col-lg-3 col-sm-6 panel  " id="'.$krow[0].'usercard" style="padding-bottom:3px;"><div class="panel-heading" style="padding:3px;background-color:#663ce7;border-color:#663ce7;"><a href="profile?un='.$krow[1].'" >
									      <img class="img-circle pull-left" style="height:45px;" src="'.$krow[2].'">
									</a> <a style="color:white;"href="profile?un='.$krow[1].'"><h6 class="ubuntu"> &nbsp;$'.$krow[1].'</h6><a role="button" onclick="memberdo(this.id);" id="'.$krow[0].'todomem" style="font-size:3.5vh;" class="pull-right " >';
                                        kya_ayega($krow[1],$jqry[0]);
                                        echo'</a> </a> </div> <h6 class="ubuntu"style="color:red;"> '.$full.' </h6></div>';
				 
				 
					
		 
				$y++;
		}
                                
                                 
                 
                   
				if($y==-1 ) 
{echo'<h6 style="text-align:center;">no match found</h6>';}	

//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
}



 ?>
 
        
    
	
	