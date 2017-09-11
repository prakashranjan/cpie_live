<?php 
require_once('../auth.php');
 include("../connection.php");	
 include("../commonfun.php");
 include_once("broadcastpost_common.php");

               $mem_id=$_SESSION['SESS_MEMBER_ID'];
	        $usern=$_SESSION['SESS_USERNAME'];
	       
		// anon = anonymous


		if(isset($_POST['anon'])){
            $anon=1;
        }else{
            $anon=0;
        }	

 
  $all_tagy=addslashes($_POST['tagy']);
$caption=  addslashes($_POST['cap']); 
$catin=  addslashes($_POST['catin']);

 $u_ids=  addslashes($_POST['u_ids']);

if((($all_tagy=="")&&($u_ids==""))||$caption==""){exit();}

                    if(savecap($caption)==1){
			echo'<div class="alert alert-success">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>success :)</strong> .
</div>';
/*
 $hint="chat";
if($anon!=1){
 $qry45="INSERT INTO notification (worker,channel_id,hint) VALUES ('$usern','$tid','$hint')";
                $result45=mysql_query($qry45);	}
 */
 
	}
else{
echo'<div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry! something went wrong. try again..</strong> .
</div>';

}






function savecap($caption)
            {$mebateyga=1; 
    $usern=$_SESSION['SESS_USERNAME'];
			           $mem_id=$_SESSION['SESS_MEMBER_ID'];
			$caption=  addslashes($_POST['cap']); 
                        $all_tagy=addslashes($_POST['tagy']);
                       $catin=  addslashes($_POST['catin']);
			 $u_ids=  addslashes($_POST['u_ids']);
                        $caption=strip_tags($caption,"<img> <a> <br>");
                        $caption=trim($caption);
			$caption=carbonlink($caption);
                         $caption=trim($caption);
			if(isset($_POST['anon'])){
            $anon=1;
        }else{
            $anon=0;
        }
        if($caption!=''){
  $chala_kya= broadcastpost_common($usern,$mem_id,$caption,$all_tagy,$catin,$anon,null,null,$mebateyga,$u_ids);
   if($chala_kya==1){echo"------chal gya";
       return 1;}
   else {echo "--------------------------------nhi-chalega";return 0;}
        }else{return 0;} 
           return 0; }
			
			
		
			
	//Start session
    
//$session=session_id();
//$time=time();
//$sql4="Update user_online set time='$time' where session='$session'";
//$result4=mysql_query($sql4);
		
			  
			
			?>
			

