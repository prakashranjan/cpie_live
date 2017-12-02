 <?php
require_once('auth.php');
 include("connection.php");	
 include("commonfun.php");
 include("vcommon.php");
  require_once('priv_auth.php');
 $usern=$_SESSION['SESS_USERNAME'];
 
 $val=cleankar($_POST['link']);
$tid=cleankar($_POST['tid']);

$val=trim($val);
if($tid=="" || $val==""){exit();}

$trigo=check_priv_auth($tid);
 
if($trigo==3 || $trigo==null){
    exit();
}


$qr=mysql_query("select user from topic where topic_id='$tid'");
  $rn=mysql_fetch_row($qr);
if($rn[0]==$usern){
$val_part=substr($val,0,26);

$w_default="https://chat.whatsapp.com/";

if(strcmp($val_part,$w_default)==0){


$sql="UPDATE topic SET whatsapp_g='$val' WHERE topic_id='$tid'";
				$tnme=mysql_query($sql);
}else{$tnme=false;}

if($tnme){
    echo'<a  href="'.$val.'" target="_blank"class="btn btn-muted  ubuntu" style="width:80%;background-color:#25d366;color:white;"><i class="fa fa-whatsapp " aria-hidden="true"></i> Join Whatsapp group</a>';
}else{echo 'false';}



}
?>