<?php
 require_once('../auth.php');
include("../connection.php");
// for teachers only --- choose my classessss...
if($_SESSION['SESS_MODE']==2){
  $usern=$_SESSION['SESS_USERNAME'];
  $mem_id=$_SESSION['SESS_MEMBER_ID'];
  
 $tid=  addslashes($_GET['tid']);
 
  
 
 $jql="SELECT fav_id FROM channel_favs WHERE mem_id='$mem_id' AND section_id='$tid'";
 $dar=mysql_query($jql);
 $heart=array();
 if ($par=mysql_fetch_row($dar))
 { $tql="DELETE from channel_favs where mem_id='$mem_id' and section_id='$tid'";
 $tar=mysql_query($tql);
 $mqlm="update section set hearts= hearts-1 where section_id='$tid'";
				$karo=mysql_query($mqlm);
	
                
	 $heart[0]=1;
 

}
else
{
 $sql="INSERT INTO channel_favs (mem_id,section_id) VALUES ('$mem_id','$tid')";
			     $toname=mysql_query($sql);
				$mql="update channel_favs set views= views+1 where mem_id='$mem_id' and section_id='$tid'";
				$kar=mysql_query($mql);
                                $mqlm="update section set hearts= hearts+1 where section_id='$tid'";
				$karo=mysql_query($mqlm);

        $heart[0]=2;
        
                


 
}
$mqlq="select hearts from  section where section_id='$tid'";
				$karq=mysql_query($mqlq);
                                $res=  mysql_fetch_row($karq);
       
        $heart[1]=$res[0];
 
 echo json_encode($heart);


 
 
 
 
 
 
 
 
}
else{
    
    //do nothing
    
}

 
 

 ?>
 