  <?php
require_once('../auth.php');
 include("../connection.php");	
 include("../commonfun.php");
 $usern=$_SESSION['SESS_USERNAME'];
 $val=$_POST['link'];
$tid=$_POST['tid'];
$val=trim($val);
$val_part=substr($val,0,26);

$w_default="https://chat.whatsapp.com/";

if(strcmp($val_part,$w_default)==0){


$sql="UPDATE section SET whatsapp_g='$val' WHERE section_id='$tid'";
				$tnme=mysql_query($sql);
}else{$tnme=false;}

if($tnme){
    echo'<a  href="'.$val.'" target="_blank"class="btn btn-muted  ubuntu" style="width:80%;background-color:#25d366;color:white;"><i class="fa fa-whatsapp " aria-hidden="true"></i> Join Whatsapp group</a>';
}else{echo 'false';}

?>