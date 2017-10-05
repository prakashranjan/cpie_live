  <?php
require_once('auth.php');
 include("connection.php");	
 include("commonfun.php");
 include("vcommon.php");
 $usern=$_SESSION['SESS_USERNAME'];
 
$tid=addslashes($_POST['tid']);
$topictagy=  addslashes($_POST['newtag']);
if($tid=="" || $topictagy=="" ){
    exit();
}

savenewtags();
          
          
                  
// new tags function

function savenewtags()
            { $alltopic_tagy=array();
            $tag_id_ar=array();
            $tid=addslashes($_POST['tid']);
                $usern=$_SESSION['SESS_USERNAME'];
            $mem_id=$_SESSION['SESS_MEMBER_ID'];
			$uname=$_SESSION['SESS_USERNAME'];

   
      $topictagy=  addslashes($_POST['newtag']);
      $alltopic_tagy=  explode(',', $topictagy, 8);
       unset($alltopic_tagy[8]);
         $alltopic_tagy=array_unique($alltopic_tagy);
         $alltopic_tagy=  array_map('strtoupper', $alltopic_tagy);
       foreach ($alltopic_tagy as &$value) {
           
       $value = preg_replace('/\s+/', '_', $value);
       //echo $value."<br>";
       }
       //echo implode(',',$alltopic_tagy);
       
       // previous tags 

          $prev_tags=array();
          $input_tags=array();
          $input_tags=$alltopic_tagy;
          $mes=mysql_query("SELECT tag_list.tag_name
FROM tag_list
INNER JOIN topic_tag  where tag_list.tagl_id=topic_tag.tagl_id
and topic_tag.topic_id='$tid'");
                   if($mes){ while($reso=mysql_fetch_row($mes)){
                        array_push($prev_tags,$reso[0]); 
                        $alltopic_tagy = array_diff($alltopic_tagy, ["$reso[0]"]);
                   }
                   //echo implode(',',$prev_tags);
                   }
       $cmatbo="";
      //  foreach ($alltopic_tagy as $valtu) {
            
    //  echo $cmatbo."'".$valtu."',";
      
     // }
     // echo"-----------------------------------------------------------------";
       $temptag=array_diff($input_tags, $alltopic_tagy) ;
       $newtemptag=array_diff($prev_tags, $temptag) ; 
      // echo implode(',',$temptag);
      // echo"-----------------------";
      // echo implode(',',$newtemptag); 
       
       if(!empty($newtemptag)){
           // for deletion
           $dmatbo="";
                 foreach ($newtemptag as $valke) {
                      $dmatbo=$dmatbo."'".$valke."',";    
                }
                 $dmatbo=substr($dmatbo, 0, -1); 
                $nqrypo=mysql_query("DELETE from topic_tag where topic_id = '$tid' && tagl_id IN "
                     . "(select tagl_id from tag_list where tag_name IN ($dmatbo) )");
                
                  //  echo "<br>deleted entry".implode(',',$newtemptag); 
           
           
       }
       
       
      if(!empty($alltopic_tagy))
                {  
                    
         
                $matbo="";
                
                foreach ($alltopic_tagy as $valtu) {
            
      $matbo=$matbo."'".$valtu."',";
      
      }
         $matbo=substr($matbo, 0, -1); 
                
                    
                $macbo=mysql_query("SELECT tagl_id,tag_name FROM tag_list WHERE tag_name IN ($matbo)");
         
          if(mysql_num_rows($macbo)>0){
              
              while($run=mysql_fetch_row($macbo)){
                 // echo "match".$run[1]."<br>";
                  array_push($tag_id_ar,$run[0]);
                  $alltopic_tagy = array_diff($alltopic_tagy, ["$run[1]"]);
                  
              }
          //   echo "<br>copy hata ke".implode(',',$alltopic_tagy); 
          }
          else{
             // echo "<br>no match".implode(',',$alltopic_tagy);
              }
          if(!empty($alltopic_tagy)){
              
                 foreach ($alltopic_tagy as $valse) {
                  //   echo $valse."<br>";
             $qrypo=mysql_query("INSERT INTO tag_list (tag_name) VALUES ('$valse')");
                   $newtag_id=mysql_insert_id();
                   array_push($tag_id_ar,$newtag_id);
                }
                    //echo "<br>new entry".implode(',',$alltopic_tagy); 
                 }
                                // echo "<br>all".implode(',',$tag_id_ar);                     
                                                  foreach ($tag_id_ar as $valme) {
             $qml=mysql_query("INSERT INTO topic_tag (topic_id,tagl_id) VALUES ('$tid','$valme')");
                 
                                                     }    
                                                     
          
                   echo ' <div class="alert alert-success">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong> tag updated successfully.
                     </div>';
					
					
					
					
                }else if(!empty($newtemptag)){
                    
                      echo ' <div class="alert alert-success">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Success!</strong> tag updated successfully.
                     </div>';
                }
                else
                {
                   echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Sorry!</strong> something went wrong.
</div>';
			}
            
            
                }




?>