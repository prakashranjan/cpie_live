
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
                     header("location: home");
			exit();
                }
                
/*		
if(!edit()){
$qry05="Update member set views=views+1 WHERE mem_id='$uid'";
               $done5=mysql_query($qry05);
}*/
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
    		<link href="css/shoutbox.css" rel="stylesheet">
                
                
		<link href="css/commoncss.css" rel="stylesheet">
                
               
    
    
   
		
		<script type="text/javascript" src="js/jquery.min.js"></script>
	
	
		<script type="text/javascript" src="js/logout.js"></script>
		<!-- <script src="js/ion.sound.js"></script> -->	
		   <script src="js/commonjs.js"></script>
        <?php	if(edit()){
            echo'<link href="css/dropzone.css" type="text/css" rel="stylesheet" />
 
<!-- 2 -->
<script src="js/dropzone.js"></script>
<script src="js/shoutbox.js"></script>
';}
               
             ?>   

		
		
	<!--<link href="css/typeahead.tagging.css" rel="stylesheet">-->
        	
                 
   <link href="css/typeahead.css"  rel="stylesheet" />
	<link href="css/bootstrap-tagsinput.css" rel="stylesheet">
        <style>
	/*body{ font-family:calibri;}*/
	
	
        
        .dropzone{padding-left:0;padding-right: 0;padding-top: 0;
        border:none;}
        
        </style>
		
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
           
   $viewsw=$n2row[8];
  

$mem_mode=$n2row[16];


               	
					 ?>
					
                    <li  class="ubuntu"><a style="background:#18bc9c"href="#"><i class="fa fa-<?php echo $genderw;?> fa-2x"></i><span style="font-size:1.3em;"> $<?php  echo $usernw ?></span></a></li>
                   
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
                       
                       </div><!--/row-->
                       <?php
                       if(edit()){
                            $gmat=mysql_query("select category_name,category_id,category_desc from priority order by category_id ");
                 
                             $tanto=1;  
                             $wid=array();
                           
                           echo'<div class="panel" id="wall_tab" style="box-shadow:none;margin-bottom:0px;border-color:#8784ff;">
                      
<b>
<ul class="nav nav-pills text-center "style="background-color:#8784ff;width:100%;" >
                 <li><a style="color:#a19ff7;background-color:#2c3e50;"><i class="fa fa-cube" aria-hidden="true"></i> My ShoutBox <i class="fa fa-angle-double-right " aria-hidden="true"></i></a></li>';
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
            
            
<!-- image Modal -->
<div id="zoomModal" class="modal fade" role="dialog">
	
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content " style="overflow:hidden;background:transparent;    text-align: -webkit-center;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        
      </div>
      
          <div  id="zoom_image">
            
         
      </div>
     
   

  </div>
  </div></div>

 <!-- image modal_over  -->
 
 
<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll ">
        <a class="btn btn-warning" href="#postModal" role="button" data-toggle="modal"  title="Target Shout">
            <i class="fa fa-crosshairs" aria-hidden="true"></i>
        </a>
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

<div id="postModal" class="modal fade" tabindex="-1" >
  <div class="modal-dialog modal-lg">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close fa-3x" style="margin-top:-14px;" data-dismiss="modal" aria-hidden="true">×</button>
			
      </div>
	  <div class="modal-body">
        <div class="tabbable"> <!-- Only required for left/right tabs -->
        <ul class="nav nav-tabs fa-lg postmf" style="background-color: #f2f2f2;">
        <li class="active "><a href="#tab1" onclick="moveform(1);" data-toggle="tab"><i class="fa fa-lg fa-comment" aria-hidden="true"></i> Chat</a></li>
        <li><a href="#tab2" onclick="moveform(2);"data-toggle="tab"><i class="fa fa-paperclip fa-lg" aria-hidden="true"></i> Media</a></li>
    <li ><a href="#tab3" onclick="moveform(3);" data-toggle="tab"><i class="fa fa-bar-chart fa-lg" aria-hidden="true"></i> Poll</a></li>
        </ul>
        <div class="tab-content">
        <div class="tab-pane active" id="tab1">
            <form class="form center-block"  enctype="multipart/form-data" >
            <div class="form-group">
              <textarea rows="8" cols="100%" style="background-color:antiquewhite;" class="form-control input-md textareabak" maxlength="45000" name="cap" id="cap" placeholder="What do you want to Target Shout?"></textarea>
            
              
                <div class=" form-control checkbox text-center fa-lg postmf" style="border:none;">
    <label>
       <input class="fa-2x pull right btn-sm" name="anon" id="anon" type="checkbox" value="1" > <i class="fa fa-user-secret fa-lg" aria-hidden="true"></i> hide identity
    </label>
              </div>
               <div id="tab1com" ></div>
              <div id="moveform" style=" background-color:#fafafa; " >
                  
                 <h4 class=" bg-primary text-success text-center ubuntu mydepth" style="padding:5px;"><i class="fa fa-crosshairs" aria-hidden="true"></i> Set Target</h4>
                  <div class="row" style="margin-left:2%;margin-right: 2%;">
                 <label for="tagy" class="text-info postmf"> <i class="fa fa-tags " aria-hidden="true"></i> Target tags </label> 
                 <input   type="text" value="" id="tagy" class=" form-control input-md " data-role="tagsinput" placeholder="tags like IT-2_YR4...">
        
  <form class="navbar-form" >
      <label for="termmob" class="text-info postmf"> <i class="fa fa-bullseye " aria-hidden="true"></i> Personal targets </label>                  
      <div class="input-group input-group-sm "style="margin-bottom: 3px;" >
                          <input type="text" class="form-control ubuntu inputpc" onkeyup="searchuser(this.id);" size="100" placeholder="Search $username or name"  id="termmob" >
                          <div class="input-group-btn">
                            <button class="btn btn-primary" onclick="searchuser(\'termmob\');" type="button"><i class="glyphicon glyphicon-search"></i></button>
                          </div>
                        </div>
      </form>
          <div class="row">
              <div id="search_members"></div></div>
              <div id="members_allshell" style="display:none;">
               
                  <h4 class=" bg-primary text-success text-center  ubuntu mydepth" style="margin-top: 0;padding:3px;" ><i class="fa fa-bullseye " aria-hidden="true"></i> Selected Personal targets</h4>
              <div class="row">
             
              <div id="members_all" style="background-color:#fafafa;">
                 
              </div>
            
             
              
          </div>
              </div>    
 <input type="hidden"  id="hide_u_ids">
                  </div> 
 
  <h4 class=" bg-primary text-success text-center ubuntu mydepth" style="padding:5px;"><i class="fa fa-caret-square-o-down" aria-hidden="true"></i> Set Category</h4>
                        
  <div class="form-group "style="margin:2%;padding:2px;">
      
      <select class="form-control" id="catin">
      <?php
       $gmat=mysql_query("select category_name,category_id from priority order by category_id ");
       while($gmatu=mysql_fetch_row($gmat)){
           
           echo' <option value="catin'.$gmatu[1].'">'.$gmatu[0].'</option>';
       }          
      ?>
      </select>
        </div>
             
              </div>
              
              
              
              
              
            
             
              
			 <div id="respo" style="    text-align: center;"></div>
            </div>
				 <div class="modal-footer">
          <div>
              <button id="grabcap" onclick="multi();" type="button" class="btn  btn-success mob_but postmf" ><i class="fa fa-crosshairs text-primary fa-3x"></i> <span class="lead">Target Shout</span> </button>
            
		 </div>
		  
		  </form>
          
      </div>
			
        </div>
        <div class="tab-pane" id="tab2">
        	 <form method="POST"   id="broadcastdocupload" action="broadcast_ajax/broadcast_uploadmera.php"  class="dropzone" enctype="multipart/form-data" >
           <div class="form-group">
              <textarea rows="8" cols="100%"class="form-control input-md textareabak" style="background-color:antiquewhite;" name="cap2" maxlength="45000"  id="cap2" placeholder="Give caption to your media..."></textarea>
            
              <div class=" form-control text-center fa-lg postmf" style="border:none;">
    <label>
       <input class="fa-2x pull right " name="anon2" id="anon2" type="checkbox" value="1" > <i class="fa fa-user-secret fa-lg" aria-hidden="true"></i> hide identity
    </label>
              </div>
                <div id="tab2com"></div>
              <div id="respo" style="    text-align: center;"></div>
            </div>
                     
		  </form>
          
      
			
        </div>
	 <div class="tab-pane" id="tab3">
            <form class="form center-block" enctype="multipart/form-data" >
            <div class="form-group">
                <textarea rows="3" cols="100%"class="form-control input-md text-danger textareabak" style="background-color:antiquewhite;" name="cap3" maxlength="1000" id="cap3" placeholder="Ask something..."required="give poll question.."></textarea>
			
                         
                         <!-- poll options -->
                        <ul style="list-style:none;    -webkit-padding-start: 0px;"id="append_li" >
                            <li style="padding-bottom:3px;" ><input type="text" class="form-control input-sm text-success text-center" name="opt1" maxlength="60" id="opt1" placeholder="+ option 1"required/></li>
                            <li style="padding-bottom:3px;"><input type="text" class="form-control input-sm text-success text-center" name="opt2" maxlength="60" id="opt2" placeholder="+ option 2"required/></li>
                            <li style="padding-bottom:3px;"><input type="text" class="form-control input-sm text-success text-center" name="opt3" maxlength="60" id="opt3" placeholder="+ option 3"/></li>
                              <li style="padding-bottom:3px;"><input type="text" class="form-control input-sm text-success text-center" name="opt4" maxlength="60" id="opt4" placeholder="+ option 4"/></li>
                      
                                          
                        </ul>
                         <li class="text-center" style="list-style:none;"><button type="button" id="add_opt_button" onclick="add_opt();" class=" btn-muted btn-xs "> + </button></li>  
                         
        
            </div>
                
                <div class=" form-control text-center fa-lg postmf" style="border:none;">
    <label>
       <input class="fa-2x pull right " name="anon3" id="anon3" type="checkbox" value="1" > <i class="fa fa-user-secret fa-lg" aria-hidden="true"></i> hide identity
    </label>
              </div>
                <div id="tab3com"></div>
                 <div id="respo3" style="    text-align: center;"></div>
				 <div class="modal-footer">
         
                                     <button id="post_poll"name="post_poll" onclick="savepoll();" type="button" class="btn btn-success mob_but postmf"  ><i class="fa fa-crosshairs text-primary fa-3x"></i> <span class="lead">Target Shout</span> </button>
         
        
                                 </div>
                  
		  
		  </form>
          
      
			
        </div>
        </div>
        </div></div></div></div></div>







	<!-- script references -->
		
		<script src="js/bootstrap.min.js"></script>
		<script src="js/scripts.js"></script>
               

                <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/typeahead.js/0.10.1/typeahead.bundle.min.js"></script>
<script src="js/typeahead.tagging.js"></script>-->
                
                
                
<script src="js/typeahead.js"></script>
<script src="js/bootstrap-tagsinput.js"></script>

<script>
    
        
      <?php
         
      $mod=$_SESSION['SESS_MODE'];
      //$tags= array();
        //$sqm=mysql_query("select tag_name from broadcast_tags where mode=0 or mode='$mod'");
        //while($runop=  mysql_fetch_row($sqm))
        //{array_push($tags,$runop[0]);   
       // }  
         // $tags=json_encode($tags);
         // echo'var tagsource='.$tags;
       if($mod==1){
           echo'var tagsource_ori="targettagss"';
       }else if($mod==2){
            echo'var tagsource_ori="targettagst"';
       }
        
       
        
        ?>

      </script>
<script>
	var countries = new Bloodhound({
	  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
	  queryTokenizer: Bloodhound.tokenizers.whitespace,
	  prefetch: {
		url: 'data/'+tagsource_ori+'.json',
		filter: function(list) {
		  return $.map(list, function(name) {
			return { name: name }; });
		}
	  }
	});
	countries.initialize();

	$('#tagy').tagsinput({
            maxTags: 8 ,
	  typeaheadjs: {
		name: 'countries',
		displayKey: 'name',
		valueKey: 'name',
		source: countries.ttAdapter()
                
                
	  }
	});
        
        
        
</script>


       
       <script>
      // $('#tagy').tagging(tagsource);
  
   
   
              $( window ).load(function() {
    //console.log( "ready!" );
    $("body").css("filter","none");
});
        </script>
       
    
        
        </body>
</html>



		






























