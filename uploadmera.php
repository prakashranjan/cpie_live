<?php
require_once('auth.php');
 include("connection.php");	
  include("commonfun.php");
  require 'Zebra_Image.php';
  include("vcommon.php");
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$image_check=false;

$myaccept_mime=array('image/jpeg','image/png','image/gif','image/jpg','application/pdf','audio/mpeg','application/msword','application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','application/vnd.openxmlformats-officedocument.presentationml.presentation','application/vnd.ms-excel','application/vnd.ms-powerpoint','application/x-rar-compressed','application/zip','application/vnd.oasis.opendocument.presentation','application/x-rar');
$caption=  addslashes($_POST['caption']);

$tn=cleankar($_POST['tn']);
 if($tn==""){
     echo "invalid";
      unset($_FILES);
     exit();}
 $usern=$_SESSION['SESS_USERNAME'];
 $check_name=  strlen(get_basename($_FILES['file']['tmp_name']));
 if($check_name==0 || $check_name>=150){
     echo "file nametoo long";
      unset($_FILES);
     exit();}
$size=formatbytes($_FILES['file']['tmp_name']);
$in_mime=mime_content_type($_FILES['file']['tmp_name']);
echo $in_mime;
$mime_res=array_search($in_mime,$myaccept_mime,true);
if($mime_res===false){echo "incorrect mime";
 unset($_FILES);
    exit();}
if (!empty($_FILES) && $tn && $size!=0 && ($size/1024/1024)<=20 && $_FILES['file']['error'] === UPLOAD_ERR_OK ) {

   if(!empty($caption))
{ 
$caption=strip_tags($caption,"<img> <a> <br>");
                   $caption=trim($caption);
		$caption=carbonlink($caption);
$caption=trim($caption);

}else{$caption= null; }


    $tempFile = $_FILES['file']['tmp_name']; //3
    $filename =$_FILES['file']['name'];
    $filename=preg_replace("/[^a-z0-9\.]/", "", strtolower($filename));
  $ext = pathinfo($filename, PATHINFO_EXTENSION);
  
  
    
   $qr=mysql_query("select category from topic where topic_id='$tn'"); 
   $rn=mysql_fetch_row($qr);
   $tid=$rn[0];
    
    if($ext=="jpg"||$ext=="jpeg"||$ext=="png"|| $ext=="gif"){
        $image_check=true;
    }
   
   if($image_check==true){
$imagedetails = getimagesize($_FILES['file']['tmp_name']);
$width = $imagedetails[0];
$height = $imagedetails[1];
   }
   
mkdir("user_files/$usern",0760);
mkdir("user_files/$usern/$tid",0760);
if($image_check==true){
mkdir("user_files/$usern/$tid/thumb",0760);}
$today = date("Y-m-d H:i");
$today=base64_encode($today);
$ses_id=  session_id();
$today=$today.$ses_id;
mkdir("user_files/$usern/$tid/$today",0760);
if($image_check==true){
mkdir("user_files/$usern/$tid/thumb/$today",0760);}
$fname="user_files/$usern/$tid/$today/$filename";
if($image_check==true){
$thumb_fname="user_files/$usern/$tid/thumb/$today/$filename";}

    move_uploaded_file($tempFile,$fname);
    if($image_check==true){
     $image = new Zebra_Image();

  
    // indicate a source image
    $image->source_path = $fname;

   

    // indicate a target image
    $image->target_path = $thumb_fname ;
    $cheight=450;
    $cwidth=450;
    if($height<450 && $width<450){
        $cheight=$height;
        $cwidth=$width;
    }
 
   
    // resize
    // and if there is an error, show the error message
    if (!$image->resize($cwidth,$cheight,ZEBRA_IMAGE_NOT_BOXED, -1)) show_error($image->error, $image->source_path, $image->target_path);  
    
    
    
    }
    
    
    if($ext=="jpg"||$ext=="jpeg"||$ext=="png"){
        if($caption!=null)
       $sql="insert into testblob (image_name,category,username,caption,owner,thumb_name) values ('$thumb_fname','$tid','$usern','$caption','$usern','$fname')";
       else
       $sql="insert into testblob (image_name,category,username,owner,thumb_name) values ('$thumb_fname','$tid','$usern','$usern','$fname')";
           
        $result=mysql_query($sql);
    }
    else if($ext=="gif"){
         if($caption!=null)
       $sql="insert into testblob (gif_name,category,username,caption,owner,thumb_name) values ('$thumb_fname','$tid','$usern','$caption','$usern','$fname')";
       else
       $sql="insert into testblob (gif_name,category,username,owner,thumb_name) values ('$thumb_fname','$tid','$usern','$usern','$fname')";
                  $result=mysql_query($sql);
        
    }
    else{
        
          if($caption!=null)
       $sql="insert into testblob (file_name,category,username,caption,owner) values ('$fname','$tid','$usern','$caption','$usern')";
       else
       $sql="insert into testblob (file_name,category,username,owner) values ('$fname','$tid','$usern','$usern')";
                  $result=mysql_query($sql);
        
    }
      
   
     
     
}
else{
    echo "something went wrong";
     unset($_FILES);
    exit();}

?>     
