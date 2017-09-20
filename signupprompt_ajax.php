<?php
  include("connection.php");
  

		session_start();
	
	

  
$yr= addslashes($_GET['yr']);
$br= addslashes($_GET['br']);
$rl= addslashes($_GET['rl']);
if(strlen($rl)!=3){
    echo "<h4> invalid admission no. </h4>";
    exit();
}




$f_cid=$yr."/".$br."/".$rl;

$rl=(int) $rl;

 $er=array();
 

if($yr=="14"||$yr=="15"||$yr=="16"||$yr=="17"){$er[0]=1;}
else {$er[0]=0;}

if($br=="IT"||$br=="CSE"||$br=="EC"||$br=="EEE"||$br=="CE"||$br=="IC"||$br=="EE"||$br=="ME"){$er[1]=1;}
else {$er[1]=0;}


if($rl!=0 && $rl<250){$er[2]=1;}
else {$er[2]=0;}

if((strlen($f_cid) ==9 ||strlen($f_cid) ==10) && $er[0] && $er[1] && $er[2]){
    
    $sql= "select id,form_fill from barcode_sign where full_cid='$f_cid'";
    $data1= mysql_query ($sql);
    if(mysql_num_rows($data1))
    { 
        $res=mysql_fetch_row($data1);
           if($res[1]== 0){
            echo"<h4 style='text-align:center;' class='text-success'><i class='fa fa-2x fa-smile-o' aria-hidden='true'></i> Thank you for coming back..</h4>";
            $_SESSION['GIFTY'] = $f_cid;
          
            showsign();
        }
        else{
            echo'<h4 class="text-danger" style="text-align:center;" ><i class="fa fa-2x fa-smile-o" aria-hidden="true"></i>  Hey! You have already signed up </h4>';
            
        }
        
        
    }
    else{
        $mql= "insert into barcode_sign (year,branch,roll_no,form_fill,full_cid) values ('$yr','$br','$rl',0,'$f_cid') ";
        $data2 = mysql_query ($mql)or die(mysql_error());
        if($data2)
        { $_SESSION['GIFTY'] = $f_cid;
            showsign();}
        
        
    }
    

}
else{
       echo "<h4> invalid admission no. </h4>";}




function showsign(){
   

echo '<div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Sign Up</h2>
                    <hr class="star-primary">
                    <span class="text-muted" style="text-align:center;"> *** Please give correct details .Its just a Beta.please support</span>
                </div>
                
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form  role="form" id="signupform" name="signupform" method="POST" action="signmeup.php"  >
                    
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> First Name </label>
                                <input class="form-control"  type="text" name="first_name" id="first_name" maxlength="15" placeholder=" First Name" required data-validation-required-message="Please enter your first name.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> Last Name </label>
                                <input class="form-control" type="text" name="last_name" id="last_name" maxlength="15" placeholder=" Last Name" >
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Address(GMail)</label>
                                <input type="email" class="form-control"  name="email" id="email" onblur="validate(this.name,this.value);" placeholder="Email Address"  required data-validation-required-message="Please enter your email address.">
                                <p class="help-block text-danger" id="emailerror"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Phone Number</label>
                                <input type="tel" pattern="[0-9]{10}" class="form-control"  maxlength="10" name="phone" id="phone"onblur="validate(this.name,this.value);" placeholder="Phone Number"  required data-validation-required-message="Please enter your phone number.">
                                <p  id="phoneerror" class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group " style="text-align:center;">
                            <div class="form-group col-xs-6  controls">
                            <label class="btn "><input class="form-control " value="female"type="radio" name="sex"required placeholder="female"  ><i class="fa fa-female" aria-hidden="true"></i> female</label>
                            </div>
                            <div class="form-group col-xs-6  controls">
                            <label class="btn "><input class="form-control " value="male"type="radio" name="sex"required placeholder=" male "><i class="fa fa-male" aria-hidden="true"></i> male</label>
                            </div>
                        </div>
                        
                          
                        <div class="row control-group">
                            <div class="form-group col-xs-12 ">
                                <label>Branch</label>
                                <select class="selectpicker form-control "  onchange="sections(this.options[this.selectedIndex].value);" name="branch" required>
                                    <option value=""  >select</option>';
                         $mas=mysql_query("select branch_id,branch_short,branch_full from branch where course_id=1");
                         while($masr=  mysql_fetch_row($mas)){
                         echo'<option value="'.$masr[0].'"  >'.$masr[1].'__ '.$masr[2].' </option>';
                         }
                               echo'</select>
                                
                                <p id="mbranch"class="help-block text-danger"></p>
                            </div>
                        </div>
                        
                        <div class="row control-group">
                            <div class="form-group col-xs-12 ">
                                <label>Year</label>
                                <select class="selectpicker form-control "  name="year" required>
                                    ';
                         $mas2=mysql_query("select duration from course where course_id=1");
                         $masr2=  mysql_fetch_row($mas2);
                         $l=1;
                         while($l<= $masr2[0]){
                         echo'<option value="'.$l.'">'.$l.'</option>';
                         $l++;
                         
                         }
                               echo'
                                    
                                        
                               </select>
                                
                                <p id="myear"class="help-block text-danger"></p>
                            </div>
                        </div>
                        
                        <div class="row control-group">
                            <div class="form-group col-xs-12 " >
                                <label>Section</label>
                                <select class="selectpicker form-control "  id="classpik" name="section" required>

                                      
                               </select>
                                
                                <p id="msection"class="help-block text-danger"></p>
                            </div>
                        </div>
                        
                           
                          
                           <br>

                         <div class="row control-group">
                            <div class="form-group col-xs-12 label-form-group controls">
                                <label> Date of Birth </label>
                                <input type="date" class="form-control" name="dob" id="dob" placeholder="Date of Birth dd/mm/yyyy" required data-validation-required-message="Please select your DOB">
                               
                                <p id=""class="help-block text-danger"></p>
                            </div>
                        </div>

                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> User Name </label>
                                <input class="form-control" type="text" name="user" id="user" maxlength="20" onblur="validate(this.name,this.value);" onkeyup="cutter(this.id);" placeholder="Username" required data-validation-required-message="Please enter your username name.">
                                <p id="usernameerror"class="help-block text-danger"></p>
                            </div>
                        </div>

                         <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> Password </label>
                                <input class="form-control" type="password" name="password" id="pword" onblur=""maxlength="20" placeholder="Password" required data-validation-required-message="Please enter your password ">
                                <p id=""class="help-block text-danger"></p>
                            </div>
                        </div>
                         <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label> Confirm Password </label>
                                <input class="form-control" type="password" name="cpassword" id="cpword" onkeyup="checkPasswordMatch();" maxlength="20" placeholder="Confirm Password" required data-validation-required-message="Please confirm password">
                                <p id="error"class="help-block text-danger"></p>
                            </div>
                        </div>
                        
                         
                        <br>
                        <div id="success"></div>
                        
                        <div class="row">
                            <div class="form-group col-xs-12" style="text-align:center;">
                                <button   type="submit" name="newregister"  class="btn btn-success btn-lg">Sign me Up</button>
                            </div>
                        </div>
                    </form>
                </div>
</div>';

}

?>