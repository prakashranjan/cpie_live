<?php 
require_once('auth.php');
 include("connection.php");	
 include("commonfun.php");
include("comment_script.php");	
	        $usern=$_SESSION['SESS_USERNAME'];
	       
		// anon = anonymous


	//	if(isset($_POST['anon'])){
          //  $anon=1;
        //}else{
         //   $anon=0;
       // }	

 $comment_info= addslashes($_GET['comment_info']);
$comment_post_id= $_GET['comment_post_id']; 

$c_info=$comment_info;

                    if(!savecom($c_info)){
                        
                                        
$logchat="SELECT log FROM member WHERE username='$usern'";
				$logtnme=mysql_query($logchat);
				$logro = mysql_fetch_row($logtnme);				


                $qry="SELECT * FROM comments WHERE image_id='$comment_post_id' AND event > '$logro[0]' ORDER BY comment_id   ";
        magic($qry);
/*
 $hint="chat";
if($anon!=1){
 $qry45="INSERT INTO notification (worker,channel_id,hint) VALUES ('$usern','$tid','$hint')";
                $result45=mysql_query($qry45);	}
 */
 
	}
else{
    // do nothing
//echo'<div class="alert alert-danger">
  //<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  //<strong>Sorry! something went wrong. try again..</strong> .
//</div>';

}	
function savecom($c_info)
            { $usern=$_SESSION['SESS_USERNAME'];
			
			$comment_info= addslashes($_GET['comment_info']);
$comment_post_id= $_GET['comment_post_id']; 
$c_info=$comment_info;
			
                        $c_info=strip_tags($c_info,"<img> <a> <br>");
                        $c_info=trim($c_info);
			$c_info=carbonlink($c_info);
			

			
	
                 $qry="insert into comments (image_id,username,caption,owner) values ('$comment_post_id','$usern','$c_info','$usern')";
                $result=mysql_query($qry) or die;
                if($result){
                $qry="update testblob set comment_count=comment_count + 1 where image_id='$comment_post_id'";
                $result=mysql_query($qry);
                }


            }
			
			
		
			
	//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
		
			  
			
			?>
			





                        
                        


                       
                       