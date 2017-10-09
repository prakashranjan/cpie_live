<?php
require_once('auth.php');
 include("connection.php");
  include("commonfun.php");
 require 'Zebra_Image.php';
 include("vcommon.php");


 $usern=$_SESSION['SESS_USERNAME'];
 

if (!empty($_FILES) && $_FILES['file']['error'] === UPLOAD_ERR_OK) {
 $check_name=  strlen(get_basename($_FILES['file']['tmp_name']));
 if($check_name==0 || $check_name>=150){
          unset($_FILES);
     echo "file name too long";
     exit();}
  

    $tempFile = $_FILES['file']['tmp_name']; //3
    $filename =$_FILES['file']['name'];
    $filename=preg_replace("/[^a-z0-9\.]/", "", strtolower($filename));
  $ext = pathinfo($filename, PATHINFO_EXTENSION);
  
    if($ext=="jpg"||$ext=="jpeg"||$ext=="gif"||$ext=="png"){
  
    
   
mkdir("profile_pic/$usern",0760);
mkdir("profile_pic/$usern/thumb",0760);
$today = date("Y-m-d H:i");
$today=base64_encode($today);
$ses_id=  session_id();
$today=$today.$ses_id;

$fname="profile_pic/$usern/$today"."_500x500_"."$filename";


$thumb_fname="profile_pic/$usern/thumb/$today"."_60x60_"."$filename";
    move_uploaded_file($tempFile,$fname);
    
  
    // create a new instance of the class
    $image = new Zebra_Image();

  $realimage = new Zebra_Image();
    // indicate a source image
    $image->source_path = $fname;
$realimage->source_path = $fname;

   

    // indicate a target image
    $image->target_path = $thumb_fname ;
 $realimage->target_path = $fname ;
    // resize
    // and if there is an error, show the error message
    if (!$image->resize(60, 60,ZEBRA_IMAGE_CROP_CENTER, -1)) show_error($image->error, $image->source_path, $image->target_path);  
     if (!$realimage->resize(500,500,ZEBRA_IMAGE_NOT_BOXED, -1)) show_error($realimage->error, $realimage->source_path, $realimage->target_path);  
     // crop
    // and if there is an error, show the error message
    
    
    if($ext=="jpg"||$ext=="jpeg"||$ext=="gif"){
        
       
    }
    else if($ext=="png"){
        
      
    }
   
    
    $sql="update member set picture='$fname',thumbnail='$thumb_fname' where username='$usern'";
           
        $result=mysql_query($sql);
    }
    else{unset($_FILES);
        exit();}
     
     
}











            /*
            
          
					//$hint="changepropic";
//$tidu=NULL;
 //$qry456="INSERT INTO notification (worker,channel_id,hint,uid) VALUES ('$usern','$tidu','$hint','$uid[0]')";
        //        $result456=mysql_query($qry456);
                }
            }*/
            
?>     




