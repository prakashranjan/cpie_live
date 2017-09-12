
<?php
require_once('../auth.php');
 include("../connection.php");	
  include("../commonfun.php");
  require '../Zebra_Image.php';


$image_check=false;
$hide_t2=  addslashes($_POST['hide_t2']); 
$anon2=  addslashes($_POST['anon2']); 
echo "----------".$hide_t2;
echo "----------".$anon2;

$myaccept_mime=array('image/jpeg','image/png','image/gif','image/jpg','application/pdf','audio/mpeg','application/msword','application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','application/vnd.openxmlformats-officedocument.presentationml.presentation','application/vnd.ms-excel','application/vnd.ms-powerpoint','application/x-rar-compressed','application/zip','application/vnd.oasis.opendocument.presentation','application/x-rar');
$caption=  addslashes($_POST['caption']);

$tn=$_POST['tn'];
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
  
  
    
   $qr=mysql_query("select category from section where section_id='$tn'"); 
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
   
mkdir("../channel_user_files/$usern",0760);
if($anon2==0){
mkdir("../channel_user_files/$usern/$tid",0760);}
else if($anon2==1){
mkdir("../channel_user_files_anony/$tid",0760);    
}

if($image_check==true){
    if($anon2==0){
mkdir("../channel_user_files/$usern/$tid/thumb",0760);}
else if($anon2==1){
   mkdir("../channel_user_files_anony/$tid/thumb",0760); 
}
    }

$today = date("Y-m-d H:i");
$today=base64_encode($today);
$ses_id=  session_id();
$anony_today='a_'.$today;
$today=$today.$ses_id;


if($anon2==0){
mkdir("../channel_user_files/$usern/$tid/$today",0760);}
else if($anon2==1){
   mkdir("../channel_user_files_anony/$tid/$anony_today",0760); 
}

if($image_check==true){

 if($anon2==0){
    mkdir("../channel_user_files/$usern/$tid/thumb/$today",0760);}
    else if($anon2==1){
      
      mkdir("../channel_user_files_anony/$tid/thumb/$anony_today",0760);
    }

}

if($anon2==0){
$fname="channel_user_files/$usern/$tid/$today/$filename";}
else if($anon2==1){
   $fname="channel_user_files_anony/$tid/$anony_today/$filename"; 
}





if($image_check==true){
    if($anon2==0){
$thumb_fname="channel_user_files/$usern/$tid/thumb/$today/$filename";}
else if($anon2==1){
    $thumb_fname="channel_user_files_anony/$tid/thumb/$anony_today/$filename";
}

    }


    move_uploaded_file($tempFile,"../".$fname);
    if($image_check==true){
     $image = new Zebra_Image();

  
    // indicate a source image
    $image->source_path ="../".$fname;

   

    // indicate a target image
    $image->target_path = "../".$thumb_fname ;
    $cheight=450;
    $cwidth=450;
    if($height<450 && $width<450){
        $cheight=$height;
        $cwidth=$width;
    }
 
   
    // resize
    // and if there is an error, show the error message
    if (!$image->resize($cwidth,$cheight,ZEBRA_IMAGE_NOT_BOXED, -1)) {show_error($image->error, $image->source_path, $image->target_path);}  
    
    
    
    }
    
    
    if($ext=="jpg"||$ext=="jpeg"||$ext=="png"){
        if($caption!=null)
       $sql="insert into channel_post (image_name,category,username,caption,owner,thumb_name,anonymous,mode_id) values ('$thumb_fname','$tid','$usern','$caption','$usern','$fname','$anon2','$hide_t2')";
       else
       $sql="insert into channel_post (image_name,category,username,owner,thumb_name,anonymous,mode_id) values ('$thumb_fname','$tid','$usern','$usern','$fname','$anon2','$hide_t2')";
           
        $result=mysql_query($sql);
    }
    else if($ext=="gif"){
         if($caption!=null)
       $sql="insert into channel_post (gif_name,category,username,caption,owner,thumb_name,anonymous,mode_id) values ('$thumb_fname','$tid','$usern','$caption','$usern','$fname','$anon2','$hide_t2')";
       else
       $sql="insert into channel_post (gif_name,category,username,owner,thumb_name,anonymous,mode_id) values ('$thumb_fname','$tid','$usern','$usern','$fname','$anon2','$hide_t2')";
                  $result=mysql_query($sql);
        
    }
    else{
        
          if($caption!=null)
       $sql="insert into channel_post (file_name,category,username,caption,owner,anonymous,mode_id) values ('$fname','$tid','$usern','$caption','$usern','$anon2','$hide_t2')";
       else
       $sql="insert into channel_post (file_name,category,username,owner,anonymous,mode_id) values ('$fname','$tid','$usern','$usern','$anon2','$hide_t2')";
                  $result=mysql_query($sql);
        
    }
      
   
     
     
}
else{
    echo "something went wrong";
     unset($_FILES);
    exit();}

?>     
