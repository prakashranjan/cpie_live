<?php
require_once('../auth.php');
 include("../connection.php");

function magic($qry){
     $usern=$_SESSION['SESS_USERNAME'];
        $result=mysql_query($qry);
               while($rowori= mysql_fetch_row($result))
                {
                $rowori[3]=  nl2br($rowori[3]);
                	if($rowori[7]!=1){
                	
					$qery="SELECT thumbnail,mem_id,username FROM member WHERE username='$rowori[2]'";
				$prpic=mysql_query($qery);
				$prpicori = mysql_fetch_row($prpic);
				$qe="SELECT mem_id,username FROM member WHERE username='$rowori[6]'";
				$pr=mysql_query($qe);
				$prp= mysql_fetch_row($pr);
					
			}
						if($rowori[7]==1){$prpicori[0]="images/anon.png";
                                                $prpicori[1]="#";
						$prpicori[2]="$******";
					     $prp[0]="#";
					     $prp[1]="$*******";
					 }
					
                   $usr=$_SESSION['SESS_USERNAME']; 
					if($usr!=$rowori[2] || $rowori[7]==1)
                        
                                        {  if($rowori[7]==1){
						
						$rowori[2] ="*******";}
                        
                        echo'<li class="left clearfix"><span class="chat-img pull-left">
                            <a href="profile?un='.$prpicori[2].'" ><img src="'.$prpicori[0].'" alt="User Avatar"style=" height:40px; "class="img-rounded  img-responsive"></a>
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <a href="profile?un='.$prpicori[2].'" ><strong class="primary-font">$'.$rowori[2].'</strong></a> 
                                        <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time"></span> '.makemydate($rowori[5]).' </small>
                                </div>
                                <p class="text-left text-info">
                                    '.$rowori[3].'
                                </p>
                                 <div class="text-right">';  $jql="SELECT s_id FROM broadcast_comment_slam WHERE username='$usern' AND comment_id='$rowori[0]'";
                                      $dar=mysql_query($jql);
                                      if ($tar=mysql_fetch_row($dar))
									  echo'<button id="'.$rowori[0].'comm_slam_id" type="button" onclick="slam_comment(this.id)" class="comment_slam text-success fa"><i class="fa fa-thumbs-o-up text-success"  aria-hidden="true"></i> '.$rowori[4].'</button>';
								  else
									  echo'<button id="'.$rowori[0].'comm_slam_id" type="button" onclick="slam_comment(this.id)" class="comment_slam text-muted fa"><i class="fa fa-thumbs-o-up text-muted" aria-hidden="true"></i> +'.$rowori[4].'</button>';
                                      echo'</div>
                            </div>
                                        </li>';}
                                        else{
                                            if($rowori[7]==1){
						$rowori[2]="*******";
						}
                                                
                                           echo' <li class="right clearfix"><span class="chat-img pull-right">
                            <a href="profile?un='.$prpicori[2].'" ><img src="'.$prpicori[0].'" alt="User Avatar" style="height:40px;"class="img-rounded  img-responsive"></a>
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <small class=" text-muted"><span class="glyphicon glyphicon-time"></span> '.makemydate($rowori[5]).' </small>
                                    <a href="profile?un='.$prpicori[2].'" ><strong class="pull-right primary-font">$'.$rowori[2].'</strong></a>
                                </div>
                                <p class="text-right text-danger">
                                   '.$rowori[3].'
                                </p>
                                <div class="text-left">';  $jql="SELECT s_id FROM broadcast_comment_slam WHERE username='$usern' AND comment_id='$rowori[0]'";
                                      $dar=mysql_query($jql);
                                      if ($tar=mysql_fetch_row($dar))
									  echo'<button id="'.$rowori[0].'comm_slam_id" type="button" onclick="slam_comment(this.id)" class="comment_slam text-success fa"><i class="fa fa-thumbs-o-up text-success"  aria-hidden="true"></i> '.$rowori[4].'</button>';
								  else
									  echo'<button id="'.$rowori[0].'comm_slam_id" type="button" onclick="slam_comment(this.id)" class="comment_slam text-muted fa"><i class="fa fa-thumbs-o-up text-muted" aria-hidden="true"></i> +'.$rowori[4].'</button>';
                                      echo'</div>
                            </div>
                        </li>
                        </ul>';
                                            
                                        }
                        
		
                }
$qry0="Update member set log = NOW() WHERE username='$usern'";
               $done=mysql_query($qry0);
}
?>