<?php 
require_once('auth.php');
 include("connection.php");	
 include("commonfun.php");
	
	        $usern=$_SESSION['SESS_USERNAME'];
	       
		// anon = anonymous


		if(isset($_POST['anon'])){
            $anon=1;
        }else{
            $anon=0;
        }	

 $tid=$_POST['tid'];
$caption=  addslashes($_POST['cap']); 


                    if(!savecap($caption)){
			echo'<div class="alert alert-success">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong> .
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
            { $usern=$_SESSION['SESS_USERNAME'];
			$tid=$_POST['tid'];
			$caption=  addslashes($_POST['cap']); 
			
                        $caption=strip_tags($caption,"<img> <a> <br>");
                        $caption=trim($caption);
			$caption=carbonlink($caption);
                         $caption=trim($caption);
			if(isset($_POST['anon'])){
            $anon=1;
        }else{
            $anon=0;
        }	

			
				$sql="SELECT category FROM topic WHERE topic_id='$tid'";
			     $toname=mysql_query($sql);
				$rows = mysql_fetch_row($toname);
                                if($caption!=''){
                 $qry="insert into testblob (category,username,caption,owner,anonymous) values ('$rows[0]','$usern','$caption','$usern','$anon')";
                $result=mysql_query($qry);
                                }
                                else{return 1;}


            }
			
			
		
			
	//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
		
			  
			
			?>
			

