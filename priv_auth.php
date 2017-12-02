<?php

function check_priv_auth($topic){
    
    $alphaword=null;
    $usern=$_SESSION['SESS_USERNAME'];

if($topic==""){
    exit();}
 
$sql="select category,private from topic where topic_id='$topic'";
            $query=mysql_query($sql);
            if(mysql_num_rows($query)==1) {$datgo=mysql_fetch_row($query);


if($datgo[1]==1){
$sql="select allow from private_member where username='$usern' AND category='$datgo[0]' AND allow=1";
            $query=mysql_query($sql);
             $rungo=mysql_fetch_row($query);

             if($rungo[0]==1)
              { $alphaword=2;
               }
              else
             { $alphaword=3;}  

          }
else
  { $alphaword=4; }
            }
return $alphaword;
    
}

?>