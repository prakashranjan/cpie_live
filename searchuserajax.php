<?php
 require_once('auth.php');
include("connection.php");
include("vcommon.php");

 $memid=$_SESSION['SESS_MEMBER_ID'];
$term=cleankar($_GET['term']);

if($term!=""){

$y=-1;
$r=1;
                 $kqry="SELECT mem_id,username,thumbnail,fname,lname FROM member where (username like '$term%') and mem_id <> '$memid'   ORDER BY views DESC ";

                $kresult=mysql_query($kqry);
				
                while($krow = mysql_fetch_row($kresult))
                {$full=$krow[3]." ".$krow[4];
				 if($r%2!=0){
					echo'<div class=" col-lg-3 col-sm-6 panel panel-danger "><div class="panel-heading"><a href="profile?un='.$krow[1].'" >
									      <img class="img-circle pull-right" style="margin-top:0px;" src="'.$krow[2].'">
									</a> <a style="color:white;"href="profile?un='.$krow[1].'"><h5 class="ubuntu"style="text-align:left;">$'.$krow[1].'</h5></a></div> <h5 class="ubuntu"style="text-align:left;color:red;"> '.$full.' </h5></div>';
				 }
				 else{
				 
				 echo'<div class=" col-lg-3 col-sm-6 panel panel-warning "><div class="panel-heading"><a href="profile?un='.$krow[1].'" >
									      <img class="img-circle pull-right" style="margin-top:0px;" src="'.$krow[2].'">
									</a> <a style="color:white;"href="profile?un='.$krow[1].'"><h5 class="ubuntu"style="text-align:left;">$'.$krow[1].'</h5></a></div> <h5 class="ubuntu"style="text-align:left;color:orange;"> '.$full.' </h5></div>';
				 
				 
				 
				 }
					
		 
				$y++;
				$r++;}
				if($y==-1) 
{echo'<img height="15%" width="15%"src="images/sorry.png"></img><br /><h2>no match found</h2>';}	

//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
}else{exit();}
 ?>
 
        
    
	
	