<?php
require_once('auth.php');
include("connection.php");
 $usern=$_SESSION['SESS_USERNAME'];
 $memid=$_SESSION['SESS_MEMBER_ID'];
 $fav_led=0;
// for favourite notification----------------blinker led
// first check favourites empty hai kya?....
$smql=mysql_query("select count(fav_id) from favourites where username='$usern'");
if(mysql_num_rows($smql)==1){
    $fav_check_no=  mysql_fetch_row($smql);
if($fav_check_no[0]>0){
//first level
$qry=mysql_query("SELECT COUNT(image_id) FROM testblob WHERE category IN (select category from favourites where username='$usern') AND event > (select fav_log from member where mem_id='$memid')");
if(mysql_num_rows($qry)==1){
    
$fav_no=  mysql_fetch_row($qry);
if($fav_no[0]==0){
    //no fav_note
    //2nd level
   
    $qry2=mysql_query("SELECT COUNT(tes.image_id) FROM testblob as tes WHERE category IN (select category from favourites where username='$usern') AND event > (select pichla_view from favourites where category=tes.category and username='$usern')");
    $fav_no2=  mysql_fetch_row($qry2);
    if($fav_no2[0]==0){
        $fav_led=0;
    }
    else if($fav_no2[0]>0){
        //switch on blinker
    $fav_led=1;
    }
    
  
    
}else if($fav_no[0]>0){
    //switch on blinker
    $fav_led=1;
}

}




}else{
    $fav_led=0;
}

}

echo $fav_led;



?>
