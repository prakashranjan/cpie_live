<?php
	require_once('auth.php');
 include("connection.php");	
	
	        $usern=$_SESSION['SESS_USERNAME'];
                $mem_id=$_SESSION['SESS_MEMBER_ID'];
	        $firstn=$_SESSION['SESS_FIRST_NAME'];
			$lastn=$_SESSION['SESS_LAST_NAME'];
			$fulln=$firstn." ".$lastn;
			$gender=$_SESSION['SESS_GENDER'];
			$gender= strtolower($gender);
 
$ui=$_GET['un'];
$sql=mysql_query("select mem_id from member where username='$ui'");
$query=mysql_fetch_row($sql);
$uid=$query[0];
if(!is_numeric($uid)){
     header("location: home");
			exit();
}


function edit() {   
	$usern=$_SESSION['SESS_USERNAME'];
                
$ui=$_GET['un'];
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
                <meta name="theme-color" content="#2c3e50">
                <link rel="manifest" href="manifest.json">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		
		<link href="css/styles.css" rel="stylesheet">
		<link href="css/font-awesome.min.css" rel="stylesheet">
	
		
		
		
		<style type="text/css">
			
			 
			/*@media (min-width: 768px) {
    /* some CSS for large resolution */

			#main{  
  background: url("images/c7.jpg") no-repeat center center fixed; 
}
                        /*}*/
		
		

 

			
			
		</style>
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
            echo'<link href="css/dropzone.css" type="text/css" rel="stylesheet" />
 
<!-- 2 -->
<script src="js/dropzone.js"></script>
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
$ui=$_GET['un'];
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
$long_discw=$n2row[13];
$emailw=$n2row[14];
$mem_mobile=$n2row[15];
$mem_mode=$n2row[16];
if($mem_mode==1){
$n2qry="select ad_no,(select course_short from course where course_id=stud_member.course_id),(select category from section where section_id=stud_member.section_id) from stud_member WHERE mem_id='$uid'";
                $n2result=mysql_query($n2qry);
                $myrow = mysql_fetch_row($n2result);
                $mem_ad_no=$myrow[0];
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
               echo' <li ><a class="btn btn-sm" id="profilepicture"  style="padding-bottom:0px;background:url('.$n2row[0].') center no-repeat;background-size:contain;background-color:#000;height:30vh;">';
				
	$metr=mysql_query("select count(image_id) from testblob where username='$usernw'");
       if(mysql_num_rows($metr)) {$metro=mysql_fetch_row($metr);
 

$shouts=$metro[0];
}

					 ?>
					</a></li>
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
                     <?php  if(edit()){echo'     
                           <div class="btn-group bg-warning" role="group"id="pfile2r">
    <button type="button" id="pfile2" class="btn btn-warning " href="#" onclick="chan(this.id);" ><i class="fa fa-user getora" ></i></button>
  </div>
                            <div class="btn-group" role="group" id="wll2r">
    <button type="button" id="wll2" class="btn btn-success " href="#" onclick="chan(this.id);" ><i class="fa fa-table getora" ></i></button>
  </div>
   <div class="btn-group"style="display:none;" role="group" id="loud_shout2">
    <button type="button"  class="btn btn-success" href="#postModal" role="button" data-toggle="modal" ><i class="fa fa-wifi getora" aria-hidden="true"></i></button>
  </div>
                          ';}
                         else {echo'<div class="btn-group simple" role="group">
                        <button type="button" class="btn simple" ><a href="profile?un='.$usern.'" style="color:white;"><i class="glyphicon glyphicon-user"></i></a></button>
                      </div>
                       

';
                         
                         
                         
                         }
                          
                          
                          ?>
                           
  <div class="btn-group" role="group">
      <a href="#" class="btn btn-success dropdown-toggle getora" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-sign-out" aria-hidden="true"></i><span class="caret"></span> </a>
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
                     <li>
                        <a href="home"><i class="glyphicon glyphicon-home"></i> Home</a>
                      </li>
                       			       
                        <?php if(!edit()){echo'<li class="mydark">
                        <a href="profile?un='.$usern.'"><span class="badge"><i class="glyphicon glyphicon-user"></i> My profile</span></a>
                      </li>';}?>

 <?php  if(edit()){ 
                     echo' <li class="nav-item">
    <a id="pfile" onclick="chan(this.id);" class="nav-link bg-warning active ubuntu fa-lg" href="#"> <i class="fa fa-user fa-lg " aria-hidden="true"></i> Profile</a>
  </li>
  <li class="nav-item" style="background-color:#2c3e50;">
    <a id="wll" onclick="chan(this.id);" class="nav-link ubuntu fa-lg" href="#"><i class="fa fa-table fa-lg" aria-hidden="true"></i> Wall &nbsp;<span class="badge pull-right" style="background-color:#2c3e50;"  ><div  class="wall_led led-yellow-off"></div></span></a>
  </li>
                      <li style="display:none;" id="loud_shout">
                        <a href="#postModal" role="button" class="fa-lg ubuntu bg-primary"data-toggle="modal"><i class="fa fa-wifi fa-lg" aria-hidden="true"></i> Loud Shout <i class="fa fa-wifi fa-lg fa-flip-horizontal" aria-hidden="true"></i></a>
                      </li>';
					  }?>
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
                                  <?php			$ui=$_GET['un'];
$sql=mysql_query("select mem_id from member where username='$ui'");
$query=mysql_fetch_row($sql);
$uid=$query[0];
		$usern=$_SESSION['SESS_USERNAME'];
                
                $qry91="select picture from member WHERE mem_id='$uid' ";
                $result91=mysql_query($qry91);
                $row91 = mysql_fetch_row($result91);
                		
							

                               echo' <div class="panel-thumbnail" style="padding-bottom:0px;background:url('.$row91[0].') center no-repeat; background-size:contain;background-color:#000; height:35vh;">
								</div>';?>
                                <div class="panel-body">
                                  <p class="lead text-primary"><?php echo $fullnw; ?></p>
                                  <p style="background-color:black;padding:4px;"> <span style="font-size:1.2em;"><?php echo "$".$usernw; ?></span> </p>
                                  
                                  
                                </div>
                              </div>

							 <?php  echo'<div class="panel panel-default">
                                 
                                  <div class="panel-body">
                                    <ul class="list-group">';
                                                          if($mem_mode==1){echo'<a class="list-group-item  ubuntu" title="Branch-'.$mem_section_part[0].' &#013; Section-'.$mem_section_part[1].' &#013; Year-'.$mem_section_part[2].'" href="channel?tn='.$mem_section.'" style="background-color:rgba(0,0,0,0.95);color:#9aea21;font-size:0.80em;"><span> <i class="fa fa-graduation-cap fa-2x" aria-hidden="true"><span class="ubuntu"> '.$mem_section.' </span></i></span> <span class="pull-right" style="font-size:1.1em;"><i class="fa fa-book" aria-hidden="true"></i> '.$mem_course.' </span></a>';}
	if(($mem_mode==1 && $_SESSION['SESS_MODE']==2) || ($mem_id==$n2row[2]))	{echo'<a class="list-group-item   ubuntu" target="_blank"href="https://api.whatsapp.com/send?text=hey%20'.$fullnw.'($'.$ui.')&phone=+91'.$mem_mobile.'" style="background-color:#25d366;color:white;"><span > <i class="fa fa-whatsapp fa-2x " aria-hidden="true"></i>  </span> Whatsapp chat<span class="pull-right ubuntu" style="font-size:1.1em;"> <i class="fa fa-mobile" aria-hidden="true"></i> '.$mem_mobile.'</span></a>
                                                                                ';}
                                                         if(($mem_mode==1 && $_SESSION['SESS_MODE']==2) || ($mem_id==$n2row[2]&& $mem_mode!=2)){echo'<li class="list-group-item  ubuntu" style="font-size:1.2em;"><span class="text-primary"> <i class="fa fa-qrcode fa-2x" aria-hidden="true"></i>  </span> <span class="pull-right" style="font-size:0.9em;">'.$mem_ad_no.'</span></li>';}
										echo'<a class="list-group-item  ubuntu " role="link" href="mailto:'.$emailw.'?subject=cpie%20chat&amp;body=Hey%20'.$fullnw.'($'.$ui.')" style="background-color:rgba(0,0,0,0.75);color:#9aea21;"><span > <i class="fa fa-envelope fa-2x" style="color:#9aea21;"aria-hidden="true"></i> <sup><i class="fa fa-share fa-2x" aria-hidden="true"></i></sup>  </span> <span id="mail_to" class="pull-right" style="font-size:1.0em;">'.$emailw.' </span></a>
                                                                                <a onclick="copyToClipboard(\'#mail_to\')" target="_blank" href="https://hangouts.google.com/chat"class=" btn  btn-primary btn-block ubuntu " style="background-color:rgba(0,0,0,0.95);color:#9aea21;font-size:1.2em;"><img  src="http://ssl.gstatic.com/images/icons/material/product/1x/hangouts_32dp.png"/> Google hangout chat</a>
                                    </ul>
                                  </div>
                               </div>';?>
							  
                           
							 
                             
                           
                           
                             

                           		
                           
                          </div>
                          
                          <!-- main col right -->
                          <div class="col-sm-7">
                               
                                <?php if(edit()){
                             echo'<div class="well"> 
                                   <form class="form-horizontal" role="form">
                                    <span class="btn-block ubuntu"style="font-size:1.2em;padding:3px;background-color:black;" > &nbsp; <i class="fa fa-meh-o"style="font-weight:bold;" aria-hidden="true"></i> My Status </span>
                                     <div class="form-group" style="padding:14px;">
                                      <textarea  id="status"  maxlength="140" name="status" onblur="validate(this.name,this.value);" class="form-control" placeholder="Update your status...."> '.$statusw.' </textarea>
                                    </div>
                                    
                                  </form>
                                 
                                </div>';} 
                                
                                
                                
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
                      
                               <div class="panel panel-default">
                                 <div class="panel-heading"><a href="#" class="pull-right"></a> <h4> Status </h4></div>
                                  <div class="panel-body">
                                    <p> <code><?php echo $statusw ;?></code></p>
                                    <div class="clearfix"></div>
								   </div>
                               </div>
                             <?php if(edit())
                               echo'<div class="panel panel-default">
                                 <div class="panel-heading"><a href="#" class="pull-right"></a> <h4 >About '.$firstnw.'</h4></div>
                                  <div class="panel-body">
                                    
                                    <div class="clearfix"></div>
                                    
                                    
                                    <textarea row="6" maxlength="255" style="height:160px;" id="long_disc" name="long_disc"  onblur="validate(this.name,this.value);"class="form-control " style="color:#2c3e50;"placeholder="tell me something about yourself...."> '.$long_discw.' </textarea>                                    
                                    
                                    <form>
                                  
                                    
                                  </div>
                               </div>';
							  
							  else{
							  echo'<div class="panel panel-default">
                                 <div class="panel-heading"><a href="#" class="pull-right"></a> <h4 >About '.$firstnw.'</h4></div>
                                  <div class="panel-body">
                                    
                                    <div class="clearfix"></div>
                                    
                                    
                                    <p class=" ubuntu " style="color:#2c3e50;    text-shadow: 0px 0px 10px #ffffff;"> '.$long_discw.' </p>
                                    
                                    
                                    <form>
                                  
                                    
                                  </div>
                               </div>';}
							  ?>
							  
							<?php if(edit())
								echo'<div class="panel panel-default">
                                
                                  <div class="panel-body">
                                    <ul class="list-group">
										<li class="list-group-item"><span class="text-primary"><i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i> Skills :</span> <input  value="'.$skillsw.'" id="skills" name="skills" onblur="validate(this.name,this.value);"class="form-control " placeholder="skill1,skill2....."></input></li>
										<li class="list-group-item"><span class="text-primary"><i class="fa fa-home fa-2x" aria-hidden="true"></i> from :</span> <input    value="'.$from_placew.'" id="from_place" name="from_place" onblur="validate(this.name,this.value);"class="form-control " placeholder="Kanpur,UP...."></input></li>
										<li class="list-group-item"><span class="text-primary"><i class="fa fa-map-marker fa-2x" aria-hidden="true"></i> lives at :</span> <input  value="'.$lives_atw.'"  id="lives_at" name="lives_at" onblur="validate(this.name,this.value);"class="form-control " placeholder="Karol Bagh,New delhi...."></input></li>
                                   
                                    </ul>
                                  </div>
                               </div>
                             ';

else{
echo'<div class="panel panel-default">
                                  <div class="panel-body">
                                    <ul class="list-group">
										<li class="list-group-item ubuntu"><span class="text-primary"> <i class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i> Skills : </span> '.$skillsw.' </li>
										<li class="list-group-item  ubuntu"><span class="text-primary"> <i class="fa fa-home fa-2x" aria-hidden="true"></i> from : </span> '.$from_placew.' </li>
										<li class="list-group-item  ubuntu"><span class="text-primary"> <i class="fa fa-map-marker fa-2x" aria-hidden="true"></i> lives at : </span> '.$lives_atw.' </li>
                                   
                                    </ul>
                                  </div>
                               </div>';
}


?>

                              
                            
                             
                             
							  
                          </div>
                       </div><!--/row-->
                       <?php
                       if(edit()){
                            $gmat=mysql_query("select category_name,category_id,category_desc from priority order by category_id ");
                 
                             $tanto=1;  
                             $wid=array();
                           
                           echo'<div class="panel" id="wall_tab" style="display:none;margin-bottom:0px;border-color:#8784ff;opacity:0.9;">
                      
<b>
<ul class="nav nav-pills text-center "style="background-color:#8784ff;width:100%;" >
                 <li><a style="color:#a19ff7;background-color:#2c3e50;"><i class="fa fa-table" aria-hidden="true"></i> WALL </a></li>';
                while($gmatr=mysql_fetch_row($gmat)){    
  if($tanto==1){echo'<li class="active"><a data-toggle="pill" href="#" title="'.$gmatr[2].'" onclick="refer('.$gmatr[1].')">'.$gmatr[0].'</a></li>';}
  else{echo'<li><a data-toggle="pill" href="#" title="'.$gmatr[2].'" onclick="refer('.$gmatr[1].')">'.$gmatr[0].'</a></li>';}
   
  $tanto++;
            array_push($wid,$gmatr[1]);    }
 echo'     
</ul>

</b>


    </div>
    <br>';
 
 foreach ($wid as $value) {
      echo'<div id="wallcat'.$value.'" style="display:none;"></div>';
 }
                echo'<div id="wall_desk" name="wallcat1" class="row"></div>';
                       }
                       ?>
                         
						 
                       
                                                     
                          
                       
                      
                         <div class="row" style="text-align:right;" >
                          
							              <div class="col-xs-8 col-sm-7">
                            <a href="#" id="loadmore"onmouseover="refer_next();" style="display:none;"class="btn btn-default  "><i class="fa fa-arrow-down" aria-hidden="true"></i> Older <i class="fa fa-arrow-down" aria-hidden="true"></i></a>
                       
                           
						               </div> 
                        </div>
                      
                        
                      
                    </div><!-- /col-9 -->
                <!-- /padding -->
            </div>
            <!-- /main -->
          
        </div>
    </div>
</div>
            
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
                            <button class="btn btn-success btn-md " onclick="save_comment();" type="button" id="comment_button">
                                <i class="fa fa-chevron-circle-right" aria-hidden="true"></i> </button>
                        </span>
                    </div>
                
        <!--<button type="button" class="btn btn-default">Older</button>-->
      </div>
    </div>

  </div>
</div>

 <!-- comment modal_over  -->






<!--post modal-->
<?php if(edit()){echo'
<div id="postModal" class="modal fade" tabindex="-1" >
  <div class="modal-dialog modal-lg">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			
      </div>
	  <div class="modal-body">
        <div class="tabbable"> <!-- Only required for left/right tabs -->
        <ul class="nav nav-tabs fa-lg postmf">
        <li class="active "><a href="#tab1" onclick="moveform(1);" data-toggle="tab"><i class="fa fa-lg fa-comment" aria-hidden="true"></i> Chat</a></li>
        <li><a href="#tab2" onclick="moveform(2);"data-toggle="tab"><i class="fa fa-paperclip fa-lg" aria-hidden="true"></i> Media</a></li>
    <li ><a href="#tab3" onclick="moveform(3);" data-toggle="tab"><i class="fa fa-bar-chart fa-lg" aria-hidden="true"></i> Poll</a></li>
        </ul>
        <div class="tab-content">
        <div class="tab-pane active" id="tab1">
            <form class="form center-block"  enctype="multipart/form-data" >
            <div class="form-group">
              <textarea rows="4" cols="100%" style="background-color:antiquewhite;" class="form-control input-lg" maxlength="2000" name="cap" id="cap" placeholder="What do you want to shout Loud?"></textarea>
              <div id="moveform"><br>
             <label for="tagy" class="text-info postmf">&nbsp;&nbsp; <i class="fa fa-tags fa-2x" aria-hidden="true"></i> tags </label> 
        <input id="tagy" class="tags-input"  value="" data-max-tags="8">
        
  <form class="navbar-form" >
                        <div class="input-group input-group-sm " >
                          <input type="text" class="form-control ubuntu " onkeyup="searchuser(this.id);" size="100" placeholder="$username or name"  id="termmob" >
                          <div class="input-group-btn">
                            <button class="btn btn-primary" onclick="searchuser(\'termmob\');" type="button"><i class="glyphicon glyphicon-search"></i></button>
                          </div>
                        </div>
      </form>
          <div class="row">
              <div id="search_members"></div></div>
               <hr />
              <div class="row">
             
              <div id="members_all" style="background-color:#faebd7;">
                 
              </div>
            
             
              
          </div>
 <input type="hidden"  id="hide_u_ids">
        <div class="form-group">
      <label for="catin"> &nbsp;<i class="glyphicon glyphicon-th-list"></i> Category</label>
      <select class="form-control" id="catin">';
      
       $gmat=mysql_query("select category_name,category_id from priority order by category_id ");
       while($gmatu=mysql_fetch_row($gmat)){
           
           echo' <option value="catin'.$gmatu[1].'">'.$gmatu[0].'</option>';
       }          
       echo'
      </select>
        </div>
             
              </div>
              <div id="tab1com"></div>
              <div class="checkbox text-center fa-lg postmf">
    <label>
       <input class="fa-2x pull right " name="anon" id="anon" type="checkbox" value="1" > <i class="fa fa-user-secret fa-lg" aria-hidden="true"></i> hide identity
    </label>
              </div>
			 <div id="respo"></div>
            </div>
				 <div class="modal-footer">
          <div>
              <button id="grabcap" onclick="multi();" type="button" class="btn   btn-block postmf" style="    background-color: powderblue;"><i class="fa fa-wifi text-primary fa-3x"></i> <span class="lead">Loud Shout</span> <i class="fa fa-wifi text-primary fa-3x fa-flip-horizontal"></i></button>
            
		 </div>
		  
		  </form>
          
      </div>
			
        </div>
        <div class="tab-pane" id="tab2">
        	 <form method="POST"   id="broadcastdocupload" action="broadcast_ajax/broadcast_uploadmera.php"  class="dropzone" enctype="multipart/form-data" >
           <div class="form-group">
              <textarea rows="4" cols="100%"class="form-control input-lg" style="background-color:antiquewhite;" name="cap2" maxlength="2000"  id="cap2" placeholder="Enter caption..."></textarea>
              <div id="tab2com"></div>
              <div class=" text-center fa-lg postmf">
    <label>
       <input class="fa-2x pull right " name="anon2" id="anon2" type="checkbox" value="1" > <i class="fa fa-user-secret fa-lg" aria-hidden="true"></i> hide identity
    </label>
              </div>
              <div id="respo"></div>
            </div>
                     
		  </form>
          
      
			
        </div>
	 <div class="tab-pane" id="tab3">
            <form class="form center-block" enctype="multipart/form-data" >
            <div class="form-group">
                <textarea rows="3" cols="100%"class="form-control input-lg text-danger" style="background-color:antiquewhite;" name="cap3" maxlength="1000" id="cap3" placeholder="Ask something..."required="give poll question.."></textarea>
			
                         
                         <!-- poll options -->
                        <ul style="list-style:none;    -webkit-padding-start: 0px;"id="append_li" >
                            <li style="padding-bottom:3px;" ><input type="text" class="form-control input-sm text-success text-center" name="opt1" maxlength="60" id="opt1" placeholder="+ option 1"required/></li>
                            <li style="padding-bottom:3px;"><input type="text" class="form-control input-sm text-success text-center" name="opt2" maxlength="60" id="opt2" placeholder="+ option 2"required/></li>
                            <li style="padding-bottom:3px;"><input type="text" class="form-control input-sm text-success text-center" name="opt3" maxlength="60" id="opt3" placeholder="+ option 3"/></li>
                              <li style="padding-bottom:3px;"><input type="text" class="form-control input-sm text-success text-center" name="opt4" maxlength="60" id="opt4" placeholder="+ option 4"/></li>
                      
                                          
                        </ul>
                         <li class="text-center" style="list-style:none;"><button type="button" id="add_opt_button" onclick="add_opt();" class=" btn-muted btn-xs "> + </button></li>  
                         
        
            </div>
                <div id="tab3com"></div>
                <div class=" text-center fa-lg postmf">
    <label>
       <input class="fa-2x pull right " name="anon3" id="anon3" type="checkbox" value="1" > <i class="fa fa-user-secret fa-lg" aria-hidden="true"></i> hide identity
    </label>
              </div>
                 <div id="respo3"></div>
				 <div class="modal-footer">
         
                                     <button id="post_poll"name="post_poll" onclick="savepoll();" type="button" class="btn btn-block postmf" style="    background-color: powderblue;" ><i class="fa fa-wifi text-primary fa-3x"></i> <span class="lead">Loud Shout</span> <i class="fa fa-wifi text-primary fa-3x fa-flip-horizontal"></i></button>
         
        
                                 </div>
                  
		  
		  </form>
          
      
			
        </div>
        </div>
        </div></div></div></div></div>


';}?>




	<!-- script references -->
		
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>
               

                <script src="http://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.4/typeahead.bundle.min.js"></script>
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

       
       $('#tagy').tagging(tagsource); 
                  $( window ).load(function() {
    console.log( "ready!" );
    $("body").css("filter","none");
});
        </script>
        <?php 
       if(edit()){echo'<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBXbGW1zlIYVp84QbxHUL_V5md0cqlSmpk&libraries=places"></script>
<script type="text/javascript">
    function initialize() {

var input = document.getElementById(\'lives_at\');
var autocomplete = new google.maps.places.Autocomplete(input);

var inputfrom = document.getElementById(\'from_place\');
var autocomplete2 = new google.maps.places.Autocomplete(inputfrom);

}

google.maps.event.addDomListener(window, \'load\', initialize);
</script>
';}?>
	</body>
</html>



		