<?php 
require_once('../auth.php');
include("../connection.php");
$postid=$_POST['postid'];
$category=$_POST['category'];
 $usern=$_SESSION['SESS_USERNAME'];
    
if($category!=-99){
$qr="select * from channel_post where image_id='$postid'";
 $res=mysql_query($qr);
$outp=mysql_fetch_row($res);
   

                   
    $qry90="INSERT into testblob (file_name,category,username,caption,image_name,owner,gif_name,thumb_name) values ('$outp[7]','$category','$usern','$outp[4]','$outp[3]','$outp[8]','$outp[11]','$outp[10]')";
                if($result=mysql_query($qry90))   
				{ echo ' <div class="alert alert-success">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong> Forwarded successfully.
</div>';
		/*$hint="share";
$tidu=$tid;
 $qry456="INSERT INTO notification (worker,channel_id,hint,chat_id) VALUES ('$usern','$tidu','$hint','$chat_id')";
                $result456=mysql_query($qry456);*/		
				
				
				}
else {
   echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> Something went wrong.
</div>';
}
}
else
{
 echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> Something went wrong.
</div>';


}
?>