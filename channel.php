<?php

	require_once('auth.php');
 include("connection.php");	
  include("commonfun.php");
   include("vcommon.php");
   
  $tn=cleankar($_GET['tn']);
  if($tn==""){exit();}
                $sql="select private from section where category='$tn'";
            $query=mysql_query($sql)or die;
            
            if($query){
             $matgo=mysql_fetch_row($query);
            }
               
/*if($matgo[0]==0){ header("location: section?tn=$tn");
		exit();}*/
	
	        $usern=$_SESSION['SESS_USERNAME'];
	        $firstn=$_SESSION['SESS_FIRST_NAME'];
			$lastn=$_SESSION['SESS_LAST_NAME'];
			$fulln=$firstn." ".$lastn;
			$gender=$_SESSION['SESS_GENDER'];
			$gender= strtolower($gender);
			$memid=$_SESSION['SESS_MEMBER_ID'];
		$codeword=0;


              //  $usern=$_SESSION['SESS_USERNAME'];
                //$qry7="SELECT picture FROM member WHERE username='$usern'";
               // $ppicture7=mysql_query($qry7);
// $crow = mysql_fetch_row($ppicture7);
 

 $qr=mysql_query("select section_id from section where category='$tn'");
  $rn=mysql_fetch_row($qr);
   $tid=$rn[0];
   if(!is_numeric($tid)){ header("location: home");
			exit();}
 hideprivate();  
//important function
function hideprivate (){
    //for students and teachers.....
$usern=$_SESSION['SESS_USERNAME'];
$mode_id=$_SESSION['SESS_MODE'];
$tn=cleankar($_GET['tn']);
 $qr=mysql_query("select section_id from section where category='$tn'");
  $rn=mysql_fetch_row($qr);
   $tid=$rn[0];
   
 if($mode_id==1){   $section_id=$_SESSION['SESS_SECTION'];
                $course_id=$_SESSION['SESS_COURSE'];
  if($tid===$section_id){$rungo[0]=1;}
  else{ 
      header("location: home");
			exit();}
 }
 else if($mode_id==2){  $rungo[0]=1; }
 else{
     header("location: home");
			exit();
 }



             if($rungo[0]==1)
              { $codeword=0;
               }
              else
             { $codeword=1;}  

      //    }
//else
 // { $codeword=0; }

return $codeword;

}

$session=session_id();
$member_id=$_SESSION['SESS_MEMBER_ID'];
$mem_id=$member_id;
				$sql2="UPDATE section SET views=(views +1) WHERE section_id='$tid'";
				$counter=mysql_query($sql2);
$sql89="UPDATE channel_user_online SET topic_id='$tid' WHERE mem_id='$member_id'and session='$session'";
			
      if(hideprivate()==0)	{$counter89=mysql_query($sql89);}		





?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Welcome <?php echo $firstn ?></title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
                 <meta name="display" content="standalone">
                <meta name="theme-color" content="#2c3e50">
                <link rel="manifest" href="manifest.json">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		
		<link href="css/styles.css" rel="stylesheet">
		<link href="css/font-awesome.min.css" rel="stylesheet">

		
		
		
		
		<style type="text/css">
			
			
			
		
		/*@media (min-width: 768px) {
    /* some CSS for large resolution */

			#main{  
  background: url("images/c7dark.jpg") no-repeat center center fixed; 
}
                  /*    }*/	
		
		
		 
		.btn-primary{background-color:#8784ff;} 
                #sidebar .nav li>a:hover {
                    background-color:#8784ff;
                    
                }
		.btn-success{background-color:#8784ff!important;
                        border-color:#8784ff!important; }	

			
		</style>
		<script>
		var tid=<?php echo $tid; ?>;
    
		
		</script>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
		<link href="css/topiccss.css" rel="stylesheet">
		<link href="css/commoncss.css" rel="stylesheet">
		<script type="text/javascript" src="js/jquery.min.js"></script>
	
		<script type="text/javascript" src="js/logout.js"></script>
		<!-- <script src="js/ion.sound.js"></script> -->
	
		
		
 
 
      
<script src="js/dropzone.js"></script>


<?php 
if(hideprivate()==0){echo'
    <script type="text/javascript" src="js/channel_common.js"></script>
			';
}




if(hideprivate()==0 && $_SESSION['SESS_MODE']==1 ){echo'
    <script type="text/javascript" src="js/channel_1.js"></script>
			';} 
       else if( $_SESSION['SESS_MODE']==2) {
           echo'
    <script type="text/javascript" src="js/channel_2.js"></script>
			';
           
       }
       
       
                        
       
                        ?>



		<script src="js/commonjs.js"></script>
		
		
		<link href="css/dropzone.css" type="text/css" rel="stylesheet" />
 
<!-- 2 -->

 <style type="text/css">
                        @media (max-width: 480px) {
                    .sidenav {
    
    background: #617182; /* For browsers that do not support gradients */    
    background: -webkit-linear-gradient(left top, rgba(135, 132, 255, 0.92),rgba(44, 62, 80, 0.77)); /* For Safari 5.1 to 6.0 */
    background: -o-linear-gradient(bottom right,rgba(135, 132, 255, 0.92),rgba(44, 62, 80, 0.77) ); /* For Opera 11.1 to 12.0 */
    background: -moz-linear-gradient(bottom right,rgba(135, 132, 255, 0.92),rgba(44, 62, 80, 0.77)  ); /* For Firefox 3.6 to 15 */
    background: linear-gradient(to bottom right, rgba(135, 132, 255, 0.92),rgba(44, 62, 80, 0.77) ); /* Standard syntax (must be last) */

}

                        }          
                </style>

	</head>
	<body style="filter: blur(30px);-webkit-filter: blur(30px);">
            <?php include_once("analyticstracking.php") ?>
	<input type="hidden" value="<?php print $tid;?>" id="tid">	


	<div class="wrapper">
    <div class="box">
        <div class="row row-offcanvas row-offcanvas-left">
                      
          
            <!-- sidebar -->
             <div id="mySidenav" class="sidenav visible-xs">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a><br>
          <div id="sideclone" class="column">        </div>
</div>
            
            
            <div class="column col-sm-2  hidden-xs"  id="sidebar">
          
              
              
                <ul class="nav" id="lg-menu">
                  <li  class="ubuntu"><a style="background:#8784ff;"href="profile?un=<?php echo $usern; ?>"><i class="fa fa-<?php echo $gender;?> fa-2x"></i> <span style="font-size:1.35em;"> $<?php echo $usern ?></span></a></li>
                   
                    <li class="active"><a href="home"> Home <i class="fa fa-home pull-right"></i></a></li>
					<li><a id="refresh"href=""> Refresh <i class="glyphicon glyphicon-refresh pull-right"></i></a></li>
                                        
                                        
                                        
<?php
$tn=cleankar($_GET['tn']); $qr=mysql_query("select section_id from section where category='$tn'"); $rn=mysql_fetch_row($qr); $tid=$rn[0];
                
                $qry99="SELECT course_id,branch_id FROM section WHERE section_id='$tid'";
                $res45=mysql_query($qry99);

 $zrow= mysql_fetch_row($res45);
 
$qry199="SELECT branch_short FROM branch WHERE branch_id='$zrow[1]'";
                $res415=mysql_query($qry199);

 $mxrow= mysql_fetch_row($res415);
 $qry199="SELECT course_short FROM course WHERE course_id='$zrow[0]'";
                $res415=mysql_query($qry199);

 $xrow= mysql_fetch_row($res415);
 $xrow[0]=str_replace("#","",$xrow[0]." / ".$mxrow[0]);

?>

          <?php 
          $ktqry="SELECT section.category FROM section JOIN channel_favs where (section.section_id=channel_favs.section_id && channel_favs.mem_id='$mem_id')";
 $mtqry=mysql_query($ktqry);
          
          
          if( $_SESSION['SESS_MODE']==2) { echo'<li class="dropdown"><button  title="switch sections"type="button" class="btn btn-primary btn-block " data-toggle="dropdown"style="text-align:left;"  style="background:#8784ff;"><h5 style="font-family:ubuntu;font-size:0.9em;"><i class="fa fa-book" aria-hidden="true"></i> '.$mxrow[0].' <span class="caret"></span></h5></button>
					<ul class="dropdown-menu scrollable-menu dropdown-menu-left" role="menu" id="typecswitch">';
    $sql="SELECT category,section_id FROM section where branch_id='$zrow[1]' order by views DESC";
 $query=mysql_query($sql);
 while($row=mysql_fetch_row($query))
 {echo'<li><a  href="channel?tn='.$row[0].'"><i class="fa fa-at" ></i> '.$row[0].'</a></li>';
  }
  echo'</ul>
					</li>
          <li> &nbsp;</li>';
 echo'<li><div class="dropdown">
  <button class="btn btn-primary btn-block " style="background:#8784ff;text-align:center;"type="button" data-toggle="dropdown"> My classes <i class="fa fa-book pull-right" aria-hidden="true"></i>
  <span class="caret"></span></button>
  <ul class="dropdown-menu scrollable-menu" role="menu" >';
                   while($jtqry=mysql_fetch_row($mtqry)){
                   echo'<li><a  href="channel?tn='.$jtqry[0].'" ><i class="fa fa-at" ></i> '.$jtqry[0].'</a></li>';}
  echo'</ul>
						</div></li><li class="mybr"> &nbsp;</li> ';            


}?>
                                        
					<?php if(hideprivate()==0){echo'<li>
<button title="channel media"type="button" class="btn btn-primary btn-block " data-toggle="modal"style="text-align:left;font-size:1.0em;" onclick="media();"data-target="#fileModal">Documents <i class="fa fa-file-text pull-right" aria-hidden="true"></i></button>   </li><li class="mybr"> &nbsp;</li>'; } ?>	
                
					<li class="dropdown"><!-- Trigger favtopis and user topics -->
						
<button title="switch to favourite channels"type="button" class="btn btn-primary btn-block " data-toggle="dropdown"style="text-align:left;font-size:1.0em;" >Easy Switch <i class="fa fa-twitch pull-right" aria-hidden="true"></i>
	<span class="caret"></span></button>   
				
  <ul class="dropdown-menu scrollable-menu" role="menu" id="eswitch">
 <?php  $sql="SELECT category,topicid FROM favourites where username='$usern' order by views DESC";
 $query=mysql_query($sql);
 while($row=mysql_fetch_row($query))
 {echo'<li><a  href="topic?tn='.$row[0].'"><i class="fa fa-at" ></i> '.$row[0].'</a></li>';
  }
?>
	  </ul>
				</li><li class="mybr"> &nbsp;</li>
                                   <?php if(hideprivate()==0){echo'<li><div class="dropdown">
  <button class="btn btn-primary btn-block " onclick="online();"type="button" data-toggle="dropdown">Online  <i class="fa fa-users pull-right" aria-hidden="true"></i>
  <span class="caret"></span></button>
  <ul class="dropdown-menu scrollable-menu" role="menu" id="online">
   
  </ul>
                                   </div></li>';}?>
					
				</ul>
			
            </div>
            
            <?php  
$tn=cleankar($_GET['tn']);
$mem_id=$_SESSION['SESS_MEMBER_ID'];
 $qr=mysql_query("select section_id from section where category='$tn'");
  $rn=mysql_fetch_row($qr);
   $tid=$rn[0];

				$sql45="select category,views,cdesc from section WHERE section_id='$tid'";
				$categ=mysql_query($sql45);
				$category=mysql_fetch_row($categ);
				
                                
                              if($_SESSION['SESS_MODE']==2){     $jql="SELECT fav_id FROM channel_favs WHERE mem_id='$mem_id' AND section_id='$tid'";
 $dar=mysql_query($jql);
 if ($tar=mysql_fetch_row($dar))
 { 
	$mql="update channel_favs set views= views+1 where mem_id='$mem_id' and section_id='$tid'";
				$kar=mysql_query($mql);
                                
                                $hrt=true;


}
else
{
$hrt=false;

 
 
}
 
 $mqlq="select hearts from section where section_id='$tid'";
				$karq=mysql_query($mqlq);
                                $resma=  mysql_fetch_row($karq);                 
                                
                                
                              }                               
                                
                                
                                
                                ?>
            
            
            <!-- /sidebar -->
          
            <!-- main right col -->
            <div class="column col-sm-10 col-xs-12" id="main">
                
                <!-- top nav -->
              	<div class="navbar navbar-blue navbar-static-top" style="background-color:#8784ff;">  
                   
                     <div class="navbar-header ">
                     <!-- <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">&#9776;</button>-->
                        <div class="btn-group btn-group-justified visible-xs" role="group" aria-label="...">
  <div class="btn-group" role="group" style="width:13%;" onclick="openNav()">
    <button type="button" class="btn " style="padding:0;background-color:#8784ff;"><span  class="visible-xs " ><i class="fa fa-bars text-primary getora" aria-hidden="true"></i></span></button>
  </div>
                            <div class="btn-group" role="group" style="width:60px;background-color: black;">
    <button type="button" class="btn "style="padding:1px;background-color: black;
    border-color: black;" href="#settingsModal" role="button"  data-toggle="modal"><?php echo "<marquee  direction='left' class='ubuntu fa-2x'>@".$category[0]." &nbsp;&nbsp;<i style='font-size:0.9em;' class='text-info glyphicon glyphicon-eye-open'>".$category[1]."</i></marquee>";?></button>
  </div>
                           
  <div class="btn-group" role="group">
    <button type="button" class="btn " style="background-color:#8784ff;" href="#postModal" role="button" data-toggle="modal" onclick="saaf();"><i class="glyphicon glyphicon-bullhorn getora"></i></button>
  </div>
                            <div class="btn-group" role="group">
    <button type="button" class="btn  " href="#" onclick="prechat();"style="padding:0;background-color:#8784ff;" ><i class="fa fa-comments getora" style="color:#3ce793;"></i></button>
  </div>
                         <?php if($_SESSION['SESS_MODE']==2){echo'   <div class="btn-group" role="group">
    <button type="button" class="btn  " style="background-color:#8784ff;" id="fav2" onclick="favmark();">';
    
         
 if ($hrt===true)
 { 
	
echo'<i style="color:#e74c3c;" class="fa fa-heart getora" aria-hidden="true"></i> <span class="badge hrt"> '.$resma[0].'</span>';

}
else
{

echo'<i style="color:#e74c3c;" class="fa fa-heart-o getora" aria-hidden="true"></i> <span class="badge hrt"> '.$resma[0].'</span>';
 
 
}
 
    
   echo'</button></div>';}?>
                            
  <div class="btn-group" role="group">
      <a href="#" class="btn  dropdown-toggle getora"style="background-color:#8784ff;" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-sign-out" aria-hidden="true"></i><span class="caret"></span> </a>
      <ul class="dropdown-menu dropdown-menu-right" > 
           
          <li role="separator" class="divider"></li>
          <li><a onclick="logout();" id="logout" href="#">logout</a></li>
      </ul>
  </div>
</div>
                        
                        
                      <a href="#" onclick="sidehide();" id="sideh" class="navbar hidden-xs" >
                    
                      <i class="fa fa-chevron-circle-left fa-2x text-primary" style="padding-top:12px;padding-left:5px;" aria-hidden="true"></i>
                      </a>
                        
                    
                  	</div>
                    
                  	<nav class="collapse navbar-collapse" role="navigation">
                    
					
                    <ul class="nav navbar-nav">
                        <li>&nbsp;</li>
                    
					  
					  
                      
				 <li class="ubuntu bg-primary hidden-xs " style="padding-top:7px; padding-bottom:7px;" >
                                     <a href="#settingsModal" role="button"  data-toggle="modal" style="font-size:2.0em; font-weight:400;padding-top:0px; padding-bottom:0px;"><?php echo "<marquee width='150' direction='left' class=''>@".$category[0]."</marquee> &nbsp;<span style='color:#8784ff;'><i class='glyphicon glyphicon-eye-open'></i> ".$category[1]." &nbsp;</span>";?></a>
                    
                        
                      </li>
                    
                      <li>
                          <a href="#postModal" role="button" data-toggle="modal" onclick="saaf();" ><span class="badge"><i class="glyphicon glyphicon-plus"></i> Shout</span></a>
                      </li>
                     <?php  if($_SESSION['SESS_MODE']==2){echo'<li>
                        <a href="#"  id="fav" onclick="favmark();"style=" color:red;text-align:center;">';
                     
 if ($hrt===true)
 { 
	
echo'<i style="color:#e74c3c;" class="fa fa-heart fa-lg fa-2x"></i> <span class="badge hrt"> '.$resma[0].'</span>';

}
else
{

echo'<i style="color:#e74c3c;" class="fa fa-heart-o fa-lg fa-2x"></i> <span class="badge hrt"> '.$resma[0].'</span>';
 
 
}
   
                        echo'</a>    
                     </li>';} ?>
					  
                    <li class="active" ><a href="#" onclick="prechat();"><i class="fa fa-comments fa-lg fa-2x" style="color:#3ce793;" ></i> <span class="badge" style=" background-color:#2C3E50;" id="ting"></span></a></li>
                      
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
						 
						<li class="dropdown" style="padding-right:10px;">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-sign-out" style="font-size:1.5em;"aria-hidden="true"></i></a>
                        <ul class="dropdown-menu">
                            
                          <li><a onclick="logout();" id="logout" href="#">logout</a></li>
                        </ul>
                      </li>
                    </ul>
                  	</nav>
                </div>
                <!-- /top nav -->
              
                
				
                    <div id="chatdiv" class="full col-sm-9">
                    
                 
                        
                      </div><!-- /col-9 -->
					  <div class="row" style="text-align:right;" >
                          
							              <div class="col-sm-8 pull-right">
                            <a href="#" id="loadmore" onmouseover="refer();" style="display:none;"class="btn btn-success  pull-center col-sm-5"><i class="fa fa-arrow-down" aria-hidden="true"></i> Load More <i class="fa fa-arrow-down" aria-hidden="true"></i></a>
                           <script> $('#loadmore').hide();</script>
                           
						               </div> 
                        </div>
                <!-- /padding -->
            </div>
            <!-- /main -->
          
        </div>
    </div>
</div>


<!-- sharemodal -->
<div class="modal fade" id="shareModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Forward Shout to</h4>
        </div>
        <div class="modal-body">
        <input type="hidden" id="shoutid" value=""/>
          <select class="form-control" id="sharechannel" >
              
            <option value="-99"> Select Channel </option>
<?php
 $sql="SELECT category FROM favourites where username='$usern' order by views DESC";
 $query=mysql_query($sql);
 while($row=mysql_fetch_row($query))
 {echo'<option value="'.$row[0].'"> '.$row[0].' </option>';
  }
?>
  </select>
        </div>
        <div class="modal-footer">
        <div id="status"></div>
          <button type="button" onclick="forward();"class="btn btn-primary">forward</button>
        </div>
      </div>
      
    </div>
  </div>

  <!-- sharemodal_over  -->
     
        

  
<!-- file Modal -->
<div id="fileModal" class="modal fade" role="dialog">
	
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Channel Docs</h4>
      </div>
      <div class="modal-body " style="overflow:hidden;">
          <div class="row">
            
               <div class="table-responsive ">
  <table class="table " id="media">
   
  </table>
</div>
     
      </div>
      <div class="modal-footer">
        <!--<button type="button" class="btn btn-default">Older</button>-->
      </div>
    </div>

  </div>
  </div></div>

 <!-- file modal_over  -->

 
 <!-- comment Modal -->
<div id="commentModal" class="modal fade" open="$(this).scrollTop(0);" role="dialog">
	
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"><i class="fa fa-comments-o " aria-hidden="true"></i> Comments </h4>
      </div>
      <div class="modal-body "  style="overflow:hidden;">
       
          
        <!-- content -->
        <div class="panel-body row ubuntu "  style="max-height:500px;overflow-y:auto;">
            <ul class="chat list  list-group " style="list-style:none;" id="comments_display"></ul> 
            <div ><h2 class="text-center text-muted"><i id="latest_comment" class="fa fa-comments-o " aria-hidden="true"></i></h2></div>
                </div>  
        
      </div>
      <div class="modal-footer ubuntu">
       
                    <div class="input-group">
                        <textarea id="comment_info"  row="2" col="100%" class="form-control input-sm text-info " style="font-size:100%;"  placeholder="Type your comment here..."></textarea>
                        <input type="hidden" id="comment_post_id" value=""/>
                        <span class="input-group-btn">
                            <button class="btn btn-success btn-md " onclick="save_comment();"  id="comment_button">
                                <i class="fa fa-chevron-circle-right" aria-hidden="true"></i> </button>
                        </span>
                    </div>
                
        <!--<button type="button" class="btn btn-default">Older</button>-->
      </div>
    </div>

  </div>
</div>

 <!-- comment modal_over  -->


        <!-- channel wall Modal -->
<div id="settingsModal" class="modal fade" role="dialog">
	
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
       <?php echo'<h5 class="modal-title  ubuntu"> #'.$xrow[0].' <i class="fa fa-angle-double-right text-muted" aria-hidden="true"></i> <span class="ubuntu" style="color:#18BC9C;font-size:1.0em;"> @'.$category[0].'</span></h5>';?>
      </div>
      <div class="modal-body " style="overflow:hidden;">
        
          <h4 class=" bg-primary text-success text-center ubuntu " style="padding:3px;">About channel</h4>
          <div class="form-group " id="chandis">
      <?php 
        echo'<p class="text-primary lead ubuntu "style="color:black;font-size:15px;" ><blockquote  class="blockbg" style="font-size:15px;"name="channeldiscrip" id="channeldiscrip" onclick="editchandis();"> '.$category[2].' </blockquote></p>';

        ?>

            </div>
          <h4 class=" bg-primary text-success text-center ubuntu " style="padding:3px;font-size:1.1em;"><i class="fa fa-whatsapp " aria-hidden="true"></i> Whatsapp group</h4>
         
          <div id="whatsapp_link_jagah" style="text-align:center;"> <?php
          $mjquery=  mysql_query("select whatsapp_g from section where section_id='$tid'");
          $mjrun=mysql_fetch_row($mjquery);
          if($mjrun[0]==NULL){}
          else{
              echo'<a  href="'.$mjrun[0].'" target="_blank"class="btn btn-muted  ubuntu" style="width:80%;background-color:#25d366;color:white;"><i class="fa fa-whatsapp " aria-hidden="true"></i> Join Whatsapp group</a>';

          }
          
          ?></div>
          <li class="mybr"></li>
          <div class="whatsapp_g_form"><form >
  <div class="input-group">
      
       <input type="text"  style="font-size:0.9em;color:#0b7964;height: 2.9em;"class=" inputbak inputmob whatsapp_g_link form-control" placeholder="https://chat.whatsapp.com/........" title="paste whatsapp group invite link">
    <div class="input-group-btn">
      <button class="btn btn-muted whatsapp_g_button " style="padding:0.2em;" onclick="channel_whatsapp();" type="button">
      <i class="fa fa-arrow-circle-o-right fa-2x inputmob" aria-hidden="true"></i>

      </button>
    </div>
       </div>
 
  
              </form>
           </div>
          <br>
          
         </div>
      <div class="modal-footer">
        
      </div>
    </div>

  </div>
</div>

 <!-- channel wall modal_over  -->



<!-- pending request Modal -->
<div id="pendingfollowModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Pending follow requests</h4>
      </div>
      <div class="modal-body">
        <table class="table table-striped">
    
    <tbody id="pendingrequest">
     
		
      
    </tbody>
  </table>
      </div>
      <div class="modal-footer">
     
      </div>
    </div>

  </div>
</div>
<!-- modal over --->

<!--post modal-->
   <div id="postModal" class="modal fade" tabindex="-1" >
  <div class="modal-dialog modal-lg">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			Shout something
      </div>
	  <div class="modal-body postmf">
        <div class="tabbable"> <!-- Only required for left/right tabs -->
        <ul class="nav nav-tabs fa-lg postmf">
        <li class="active "><a href="#tab1" data-toggle="tab"><i class="fa fa-lg fa-comment" aria-hidden="true"></i> Chat</a></li>
        <li><a href="#tab2" data-toggle="tab"><i class="fa fa-paperclip fa-lg" aria-hidden="true"></i> Media</a></li>
    <li ><a href="#tab3" data-toggle="tab"><i class="fa fa-bar-chart fa-lg" aria-hidden="true"></i> Poll</a></li>
        </ul>
        <div class="tab-content">
        <div class="tab-pane active" id="tab1">
            <form class="form center-block"  enctype="multipart/form-data" >
            <div class="form-group">
              <textarea rows="8" cols="100%" class="form-control input-lg inputbak" maxlength="2000" name="cap" id="cap" placeholder="What do you want to shout?"></textarea>
              <br>
              <div class="checkbox text-center  row ubuntu">
    <label>
       <input  name="anon" id="anon" type="checkbox"  > <i class="fa fa-user-secret fa-lg" aria-hidden="true"></i> hide identity
    </label>
            <?php if($_SESSION['SESS_MODE']==1){echo'&nbsp;<label>
       <input  name="hide_t" id="hide_t" type="checkbox"  > <i class="fa fa-user fa-lg" aria-hidden="true"></i> only students
            </label>  ';}?>    
  </div>
			 <div id="respo"></div>
            </div>
				 <div class="modal-footer">
          <div>
          <button id="grabcap" onclick="multi();" type="button" class="btn btn-primary btn-sm ubuntu " >Shout <i class="fa fa-bullhorn fa-3x"></i></button>
            
		 </div>
                                 </div>
		  </form>
          
      
			
        </div>
        <div class="tab-pane" id="tab2">
        	 <form method="POST"   id="channeldocupload" action="channel_ajax/channel_uploadmera.php" class="dropzone" enctype="multipart/form-data" >
           <div class="form-group">
              <textarea rows="4" cols="100%"class="form-control input-lg inputbak" name="cap2" maxlength="2000"  id="cap2" placeholder="Enter caption..."></textarea>
		 <br>
              <div class="checkbox text-center  row ubuntu">
    <label>
       <input  name="anon2" id="anon2" type="checkbox"  value="1" > <i class="fa fa-user-secret fa-lg" aria-hidden="true"></i> hide identity
    </label>
            <?php if($_SESSION['SESS_MODE']==1){echo'&nbsp;<label>
       <input  name="hide_t2" id="hide_t2" type="checkbox"  value="1"> <i class="fa fa-user fa-lg" aria-hidden="true"></i> only students
            </label>  ';}?>    
  </div>	 
              <div id="respo"></div>
            </div>
                     
				
		  </form>
          
      
			
        </div>
	 <div class="tab-pane" id="tab3">
            <form class="form center-block" enctype="multipart/form-data" >
            <div class="form-group">
                <textarea rows="3" cols="100%"class="form-control input-lg text-danger inputbak" name="cap3" maxlength="1000" id="cap3" placeholder="Ask something..."required="give poll question.."></textarea>
			
                         
                         <!-- poll options -->
                        <ul style="list-style:none;    -webkit-padding-start: 0px;"id="append_li" >
                            <li style="padding-bottom:3px;" ><input type="text" class="form-control input-sm text-success text-center" name="opt1" maxlength="60" id="opt1" placeholder="+ option 1"required/></li>
                            <li style="padding-bottom:3px;"><input type="text" class="form-control input-sm text-success text-center" name="opt2" maxlength="60" id="opt2" placeholder="+ option 2"required/></li>
                            <li style="padding-bottom:3px;"><input type="text" class="form-control input-sm text-success text-center" name="opt3" maxlength="60" id="opt3" placeholder="+ option 3"/></li>
                              <li style="padding-bottom:3px;"><input type="text" class="form-control input-sm text-success text-center" name="opt4" maxlength="60" id="opt4" placeholder="+ option 4"/></li>
                      
                                          
                        </ul>
                         <li class="text-center" style="list-style:none;"><button type="button" id="add_opt_button" onclick="add_opt();" class=" btn-muted btn-xs "> + </button></li>  
                         
            </div>
				 <div class="modal-footer">
         
         <div class=" form-control checkbox row text-center ubuntu ">
             <label class="text-primary postmf"><input id="poll_checkbox" name="poll_checkbox" type="checkbox" ><i class="fa fa-user-secret " aria-hidden="true"style="color:#555555;"></i> hide identity</label>
         
             <?php if($_SESSION['SESS_MODE']==1){echo'&nbsp;<label class="text-primary  postmf"><input id="poll_hide_t" name="poll_hide_t" type="checkbox" ><i class=" fa fa-user " aria-hidden="true"style="color:#555555;"></i> only students</label>  ';}?>  
         </div><button id="post_poll"name="post_poll" onclick="savepoll();" type="button" class="btn btn-primary btn-sm ubuntu " > Shout <i class="fa fa-bullhorn fa-3x"></i></button>
         <br><div id="respo3"></div>
                                 </div>
                  
		  
		  </form>
          
      
			
        </div>
        </div>
</div></div></div></div></div>


     






	<!-- script references -->
		
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>
                
                <script>
          $( window ).load(function() {
    console.log( "ready!" );
    $("body").css("filter","none");
});
</script>
		
	</body>
</html>



