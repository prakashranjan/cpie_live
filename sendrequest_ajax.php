<?php
 require_once('auth.php');
include("connection.php");
include("vcommon.php");
 $usern=$_SESSION['SESS_USERNAME'];
 $mem_id=$_SESSION['SESS_MEMBER_ID'];
$uid=addslashes($_GET['uid']);
$hut_val=addslashes($_GET['hut']);
if($uid=="" || $hut_val==""){exit();}

if($uid!=$mem_id && ($hut_val==1||$hut_val==2)){
$kqry="SELECT mem_id FROM member WHERE mem_id='$uid'";
 $mqry=mysql_query($kqry);
 if(mysql_num_rows($mqry)==1){
 $jqry=mysql_fetch_row($mqry);
 if($hut_val==1){$killer="likers";}
 else if($hut_val==2){$killer="haters";}
 else{exit();}
 
 $jql="SELECT follow_id,status FROM follow WHERE user1_id='$mem_id' AND user2_id='$jqry[0]'";
 $dar=mysql_query($jql);
 if (mysql_num_rows($dar)==1)
 { $par=mysql_fetch_row($dar);
    
  if($par[1]==1){
      if($hut_val==1){
          //do nothing
          echo 1;
      }
      else if ($hut_val==2){
          $kqry35=mysql_query("Update follow SET status=2 WHERE follow_id='$par[0]'");
 $kqry36=mysql_query("Update member SET likers=likers-1,haters=haters+1 WHERE mem_id='$jqry[0]'");
 echo 1;
      }
      
  }else if($par[1]==2){
      if($hut_val==1){
          $kqry359=mysql_query("Update follow SET status=1 WHERE follow_id='$par[0]'");
 $kqry369=mysql_query("Update member SET likers=likers+1,haters=haters-1 WHERE mem_id='$jqry[0]'");
 
      echo 1;}
      else if ($hut_val==2){
          //do nothing
      echo 1;}
  }
  
	  

  
}
else
{
 $sql="INSERT INTO follow (user1_id,user2_id,status) VALUES ('$mem_id','$jqry[0]','$hut_val')";
			     $toname=mysql_query($sql);
                             if($toname){
                                
$kqry2="Update member SET $killer=$killer+1 WHERE mem_id='$jqry[0]'";
 $mqry2=mysql_query($kqry2);    
                            echo 1; }
                             
				
 
 
}
}else{exit();}
}
else {echo 0;}

?>