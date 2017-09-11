<?php

 

function broadcastpost_common($usern,$mem_id,$caption,$all_tagy,$catin,$anon,$polloption,$mul_cor,$mebateyga,$u_ids){
          // tag checker
          $tagless=0;
          $personal=0;
          $ar_u_ids=array();
          if($all_tagy==""){$tagless=1;}
          if($u_ids!=""){$personal=1;}
          
      $mod=$_SESSION['SESS_MODE'];
      if($personal==1){
          //for personal
          echo $u_ids."<br>";
          $ar_u_ids=  explode(',', $u_ids, 31);
       
       unset($ar_u_ids[31]);
         $ar_u_ids=array_unique($ar_u_ids);
         
         echo"-----u_ids-----";
    echo implode(',',$ar_u_ids);
    $sqm555=mysql_query("select mem_id from member where mem_id in (".implode(',',$ar_u_ids).")");
    unset($ar_u_ids);
    $ar_u_ids=array();
     if(mysql_num_rows($sqm555)>0){
         while($run555=mysql_fetch_row($sqm555)){
             array_push($ar_u_ids, $run555[0]);
         }
         echo implode(',',$ar_u_ids);
         
     }else{return 0;
         exit();}
    
      
          
      }
      if($tagless==0 && ($personal==0 || $personal==1) ){
      $intag="";
      
      $cotag="";
      $tagsy= array();
      $arall_tagy= array();
      
      echo"raw data----<br>";
      //tag wala hai to kya hoga
      
      echo $all_tagy."<br>";
      
      
       $arall_tagy=  explode(',', $all_tagy, 8);
       
       unset($arall_tagy[8]);
         $arall_tagy=array_unique($arall_tagy);
         $arall_tagy=  array_map('strtoupper', $arall_tagy);
    
      foreach ($arall_tagy as $value) {
            
      $intag=$intag."'".$value."',";
      
      }
         $intag=$intag."'HELL'"; 
         echo"intag data----<br>";
         echo $intag."<br>";
        $sqm=mysql_query("select tag_name from broadcast_tags where tag_name in($intag) and (mode='$mod' or mode=0)");
           echo"selected data----<br>"; 
           if(mysql_num_rows($sqm)>0){
               //for content upload --------------------------------------------------------------------
             
                                    $category=$catin;
                 if($mebateyga==1 && $caption!=''){
                     //for chat
                 $qry="insert into broadcast_post (category_id,username,caption,owner,anonymous) values ('$category','$usern','$caption','$usern','$anon')";
                  $result=mysql_query($qry);
                if($result){
                   $content_id=mysql_insert_id();
                   
                }               
                 
                 }
                 else if($mebateyga==2){
                     //for media
                     $content_id=mediarakh($catin,$anon,$caption);
                 }
                 else if($mebateyga==3 && $caption!=''){
                     //for poll
                      $qry="insert into broadcast_post (category_id,username,caption,owner,poll_type,anonymous) values ('$catin','$usern','$caption','$usern',0,'$anon')";
                $result=mysql_query($qry);
                if($result){$poll_id=mysql_insert_id();
                
                    
                  foreach ($polloption as &$value) {
                   $value=trim($value);
                     $qry="insert into broadcast_poll_option (image_id,poll_option) values ('$poll_id','$value')";
                $result=mysql_query($qry);
                            }  
                   $content_id=$poll_id; 
                }
                     
                 }
                 else{return 0;
                     exit();}                 
                                  
                
                                
                                
               //content upload over -------------------------------------------------------------------------
        while($runop=  mysql_fetch_row($sqm))
        { $runop[0]=trim($runop[0]);
            array_push($tagsy,$runop[0]); 
        echo $runop[0]."--<br>";
        }  
         
      
        
       
         
         
         //end
        
//tagy work
       
        
        
        $tags_co= array();
        $tags_co_id=array();
        $tags_yr_co_id=array();
       
        $tags_yr_co_num=array();
        $tags_yr_br_num=array();
        $tags_yr_br_id=array();
        $tags_sec=array();
       
        $tags_sec_id=array();
        $tags_sec_yr=array();
        $tags_br= array();
        $tags_br_id= array();
        $tags_yr_co= array();
        $tags_yr_br= array();
        
        $tags_every= 0;
        $tags_teachers= 0;
        $tags_students= 0;
        
        $statement="The message has been sent to ";
        
        
         
       
         echo "<code>".$caption."</code><br>";
         
         $eve=  array_search('EVERYONE',$tagsy);
         if(is_numeric($eve)){ echo $eve."--";
             echo"everyone found do its stuff";
             //here no need to worry about personal....
         $qrye="insert into access (image_id,post_mode,owner_id,category_id) values ('$content_id',0,'$mem_id','$catin')";
                $resulte=mysql_query($qrye);
         echo $statement.$tagsy[$eve];
          $tagsy= reset($tagsy);
         $tags_every= 1;
         
         }
         else{
         echo"else";
         //two childs students and teachers
         $eve11=  array_search('STUDENTS',$tagsy);
            $eve12=  array_search('TEACHERS',$tagsy);
           //------+-----------+-------------+-----------+----------+-------+-----------+--------+---------+------------+-----------+---------------------------------
        
         if(is_numeric($eve11)){ 
             echo"students found do its stuff";
             //for personal--- only teachers---- check it..................
              $qrys="insert into access (image_id,post_mode,owner_id,category_id,personal) values ('$content_id',1,'$mem_id','$catin','$personal')";
                $results=mysql_query($qrys);
                if($results){
        $acc_stud=mysql_insert_id();
        if($personal==1){
            $qryt4=mysql_query("insert into access_mem_p (user_id,image_id,access_id) (select mem_id,'$content_id','$acc_stud' from member where mem_id in (".implode(',',$ar_u_ids).") and mode_id=2)");
                echo"kaam ho gya personal student";
            
        }
        
                }
         echo $statement.$tagsy[$eve11];
           unset($tagsy[$eve11]);
         $tags_students= 1;
         
         }
         else{
             $access1=null;
             function getaccess1(&$acc,$con_id,$m_id,$cat,$personal,$ar_u_ids){
                 if($acc===null){
        $mqry=mysql_query("select access_id from access where image_id='$con_id' and post_mode=1");
        if(mysql_num_rows($mqry)>0){ 
        $mqryr=mysql_fetch_row($mqry);
        $acc=$mqryr[0];
        }else{
        $qrye1="insert into access (image_id,post_mode,owner_id,category_id,personal) values ('$con_id',1,'$m_id','$cat','$personal')";
                $resulte1=mysql_query($qrye1);
                if($resulte1){
        $acc=mysql_insert_id();
        if($personal==1){
            $qryt489=mysql_query("insert into access_mem_p (user_id,image_id,access_id) (select mem_id,'$con_id','$acc' from member where mem_id in (".implode(',',$ar_u_ids)."))");
                echo"kaam ho gya personal student";
            
        }
        
                }}}
        
        return $acc;         
                 
             }
             
             echo"<br>else11<br>";
         
         foreach ($tagsy as $value) {
            
      $cotag=$cotag."'".$value."',";
      
      }
         $cotag=$cotag."'HELL'"; 
         
         //student child tree
           $sqlm=mysql_query("select tag_name,ref_id from broadcast_tags where tag_name in($cotag) and (mode='$mod' or mode=0) and type=2");
           echo"selected co --data----<br>"; 
           if(mysql_num_rows($sqlm)>0){
        while($runco=  mysql_fetch_row($sqlm))
        { $runco[0]=trim($runco[0]);
            array_push($tags_co,$runco[0]); 
            array_push($tags_co_id,$runco[1]); 
            $tagsy = array_diff($tagsy, ["$runco[0]"]);
        echo $runco[0]."---".$runco[1]."--<br>";
        // do the course stuff
        $access1=getaccess1($access1,$content_id,$mem_id,$catin,$personal,$ar_u_ids);
                   $qrye11="insert into access_stud (image_id,access_id,course_id,tag_type) values ('$content_id','$access1','$runco[1]',2)";
                $resulte11=mysql_query($qrye11);
                if($resulte11){echo'CO-yes';}
                   
                   
                
        
        
           } 
           
           
           
        }else{echo"<br>else21<br>";
        //do nothing
         }
         //-------------------------==--------------------==-----------------==--------------------==-------==------
        unset($cotag);
        $cotag="";
         foreach ($tagsy as $value) {
            
      $cotag=$cotag."'".$value."',";
      
      }
         $cotag=$cotag."'HELL'"; 
         
          if(!empty($tags_co_id)){
              $not_emp="and ref_id NOT IN (".implode(',',$tags_co_id).")";}
          else{$not_emp="";}
          
         $sqlmn=mysql_query("select tag_name,ref_id from broadcast_tags where tag_name in($cotag) and (mode='$mod' or mode=0) and type=6 ".$not_emp);
        echo"selected yr_co --data----<br>"; 
          if(mysql_num_rows($sqlmn)>0){
              
        while($runyrco=  mysql_fetch_row($sqlmn))
        { $runyrco[0]=trim($runyrco[0]);
            array_push($tags_yr_co,$runyrco[0]); 
            array_push($tags_yr_co_id,$runyrco[1]); 
            $yr_num=preg_replace('/\D/', '', $runyrco[0]);
            array_push($tags_yr_co_num,$yr_num); 
            $tagsy = array_diff($tagsy, ["$runyrco[0]"]);
        echo $runyrco[0]."---".$runyrco[1]."--".$yr_num."--<br>";
        // do the yr_course stuff
        $access1=getaccess1($access1,$content_id,$mem_id,$catin,$personal,$ar_u_ids);
        
        $qrye21="insert into access_stud (image_id,access_id,course_id,year,tag_type) values ('$content_id','$access1','$runyrco[1]','$yr_num',6)";
                $resulte21=mysql_query($qrye21);
                if($resulte21){echo'CO-yr -yes';}
        
        
        
           } 
           
           
           
        }else{
            
            //remove yr-co tags
        }
        //-------==-------==--------==--------==-------==--------==-----------==-----------==--------==------- 
        unset($cotag);
        $cotag="";
         foreach ($tagsy as $value) {
            
      $cotag=$cotag."'".$value."',";
      
      }
         $cotag=$cotag."'HELL'"; 
        
          //----------------------------------------------------------------------------------------------------------------------------------------   
        // for branch
        //echo "input branch tags<br>";
        $line=mysql_query("select tag_name,ref_id from broadcast_tags where tag_name in ($cotag) and (mode='$mod' or mode=0) and type=3 ");
         if(mysql_num_rows($line)>0){
        while($rest=  mysql_fetch_row($line)){
              array_push($tags_br,$rest[1]);
               $tagsy = array_diff($tagsy, ["$rest[0]"]);
            //  echo $rest[0]."---".$rest[1]."--<br>";
        }
           
        
         if(!empty($tags_co_id)){
              $not_emp6="and course_id NOT IN (".implode(',',$tags_co_id).")";}
          else{$not_emp6="";}
        $lineb=mysql_query("select branch_id,branch_full from branch where branch_id IN (".implode(',',$tags_br).") ".$not_emp6);
       echo"selected branch --data----<br>";
         if(mysql_num_rows($lineb)>0){
                 
        while($resu=mysql_fetch_row($lineb))
        { 
            array_push($tags_br_id,$resu[0]); 
        echo $resu[0]."---".$resu[1]."--<br>";
        // do the branch stuff
        $access1=getaccess1($access1,$content_id,$mem_id,$catin,$personal,$ar_u_ids);
        
        $qrye31="insert into access_stud (image_id,access_id,branch_id,tag_type) values ('$content_id','$access1','$resu[0]',3)";
                $resulte31=mysql_query($qrye31);
                if($resulte31){echo'br-yes';}
        
        
        
           } 
           
           
           
        }else{}
               
        
        
        }
        
        
        
        
        
        
        //---------------------------------------------------------------------------------------------------------------------------------------------
        //------==---------==----------==-------------==------------==---------------==--------------==------------------
         unset($cotag);
        $cotag="";
         foreach ($tagsy as $value) {
            
      $cotag=$cotag."'".$value."',";
      
      }
         $cotag=$cotag."'HELL'"; 
          if(!empty($tags_br_id)){
              $not_emp2="and ref_id NOT IN (".implode(',',$tags_br_id).")";}
          else{$not_emp2="";}
        
          
         $sqlmno=mysql_query("select tag_name,ref_id from broadcast_tags where tag_name in($cotag) and (mode='$mod' or mode=0) and type=5 ".$not_emp2);
        echo"selected yr_br --data----<br>"; 
          if(mysql_num_rows($sqlmno)>0){
              
        while($runyrbr=  mysql_fetch_row($sqlmno))
        { $runyrbr[0]=trim($runyrbr[0]);
            array_push($tags_yr_br,$runyrbr[0]); 
            array_push($tags_yr_br_id,$runyrbr[1]); 
            $yr_num=preg_replace('/\D/', '', $runyrbr[0]);
            array_push($tags_yr_br_num,$yr_num); 
            $tagsy = array_diff($tagsy, ["$runyrbr[0]"]);
         
             if(!empty($tags_co_id)){ 
         $matr2=  mysql_query("select branch_id from branch where branch_id='$runyrbr[1]' and course_id NOT IN (".implode(',',$tags_co_id).")"); 
            
            if(mysql_num_rows($matr2)>0)   
        {echo $runyrbr[0]."---".$runyrbr[1]."--".$yr_num."--<br>";
        // do the yr_branch stuff
        $access1=getaccess1($access1,$content_id,$mem_id,$catin,$personal,$ar_u_ids);
        
        $qrye51="insert into access_stud (image_id,access_id,branch_id,year,tag_type) values ('$content_id','$access1','$runyrbr[1]','$yr_num',5)";
                $resulte51=mysql_query($qrye51);
             if($resulte51){echo'br-yr-yes';}}}
             else{
                echo $runyrbr[0]."---".$runyrbr[1]."--".$yr_num."--<br>";
        // do the yr_branch stuff
        $access1=getaccess1($access1,$content_id,$mem_id,$catin,$personal,$ar_u_ids);
        
        $qrye51="insert into access_stud (image_id,access_id,branch_id,year,tag_type) values ('$content_id','$access1','$runyrbr[1]','$yr_num',5)";
                $resulte51=mysql_query($qrye51);
             if($resulte51){echo'br-yr-yes';} 
                 
                 
                 
             }
        
           } 
           
           
           
        }else{}
         //----------------------------------------------------------------------------------------------------------------------------------------------------------
         
          //---------------------------------------------------------------------------------------------------------------------------------------------
      //-------------==-------------------==---------------==-------------------==---------------==-------------------------  
         unset($cotag);
        $cotag="";
         foreach ($tagsy as $value) {
            
      $cotag=$cotag."'".$value."',";
      
      }
         $cotag=$cotag."'HELL'"; 
         
        
          
         $sqlmns=mysql_query("select tag_name,ref_id from broadcast_tags where tag_name in($cotag) and (mode='$mod' or mode=0) and type=4 ");
        echo"selected section --data----<br>"; 
          if(mysql_num_rows($sqlmns)>0){
              
        while($runsec=  mysql_fetch_row($sqlmns))
        { //no need of other things ,we have got section id !!!!
            
            array_push($tags_sec,$runsec[0]); 
            array_push($tags_sec_id,$runsec[1]); 
            $yr_num=preg_replace('/\D/', '', $runsec[0]);
            array_push($tags_sec_yr,$yr_num); 
            $tagsy = array_diff($tagsy, ["$runsec[0]"]);
             if(!empty($tags_co_id)){
              $not_emp3="and course_id NOT IN (".implode(',',$tags_co_id).")";}
          else{$not_emp3="";}
          
           if(!empty($tags_br_id)){
              $not_emp4="and branch_id NOT IN (".implode(',',$tags_br_id).")";}
          else{$not_emp4="";}
            
           $matr=  mysql_query("select section_id from section where section_id='$runsec[1]' ".$not_emp3." ".$not_emp4); 
            
            if(mysql_num_rows($matr)>0)
       { echo $runsec[0]."---".$runsec[1]."--".$yr_num."--<br>";
        // do the section stuff
        $access1=getaccess1($access1,$content_id,$mem_id,$catin,$personal,$ar_u_ids);
        
        $qrye41="insert into access_stud (image_id,access_id,section_id,tag_type) values ('$content_id','$access1','$runsec[1]',4)";
                $resulte41=mysql_query($qrye41);
       if($resulte41){echo'section-yes';}}
        
        
        
        
           } 
           
           
           
        }else{}
         //-----------------------------------------------------------------------------------------------------------------------------------------------
        
        if(!empty($tagsy)){
            echo "<br>---------------".implode(',',$tagsy)."------------<br>";
        }
        else{
            echo"<br>---------empty------------------<br>";
        }
         
         }
         //--------------+----------+---------------+------------------+---------------------+---------------+-----------------+-----------------------------------------------
         
         if(is_numeric($eve12)){ 
             echo"teachers found do its stuff";
             //here in personal only students can be added....
             $qryt="insert into access (image_id,post_mode,owner_id,category_id,personal) values ('$content_id',2,'$mem_id','$catin','$personal')";
                $resultt=mysql_query($qryt);
                if($resultt){
        $acc_teach=mysql_insert_id();
        if($personal==1){
            $qryt4=mysql_query("insert into access_mem_p (user_id,image_id,access_id) (select mem_id,'$content_id','$acc_teach' from member where mem_id in (".implode(',',$ar_u_ids).") and mode_id=1)");
                echo"kaam ho gya personal teach";
            
        }
        
                }
         echo $statement.$tagsy[$eve12];
          unset($tagsy[$eve12]);
         $tags_teachers= 1;
         
         }
         else{
             //do nothing
             echo"<br>else12<br>";}
       //------+-----------+-------------+-----------+----------+-------+-----------+--------+---------+------------+-----------+---------------------------------
         
         
        
            }
			
                                
}
else{return 0;
                     exit();}    


         }
            else if($tagless==1 && $personal==1){
                
                //only personal will be post ........
//---------for content upload --------------------------------------------------------------------
             
                                    $category=$catin;
                 if($mebateyga==1 && $caption!=''){
                     //for chat
                 $qry="insert into broadcast_post (category_id,username,caption,owner,anonymous) values ('$category','$usern','$caption','$usern','$anon')";
                  $result=mysql_query($qry);
                if($result){
                   $content_id=mysql_insert_id();
                   
                }               
                 
                 }
                 else if($mebateyga==2){
                     //for media
                     $content_id=mediarakh($catin,$anon,$caption);
                     if($content_id==false){
                         return 0;
                         exit();
                     }
                 }
                 else if($mebateyga==3 && $caption!=''){
                     //for poll
                      $qry="insert into broadcast_post (category_id,username,caption,owner,poll_type,anonymous) values ('$catin','$usern','$caption','$usern',0,'$anon')";
                $result=mysql_query($qry);
                if($result){$poll_id=mysql_insert_id();
                
                    
                  foreach ($polloption as &$value) {
                   $value=trim($value);
                     $qry="insert into broadcast_poll_option (image_id,poll_option) values ('$poll_id','$value')";
                $result=mysql_query($qry);
                            }  
                   $content_id=$poll_id; 
                }
                     
                 }
                 else{return 0;
                     exit();}                 
                                  
                
                                
                                
               //content upload over -------------------------------------------------------------------------
                
                //for access 
         
                $qrye=mysql_query("insert into access (image_id,post_mode,owner_id,category_id,tagless,personal) values ('$content_id',0,'$mem_id','$catin','$tagless','$personal')");
                 if($qrye){
        $acc_personal=mysql_insert_id();
        
            $qryt4=mysql_query("insert into access_mem_p (user_id,image_id,access_id) (select mem_id,'$content_id','$acc_personal' from member where mem_id in (".implode(',',$ar_u_ids)."))");
                echo"kaam ho gya personal only chal gya";
            
        
        
                }
            }
            else{
                                return 0;
                                exit();}
                              return 1;
}


 
 function mediarakh($catin,$anon,$caption){
 


$image_check=false;

$myaccept_mime=array('image/jpeg','image/png','image/gif','image/jpg','application/pdf','audio/mpeg','application/msword','application/vnd.openxmlformats-officedocument.wordprocessingml.document','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet','application/vnd.openxmlformats-officedocument.presentationml.presentation','application/vnd.ms-excel','application/vnd.ms-powerpoint','application/x-rar-compressed','application/zip','application/vnd.oasis.opendocument.presentation','application/x-rar');
$caption=  addslashes($_POST['caption']);


 $usern=$_SESSION['SESS_USERNAME'];
 $check_name=  strlen(get_basename($_FILES['file']['tmp_name']));
 if($check_name==0 || $check_name>=150){
     echo "file nametoo long";
      unset($_FILES);
      return false; 
     exit();}
$size=formatbytes($_FILES['file']['tmp_name']);
$in_mime=mime_content_type($_FILES['file']['tmp_name']);
echo $in_mime;
$mime_res=array_search($in_mime,$myaccept_mime,true);
if($mime_res===false){echo "incorrect mime";
 unset($_FILES);
 return false;
    exit();}
if (!empty($_FILES) && $size!=0 && ($size/1024/1024)<=20 && $_FILES['file']['error'] === UPLOAD_ERR_OK ) {

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
  
  
    
    
    if($ext=="jpg"||$ext=="jpeg"||$ext=="png"|| $ext=="gif"){
        $image_check=true;
    }
   
   if($image_check==true){
$imagedetails = getimagesize($_FILES['file']['tmp_name']);
$width = $imagedetails[0];
$height = $imagedetails[1];
   }
   
mkdir("../broadcast_user_files/$usern");

if($image_check==true){
    if($anon==0){
mkdir("../broadcast_user_files/$usern/thumb");}
else if($anon==1){
   mkdir("../broadcast_user_files_anony/thumb"); 
}
    }

$today = date("Y-m-d H:i");
$today=base64_encode($today);
$ses_id=  session_id();
$anony_today='a_'.$today;
$today=$today.$ses_id;
if($anon==0){
mkdir("../broadcast_user_files/$usern/$today");}
else if($anon==1){
   mkdir("../broadcast_user_files_anony/$anony_today"); 
}
if($image_check==true){
    if($anon==0){
    mkdir("../broadcast_user_files/$usern/thumb/$today");}
    else if($anon==1){
      mkdir("../broadcast_user_files_anony/thumb/$anony_today");  
    }

}
if($anon==0){
$fname="broadcast_user_files/$usern/$today/$filename";}
else if($anon==1){
   $fname="broadcast_user_files_anony/$anony_today/$filename"; 
}

if($image_check==true){
    if($anon==0){
$thumb_fname="broadcast_user_files/$usern/thumb/$today/$filename";}
else if($anon==1){
    $thumb_fname="broadcast_user_files_anony/thumb/$anony_today/$filename";
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
        if($caption!=null){
       $sql="insert into broadcast_post (image_name,category_id,username,caption,owner,thumb_name,anonymous) values ('$thumb_fname','$catin','$usern','$caption','$usern','$fname','$anon')";
        }else
        {$sql="insert into broadcast_post (image_name,category_id,username,owner,thumb_name,anonymous) values ('$thumb_fname','$catin','$usern','$usern','$fname','$anon')";
        }  
        $result=mysql_query($sql);
        if($result){
                   $content_id=mysql_insert_id();
                   
                }    
    }
    else if($ext=="gif"){
         if($caption!=null)
         {$sql="insert into broadcast_post (gif_name,category_id,username,caption,owner,thumb_name,anonymous) values ('$thumb_fname','$catin','$usern','$caption','$usern','$fname','$anon')";
         }else
         {$sql="insert into broadcast_post (gif_name,category_id,username,owner,thumb_name,anonymous) values ('$thumb_fname','$catin','$usern','$usern','$fname','$anon')";
         }        $result=mysql_query($sql);
         if($result){
                   $content_id=mysql_insert_id();
                   
                }    
        
    }
    else{
        
          if($caption!=null)
          {$sql="insert into broadcast_post (file_name,category_id,username,caption,owner,anonymous) values ('$fname','$catin','$usern','$caption','$usern','$anon')";
          }else
          {$sql="insert into broadcast_post (file_name,category_id,username,owner,anonymous) values ('$fname','$catin','$usern','$usern','$anon')";
          }       $result=mysql_query($sql);
          if($result){
                   $content_id=mysql_insert_id();
                   
                }    
        
    }
      
   
     
     return $content_id;
}
else{
    echo "something went wrong";
     unset($_FILES);
     return false;
    exit();}
 }

?>