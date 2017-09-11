<?php
 /*require_once('auth.php');
include("connection.php");
 $usern=$_SESSION['SESS_USERNAME'];
$z=0;

 
 $jql="SELECT user1,follow_id FROM follow WHERE user2='$usern' AND status=0";
 $dar=mysql_query($jql);
 while($par=mysql_fetch_row($dar))
 { $kqry="SELECT mem_id FROM member WHERE username='$par[0]'";
 $mqry=mysql_query($kqry);
 $jqry=mysql_fetch_row($mqry);
	 
	 echo'<tr id="'.$par[1].'ROW" >
	 <td  class="text-primary" style="text-align:center;font-size:120%;"><a href="profile?uno='.$jqry[0].'" style="color:RoyalBlue;font-family:ubuntu;text-decoration:none;"> $'.$par[0].'</a> wants to follow you</td>
        <td style="text-align:center;color:green;"> <button id="'.$par[1].'AC"class="" onclick="acceptrequest(this.id)" >Accept</button>
       <button style="color:red;"class=""  id="'.$par[1].'RE"onclick="removerequest(this.id)" >Remove</button></td></tr>';
$z++;
}

 
if($z==0){echo'<h4 class="text-muted" style="text-align:center;"> No follow requests </h4>';} 
*/
?>