  <?php
require_once('auth.php');
 include("connection.php");	
 include("commonfun.php");
  include("vcommon.php");
   require_once('priv_auth.php'); 
 $usern=$_SESSION['SESS_USERNAME'];
 $val=cleankar($_POST['val']);
$tid=cleankar($_POST['tid']);
$val=trim($val);
$val=carbonlink($val);
if($tid=="" || $val==""){exit();}
$trigo=check_priv_auth($tid);
 
if($trigo==3 || $trigo==null){
    exit();
}

$sql="UPDATE topic SET cdesc='$val' WHERE topic_id='$tid'";
				$tnme=mysql_query($sql);
//$hint="channeldescription";

 //$qry45="INSERT INTO notification (worker,channel_id,hint) VALUES ('$usern','$tid','$hint')";
   //             $result45=mysql_query($qry45);


echo'<p class="text-primary lead ubuntu "style="color:black;"  ><blockquote style="font-size:15px;" class="blockbg" onclick="editchandis();" name="channeldiscrip" id="channeldiscrip"> '.$val.' </blockquote></p>';



?>