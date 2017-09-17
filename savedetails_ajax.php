  <?php
require_once('auth.php');
 include("connection.php");	
 $usern=$_SESSION['SESS_USERNAME'];
 $val=addslashes($_POST['val']);
 $val=trim($val);
 $place_id=addslashes($_POST['place_id']);
// echo $place_id."<br>";
$name=addslashes($_POST['name']);
//echo $name."<br>";
if($name=="status"||$name=="long_disc"||$name=="skills"||$name=="from_place"||$name=="lives_at"){
  //  echo "pehla<br>";
if($name=="status" || $name=="long_disc"|| $name=="skills"){
    // echo "pehla 2 ".$name."<br>";
$sql="UPDATE member SET $name='$val' WHERE username='$usern'";
				$tnme=mysql_query($sql);
		
echo stripslashes($val);
}
else if($name=="from_place" || $name=="lives_at"){
     //echo "doosra<br>";
 if($place_id!=""){
      //echo "doosra 2<br>";
     //fetching other information from placeid
     $pl_name=null;
     
     $route=null;
     $country="IN";
     $zip=null;
     $state=null;
     $area=null;
     $city=null;
            
        
     
     $ch = curl_init();
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_URL, 'https://maps.googleapis.com/maps/api/place/details/json?placeid='.$place_id.'&key=AIzaSyBXbGW1zlIYVp84QbxHUL_V5md0cqlSmpk');
$resultpl = curl_exec($ch);
curl_close($ch);
//echo $resultpl."<br>";
$obj = json_decode($resultpl);
if($obj->status=="OK"){
//echo "ok status<br>-----------------------------------------------";
//$lom=0;
foreach ( $obj->result->address_components as $valoo){
//$lomo=0;    
    //echo "-----[".$lom."]--".$valoo->short_name."<br>-----------------------------------------------------";
foreach($valoo->types as $vty){
    //echo "-+++++[".$lom."][".$lomo."]--".$vty."<br>--+++++++++++++++++++++++++++++-------";
    //echo"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@";
    if($vty=="country"){$country=$valoo->short_name;}
    else if($vty=="postal_code"){$zip=$valoo->short_name;}
    else if($vty=="administrative_area_level_1"){$state=$valoo->short_name;}
    else if($vty=="locality"){$city=$valoo->short_name;}
    else if($vty=="sublocality_level_1"){$area=$valoo->short_name;}
    else if($vty=="route"){$route=$valoo->short_name;}
    
    
    
    
//$lomo++;
}

  //  $lom++;
}

$pl_name=$obj->result->name;

     
     
     $result=mysql_query("insert into member_loc (place_id,name,route,area,city,state,country,zip,val_str) Values ('$place_id','$pl_name','$route','$area','$city','$state','$country','$zip','$val')");
     if($result){
        //  echo "teesra<br>";
         $vector=mysql_insert_id();
         $sql=mysql_query("UPDATE member SET $name='$vector' WHERE username='$usern'");
         if($sql){echo stripslashes($val);}
         else{exit();}
         
     }
     else{
          //echo "fourth<br>";
      $sql=mysql_query("select loc_id from member_loc where place_id='$place_id'");
      $reso=  mysql_fetch_row($sql);
       $sql9=mysql_query("UPDATE member SET $name='$reso[0]' WHERE username='$usern'");
         if($sql9){echo stripslashes($val);}
         else{exit();}
      
 }
 
         }
         else{exit();}
 }
 else{exit();}
    
} 
}
else{
   
    exit();
}
/*
if($name="status"){
$hint="changestatus";
$tidu=NULL;
 $qry456="INSERT INTO notification (worker,channel_id,hint,uid) VALUES ('$usern','$tidu','$hint','$uid')";
                $result456=mysql_query($qry456);


}
*/
?>