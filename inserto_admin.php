<?php
require_once('auth.php');


 $kqry="SELECT * FROM branch WHERE course_id=1";
 $mqry=mysql_query($kqry);
 while($jqry=mysql_fetch_row($mqry)){
   for($m=1;$m<=4;$m++){
     for($i=1;$i<=2;$i++){
       $categ=$jqry[1].'_'.$i.'_'."YR".$m;
       $cdesc="This is an official channel for ".$jqry[1].'-'.$i." Year-".$m." of branch ".$jqry[2].".Enjoy....";
       $qry89="INSERT INTO section (category,cdesc,mode_id,course_id,branch_id,year) VALUES ('$categ','$cdesc',1,1,'$jqry[0]','$m')";
$result89=mysql_query($qry89) or die;
if($result89){
    echo $categ."-yes";
        }
else{
    echo $categ."-no";
     }
       
       
   }  
   }
 }
 ?>