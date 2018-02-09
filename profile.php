
<?php
	require_once('auth.php');
 include("connection.php");
 include("vcommon.php");
	
	        $usern=$_SESSION['SESS_USERNAME'];
                $mem_id=$_SESSION['SESS_MEMBER_ID'];
	        $firstn=$_SESSION['SESS_FIRST_NAME'];
			$lastn=$_SESSION['SESS_LAST_NAME'];
			$fulln=$firstn." ".$lastn;
			$gender=$_SESSION['SESS_GENDER'];
			$gender= strtolower($gender);
 
$ui=cleankar($_GET['un']);
if($ui==""){header("location: home");
    exit();
}
$sql=mysql_query("select mem_id from member where username='$ui'");
$query=mysql_fetch_row($sql);
$uid=$query[0];
if(!is_numeric($uid)){
     header("location: home");
			exit();
}


function edit() {   
	$usern=$_SESSION['SESS_USERNAME'];
                
$ui=cleankar($_GET['un']);
$sql=mysql_query("select mem_id from member where username='$ui'");
$query=mysql_fetch_row($sql);
$uid=$query[0];
if(!is_numeric($uid)){
     header("location: home");
			exit();
}
                $qry78="SELECT mem_id FROM member WHERE username='$usern'";
                $ppicture78=mysql_query($qry78);
 $crow78 = mysql_fetch_row($ppicture78);

if($crow78[0]==$uid){return 1;}
else{return 0;}

		}
		
		
if(!edit()){
$qry05="Update member set views=views+1 WHERE mem_id='$uid'";
               $done5=mysql_query($qry05);
}
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
                  <meta name="theme-color" content="#fafafa">
                <link rel="manifest" href="manifest.json">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		
		<link href="css/styles.css" rel="stylesheet">
		<!--<link href="css/font-awesome.min.css" rel="stylesheet">-->
	
		<link rel="stylesheet" href="https://use.fontawesome.com/d05823ecab.css">
		
		
		
                <?php if(edit()){echo"
                <script>
		var tid=$uid; 
		
		</script>
                ";}?>
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    		<link href="css/profilecss.css" rel="stylesheet">
                
                
		<link href="css/commoncss.css" rel="stylesheet">
                
               
    
    
   
		
		<script type="text/javascript" src="js/jquery.min.js"></script>
	
	
		<script type="text/javascript" src="js/logout.js"></script>
		<!-- <script src="js/ion.sound.js"></script> -->	
		   <script src="js/commonjs.js"></script>
        <?php	if(edit()){
            echo'
 
<!-- 2 -->

<script src="js/profilemejs.js"></script>
';}
                else {echo'<script src="js/profileotherjs.js"></script>';}
                
             ?>   

		
		
	<link href="css/typeahead.tagging.css" rel="stylesheet">
        	
                 
   
        
		
	</head>
	<body style="filter: blur(30px);-webkit-filter: blur(30px);">
            <?php include_once("analyticstracking.php") ?>
	
	


	<div class="wrapper">
    <div class="box">
        <div class="row row-offcanvas row-offcanvas-left">
                       <div id="mySidenav" class="sidenav visible-xs">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a><br>
          <div id="sideclone" class="column">        </div>
</div>
          
            <!-- sidebar -->
            <div class="column col-sm-2  hidden-xs"  id="sidebar">
              
              
               
                <ul class="nav" id="lg-menu">
					
					<?php 
$ui=cleankar($_GET['un']);
$sql=mysql_query("select mem_id from member where username='$ui'");
$query=mysql_fetch_row($sql);
$uid=$query[0];
if(!is_numeric($uid)){
     header("location: home");
			exit();
}
						$usern=$_SESSION['SESS_USERNAME'];
                
                $n2qry="select picture,username,mem_id,fname,lname,gender,haters,likers,views,status,skills,from_place,lives_at,long_disc,email,mobile,mode_id,shouts,loudshouts from member WHERE mem_id='$uid'";
                $n2result=mysql_query($n2qry);
                $n2row = mysql_fetch_row($n2result);

$usernw=$n2row[1];
            $firstnw=$n2row[3];
			$lastnw=$n2row[4];
			$fullnw=$firstnw." ".$lastnw;
                        $fullnw=  strtoupper($fullnw);
			$genderw=$n2row[5];
			$genderw= strtolower($genderw);
            $followw=$n2row[6];
            $followersw=$n2row[7];
   $viewsw=$n2row[8];
   $statusw=$n2row[9];
$skillsw=$n2row[10];
$from_placew=$n2row[11];
$lives_atw=$n2row[12];

$sql78=mysql_query("select val_str,loc_id from member_loc where loc_id in ('$from_placew','$lives_atw')");
while($re234= mysql_fetch_row($sql78))
{if($re234[1]==$from_placew){
    $from_placew=$re234[0];
                            }
 if($re234[1]==$lives_atw){
$lives_atw=$re234[0];
     
                          }
    
}
$long_discw=$n2row[13];
$emailw=$n2row[14];
$mem_mobile=$n2row[15];
$mem_mode=$n2row[16];
if($mem_mode==1){
$n2qry="select ad_no,(select course_short from course where course_id=stud_member.course_id),(select category from section where section_id=stud_member.section_id),roll_no from stud_member WHERE mem_id='$uid'";
                $n2result=mysql_query($n2qry);
                $myrow = mysql_fetch_row($n2result);
                $mem_ad_no=$myrow[0];
                $mem_roll_no=$myrow[3];
                $mem_course=$myrow[1];
                $mem_section=$myrow[2];
                $mem_section_part=explode('_', $mem_section);
                 
                       $mem_section_part[2]=substr($mem_section_part[2],2);

}
else if($mem_mode==2){
$n2qry="select emp_no from teach_member WHERE mem_id='$uid'";
                $n2result=mysql_query($n2qry);
                $myrow = mysql_fetch_row($n2result);
                

}
               		
	$metr=mysql_query("select count(image_id) from testblob where username='$usernw'");
       if(mysql_num_rows($metr)) {$metro=mysql_fetch_row($metr);
 

$shouts=$metro[0];
}

					 ?>
					
                    <li  class="ubuntu"><a style="background:#18bc9c"href="#"><i class="fa fa-<?php echo $genderw;?> fa-2x"></i><span style="font-size:1.3em;"> $<?php  echo $usernw ?></span></a></li>
                    <li class=" marq "><a  style="color:white; background:#18bc9c;font-size:0.9em;font-weight: bolder;"href="#"><i class="glyphicon glyphicon-home"></i> <?php echo $fullnw ?></a></li>
                    <li class="active"><a href="home"> Home <i class="fa fa-home pull-right"></i></a></li>
					<li><a id="refresh"href=""> Refresh <i class="glyphicon glyphicon-refresh pull-right"></i></a></li>
					


					<li class="dropdown"><!-- Trigger favtopis and user topics -->
						
<button title="switch to favourite channels"type="button" class="btn btn-success btn-block " data-toggle="dropdown"style="text-align:left;font-size:1.0em;" >Easy Switch <i class="fa fa-twitch pull-right" aria-hidden="true"></i>
	<span class="caret"></span></button>   
				
  <ul class="dropdown-menu scrollable-menu" role="menu" id="eswitch">
 <?php  $sql="SELECT category,topicid FROM favourites where username='$usern' order by views DESC";
 $query=mysql_query($sql);
 while($row=mysql_fetch_row($query))
 {echo'<li><a  href="topic?tn='.$row[0].'"><i class="fa fa-at" ></i> '.$row[0].'</a></li>';
  }
?>
	  </ul>
				</li>
					
                                     <?php  
                                     if($_SESSION['SESS_MODE']==2){
                                     $ktqry="SELECT section.category FROM section JOIN channel_favs where (section.section_id=channel_favs.section_id && channel_favs.mem_id='$mem_id')";
 $mtqry=mysql_query($ktqry); 
                                        echo'<li><div class="dropdown">
  <button class="btn btn-primary btn-block simple" style="text-align:center;font-size:1.3em;"type="button" data-toggle="dropdown"> My classes <i class="fa fa-book pull-right" aria-hidden="true"></i>
  <span class="caret"></span></button>
  <ul class="dropdown-menu scrollable-menu" role="menu" >';
                   while($jtqry=mysql_fetch_row($mtqry)){
                   echo'<li><a  href="channel?tn='.$jtqry[0].'" ><i class="fa fa-at" ></i> '.$jtqry[0].'</a></li>';}
  echo'</ul>
                                     </div></li> ';} ?> 
                                        
                                     
			
			
                     
				</ul>
				
		
              
             
              
            </div>
            <!-- /sidebar -->
          
            <!-- main right col -->
            <div class="column col-sm-10 col-xs-12"  id="main">
                
   <!-- top nav -->
              	<div class="navbar navbar-blue navbar-static-top">  
                    <div class="navbar-header">
                       <div class="btn-group btn-group-justified visible-xs" role="group" aria-label="...">
  <div class="btn-group" role="group" style="width:2%;"onclick="openNav()">
    <button type="button" class="btn btn-success" style="padding:0px;"><span  class="visible-xs " ><i class="fa fa-bars text-primary getora" aria-hidden="true"></i></span></button>
  </div>
             <div class="btn-group" role="group">
                 <button type="button" class="btn btn-success" ><a style="color:white;" href="home"><i class="glyphicon glyphicon-home getora"></i></a></button>
  </div>                
                     <?php  if(edit()){ 
                         
                         //do nothing
                     }
                         else {echo'<div class="btn-group simple" role="group">
                        <button type="button" class="btn simple" ><a href="profile?un='.$usern.'" style="color:white;"><i class="glyphicon glyphicon-user"></i></a></button>
                      </div>
                       

';
                         
                         
                         
                         }
                          
                          
                          ?>
                           
  <!--<div class="btn-group" role="group">
      <a href="#" class="btn btn-success dropdown-toggle getora" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-sign-out" aria-hidden="true"></i><span class="caret"></span> </a>
      <ul class="dropdown-menu dropdown-menu-right" > 
           
          <li role="separator" class="divider"></li>
          <li><a onclick="logout();" id="logout" href="#">logout</a></li>
      </ul>
  </div>-->
</div>
                        
                        
                        
                        
                       <a href="#" onclick="sidehide();" id="sideh" class="navbar hidden-xs" >
                    
                      <i class="fa fa-chevron-circle-left fa-2x text-primary" style="padding-top:12px;padding-left:5px;" aria-hidden="true"></i>
                      </a>
                  	</div>
                  	<nav class="collapse navbar-collapse" role="navigation">
               
                    <ul class="nav navbar-nav">
                     <li>
                        <a href="home"><i class="glyphicon glyphicon-home"></i> Home</a>
                      </li>
                       			       
                        <?php if(!edit()){echo'<li class="mydark">
                        <a href="profile?un='.$usern.'"><span class="badge"><i class="glyphicon glyphicon-user"></i> My profile</span></a>
                      </li>';}?>

                    </ul>

                     <ul class="nav navbar-nav navbar-right">
						 
						<li class="dropdown" style="padding-right:10px;">
                        <a href="#" class="dropdown-toggle " data-toggle="dropdown"><i class="fa fa-sign-out" style="font-size:1.5em;"aria-hidden="true"></i></a>
                        <ul class="dropdown-menu">
                             
                          <li><a onclick="logout();" id="logout" href="#">logout</a></li>
                        </ul>
                      </li>
                    </ul>
                  	</nav>
                </div>
                <!-- /top nav -->
              
                
                    <div  id="blackback"class="full col-sm-9">
                      
                        <!-- content -->                      
                      	<div id="desk" class="row ">
                         <input type="hidden" value="<?php print $uid;?>" id="uid">
 <!-- main col left --> 
                         <div class="col-sm-5">
                           
                              <div class="panel panel-default well">
                                  <?php			$ui=cleankar($_GET['un']);
$sql=mysql_query("select mem_id from member where username='$ui'");
$query=mysql_fetch_row($sql);
$uid=$query[0];
		$usern=$_SESSION['SESS_USERNAME'];
                
                $qry91="select picture from member WHERE mem_id='$uid' ";
                $result91=mysql_query($qry91);
                $row91 = mysql_fetch_row($result91);
                		
							

                               echo' <div class="panel-thumbnail" style="padding-bottom:0px;background:url('.$row91[0].') center no-repeat; background-size:contain;background-color:#dadada; height:35vh;">
								';
                               if(edit()){echo'<a  href="#statusModal" role="button" data-toggle="modal" class="overbub"  > <code>'.$statusw.'</code></a>';}
 else {echo'<a  href="#" role="button" class="overbub"  > <code>'.$statusw.'</code></a>';}
echo'</div>';?>
                                <div class="panel-body">
                                  <p class="lead text-primary text-center"><?php echo $fullnw; ?></p>
                                  <p class="bg-primary text-center" style="padding:4px;"> <span style="font-size:1.2em;"><?php echo "$".$usernw; ?></span> </p>
                                  
                                 <?php
                                  
                                  $show_tags=array();
          $mes=mysql_query("SELECT tag_list.tag_name
FROM tag_list
INNER JOIN skill_tag  where tag_list.tagl_id=skill_tag.tagl_id
and skill_tag.mem_id='$uid'");
                   if($mes){ while($reso=mysql_fetch_row($mes)){
                        array_push($show_tags,$reso[0]); 
                   }
                  // echo implode(',',$show_tags);
                   }
                   
                   if(empty($show_tags)){
                       echo' <div role="button" href="#skillModal" role="button"  data-toggle="modal" >
                                      <ul class="tagging_ul responsive text-center" style="background-color: #dadada;border-color:silver; ">
                                          <li class="tagging_tag txtblr">___________</li>
                                          <li class="tagging_tag txtblr">_______</li>
                                          <li class="tagging_tag txtblr">____</li>
                                          <li class="tagging_tag txtblr">_____</li>
                                          <li class="tagging_tag txtblr">___</li>
                                          <li class="tagging_tag txtblr">_____</li>
                                          <li class="tagging_tag txtblr">_________</li>
                                      </ul>
                                  </div>';
                       
                   }else{
                       echo'<div role="button" href="#skillModal" role="button"  data-toggle="modal" >
                                      <ul class="tagging_ul responsive text-center" style="background-color: #dadada;border-color:silver; ">';
                       foreach($show_tags as $tempout){
                           echo'<li class="tagging_tag ">'.$tempout.'</li>';
                       }
                       echo'</ul>
                                  </div>';
                       
                   }
                                  
                                  
                                  
                                  
                                  ?>
                                  
                                  
                                  
                                  
                                 
                                  
                                 <?php 
                                 if(edit()){
                                      echo'<ul class="list-group" style="margin-bottom:0;" >
										
										<li class="list-group-item"><i class="fa fa-home  " style="font-size:2em;color:#2C3E50" aria-hidden="true"></i> <span class="text-primary heavyt" > From :</span> (approximate)<input    value="'.$from_placew.'" id="from_place" name="from_place" class="form-control input-sm inputbak " placeholder="Kanpur,UP...."></input></li>
										<li class="list-group-item"><i class="fa fa-map-marker " style="font-size:2em;color:#2C3E50" aria-hidden="true"></i> <span class="text-primary heavyt"> Currently living at :</span> (approximate)<input  value="'.$lives_atw.'"  id="lives_at" name="lives_at" class="form-control input-sm inputbak" placeholder="Karol Bagh,New delhi...."></input></li>
                                                                                  
                                   
                                    </ul>';
                                 }
                                 else
                                 {echo' <ul class="list-group "style="margin-bottom:0;" >

										<li class="list-group-item  ubuntu  "><i class="fa fa-home "style="font-size:2em;color:#2C3E50" aria-hidden="true"></i> <span class="text-primary heavyt ">  From : </span> '.$from_placew.' </li>
										<li class="list-group-item  ubuntu "><i class="fa fa-map-marker "style="font-size:2em;color:#2C3E50" aria-hidden="true"></i> <span class="text-primary heavyt ">  Currently living at : </span> '.$lives_atw.' </li>
                                   
                                 </ul>';}
                                 ?>
                                </div>
                            
                                  
                              </div>
                             

							 
							  
                           
							 
                             
                           
                           
                             

                           		
                           
                          </div>
                          
                          <!-- main col right -->
                          <div class="col-sm-7">
                               
                                <?php 
                                
                                
                                
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
                                     $lh_res= lh($uid,$mem_id);       ?>
							  
							   <div class="panel panel-default">
                                <!--<div class="panel-heading"><h4></h4></div>-->
                               	<div class="panel-body">
								  <ul class="list-group diska">
									  
									  
                                                                      <li class="list-group-item lead ubuntu"> <i class="fa  fa-2x text-success fa-smile-o" aria-hidden="true"></i> <?php echo $followersw; ?> likers  <?php if( !edit() && ($lh_res==1||$lh_res==0)){echo'<button type="button"  onclick="sendrequest(1);" style="border-radius:35px;" class="makar1 btn pull-right text-primary btn-success  btn-xs"><i class="fa fa-2x fa-smile-o" aria-hidden="true"></i> <i class="fa  fa-plus-circle" aria-hidden="true"></i> </button>';}?> <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"   aria-valuemin="0" aria-valuemax="1000" style="width: <?php echo $followersw/10;?>%">
    <span class="sr-only"></span>
  </div>
</div>
								  </li>
                                                                    <li class="list-group-item lead ubuntu"> <i class="fa fa-2x  text-danger fa-frown-o" aria-hidden="true"></i> <?php echo $followw; ?> haters <?php if(!edit() && ($lh_res==2 ||$lh_res==0) ){echo'<button type="button" onclick="sendrequest(2);" style="border-radius:35px;" class="makar2 btn pull-right text-primary btn-danger  btn-xs"><i class="fa fa-2x fa-frown-o" aria-hidden="true"></i> <i class="fa  fa-plus-circle" aria-hidden="true"></i> </button>';}?> <div class="progress">
  <div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"  aria-valuemin="0" aria-valuemax="1000" style="width: <?php echo $followw/10;?>%">
    <span class="sr-only"></span>
  </div>
</div>
								  </li>
							 <li class="list-group-item lead  ubuntu"> <?php echo $viewsw; ?> views  <div class="progress">
  <div class="progress-bar progress-bar-info progress-bar-striped active" role="progressbar"   aria-valuemin="0" aria-valuemax="8000" style="width: <?php echo $viewsw/80;?>%">
    <span class="sr-only"></span>
  </div>
</div>
								  </li>
                                                                  <li class="list-group-item lead  ubuntu"> <?php echo $shouts; ?> shouts <div class="progress">
  <div class="progress-bar progress-bar-primary progress-bar-striped active" role="progressbar"   aria-valuemin="0" aria-valuemax="8000" style="width: <?php echo $shouts/20;?>%">
    <span class="sr-only"></span>
  </div>
</div>
                  </li>
                                   
                                    </ul>
								  
								  </div>
						</div>
                      
                               
                          
							
                            <?php  echo'<div class="panel panel-default">
                                 
                                  <div class="panel-body">
                                    <ul class="list-group">';
                                                          if($mem_mode==1){echo'<a class="list-group-item patte ubuntu" title="Branch-'.$mem_section_part[0].' &#013; Section-'.$mem_section_part[1].' &#013; Year-'.$mem_section_part[2].'" href="channel?tn='.$mem_section.'" style="background-color:#8784ff;color:#efefef;font-size:0.80em;"><span> <i class="fa fa-graduation-cap fa-2x" aria-hidden="true"><span class="ubuntu"> '.$mem_section.' </span></i></span> <span class="pull-right" style="font-size:1.1em;"><i class="fa fa-book" aria-hidden="true"></i> '.$mem_course.' </span></a>';}
	if(($mem_mode==1 && $_SESSION['SESS_MODE']==2) || ($mem_id==$n2row[2]))	{echo'<a class="list-group-item  patte ubuntu" target="_blank"href="https://api.whatsapp.com/send?text=hey%20'.$fullnw.'($'.$ui.')&phone=+91'.$mem_mobile.'" style="background-color:#25d366;color:white;"><span > <i class="fa fa-whatsapp fa-2x " aria-hidden="true"></i>  </span> Whatsapp chat<span class="pull-right ubuntu" style="font-size:1.1em;"> <i class="fa fa-mobile" aria-hidden="true"></i> '.$mem_mobile.'</span></a>
                                                                                ';}
                                                         if(($mem_mode==1 && $_SESSION['SESS_MODE']==2) || ($mem_id==$n2row[2]&& $mem_mode!=2)){
                                                            if($mem_ad_no!=null) echo'<li class="list-group-item patte ubuntu" style="font-size:1.2em;"><span class="text-primary"> <i class="fa fa-qrcode fa-2x" aria-hidden="true"></i>  </span> <span class="pull-right" style="font-size:0.9em;">'.$mem_ad_no.'</span></li>';
                                                         
                                                         else if($mem_roll_no!=null)
                                                             echo'<li class="list-group-item  patte ubuntu" style="font-size:1.2em;"><span class="text-primary"> <i class="fa fa-qrcode fa-2x" aria-hidden="true"></i>  </span> <span class="pull-right" style="font-size:0.9em;">'.$mem_roll_no.'</span></li>';
                                                         
                                                         }
                                                         
										echo'<a class="list-group-item  ubuntu patte" role="link" href="mailto:'.$emailw.'?subject=cpie%20chat&amp;body=Hey%20'.$fullnw.'($'.$ui.')" style="background-color:#f76a5c;color:#efefef;"><span > <i class="fa fa-envelope fa-2x" style="color:#efefef;"aria-hidden="true"></i></span> <span id="mail_to" class="pull-right" style="font-size:1.0em;">'.$emailw.' </span></a>
                                                                                <a onclick="copyToClipboard(\'#mail_to\')" target="_blank" href="https://hangouts.google.com/chat"class=" list-group-item patte ubuntu " style="background-color: rgb(44, 62, 80);color: #109c59;font-size:1.2em;text-align:center;"><img  src="https://ssl.gstatic.com/images/icons/material/product/1x/hangouts_32dp.png"/> Google hangout chat</a>
                                    </ul>
                                  </div>
                               </div>';?>      
                            
                             
                             
							  
                          </div>
                       </div><!--/row-->
                       
                         
						 
                       
                                                     
                          
                       
                      
                         
                      
                    </div><!-- /col-9 -->
                <!-- /padding -->
            </div>
            <!-- /main -->
          
        </div>
    </div>
</div>
            
    

 
           
  <?php  if(edit()){
 echo '<!-- status Modal -->
<div id="statusModal" class="modal fade" role="dialog">
	
  <div class="modal-dialog ">

    <!-- Modal content-->
    <div class="modal-content " style="overflow:hidden;background:transparent;    text-align: -webkit-center;">
     
     
                             <div class="well"> 
                                   <form class="form-horizontal" role="form">
                                    <span class="btn-block bg-primary ubuntu"style="font-size:1.2em;padding:3px;" > &nbsp; <i class="fa fa-meh-o"style="font-weight:bold;color:white;" aria-hidden="true"></i> My Status </span>
                                     <div class="form-group" style="padding:0;margin:0;">
                                      <textarea  id="status"  maxlength="140" name="status" onblur="validate(this.name,this.value);" class="form-control textareabak" placeholder="Update your status...."> '.$statusw.' </textarea>
                                    </div>
                                    
                                  </form>
                                 
                                </div> 
     
   

  </div>
  </div></div>

 <!-- status modal_over  -->
 ';}
 ?>
 
    
 <?php 
 
 if(edit()){
 echo '<!-- skilltag Modal -->
<div id="skillModal" class="modal fade" role="dialog">
	
  <div class="modal-dialog ">

    <!-- Modal content-->
    <div class="modal-content " style="overflow:hidden;background:transparent;    ">
     
     <div class="panel panel-default">
                                
                                  <div class="panel-body">
                                  <label for="skill_tagy" class="text-info postmf">&nbsp;&nbsp;<i class="fa fa-pencil-square-o text-primary fa-2x" aria-hidden="true"></i> <span class="text-primary heavyt"> Interested in :</span></label> 
        <input id="skill_tagy" class="tags-input"  value="'; 
          
              
 echo implode(',',$show_tags);
 
 
 
          
                   echo'"  data-max-tags="8">
                       
<button type="button"  id="tagy_show_but" onclick="skilltags();" class="btn-primary ubuntu btn-block" style="padding:3px;">Update Tags</button>

                       <br><div id="tagy_show_res"></div>
        
        
                                    
                                  </div>
                               </div>
                             
   

  </div>
  </div></div>

 <!-- skilltag modal_over  -->
 ';}
 ?>
 
 



	<!-- script references -->
		
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>
               

                <script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>
<script src="js/typeahead.tagging.js"></script>	

<script>
    
        
      <?php
         
      $mod=$_SESSION['SESS_MODE'];
      $tags= array();
        $sqm=mysql_query("select tag_name from broadcast_tags where mode=0 or mode='$mod'");
        while($runop=  mysql_fetch_row($sqm))
        {array_push($tags,$runop[0]);   
        }  
          $tags=json_encode($tags);
          echo'var tagsource='.$tags;
       
        
       
        
        ?>

       var skill_tagsource="";
       
       
       
  
    $('#skill_tagy').tagging(tagsource);
   
              $( window ).load(function() {
    //console.log( "ready!" );
    $("body").css("filter","none");
});
        </script>
       
       <?php if(edit()){echo'
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBXbGW1zlIYVp84QbxHUL_V5md0cqlSmpk&libraries=places"></script>
<script type="text/javascript">
    var autocomplete,autocomplete2;
    var place_id1,place_id2;
    function initialize() {

var input = document.getElementById(\'lives_at\');
var options = {
  
  componentRestrictions: {country: \'In\'}
};
autocomplete = new google.maps.places.Autocomplete(input,options);
 autocomplete.addListener(\'place_changed\', pop_place_info);
 

var options2 = {
  
  componentRestrictions: {country: \'In\'}
};
var inputfrom = document.getElementById(\'from_place\');
 autocomplete2 = new google.maps.places.Autocomplete(inputfrom,options2);
autocomplete2.addListener(\'place_changed\', pop_place_info2);
}
  function pop_place_info(){
      var place=autocomplete.getPlace();
      place_id1=place.place_id;
      //console.log(place_id1);
      validate("lives_at",$("#lives_at").val(),place_id1);
  }
function pop_place_info2(){
      var place=autocomplete2.getPlace();
      place_id2=place.place_id;
      //console.log(place_id2);
      validate("from_place",$("#from_place").val(),place_id2);
  }


google.maps.event.addDomListener(window, \'load\', initialize);
</script>';}
	
        ?>
        
        </body>
</html>



		






























