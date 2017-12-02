<?php
 require_once('auth.php');
include("connection.php");
include("vcommon.php");
require_once('priv_auth.php');
$usern=$_SESSION['SESS_USERNAME'];
$tid=cleankar($_GET['tid']);
if($tid==""){exit();}
 $trigo=check_priv_auth($tid);
 
if($trigo==3 || $trigo==null){
    exit();
}

$z=0;
$sqlu="select category from topic where topic_id='$tid'";
$resu=mysql_query($sqlu);
$runu=mysql_fetch_row($resu);
 
 $jql="SELECT pvt_id,username FROM private_member WHERE category='$runu[0]' AND allow=0";
 $dar=mysql_query($jql);
 while($par=mysql_fetch_row($dar))
 {	echo'<tr id="'.$par[0].'joinreq" >
	<td  class="text-primary" colspan="2" style="text-align:center;font-size:120%;"><a href="profile?un='.$par[1].'" style="color:RoyalBlue;font-family:ubuntu;text-decoration:none;"> $'.$par[1].'</a> wants to join channel</td></tr>
        <tr id="'.$par[0].'joinreq_but" style="text-align:center;color:green;"><td colspan="1"> <button id="'.$par[0].'ACjoin"class="btn btn-block btn-sm" onclick="joinallow(this.id)" >Allow</button>
       </td><td colspan="1"><button style="color:red;"class="btn btn-block btn-sm"  id="'.$par[0].'REignore"onclick="ignorerequest(this.id)" >Remove</button></td></tr>';

 $z++;
}

 
if($z==0){echo'<h4 class="text-muted" style="text-align:center;"> No Join requests </h4>';} 

?>

