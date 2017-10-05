<?php 
require_once('auth.php');
include("connection.php");
include("commonfun.php");
include("vcommon.php");

$type_id=cleankar($_POST['typeid']);
$topic_vis=cleankar($_POST['topic_visi']);
$cdesc=  addslashes($_POST['cdesc']);
   $private=cleankar($_POST['private']); 
    $newcat= addslashes($_POST['newcat']);
   $topictagy=  addslashes($_POST['ttagy']);
   if(($type_id!="" && $newcat!="") ||($type_id=="" && $newcat=="") ){ //exit case
                                            echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> something went wrong.
</div>';
                      exit();}

                    $uname=$_SESSION['SESS_USERNAME'];
                    $newtopic= addslashes($_POST['ntopic']);
                    $newtopic =trim($newtopic);
                    $newtopic = preg_replace('/\s+/', '_', $newtopic);
					$qr="select (category) from topic where category='$newtopic'";
                    $res=mysql_query($qr);
					if($outp=mysql_fetch_row($res))
					{
                   echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> Channel already exist.
</div>';
                }	
					else if($newtopic=="" || $topictagy=="")
					{echo ' <div class="alert alert-warning">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>please!</strong> enter something.
</div>';   }
				else
					{savenewtopic($newtopic);}
                
            
            
            function savenewtopic($newtopic)
            { $alltopic_tagy=array();
            $tag_id_ar=array();
                $usern=$_SESSION['SESS_USERNAME'];
            $mem_id=$_SESSION['SESS_MEMBER_ID'];
			$uname=$_SESSION['SESS_USERNAME'];
                         $newcat= addslashes($_POST['newcat']);
      $type_id=cleankar($_POST['typeid']);
      $topic_vis=cleankar($_POST['topic_visi']);
      $topictagy=  addslashes($_POST['ttagy']);
      $alltopic_tagy=  explode(',', $topictagy, 8);
       unset($alltopic_tagy[8]);
         $alltopic_tagy=array_unique($alltopic_tagy);
         $alltopic_tagy=  array_map('strtoupper', $alltopic_tagy);
       foreach ($alltopic_tagy as &$value) {
           
       $value = preg_replace('/\s+/', '_', $value);
      // echo $value."<br>";
       }
      // echo implode(',',$alltopic_tagy);
       
       // for type_id and checking of newcat
      
      if($type_id!=""){//here $type_id is true       
        $res555=mysql_query("select branch_id from type where branch_id='$type_id'");
                  if(mysql_num_rows($res555)==1){//here $type_id verified
                  $resrun=  mysql_fetch_row($res555);
                  $type_id=$resrun[0];
                      
                  }else{
                      echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> something went wrong.
</div>';
                      exit();
                  }
          
      }
      else if($newcat!=""){
          //here newcat will be insterted after checking..
           
                    $newcat =trim($newcat);
                    $newcat = preg_replace('/\s+/', '_', $newcat);
                    $newcat = "#".$newcat;
					$qr="select type from type where type='$newcat'";
                    $res=mysql_query($qr);
                                        if(mysql_num_rows($res)==1){
                                            //exit case
                                            echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> something went wrong.
</div>';
                      exit();
                                        }
                                        else if (mysql_num_rows($res)==0){
                                            $qry458=mysql_query("INSERT INTO type(type,username)  VALUES ('$newcat','$usern')");
                                            if($qry458){
                                                $type_id=mysql_insert_id();
                                            }
                                            else{
                                                echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> something went wrong.
</div>';
                      exit();
                                            }
                
                                            
                                        }
                                        else{
                                                echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> something went wrong.
</div>';
                      exit();
                                            }
          
          
          
      }
      else{
          echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> something went wrong.
</div>';
                      exit();
          
      }
       
      if($_SESSION['SESS_MODE']==$topic_vis || $topic_vis==0){ 
			
      
				$cdesc= addslashes($_POST['cdesc']);
                                $cdesc=strip_tags($cdesc);
                               
                                 $l = rand(1,9);

              $source="images/tt".$l.".png";
              
        $cdesc=trim($cdesc);
          $cdesc=carbonlink($cdesc);
               $private=  addslashes($_POST['private']);  
                $qry45="INSERT INTO topic (category,user,type_id,wall,cdesc,private,topic_mode) VALUES ('$newtopic','$uname','$type_id','$source','$cdesc','$private','$topic_vis')";
                $result45=mysql_query($qry45);
                if($result45)
                {  $newtopic_id=mysql_insert_id();
                    $qry89="INSERT INTO private_member (username,category,allow) VALUES ('$usern','$newtopic',1)";
                
                if($private==1){$result89=mysql_query($qry89);}
                $sql345=mysql_query("INSERT INTO favourites (username,topicid,category) VALUES ('$usern','$newtopic_id','$newtopic')");
			    
				$mql345=mysql_query("update favourites set views= views+1 where username='$usern' and topicid='$newtopic_id'");
				
                                $mqlm345=mysql_query("update topic set hearts= hearts+1 where topic_id='$newtopic_id'");
			
                
                $matbo="";
                
                foreach ($alltopic_tagy as $valtu) {
            
      $matbo=$matbo."'".$valtu."',";
      
      }
         $matbo=substr($matbo, 0, -1); 
                
                    
                $macbo=mysql_query("SELECT tagl_id,tag_name FROM tag_list WHERE tag_name IN ($matbo)");
         
          if(mysql_num_rows($macbo)>0){
              
              while($run=mysql_fetch_row($macbo)){
                //  echo "match".$run[1]."<br>";
                  array_push($tag_id_ar,$run[0]);
                  $alltopic_tagy = array_diff($alltopic_tagy, ["$run[1]"]);
                  
              }
           //  echo "<br>copy hata ke".implode(',',$alltopic_tagy); 
          }
          else{
             // echo "<br>no match".implode(',',$alltopic_tagy);
              }
          if(!empty($alltopic_tagy)){
              
                 foreach ($alltopic_tagy as $valse) {
                   //  echo $valse."<br>";
             $qrypo=mysql_query("INSERT INTO tag_list (tag_name) VALUES ('$valse')");
                   $newtag_id=mysql_insert_id();
                   array_push($tag_id_ar,$newtag_id);
                }
                    //echo "<br>new entry".implode(',',$alltopic_tagy); 
                 }
                               //  echo "<br>all".implode(',',$tag_id_ar);                     
                                                  foreach ($tag_id_ar as $valme) {
             $qml=mysql_query("INSERT INTO topic_tag (topic_id,tagl_id) VALUES ('$newtopic_id','$valme')");
                 
                                                     }    
                                                     
          
                   echo ' <div class="alert alert-success">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong> Channel added successfully.
                     </div>';
					
					//$hint="newchannel";
					// $qry459="select topic_id from topic  where category='$newtopic'";
               // $result459=mysql_query($qry459);
			//		$tidu=mysql_fetch_row($result459);

 //$qry456="INSERT INTO notification (worker,channel_id,hint) VALUES ('$usern','$tidu[0]','$hint')";
    //            $result456=mysql_query($qry456);
					
					
					
                }
                else
                {
                   echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> something went wrong.
</div>';
			}
            }
            else{
                echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> something went wrong.
</div>';
            }
                }


//Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);

            ?>
			