<?php
require_once('../auth.php');
 include("../connection.php");	
	 include("../commonfun.php");
          include("../vcommon.php");
         $sqlstart=mysql_query("select NOW()");
         $wakt=mysql_fetch_row($sqlstart);
                 $mode_id=$_SESSION['SESS_MODE'];
	        $usern=$_SESSION['SESS_USERNAME'];
	        $firstn=$_SESSION['SESS_FIRST_NAME'];
			$lastn=$_SESSION['SESS_LAST_NAME'];
			$fulln=$firstn." ".$lastn;
			$gender=$_SESSION['SESS_GENDER']; 
                        $gender= strtolower($gender);
	$mem_id=$_SESSION['SESS_MEMBER_ID'];
        if($mode_id==1){
                       $mysec_id= $_SESSION['SESS_SECTION'];
                        $myco_id=$_SESSION['SESS_COURSE'];
                        $my_yr=$_SESSION['SESS_YEAR'];
                        $mybr_id=$_SESSION['SESS_BRANCH'];
        }
                        $y=-1;	
 
 
 
 
 
 
 $end=3;
$n=0;
$mart=0;
$dupli_checker=array();
$cat_count=array("urgent"=>0,"academic"=>0,"knowledge"=>0,"event"=>0,"skill"=>0,"opportunity"=>0,"fun"=>0);



$majhburi=  mysql_query("Select category_id from priority");
while($runmajbu=mysql_fetch_row($majhburi)){

$mainac=mysql_query("SELECT image_id,access_id,post_mode,owner_id,tagless,personal,category_id FROM access WHERE (((post_mode IN ($mode_id,0) ) or personal=1) ) and  wakt >=( select pri_".$runmajbu[0]." from priority_log where mem_id='$mem_id' ) and owner_id != '$mem_id' and category_id='$runmajbu[0]]' order by access_id desc ");
				while($mac= mysql_fetch_row($mainac)){
                                    $mart++;
              //echo "mart---->".$mart."<br>";
                                  //--------------------------------------------------------------------------------------------------------------------------------------
                                    //now operations on each selected access row
                                   if($mac[4]==0) 
                                  {  if($mac[3]==$mem_id){ //echo"mem_id/";
                                    displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);}
                                    
                                    else if($mac[2]==0){//echo"mod=0/everyone";
                                    displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);}
                                    else if($mac[2]!=$mode_id && $mac[5]==1){//echo"for personal and not (mode_id or 0)";
                                         $submain_pers=mysql_query("SELECT user_id FROM access_mem_p WHERE access_id='$mac[1]' and user_id='$mem_id'");
                                                                    if(mysql_num_rows($submain_pers)==1){//echo"personal/";
                                                                    displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);}
                                        
                                    }
                                    
                                    else if($mac[2]==1){//echo"mod=1/";
                                                                    $submain=mysql_query("SELECT course_id,branch_id,year,section_id,tag_type FROM access_stud WHERE access_id='$mac[1]'");
                                                                    if(mysql_num_rows($submain)==0){//echo"only Students/";
                                                                    displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);}
                                                                    else {
                                                                        //5 query algorithm
                                                                        while($gom=mysql_fetch_assoc($submain)){   
                                                                        
                                                                        
                                                                        if($gom['course_id']==$myco_id && $gom['tag_type']==2){//echo"tag2/";
                                                                        displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);break;}
                                                                        else if($gom['branch_id']==$mybr_id && $gom['tag_type']==3){//echo"tag3/";
                                                                        displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);break;}
                                                                        else if($gom['section_id']==$mysec_id && $gom['tag_type']==4){//echo"tag4/";
                                                                        displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);break;}
                                                                        else if($gom['branch_id']==$mybr_id && $gom['year']==$my_yr && $gom['tag_type']==5){//echo"tag5/";
                                                                        displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);break;}
                                                                        else if($gom['course_id']==$myco_id && $gom['year']==$my_yr && $gom['tag_type']==6){//echo"tag6/";
                                                                        displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);break;}
                                                                      
                                                                        
                                                                    }
                                                                    }                        
                                        //for access_stud
                                    }
                                    
                                    else if($mac[2]==2){
                                        //echo"mod=2";
                                        displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);
                                        //for access_teach
                                    }
                                    
                                    
 //---------------------------------------- for personal with tags 
                                    
                                    if($mac[2]==$mode_id && $mac[5]==1){//echo"for personal and same mode_id";
                                         $submain_pers2=mysql_query("SELECT user_id FROM access_mem_p WHERE access_id='$mac[1]' and user_id='$mem_id'");
                                                                    if(mysql_num_rows($submain_pers2)==1){//echo"personal/";
                                                                    displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);}
                                        
                                }}
                                else if($mac[4]==1 && $mac[5]==1){

                                      if($mac[3]==$mem_id){ //echo"mem_id/";
                                    displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);}
                                   else{
                                     //echo"for only personal and tagless is 1";
                                     $submain_pers3=mysql_query("SELECT user_id FROM access_mem_p WHERE access_id='$mac[1]' and user_id='$mem_id'");
                                                                    if(mysql_num_rows($submain_pers3)==1){//echo"personal/";
                                                                    displaychat(0,$mac,$mart,$n,$usern,$dupli_checker,$cat_count);}
                                        
                                   }
                                }
                                
                           
                 }
                 }
        
        
function displaychat($wallid,$mac,&$mart,&$n,$usern,&$dupli_checker,&$cat_count){
    $mem_id=$_SESSION['SESS_MEMBER_ID'];
    
    if($n==0){
         
    }
    
    $checko=array_search($mac[0]."_".$mac[6], $dupli_checker);                
if($checko!==false){
    //do nothing
    //echo "skipped-".$mac[0]."<br>";
}
else{    //echo $mac[0]."_".$mac[6]."<br>";
    array_push($dupli_checker, $mac[0]."_".$mac[6]);
         $triko=getcat($mac[6]);
         $cat_count["$triko"]++;
      //echo implode(',',$dupli_checker);
//inserting index to b_post_index for fast retrieval of post

//$sql199=mysql_query("insert into b_post_index (image_id,mem_id,category_id) values ('$mac[0]','$mem_id','$wallid')");

                   
                                        	 
				
}
   

	
}


/*
foreach($cat_count as $x => $x_value) {
    echo "category=" . $x . ", count=" . $x_value;
    echo "<br>";
}*/

echo json_encode($cat_count);

function getcat($val){
    switch ($val){
        case 1:return "urgent";
        case 4:return "academic";
        case 5:return "knowledge";
        case 6:return "event";
        case 7:return "skill";
        case 8:return "opportunity";
        case 9:return "fun";
    }
    
    
    
    
    
}
?>

