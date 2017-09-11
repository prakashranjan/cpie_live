<?php
require_once('../auth.php');
 include("../connection.php");	
 $usern=$_SESSION['SESS_USERNAME'];
 $memid=$_SESSION['SESS_MEMBER_ID'];
 $sec_id=$_SESSION['SESS_SECTION'];
 $class_led=0;
//for class_led notification blinker
//first check usermode
if($_SESSION['SESS_MODE']==1){
    //first level
$qry=mysql_query("SELECT COUNT(image_id) FROM channel_post WHERE category = (select category from section where section_id='$sec_id') AND event > (select pichla_view from stud_member where mem_id='$memid')");
if(mysql_num_rows($qry)==1){
    
$class_no=  mysql_fetch_row($qry);
if($class_no[0]==0){
    //no fav_note
     $class_led=0;
    
  
    
}else if($class_no[0]>0){
    //switch on blinker
    $class_led=1;
}

}


    
}

echo $class_led;



?>

