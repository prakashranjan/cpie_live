
<?php 

require_once('../auth.php');
 include("../connection.php");	
 include("../commonfun.php");
 include("../vcommon.php");
	
	        $usern=$_SESSION['SESS_USERNAME'];
	       
		// anon = anonymous


		

 
$mul_cor=0;


                    if(!savecap()){
			echo'<div class="alert alert-success">
  <a href="#" class="close text-center" data-dismiss="alert" aria-label="close">&times;</a>
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
function savecap()
            { $_POST  = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
    $usern=$_SESSION['SESS_USERNAME'];
			$tid=cleankar($_POST['tid']);
			$caption=  addslashes($_POST['cap']); 
			
                        $caption=strip_tags($caption,"<img> <a> <br>");
                        $caption=trim($caption);
			$caption=carbonlink($caption);
                         $caption=trim($caption);
                        $mul_cor= cleankar($_POST['poll_checkbox']);
                        $poll_hide_t=cleankar($_POST['poll_hide_t']);
                         $polloption=$_POST['polloption'];
                        $polloption =array_map('strip_tags', $polloption);
                        
			$anony=cleankar($_POST['anony']);
			 if($anony=="" ||$poll_hide_t=="" || $caption=="" || $tid=="" || empty($polloption)==true){return 1;}
				$sql="SELECT category FROM section WHERE section_id='$tid'";
			     $toname=mysql_query($sql);
				$rows = mysql_fetch_row($toname);
                                if($caption!=''){
                 $qry="insert into channel_post (category,username,caption,owner,poll_type,anonymous,mode_id) values ('$rows[0]','$usern','$caption','$usern','$mul_cor','$anony','$poll_hide_t')";
                $result=mysql_query($qry);
                if($result){$poll_id=mysql_insert_id();
                
                    
                  foreach ($polloption as &$value) {
                   $value=trim($value);
                     $qry="insert into channel_poll_option (image_id,poll_option) values ('$poll_id','$value')";
                $result=mysql_query($qry);
                            }  
                    
                }
            }else{return 1;}


            }
			
			
		
			
	//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
		
			  
			
			?>

