<!DOCTYPE html>
<html lang="en">
    <head>  
<?php
include_once"connection.php";
//Start session
	session_start();
	//Check whether the session variable SESS_MEMBER_ID is present or not
	if(!isset($_SESSION['SESS_MEMBER_ID']) || (trim($_SESSION['SESS_MEMBER_ID']) == '')) {
	
	}
   else
   {   header("location: home");
		exit();   }

    
     
?>

<script type="text/javascript" src="js/jquery.min.js"></script>


<link href="css/font-awesome.min.css" rel="stylesheet">





	<style  type="text/css" >
		 

		::-webkit-scrollbar-track
{
	-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
	background-color: #18bc9c;
}

::-webkit-scrollbar
{
	width: 6px;
	background-color: #F5F5F5;
}

::-webkit-scrollbar-thumb
{
	background-color:  #2C3E50;
}
	
.hid{ visibility:hidden;}
#interactive.viewport {
  width: 100%;
  height: 100%;
}

/* line 6, ../sass/_viewport.scss */
#interactive.viewport canvas, video {
  float: left;
  width: 100%;
  height: 100%;
}
/* line 10, ../sass/_viewport.scss */
#interactive.viewport canvas.drawingBuffer, video.drawingBuffer {
  margin-left: 0px;
}
canvas{display:none !important;}
	</style>


    
   
    
    
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
               <meta name="display" content="standalone">
                <meta name="theme-color" content="#2c3e50">
    <link rel="manifest" href="manifest.json">
    <title>Carbon Pie</title>

 

    <!-- Custom CSS -->
    
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/freelancer.css" rel="stylesheet">
    <!-- Custom Fonts -->
   
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    



	<script src="js/register.js"></script>
        
     
        <style type="text/css">
            .row{
                margin-left: 0px;
                margin-right: 0px;
            }
        
        </style>

	</head>
	
<body id="page-top" class="index" style="filter: blur(30px);-webkit-filter: blur(30px);">
	<?php include_once("analyticstracking.php") ?>
	
	

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
				<a class="navbar" href="#page-top"><img class="logo_flex" src="images/logo49.png" height="70" ></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    
                    <li class="page-scroll">
                        <a href="#about">About</a>
                    </li>
					
                    <li class="page-scroll">
                        <a href="#contact">Sign Up</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="row" style="margin-left: 0px;
    margin-right: 0px;padding:0px;">
                <div class="col-lg-12  jigli">
                <div class="intro-text">
					<span class="skills"> LOGIN &nbsp; <span style="color:#2C3E50;"><i class="fa  fa-graduation-cap fa-2x" aria-hidden="true"></i>JSSATEN</span> </span>
                    <hr class="star-light">
                    
</div>

                    <div class="panel panel-success  animated rubberBand ">
            
             
                <div class="panel-body ">
                    <form class="form-horizontal" role="form" enctype="multipart/form-data" action="login_exec.php" method="post">
                        <div class="form-group">
                            
                            <div class="">
                                <input type="username"  class="form-control" name="username"id="inputEmail3" placeholder="Username" required="">
                                
                            </div>
                        </div>
                        <div class="form-group">
                            
                            <div class="">
                                <input type="password"name="password" class="form-control" id="inputPassword3" placeholder="Password" required="">
                            </div>
                        </div>
                     
                        <div class="form-group last">
                            <div class="">
                                <button name="submit" type="submit"id="submit" class="btn btn-success " style="font-size:1.2em;"><i class="fa fa-unlock fa-2x"></i> Login </button>
                                
                            </div>
                        </div>
                    </form>
                    <!--the code bellow is used to display the message of the input validation-->
         <?php
         //login material
            if( isset($_SESSION['ERRMSG_ARR']) && is_array($_SESSION['ERRMSG_ARR']) && count($_SESSION['ERRMSG_ARR']) >0 ) {
            echo '<ul class="err" style="list-style:none;"  >';
            foreach($_SESSION['ERRMSG_ARR'] as $msg) {
                echo '<li>';
                
echo ' <div class="alert alert-danger">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>',$msg,'</strong>
</div>';                
                echo'</li>'; 
                }
            echo '</ul>';
            unset($_SESSION['ERRMSG_ARR']);
            }
            //signup material
           
        ?>
                </div>
                
                        <div class="panel-footer page-scroll row" ><a href="#contact" class=" page-scroll btn btn-primary "><i class="fa fa-barcode fa-2x" aria-hidden="true"></i><i class="fa fa-user-plus fa-2x"></i> New User</a> &nbsp; <span class="text-success pull-right" style="font-size:1em;">Best view on <i class="fa fa-2x fa-chrome" aria-hidden="true"></i> Chrome </span>
                </div>
                
            </div>
        </div>
</div>

                    
                </div>
            </div>
        </div>
    </header>

    <!-- Portfolio Grid Section -->
    

    <!-- About Section -->
    <section class="success" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Communication network
for the 21st century Colleges.</h2>
                    <hr class="star-light">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>Organize your College conversations in open channels classified under categories. Make a channel for your class, a topic, a team, or anything—everyone has a transparent view of all that’s going on. Private channels are also available . </p>
                </div>
                <div class="col-lg-4">
                    <p>Not just your messages, but all your files, images, PDFs, documents, and spreadsheets can be dropped right into Carbon Pie and shared with anyone you want. Add new channels, favourite it for later reference, and it’s all completely searchable.</p>
                </div>
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <a  class="btn btn-lg btn-outline" href="#readmoreModal"  data-toggle="modal">
                        <i class="fa fa-book"></i> Read More
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- SIGNUP Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2> Sign up with admission number </h2>
                    <hr class="star-primary">
                </div>
            </div>
           
            <div class="row">
                
               <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label class="text-center"> Admission no. </label>
                                <input class="form-control text-center" type="text" name="ad_no" id="adno"  onkeyup="keyadno(this.value);"   maxlength="10" placeholder="type your Admission no. eg. 14/IT/047" required data-validation-required-message="Please enter your Admission No. like 14/IT/047">
                                
                            </div>
                        </div>
                <br>
                <div class="form-group col-xs-12 text-center">
                    <button   type="button" role="button" name="adno_getform" id="adno_getform" onclick="adno_getform();" class="btn btn-success fa-2x btn-md ">Get Sign Up form</button>
                            </div>
                <div id="filebar">
<div id="container" class="container">
    
  <!-- bar code stuff-->
</div>
</div>
                
                
            </div>
            
           
        </div>
        
    </section>

    <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>Location</h3>
                        <p>C-20/1, Sector 62<br>Noida, Uttar Pradesh 201301</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Around the Web</h3>
                        <ul class="list-inline">
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-dribbble"></i></a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>About Carbon Pie</h3>
                        <p>Carbon Pie | CARBON PIE is a licensed subscription of Carbon Pie software which is maintained by Carbon Pie representatives.<a href="#"> Carbon Pie </a>.</p>
                    
                      <div ><img src="images/comodo_secure_seal_100x85_transp.png" ></div></div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container">
                <div class="row">
                  <div class="col-lg-12">
                        Copyright &copy; Carbon Pie | CARBON PIE 2016 
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll visible-xs visible-sm">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    <!-- Portfolio Modals -->
   

    <div class="portfolio-modal modal fade" id="readmoreModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>About Carbon Pie</h2>
                            <hr class="star-primary">
                            <img src="images/rectlogo.png" class="img-responsive img-centered img-circle" alt="">
                            <p>In large number of colleges there is no concrete system for internal communication ,and students use to make their own group network on whatsapp, facebook etc. According to us when a student joins an institute he/she becomes a member of a new society and for the communication within the society there must be a technological tool.By interacting with teachers and fellow students of the colleges.We came up with a solution Carbon Pie.
</p>
                            <br>
                            <h2> TEAM </h2>
                            <hr class="star-primary">
                            
                <img class="img-circle img-responsive img-centered" src="images/pic09.jpg" alt="">
                <h3>Prakash Ranjan Singh
                    <small>Founder & Developer</small>
                </h3>
                <p> I am Prakash Ranjan Singh student of Btech IT IVth year of JSS Academy of Technical Education , Noida. I am a web developer and have eagerness to learn new programming languages . This Webapp is made on the basic idea of helping students in a techy way and webapp is the best way to network them.<ul class="  list-inline">
                            <li>
                                <a href="https://www.facebook.com/prs786?fref=ts" target="_blank" class=" btn-social "><i class="  fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="https://plus.google.com/u/0/108132880255375136735/about/p/pub" target="_blank" class="btn-social "><i class="fa fa-fw fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="#" target="_blank" class="btn-social"><i class="fa fa-fw fa-twitter"></i></a>
                            </li>
                            <li>
                                <a href="https://in.linkedin.com/in/prakash-ranjan-singh-19a879b4" target="_blank" class="btn-social "><i class="fa fa-fw fa-linkedin"></i></a>
                            </li>
                            <li>
                                <a href="#" target="_blank" class="btn-social "><i class="fa fa-fw fa-dribbble"></i></a>
                            </li>
                        </ul></p>
            
                             
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

   
    
    <!-- sign up Modal -->
<div id="signModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
     
      <div id="result" class="modal-body">
        <div style='text-align:center;'><img src='images/copy.gif'/></div>
         
        
      </div>
      
    </div>

  </div>
</div>
    
    
    <!-- jQuery -->
    
  

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    

    <!-- Custom Theme JavaScript -->
    <script src="js/freelancer.js"></script>
    
   <!-- <script src="dist/quagga.min.js" type="text/javascript"></script>
<script src="js/live_w_locator.js" type="text/javascript"></script>
<script src="js/file_input.js" type="text/javascript"></script>-->
<script>
          $( window ).load(function() {
    console.log( "ready!" );
    $("body").css("filter","none");
});
</script>

</body>

</html>
