

<?php 
require_once('../auth.php');
 include("../connection.php");
 	 include("../commonfun.php");
          include("../vcommon.php");
//Start session
   
$session=session_id();
$time=time();
$sql4="Update channel_user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);
	
	        $usern=$_SESSION['SESS_USERNAME'];
	$j=0;        
			
 $tid=cleankar($_GET['tid']);
 if($tid==""){exit();}

 
 

				$sqlchat="SELECT category FROM section WHERE section_id='$tid'";
				$tnme=mysql_query($sqlchat);
				$ro = mysql_fetch_row($tnme);
				
                $qry="SELECT file_name,event FROM channel_post WHERE category='$ro[0]' AND file_name IS NOT NULL ORDER BY image_id DESC limit 20";
                $result=mysql_query($qry);
                while($rowori= mysql_fetch_row($result))
                { if($rowori[0]){$j++;
					$docname=get_basename($rowori[0]);
                                        
				$file_size=human_formatbytes("../".$rowori[0], "MB");
				
					echo'<tr>
         <td  class="text-info " style="font-size:1.0em;">&nbsp;<i class="fa fa-angle-double-right text-muted" aria-hidden="true"></i> '.substr($docname,0,150).' </td><br class="visible-xs">
        </tr><tr>
		  <td style="font-size:0.9em;"> <span class="text-muted pull-left ">&nbsp;<i class="fa fa-clock-o" aria-hidden="true"></i> '.makemydate($rowori[1]).'</span> &nbsp; <a class=" btn btn-info btn-sm pull-right" href="'.$rowori[0].'" download><i class="fa fa-download" aria-hidden="true"></i> '.$file_size.'</a>&nbsp;&nbsp;&nbsp;</td>
      </tr>';	
					
				}		
				
				
				}
				   
            

if($j==0){

echo"<div style='text-align:center;'><br><h4 class='text-muted' >No Docs uploaded to the Channel</h4></div> ";


}
?>












