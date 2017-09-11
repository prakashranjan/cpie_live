<?php

/*require_once('auth.php');
include("connection.php");
 include("commonfun.php");
 $usern=$_SESSION['SESS_USERNAME'];
$sql4="SELECT log FROM member where username='$usern'";
 $query4=mysql_query($sql4);
$log=mysql_fetch_row($query4);
$z=0;
$favchannel="favchannel";
$byfollower="follow";
$older=$_POST['older'];
$start=$older*3;
$nos=3;
  
//for display
$sql="SELECT * FROM notestatus where receiver='$usern' order by notestatus_id DESC LIMIT $start , $nos ";
 $query=mysql_query($sql);
 while($row67=mysql_fetch_row($query))
 {
	 $sql3="SELECT * FROM notification where notification_id='$row67[3]' ";
 $query3=mysql_query($sql3);
 $row3=mysql_fetch_row($query3);
	 
  $sql5="SELECT thumbnail FROM member where username='$row3[1]'";
 $query5=mysql_query($sql5);
	  $pic=mysql_fetch_row($query5);
//for fav channel notifications


 if($row67[4]==$favchannel){
	 $sql00="SELECT category FROM topic where topic_id='$row3[2]'";
 $query00=mysql_query($sql00);
	  $row=mysql_fetch_row($query00);
	  
	 
 if($row3[3]=="channeldescription")
 {
	 if($row3[4]>=$log[0] || $row67[2]==0){echo'<tr id="'.$row67[0].'"class="bg-success nopadding" onclick="notechanlink(\''.$row[0].'\',this.id)">
        <td  style="color: #2C3E50;" col="1"  ><img  class="img-rounded pull-right"height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td class=""><ul class="list-unstyled "><li style="color:#2C3E50;" class=""><span style="color:RoyalBlue;">$'.$row3[1].'</span> has changed <span style="color:orange; font-weight:bold;">@'.$row[0].'</span> description</li>
			  <li class=""style="font-size:14px;color:#2C3E50;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
       </tr>';
	 
	 }
 else{ 
 
 echo'<tr id="'.$row67[0].'" onclick="notechanlink(\''.$row[0].'\',this.id)" class="nopadding">
        <td col="1" ><img class="img-rounded pull-right" height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td ><ul class="list-unstyled "><li class="nopadding"><span style="color:RoyalBlue;">$'.$row3[1].'</span> has changed <span style="color:orange;font-weight:bold;">@'.$row[0].'</span> description</li>
			  <li class=""style="font-size:14px;color:silver;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
			 </tr>';
 
 }
 
 }
	 
	 else  if($row3[3]=="channelwall"){
		 
		  if($row3[4]>=$log[0] || $row67[2]==0){echo'<tr  id="'.$row67[0].'" class="bg-success nopadding" onclick="notechanlink(\''.$row[0].'\',this.id)">
        <td  style="color: #2C3E50;" col="1"  ><img  class="img-rounded pull-right"height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td class=""><ul class="list-unstyled "><li style="color:#2C3E50;" class=""><span style="color:RoyalBlue;">$'.$row3[1].'</span> has changed <span style="color:orange;font-weight:bold;">@'.$row[0].'</span> wallpaper</li>
			  <li class=""style="font-size:14px;color:#2C3E50;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
       </tr>';
	 
	 }
 else{
 
 echo'<tr  id="'.$row67[0].'" onclick="notechanlink(\''.$row[0].'\',this.id)" class="nopadding">
        <td col="1" ><img class="img-rounded pull-right" height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td ><ul class="list-unstyled "><li class="nopadding"><span style="color:RoyalBlue;">$'.$row3[1].'</span> has changed <span style="color:orange; font-weight:bold;">@'.$row[0].'</span> wallpaper</li>
			  <li class=""style="font-size:14px;color:silver;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
			 </tr>';
 
 }
	 
	 
	 }
	 
	  else  if($row3[3]=="chat"){
		 
		  if($row3[4]>=$log[0] || $row67[2]==0){echo'<tr  id="'.$row67[0].'" class="bg-success nopadding" onclick="notechanlink(\''.$row[0].'\',this.id)">
        <td  style="color: #2C3E50;" col="1"  ><img  class="img-rounded pull-right"height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td class=""><ul class="list-unstyled "><li style="color:#2C3E50;" class=""><span style="color:RoyalBlue;">$'.$row3[1].'</span> has shouted on <span style="color:orange;font-weight:bold;">@'.$row[0].'</span> channel</li>
			  <li class=""style="font-size:14px;color:#2C3E50;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
       </tr>';
	 
	 }
 else{
 
 echo'<tr  id="'.$row67[0].'" onclick="notechanlink(\''.$row[0].'\',this.id)" class="nopadding">
        <td col="1" ><img class="img-rounded pull-right" height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td ><ul class="list-unstyled "><li class="nopadding"><span style="color:RoyalBlue;">$'.$row3[1].'</span> has shouted on <span style="color:orange; font-weight:bold;">@'.$row[0].'</span> channel</li>
			  <li class=""style="font-size:14px;color:silver;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
			 </tr>';
 
 }
	 
	 
	 }
	 
	 else  if($row3[3]=="pic"){
		 
		  if($row3[4]>=$log[0] || $row67[2]==0){echo'<tr id="'.$row67[0].'" class="bg-success nopadding" onclick="notechanlink(\''.$row[0].'\',this.id)">
        <td  style="color: #2C3E50;" col="1"  ><img  class="img-rounded pull-right"height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td class=""><ul class="list-unstyled "><li style="color:#2C3E50;" class=""><span style="color:RoyalBlue;">$'.$row3[1].'</span> has shouted an &nbsp;<i class="fa fa-picture-o fa-2x" aria-hidden="true"></i> image on <span style="color:orange;font-weight:bold;">@'.$row[0].'</span> channel</li>
			  <li class=""style="font-size:14px;color:#2C3E50;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
       </tr>';
	 
	 }
 else{
 
 echo'<tr id="'.$row67[0].'" onclick="notechanlink(\''.$row[0].'\',this.id)" class="nopadding">
        <td col="1" ><img class="img-rounded pull-right" height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td ><ul class="list-unstyled "><li class="nopadding"><span style="color:RoyalBlue;">$'.$row3[1].'</span> has shouted an &nbsp;<i class="fa fa-picture-o fa-2x" aria-hidden="true"></i> image on <span style="color:orange; font-weight:bold;">@'.$row[0].'</span> channel</li>
			  <li class=""style="font-size:14px;color:silver;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
			 </tr>';
 
 }
	 
	 
	 }
	 
	 else  if($row3[3]=="doc"){
		 
		  if($row3[4]>=$log[0] || $row67[2]==0){echo'<tr id="'.$row67[0].'" class="bg-success nopadding" onclick="notechanlink(\''.$row[0].'\',this.id)">
        <td  style="color: #2C3E50;" col="1"  ><img  class="img-rounded pull-right"height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td class=""><ul class="list-unstyled "><li style="color:#2C3E50;" class=""><span style="color:RoyalBlue;">$'.$row3[1].'</span> has shouted a &nbsp;<i class="fa fa-file-text fa-2x" aria-hidden="true"></i> document on <span style="color:orange;font-weight:bold;">@'.$row[0].'</span> channel</li>
			  <li class=""style="font-size:14px;color:#2C3E50;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
       </tr>';
	 
	 }
 else{
 
 echo'<tr id="'.$row67[0].'" onclick="notechanlink(\''.$row[0].'\',this.id)" class="nopadding">
        <td col="1" ><img class="img-rounded pull-right" height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td ><ul class="list-unstyled "><li class="nopadding"><span style="color:RoyalBlue;">$'.$row3[1].'</span> has shouted a &nbsp;<i class="fa fa-file-text fa-2x" aria-hidden="true"></i> document on <span style="color:orange; font-weight:bold;">@'.$row[0].'</span> channel</li>
			  <li class=""style="font-size:14px;color:silver;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
			 </tr>';
 
 }
	 
	 
	 }
	 $z++;
	 
 }
	 
	 //for follow user notifications

 
 else if($row67[4]==$byfollower){
	 
	 
	$sql999="SELECT gender,username FROM member where mem_id='$row3[5]'";
 $query999=mysql_query($sql999);
	$row999=mysql_fetch_row($query999); 
	 if($row999[0]=="male"){
	 $his="his";
	 }
	 else{ $his="her";
	 }
		 
 if($row3[3]=="changepropic")
 {
	 if($row3[4]>=$log[0] || $row67[2]==0){echo'<tr id="'.$row67[0].'" class="bg-success nopadding" onclick="noteuserlink('.$row999[1].',this.id)">
        <td  style="color: #2C3E50;" col="1"  ><img  class="img-rounded pull-right"height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td class=""><ul class="list-unstyled "><li style="color:#2C3E50;" class=""><span style="color:RoyalBlue; font-weight:bold;">$'.$row3[1].'</span> has changed '.$his.' profile <i class="fa fa-user fa-2x" aria-hidden="true"></i> picture</li>
			  <li class=""style="font-size:14px;color:#2C3E50;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
       </tr>';
	 
	 }
 else{
 
 echo'<tr id="'.$row67[0].'" onclick="noteuserlink('.$row999[1].',this.id)" class="nopadding">
        <td col="1" ><img class="img-rounded pull-right" height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td ><ul class="list-unstyled "><li class="nopadding"><span style="color:RoyalBlue;font-weight:bold;">$'.$row3[1].'</span> has changed '.$his.' profile <i class="fa fa-user fa-2x" aria-hidden="true"></i> picture</li>
			  <li class=""style="font-size:14px;color:silver;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
			 </tr>';
 
 }
 
 }
	
 else if($row3[3]=="changestatus")
 {
	 if($row3[4]>=$log[0] || $row67[2]==0){echo'<tr id="'.$row67[0].'" class="bg-success nopadding" onclick="noteuserlink('.$row999[1].',this.id)">
        <td  style="color: #2C3E50;" col="1"  ><img  class="img-rounded pull-right"height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td class=""><ul class="list-unstyled "><li style="color:#2C3E50;" class=""><span style="color:RoyalBlue; font-weight:bold;">$'.$row3[1].'</span> has changed '.$his.' <i class="fa fa-smile-o fa-2x" aria-hidden="true"></i> status</li>
			  <li class=""style="font-size:14px;color:#2C3E50;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
       </tr>';
	 
	 }
 else{
 
 echo'<tr id="'.$row67[0].'" onclick="noteuserlink('.$row999[1].',this.id)" class="nopadding">
        <td col="1" ><img class="img-rounded pull-right" height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td ><ul class="list-unstyled "><li class="nopadding"><span style="color:RoyalBlue;font-weight:bold;">$'.$row3[1].'</span> has changed '.$his.' <i class="fa fa-smile-o fa-2x" aria-hidden="true"></i> status</li>
			  <li class=""style="font-size:14px;color:silver;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
			 </tr>';
 
 }
 
 }	 
	 
 else if($row3[3]=="newchannel")
 {   $sql199="SELECT category FROM topic where topic_id='$row3[2]'";
 $query199=mysql_query($sql199);
  $cat=mysql_fetch_row($query199);
	 
	 
	 
	 if($row3[4]>=$log[0] || $row67[2]==0){echo'<tr id="'.$row67[0].'" class="bg-success nopadding" onclick="notechanlink('.$cat.',this.id)">
        <td  style="color: #2C3E50;" col="1"  ><img  class="img-rounded pull-right"height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td class=""><ul class="list-unstyled "><li style="color:#2C3E50;" class=""><span style="color:RoyalBlue; font-weight:bold;">$'.$row3[1].'</span> has created a new channel <span style="color:orange; font-weight:bold;">@'.$cat[0].'</span></li>
			  <li class=""style="font-size:14px;color:#2C3E50;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
       </tr>';
	 
	 }
 else{
 
 echo'<tr id="'.$row67[0].'" onclick="notechanlink('.$cat.',this.id)" class="nopadding">
        <td col="1" ><img class="img-rounded pull-right" height="50" src="data:image;base64,'.$pic[0].'"></td>
		  <td ><ul class="list-unstyled "><li class="nopadding"><span style="color:RoyalBlue;font-weight:bold;">$'.$row3[1].'</span> has created a new channel <span style="color:orange; font-weight:bold;">@'.$cat[0].'</span></li>
			  <li class=""style="font-size:14px;color:silver;"><span class=" pull-right"><i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($row3[4]).' </span></li></ul> 
		</td>
			 </tr>';
 
 }
 
 }		 
	 
	 
	 
	$z++; 
	 
	 }
 



 }
if($z<=2){echo'<th><td><h4 class="text-muted" style="text-align:center;"><i class="fa fa-flag fa-lg" aria-hidden="true"></i>
  Welcome to Carbon Pie </h4></td></th>';
echo"<script>  $('#older').hide(); </script>";}
else
echo"<script>  $('#older').show(); </script>";

$usern=$_SESSION['SESS_USERNAME'];
$my_date = date("Y-m-d H:i:s");
		$qry0="Update member set log = NOW() WHERE username='$usern'";
               $done=mysql_query($qry0);

 */
 ?> 







		
		