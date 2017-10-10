
<?php



require_once('../auth.php');
 include("../connection.php");
  include("../vcommon.php");
	
	        $usern=$_SESSION['SESS_USERNAME'];
	        $firstn=$_SESSION['SESS_FIRST_NAME'];
			$lastn=$_SESSION['SESS_LAST_NAME'];
			$fulln=$firstn." ".$lastn;
			$gender=$_SESSION['SESS_GENDER'];
			$gender= strtolower($gender);
			
 $tid=cleankar($_POST['tid']);
 			
 $counter=cleankar($_POST['count']);
 if($tid=="" || $counter==""){exit();}

$sql1="SELECT log FROM member WHERE username='$usern'";
$log=mysql_query($sql1);
				$row = mysql_fetch_row($log);
$sql="SELECT category FROM section WHERE section_id='$tid'";
			     $toname=mysql_query($sql);
				$rows = mysql_fetch_row($toname);
                 $qry="SELECT COUNT(*) FROM channel_post where category='$rows[0]' and event > '$row[0]' ;";
                $result=mysql_query($qry);
				$row2 = mysql_fetch_row($result);
	
echo " ".$row2[0];

if($counter==1 && $row2[0]>0)
{ $t=$row2[0];
echo"<script>  $('#ting').css('color','red'); </script>";
 notifysound($row2[0]);
//yes
}
else if($counter==1 && $row2[0]==0)
{ $t=0;
echo"<script>  $('#ting').css('color','white'); </script>";
//no
    update_log();
}
else if($counter>1 && $row2[0]==0)
{$t=0;
echo"<script>  $('#ting').css('color','white'); </script>";
//no
update_log();
}
else if($counter>1 && $row2[0]>0)
{if($row2[0]==$t)
	{echo"<script>  $('#ting').css('color','white'); </script>";
		//no
        update_log();
}
else{$t=$row2[0];
echo"<script>  $('#ting').css('color','red'); </script>";
	  notifysound($row2[0]);
	//yes
	}
}




function notifysound($note){

if($note!=0)
{//for notification soundy
}
	
	
}

function update_log(){
     $usern=$_SESSION['SESS_USERNAME'];
$qry0="Update member set log = NOW() WHERE username='$usern'";
               $done=mysql_query($qry0);
}














?>
