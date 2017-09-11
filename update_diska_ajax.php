<?php
 require_once('auth.php');
include("connection.php");
 $usern=$_SESSION['SESS_USERNAME'];
 $mem_id=$_SESSION['SESS_MEMBER_ID'];
$uid=addslashes($_GET['uid']);
if($uid==$mem_id){
  
    exit(1);
}
  $n2qry="select haters,likers,views,shouts from member WHERE mem_id='$uid'";
                $n2result=mysql_query($n2qry);
                $n2row = mysql_fetch_row($n2result);


 function lh($uid,$mem_id){
                                  
                                    $darm=mysql_query("SELECT follow_id,status FROM follow WHERE user1_id='$mem_id' AND user2_id='$uid'");
 
 if (mysql_num_rows($darm)==1){
    $daro=mysql_fetch_row($darm);
    
     if($daro[1]==1){//former like
    return 2;  
         
     }
         else if($daro[1]==2){//former hate
     
         return 1;
         }
         
     }
 else{return 0;}
                                             }
                                     $lh_res= lh($uid,$mem_id); 
                                     echo'	  
                                                                      <li class="list-group-item lead ubuntu"> <i class="fa  fa-2x text-success fa-smile-o" aria-hidden="true"></i> '.$n2row[1] .' likers '; if(($lh_res==1||$lh_res==0)){echo'<button type="button"  onclick="sendrequest(1);" style="border-radius:35px;" class="makar1 btn pull-right text-primary btn-success  btn-xs"><i class="fa fa-2x fa-smile-o" aria-hidden="true"></i> <i class="fa  fa-plus-circle" aria-hidden="true"></i> </button>';} echo'<div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"   aria-valuemin="0" aria-valuemax="1000" style="width:'. ($n2row[1]/10).'%">
    <span class="sr-only"></span>
  </div>
</div>
								  </li>
                                                                    <li class="list-group-item lead ubuntu"> <i class="fa fa-2x  text-danger fa-frown-o" aria-hidden="true"></i> '. $n2row[0] .' haters '; if(($lh_res==2 ||$lh_res==0) ){echo'<button type="button" onclick="sendrequest(2);" style="border-radius:35px;" class="makar2 btn pull-right text-primary btn-danger  btn-xs"><i class="fa fa-2x fa-frown-o" aria-hidden="true"></i> <i class="fa  fa-plus-circle" aria-hidden="true"></i> </button>';} echo'<div class="progress">
  <div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"  aria-valuemin="0" aria-valuemax="1000" style="width:'. ($n2row[0]/10).'%">
    <span class="sr-only"></span>
  </div>
</div>
								  </li>
							 <li class="list-group-item lead  ubuntu"> '.$n2row[2].' views  <div class="progress">
  <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar"   aria-valuemin="0" aria-valuemax="8000" style="width:'. ($n2row[2]/80).'%">
    <span class="sr-only"></span>
  </div>
</div>
								  </li>
                                                                  <li class="list-group-item lead  ubuntu"> '.$n2row[3].' shouts <div class="progress">
  <div class="progress-bar progress-bar-primary progress-bar-striped active" role="progressbar"   aria-valuemin="0" aria-valuemax="8000" style="width:'.($n2row[3]/20).'%">
    <span class="sr-only"></span>
  </div>
</div>
                  </li>
                                   ';


?>