
<?php
	require_once('auth.php');
include("connection.php");
include("vcommon.php");


$session=session_id();
$fav_led="-off";
$class_led="-off";
$wall_led="-off";
$bar_led="-off";
	
	        $usern=$_SESSION['SESS_USERNAME'];
	        $firstn=$_SESSION['SESS_FIRST_NAME'];
			$lastn=$_SESSION['SESS_LAST_NAME'];
			$fulln=$firstn." ".$lastn;
			$gender=$_SESSION['SESS_GENDER'];
			$gender= strtolower($gender);
			$memid=$_SESSION['SESS_MEMBER_ID'];
                        if($_SESSION['SESS_MODE']==1){
                        $sec_id=$_SESSION['SESS_SECTION'];
                        }
function getRealIpAddr()
{$usern=$_SESSION['SESS_USERNAME'];

    if (!empty($_SERVER['HTTP_CLIENT_IP']))   //check ip from share internet
    {
      $ip=$_SERVER['HTTP_CLIENT_IP'];
    }
    elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //to check ip is pass from proxy
    {
      $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
    }
    else
    {
      $ip=$_SERVER['REMOTE_ADDR'];
    }
    
    return $ip;
}


		

    function getBrowser()
{
    $u_agent = $_SERVER['HTTP_USER_AGENT'];
    $bname = 'Unknown';
    $platform = 'Unknown';
    $version= "";

    //First get the platform?
    if (preg_match('/linux/i', $u_agent)) {
        $platform = 'linux';
    }
    elseif (preg_match('/macintosh|mac os x/i', $u_agent)) {
        $platform = 'mac';
    }
    elseif (preg_match('/windows|win32/i', $u_agent)) {
        $platform = 'windows';
    }

    // Next get the name of the useragent yes seperately and for good reason
    if(preg_match('/MSIE/i',$u_agent) && !preg_match('/Opera/i',$u_agent))
    {
        $bname = 'Internet Explorer';
        $ub = "MSIE";
    }
    elseif(preg_match('/Firefox/i',$u_agent))
    {
        $bname = 'Mozilla Firefox';
        $ub = "Firefox";
    }
    elseif(preg_match('/Chrome/i',$u_agent))
    {
        $bname = 'Google Chrome';
        $ub = "Chrome";
    }
    elseif(preg_match('/Safari/i',$u_agent))
    {
        $bname = 'Apple Safari';
        $ub = "Safari";
    }
    elseif(preg_match('/Opera/i',$u_agent))
    {
        $bname = 'Opera';
        $ub = "Opera";
    }
    elseif(preg_match('/Netscape/i',$u_agent))
    {
        $bname = 'Netscape';
        $ub = "Netscape";
    }

    // finally get the correct version number
    $known = array('Version', $ub, 'other');
    $pattern = '#(?<browser>' . join('|', $known) .
    ')[/ ]+(?<version>[0-9.|a-zA-Z.]*)#';
    if (!preg_match_all($pattern, $u_agent, $matches)) {
        // we have no matching number just continue
    }

    // see how many we have
    $i = count($matches['browser']);
    if ($i != 1) {
        //we will have two since we are not using 'other' argument yet
        //see if version is before or after the name
        if (strripos($u_agent,"Version") < strripos($u_agent,$ub)){
            $version= $matches['version'][0];
        }
        else {
            $version= $matches['version'][1];
        }
    }
    else {
        $version= $matches['version'][0];
    }

    // check if we have a number
    if ($version==null || $version=="") {$version="?";}

    return array(
        'userAgent' => $u_agent,
        'name'      => $bname,
        'version'   => $version,
        'platform'  => $platform,
        'pattern'    => $pattern
    );
}

if($_SESSION['SESS_CDATA']==0){
$ip=getRealIpAddr();
$browser=getBrowser();

$browserver=$browser['version'];
$browserplat=$browser['platform'];
$browserpat=$browser['pattern'];

//$sql=mysql_query("update member set ip='$ip',browser='$browser[name]',browserplat='$browserplat' where username='$usern'");

$sql=mysql_query("insert into ip(user_id,ip,browser,browserver,browserplat,browserpat,session) values ('$memid','$ip','$browser[name]','$browserver','$browserplat','$browserpat','$session')");
  $_SESSION['SESS_CDATA']=1;

}

// for favourite notification----------------blinker led
// first check favourites empty hai kya?....
$smql=mysql_query("select count(fav_id) from favourites where username='$usern'");
if(mysql_num_rows($smql)==1){
    $fav_check_no=  mysql_fetch_row($smql);
if($fav_check_no[0]>0){
//first level
$qry=mysql_query("SELECT COUNT(image_id) FROM testblob WHERE category IN (select category from favourites where username='$usern') AND event > (select fav_log from member where mem_id='$memid')");
if(mysql_num_rows($qry)==1){
    
$fav_no=  mysql_fetch_row($qry);
if($fav_no[0]==0){
    //no fav_note
    //2nd level
   
    $qry2=mysql_query("SELECT COUNT(tes.image_id) FROM testblob as tes WHERE category IN (select category from favourites where username='$usern') AND event > (select pichla_view from favourites where category=tes.category and username='$usern')");
    $fav_no2=  mysql_fetch_row($qry2);
    if($fav_no2[0]==0){
        $fav_led="-off";
    }
    else if($fav_no2[0]>0){
        //switch on blinker
    $fav_led=" ";
    }
    
  
    
}else if($fav_no[0]>0){
    //switch on blinker
    $fav_led=" ";
}
}




}

}

//for class_led notification blinker
//first check usermode
if($_SESSION['SESS_MODE']==1){
    //first level
$qry=mysql_query("SELECT COUNT(image_id) FROM channel_post WHERE category = (select category from section where section_id='$sec_id') AND event > (select pichla_view from stud_member where mem_id='$memid')");
if(mysql_num_rows($qry)==1){
    
$class_no=  mysql_fetch_row($qry);
if($class_no[0]==0){
    //no fav_note
     $class_led="-off";
    
  
    
}else if($class_no[0]>0){
    //switch on blinker
    $class_led=" ";
    $bar_led=" ";
    
}

}


    
}
/*
//for wall_led notification blinker
//first check usermode

    //first level
$qry=mysql_query("SELECT COUNT(image_id) FROM channel_post WHERE category = (select category from section where section_id='$sec_id') AND event > (select pichla_view from stud_member where mem_id='$memid')");
if(mysql_num_rows($qry)==1){
    
$wall_no=  mysql_fetch_row($qry);
if($wall_no[0]==0){
    //no fav_note
     $wall_led="-off";
    
  
    
}else if($wall_no[0]>0){
    //switch on blinker
    $wall_led=" ";
    $bar_led=" ";
    
}

}

*/
    




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
		
                
		<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet">
                     <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
                
		<link href="css/commoncss.css" rel="stylesheet">
		<link href="css/homecss.css" rel="stylesheet">
	
		<script type="text/javascript" src="js/jquery.min.js"></script>
     
		<script type="text/javascript" src="js/logout.js"></script>
                
		
<!--<script src="js/ion.sound.js"></script> -->
                
                <script>  var tid=0;
           
        </script>
	<script src="js/dropzone.js"></script>
        <script src="js/commonjs.js"></script>
			<script type="text/javascript" src="js/homejs.js"></script>
			
	
		<link href="css/dropzone.css" type="text/css" rel="stylesheet" />
 
<!-- 2 --><link href="css/typeahead.tagging.css" rel="stylesheet">
<?php 
if($fav_check_no[0]>0){
    
    echo'<script>if(!($(".fav_led").hasClass("led-yellow"))){
setTimeout(function(){
  global_led("fav");
}, 30000);
}</script>';
    
}
if($_SESSION['SESS_MODE']==1){
    
    echo'<script>if(!($("#class_led").hasClass("led-yellow"))){
setTimeout(function(){
  global_led("class");
}, 30000);
}</script>';
    
}


    
    echo'<script>if(!($(".wall_led").hasClass("led-yellow"))){
setTimeout(function(){
  global_led("wall");
}, 30000);
}</script>';
    



?>


<link rel="manifest" href="/manifest.json" />
<script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async=""></script>
<script>
  var OneSignal = window.OneSignal || [];
  OneSignal.push(function() {
    OneSignal.init({
      appId: "eeabe40a-1825-46cc-a5a9-25b64d3ee104",
    });
  });
</script>
		
	</head>
	<body style="filter: blur(30px);-webkit-filter: blur(30px);">
            <?php include_once("analyticstracking.php") ?>
	
	<div class="wrapper">
    <div class="box">
        <div class="row row-offcanvas row-offcanvas-left">
                      
          
            <!-- sidebar -->
             <div id="mySidenav" class="sidenav visible-xs">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a><br>
          <div id="sideclone" class="column">        </div>
</div>
            
            
            
            <div class="column col-sm-2  hidden-xs " id="sidebar">
              
              	<?php
                $usern=$_SESSION['SESS_USERNAME'];
                $mem_id=$_SESSION['SESS_MEMBER_ID'];
                $n2qry="select picture,email from member WHERE username='$usern' ";
                $n2result=mysql_query($n2qry);
                $n2row = mysql_fetch_row($n2result);
                ?>
               
                <ul class="nav " id="lg-menu">
				     
				    <li ><a class="btn btn-sm dpwala" href="#profile_picModal" style="padding-bottom:0px;background:url(<?php echo $n2row[0] ?>) center no-repeat;background-size:contain;" role="button" data-toggle="modal" >
					
					</a></li>
                    <li  class="ubuntu"><a style="background:#18bc9c;"href="profile?un=<?php echo $usern; ?>"><i class="fa fa-<?php echo $gender;?> fa-2x"></i><span style="font-size: 1.3em;"> $<?php echo $usern ?></span> </a></li>
                                        
                   
                    
					<li><a onclick="mytopic();" href="#" title="my channels"> My channels <i class="fa fa-hand-peace-o fa-lg pull-right" aria-hidden="true"></i> </a></li>
					<li><a href=""> Refresh <i class="glyphicon glyphicon-refresh pull-right"></i> </a></li>
            
                        
               <li  class="ubuntu"><a style="background:#18bc9c;"href="shoutbox?un=<?php echo $usern; ?>"><i class="fa fa-2x fa-cube"></i><span style="font-size: 1.3em;"> My ShoutBox </span> <span class="badge pull-right" style="background-color:#2c3e50;"  ><div class=" wall_led led-yellow<?php echo $wall_led; ?>"></div></span></a></li>                   
            
                    
                   <?php
                if($_SESSION['SESS_MODE']==1){
                $section_id=$_SESSION['SESS_SECTION'];
                $course_id=$_SESSION['SESS_COURSE'];
                 
                $kqry="SELECT category FROM section WHERE section_id='$section_id'";
 $mqry=mysql_query($kqry);
 $jqry=mysql_fetch_row($mqry);
                  {echo'<li  class="ubuntu " ><a style="background:#8784ff;text-align:left;" href="channel?tn='.$jqry[0].'" class="ubuntu " > <i class="fa fa-users fa-2x " aria-hidden="true"></i> <span style="font-size:1.35em;" > My Class </span>&nbsp; <span class="badge pull-right" style="background-color:#2c3e50;"  ><div id="class_led" class="led-yellow'.$class_led.'"></div></span></a></li>';
                }    }      else if($_SESSION['SESS_MODE']==2){
                    
                     $kqry="SELECT course_id,course_short FROM course ";
 $mqry=mysql_query($kqry);
 $ktqry="SELECT section.category FROM section JOIN channel_favs where (section.section_id=channel_favs.section_id && channel_favs.mem_id='$mem_id')";
 $mtqry=mysql_query($ktqry);
 

                   echo'<li><div class="dropdown">
  <button class="btn btn-primary btn-block " style="background:#8784ff;text-align:center;font-size:1.2em;"type="button" data-toggle="dropdown"> All Courses <i class="fa fa-list pull-right" aria-hidden="true"></i>
  <span class="caret"></span></button>
  <ul class="dropdown-menu scrollable-menu" role="menu" >';
                   while($jqry=mysql_fetch_row($mqry)){
                   echo'<li><a id="cour'.$jqry[0].'" href="#" onclick="getallbranch(this.id);"><i class="fa fa-hashtag" ></i> '.$jqry[1].'</a></li>';}
  echo'</ul>
						</div></li> ';  
                    
                     echo'<li><div class="dropdown">
  <button class="btn btn-primary btn-block " style="background:#18bc9c;text-align:center;font-size:1.2em;"type="button" data-toggle="dropdown"> My classes <i class="fa fa-book pull-right" aria-hidden="true"></i>
  <span class="caret"></span></button>
  <ul class="dropdown-menu scrollable-menu" role="menu" >';
                   while($jtqry=mysql_fetch_row($mtqry)){
                   echo'<li><a  href="channel?tn='.$jtqry[0].'" ><i class="fa fa-at" ></i> '.$jtqry[0].'</a></li>';}
  echo'</ul>
						</div></li> ';  
                    
                    
                }     ?>
               <li class="mybr">&nbsp;</li>
                                         
                 
                      
                       
					 
					  
                                        
                </ul>

               <!-- <ul class="list-unstyled hidden-xs" id="sidebar-footer">
                    <li><div class="dropup">
  <button class="btn btn-primary btn-block " onclick="online();"type="button" data-toggle="dropdown">Online  <i class="fa fa-users pull-right" aria-hidden="true"></i>
  <span class="caret"></span></button>
  <ul class="dropdown-menu scrollable-menu" role="menu" id="online">
   
  </ul>
						</div></li>
					
					
					
                </ul>   -->
              
              	<!-- tiny only nav-->
             
              
            </div>
            <!-- /sidebar -->
          
            <!-- main right col -->
            <div class="column col-sm-10 col-xs-12" id="main">
                
                <!-- top nav -->
              	<div class="navbar navbar-blue navbar-static-top">  
                    <div class="navbar-header">
                     <!-- <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">&#9776;</button>-->
                     <div id="navswitch1" style="display:none;">
                         
                         <div class="btn-group" role="group">
       <button type="button" class="btn btn-success" style="padding:0px;padding-left:10px; padding-right:10px;width:100%;"  onclick="removeinputbox();" role="button" ><i class="fa fa-angle-up " aria-hidden="true"></i></button>
                             <br>
      <form class="navbar-form" style="padding:0px;padding-left:0px;padding-right:0px;margin:0px 0px 0px 0px;">
                        <div class="input-group input-group-md" style="width:100%;">
                          <input type="text" class="form-control ubuntu inputmob srchin" onkeyup="search(this.id);"  placeholder=" $abc(user) | abc(channel)"  id="termmob" >
                          <div class="input-group-btn">
                            <button class="btn btn-primary" onclick="search('termmob');" type="button"><i class="glyphicon glyphicon-search"></i></button>
                          </div>
                        </div>
      </form></div></div>
                     
                     <div id="navswitch2" style="display: none;"></div>
                     
                        <div class="btn-group btn-group-justified visible-xs" id="navjustify" role="group" aria-label="...">
                            <div class="btn-group" style="background-color:#2c3e50;width:3%;" role="group" onclick="openNav()">
    <button type="button" class="btn " href="#" style="background-color:#2c3e50;"><i class="fa fa-bars getora " aria-hidden="true"></i><div class="bar_led led-yellow<?php echo $bar_led; ?>"></div></button>
  </div>
        
         <div class="btn-group" role="group">
                       <button class="btn btn-success" onclick="getinputbox();" type="button"><i class="glyphicon glyphicon-search"></i></button>
         </div>
                            
     <div class="btn-group" role="group">
    <button type="button" class="btn btn-success" href="#return" onclick="home();" role="button" ><i class="glyphicon glyphicon-home getora"></i></button>
  </div>                      
  <div class="btn-group" role="group">
    <button type="button" class="btn btn-success" href="#" role="button" onclick="trend();"><i class=" glyphicon glyphicon-fire getora"></i></button>
  </div>
                            <div class="btn-group"style="background-color:#2c3e50;" role="group">
    <button type="button" class="btn " href="#" onclick="favtopic();" style="background-color:#2c3e50;" ><i class="fa fa-star getora " aria-hidden="true"></i><div  class="fav_led led-yellow<?php echo $fav_led; ?>"></div></button>
  </div>
                            
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
                    <form class="navbar-form navbar-left">
                        <div class="input-group input-group-md" style="max-width:350px;">
                          <input type="text" class="form-control ubuntu inputpc srchin" placeholder=" $abc(user) | abc(channel)"  id="term1" onkeyup="search(this.id);">
                          <div class="input-group-btn">
                            <button class="btn btn-primary" onclick="search('term1');"type="button"><i class="glyphicon glyphicon-search"></i></button>
                          </div>
                        </div>
                    </form>
                    <ul class="nav navbar-nav">
                     <li>
                        <a href="#return" onclick="home();" ><i class="glyphicon glyphicon-home"></i> Home</a>
                      </li>

                      

                     
					  
                     
					  <li style="background-color:#2c3e50;">
                                              <a onclick="favtopic();" href="#" title="favourites"><i class="fa fa-star " aria-hidden="true" style="font-size: 1.5em;" ></i><span class="badge" style="background-color:#2c3e50;"  ><div   class=" fav_led led-yellow<?php echo $fav_led; ?>"></div></span></a>
                      </li>
                       <li>
                        <a  href="#" onclick="trend();"><span class="badge">Popular</span></a>
                      </li>
					  
						
					
						
					   
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
              
                
                    <div  id="blackback"class="full col-sm-9">
                      
                        <!-- content -->                      
                      	
                         
<!-- CONTENT 
=================================-->
<div class=" text-center">
    <div class="row ">
        
       <div id="return">
		<?php echo'
<div class=" khatoono  "style="background-color:#18bc9c;"> <i class="fa fa-map-o" aria-hidden="true"></i> JSSATEN WORLD </div>
       
  
    <br>
 
<p class="topic_bheed">';

                 $kqry="SELECT * FROM type ORDER BY views DESC";


               $kresult=mysql_query($kqry);
				
                while($krow = mysql_fetch_row($kresult))
                {$n = rand(18,32 )/10;
               
			echo'<a id="'.$krow[0].'" href="#"  onclick="type_match(this.id)" class=" homeo btn btn-link text-primary" style=" font-size:'.$n.'vmax;  ">'.$krow[1].'</a>&nbsp;&nbsp;&nbsp;';     }

echo'</p>
</br>';?>
<!--<img src="images/floral-finish.png" width="50%"></img>-->
</div>
        
        <div id="return2" style="display: none;"></div>
        <div id="return3" style="display: none;"></div>
        <div id="return4" style="display: none;"></div>
        <div id="return5" style="display: none;"></div>
        <div id="return6" style="display: none;"></div>
        <div id="return7" style="display: none;"></div>
        <div id="return8" style="display: none;"></div>
        <div id="return9" style="display: none;"></div>
        <div id="return10" style="display: none;"></div>
        <div id="return11" style="display: none;"></div>
        <div id="tmcacheall" style="display: none;"></div>
        
  	</div>
    
  	
  	
</div>

<!-- /CONTENT ============-->

                         
						 
                       
                                                     
                          
                      
                      
                        
                      
                      
                      
                      
                      
                        
                      
                        
                      
                    </div><!-- /col-9 -->
                <!-- /padding -->
                
            </div>
            <!-- /main -->
          
        </div>
    </div>
</div>

	
 <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll ">
        <a class="btn btn-primary" href="#postModal" role="button"  data-toggle="modal" title="Add Channel">
            <i class="fa fa-plus"></i>
        </a>
    </div>		
		

<!--post modal-->

<div id="postModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
	  
      <div class="modal-header baksuccess" style="font-size:1.2em;">
          <button type="button" class="close" onclick="clean();"data-dismiss="modal" aria-hidden="true">×</button>
			
      </div>
      <div class="modal-body">
          <form class="form ">
            <div class="form-group">
		
                <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> Channel Name </label>
                               
                                 <input type="text" class="form-control" autofocus="" id="ntopic" maxlength="20" placeholder="name it within 3 words"required/>
                        
                            </div>
                
            
              <div class="form-group col-xs-12 floating-label-form-group controls">
             <label> Select Category </label>
  <select class="form-control" id="type" >
    <option value=""> Select Category </option>
<?php
 $kresult=mysql_query($kqry);
 while($krow=mysql_fetch_row($kresult))
 {echo'<option value="'.$krow[0].'"> '.$krow[1].' </option>';
  }
   ?> </select>
            
              <div class="text-center"><span class="text-center text-muted ">-------- OR --------</span></div>

            <label> Create Category </label>
              <input type="text" class="form-control " autofocus="" id="newcat" maxlength="20" placeholder="create new category..."required/>
      
              </div>  
              
           
      
      <select class="form-control" id="topic_visi">
        <option value="-99"> Select Visibility </option>
        <option value="0">Everyone</option>
       <?php if($_SESSION['SESS_MODE']==1){echo' <option value="1">only students</option>';}
        if($_SESSION['SESS_MODE']==2){echo' <option value="2">only teachers</option>';}?>
        
      </select></div>
              
            <div class="pull-right btn-group " data-toggle="buttons">
  <label class="btn btn-primary active ">
    <input type="radio" name="private" id="private0" value="0" autocomplete="off" checked required> <i class="fa fa-globe" aria-hidden="true" ></i> Public
  </label>
  <label class="btn btn-primary ">
    <input type="radio" name="private" id="private1" value="1" autocomplete="off" required> <i class="fa fa-lock" aria-hidden="true"></i> Private
  </label>&nbsp;&nbsp;&nbsp;&nbsp;
</div>
              
              
			   <div class="form-group">
              <textarea rows="4" cols="100%"class="form-control input-lg textareabak" name="cdesc" id="cdesc" placeholder="Write the channel discription in detail..."></textarea>
			 
            </div>
              <label for="tagy" class="text-danger postmf">&nbsp;&nbsp; <i class="fa fa-tags fa-2x" aria-hidden="true"></i> tags </label> 
        <input id="ttagy" class="tags-input"  value="" data-max-tags="8">
          </form>
      </div>
      <div class="modal-footer baksuccess">
          <div>
		  <div style="color:red;font-size:1.3em;" id="report"></div>
          <button class="btn btn-primary btn-block btn-xs fa-2x" style="font-weight:bold;color:white;"onclick="both();" > <i class="fa fa-plus" style="color:white;"aria-hidden="true"></i> Add </button>
            
		  </div>	
      </div>
  </div>
  </div>
</div>
		

<!-- modal over -->




<!--profile pic modal-->
<div id="profile_picModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg">
  <div class="modal-content" >
      
      <div class="modal-header">
          <button type="button" class="close" onclick="clean();"data-dismiss="modal" aria-hidden="true">×</button>
            Display Picture
      </div>
      <div class="modal-body">
          <div id="current_poto" style="padding-bottom:0px;background:url(<?php echo $n2row[0] ?>) center no-repeat; background-size:contain;background-color:#000; height:70vh;"> 
          </div>
          
          <form method="POST"   action="profpic_ajax.php" class="dropzone" id="dpupload" enctype="multipart/form-data" >
           <div class="form-group">
              
            </div>
              <input type="text" id="cap2" style="display: none;" value=""/>       
				
		  </form>
      </div>
  </div>
  </div>
</div>


<!--over-->
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

       
       $('#ttagy').tagging(tagsource); 
                $( window ).load(function() {
   // console.log( "ready!" );
    $("body").css("filter","none");
});
        
        </script>
        

   

   
        <script>
        Notification.requestPermission(function(status) {
    console.log('Notification permission status:', status);
});



//notification script
OneSignal.push(function() {
  /* These examples are all valid */

               
  OneSignal.getUserId().then(function(userId) {
    console.log("OneSignal User ID:", userId);
     OneSignal.syncHashedEmail("<?php echo $n2row[1]; ?>").then(function(){
        console.log("email registered success") 
     });
      
  });
});
 
        </script>
		
	</body>
</html>
