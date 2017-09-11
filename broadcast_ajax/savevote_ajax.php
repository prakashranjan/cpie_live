<?php
require_once('../auth.php');
include("../connection.php");

  $usern=$_SESSION['SESS_USERNAME'];
 $poll_id=$_POST['poll_id'];
 $opt_val=$_POST['opt_val'];
 
 
 
 
 //$jql="SELECT s_id FROM slam WHERE username='$usern' AND topic_id='$tid' AND chat_id='$chat_id'";
 //$dar=mysql_query($jql);
 //if ($par=mysql_fetch_row($dar))
 //{
 // $tql="DELETE from slam where username='$usern' and topic_id='$tid' and chat_id='$chat_id'";
//	$tar=mysql_query($tql);
	
//	$mql5="update testblob set eye= eye-1 where  image_id='$chat_id'";
//				$kar5=mysql_query($mql5);
				
//				$qry="SELECT eye FROM testblob WHERE image_id='$chat_id'";
  //              $result=mysql_query($qry);
    //            $rowori= mysql_fetch_row($result);
				
 //echo '<i class="fa fa-thumbs-o-up text-muted" aria-hidden="true"></i> +'.$rowori[0];

//}
//else
//{
 if($poll_id && $opt_val && $usern){
 $sql="INSERT INTO broadcast_poll_count (option_id,image_id,username) VALUES ('$opt_val','$poll_id','$usern')";
			     $toname=mysql_query($sql);
				
				

				$mql56="update broadcast_poll_option set hits= hits+1 where image_id='$poll_id' AND option_id='$opt_val'";
				$kar56=mysql_query($mql56);
                                
                 echo '<div class="panel-body">';
                                       $k='A';
                                       $qry="SELECT option_id,poll_option,hits FROM broadcast_poll_option WHERE image_id='$poll_id'";
				$res=mysql_query($qry);
				while($option = mysql_fetch_row($res))
                                {
                                   echo'<div class="radio">
                               <label>
                                    
                                    <strong>'.$k++.'.  </strong>'.$option[1].'   <span class="text-info text-right " > ('.$option[2].' <i class="fa fa-hand-peace-o" aria-hidden="true"></i>) </span>
                                </label>
                            </div>
                            
                               <div class="progress progress-striped active">';
                                        $poll_per=($option[2]/2000)*100;  
                                        if($poll_per>=75)
                                        { echo'<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else if($poll_per>=50)
                                             { echo'<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else if($poll_per>=25)
                                             { echo'<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                        else 
                                             { echo'<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="'.$option[2].'" aria-valuemin="0" aria-valuemax="2000" style="width: '.$poll_per.'%">';}
                                             echo'<span class="sr-only"> '.$option[2].'Votes </span>
                                   </div>
                               </div>';
                          }  
                          echo'</div>';
 }
			//	$qry89="SELECT eye FROM testblob WHERE image_id='$chat_id'";
                //$result89=mysql_query($qry89);
               // $rowori89= mysql_fetch_row($result89);
//echo '<i class="fa fa-thumbs-o-up text-success" aria-hidden="true"></i> '.$rowori89[0];
	
	/*$hint="like";
$tidu=$tid;
 $qry456="INSERT INTO notification (worker,broadcast_id,hint,chat_id) VALUES ('$usern','$tidu','$hint','$chat_id')";
                $result456=mysql_query($qry456);*/
 
//}
 
 //Start session
    
$session=session_id();
$time=time();
$sql4="Update user_online set time='$time' where session='$session'";
$result4=mysql_query($sql4);


 
 
?>
