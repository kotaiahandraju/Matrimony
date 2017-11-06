<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Aarna Matrimony">
    <meta name="author" content="Aarna Matrimony">

    <title>Aarna Matrimony</title>

    <!-- Bootstrap core CSS -->
    <link href="user/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
           
    <script src="user/js/ie-emulation-modes-warning.js"></script>
    <link href="user/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="user/vendor/woocommerce-FlexSlider/flexslider.css" type="text/css" media="screen" />
    <link href="user/css/style.css" rel="stylesheet">
    <link href="user/css/custom.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="user/css/component.css" />
    <script src="user/js/modernizr.custom.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
.dispnone
{
	display: none !important;
}
.hiddencss
{
	visibility: hidden;
}
body {
	background:#F1F1F2;
}
.container { background:#FFF;}
.ilogo { padding:15px 0; border-bottom:12px solid #F1F1F2 }
.control-label { text-align:left;}
.midcontnet { border-bottom:12px solid #F1F1F2; padding-bottom:40px; }
.manditory{color: red;}

.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}





/* body{margin:40px;} */

.stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
</style>

  </head>

  <body>
  
  
  
  
        <div class="container">
            <div class="row">
            <div class="ilogo">
            <div class="col-md-7 col-sm-7">
              <img src="user/images/logo.jpg" class="img-responsive">
            </div>
            <div class="col-md-5 col-sm-12">
            	<!-- <div class="stepwizard">
				    <div class="stepwizard-row">
				        <div class="stepwizard-step">
				            <button type="button" id="step1" class="btn btn-default btn-circle">1</button>
				            <p>Cart</p>
				        </div>
				        <div class="stepwizard-step">
				            <button type="button" id="step2" class="btn btn-default btn-circle">2</button>
				            <p>Shipping</p>
				        </div>
				        <div class="stepwizard-step">
				            <button type="button" id="step3" class="btn btn-default btn-circle">3</button>
				            <p>Shipping</p>
				        </div>
				        <div class="stepwizard-step">
				            <button type="button"  id="step4" class="btn btn-default btn-circle" >4</button>
				            <p>Payment</p>
				        </div> 
				    </div>
				</div> -->
            </div>
            <div  class="clearfix"></div>    
    		</div>
     </div>
     
   <div class="row">
   <div class="midcontnet">
   
   <div class="col-md-8">
   <form:form commandName="partnerProfile" action="savePartnerProfile" class="form-horizontal" id="savePartnerProfile" method="post">
   <form:hidden path="userrequirementId"/>
<fieldset>

<!-- 1st Step starts here-->
<div id="firstForm">
    <div class="col-md-12">
      <h3>Tell us what you are looking for in a life partner</h3>
    </div>
    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Age From</label>  
      <div class="col-md-6">
      <form:input path="rAgeFrom" class="form-control  numericOnly u1" placeholder="Enter Age From" />
<!--       	<input type="text" name="age" class="form-control u1" placeholder="Enter Age" maxlength="255"/> -->
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Age To</label>  
      <div class="col-md-6">
      <form:input path="rAgeTo" class="form-control numericOnly u1" placeholder="Enter Age To" />
<!--       	<input type="text" name="age" class="form-control u1" placeholder="Enter Age" maxlength="255"/> -->
      </div>
    </div>
    <%-- <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Height</label>  
      <div class="col-md-6">
       <form:input path="rHeight" placeholder="Enter Height"/>
       	<input type="text" name="height" class="form-control u1" placeholder="Enter Height" maxlength="255"/> -->
      </div>
    </div> --%>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Height</label>  
      <div class="col-md-6">
      	<form:select path="rReligion" class="form-control u1">
			<form:option value="">-- Choose Height --</form:option>
			<form:options items="${height}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group" >
      <label class="col-md-4 control-label" i for="textinput">Marital Status</label>  
      <div class="col-md-6">
      	<form:select path="rMaritalStatus" class="form-control u1" onchange="hideChildren();">
			<form:option value="Doesn't Matter">Doesn't Matter</form:option>
			<form:option value="Married">Married</form:option>
			<form:option value="Unmarried">Unmarried</form:option>
			<form:option value="Widow/Divorced">Widow/Divorced</form:option>
		</form:select>
      </div>
    </div>

    <div class="form-group" id="haveChildrenId" style="display: none">
      <label class="col-md-4 control-label" for="textinput" >Have Children</label>  
      <div class="col-md-6">
      	<form:select path="haveChildren" class="form-control u1">
			<form:option value="Doesn't Matter">Doesn't Matter</form:option>
			<form:option value="1">1</form:option>
			<form:option value="2">2</form:option>
			<form:option value="No Children">No Children</form:option>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Religion</label>  
      <div class="col-md-6">
      	<form:select path="rReligion" class="form-control u1">
			<form:option value="">-- Choose Religion --</form:option>
			<form:options items="${religion}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Community</label>  
      <div class="col-md-6">
      	<form:select path="rCaste" class="form-control u1">
			<form:option value="">-- Choose Community --</form:option>
			<form:options items="${cast}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Mother Tongue</label>  
      <div class="col-md-6">
      	<form:select path="rMotherTongue" class="form-control u1">
			<form:option value="">-- Choose Mother Tongue --</form:option>
			<form:options items="${language}"></form:options>
		</form:select>
      </div>
    </div>
 <script>
$(document).ready(function(){
	$(".ifMore").hide();
	$(".incomeBlock").hide();
	
    $(".more").click(function(){
    	$(".hideMe").hide();
    	$(".ifMore").show();
    });
    
    $(".incomeRange").click(function(){
    	$(".incomeBlock").show();
    });
    $(".incomeMatter").click(function(){
    	$(".incomeBlock").hide();
    });
    /* $(".more").click(function(){
        $(".ifMore").collapse('toggle');
    });
    $(".more").click(function(){
        $(".ifMore").collapse('hide');
    }); */
    
});
</script>   
    <div class="form-group hideMe">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6 text-center">
      	<span class="more" style="color: #0087AF;cursor: pointer;">MORE </span><i style="cursor: pointer;" class="fa fa-angle-down"></i>
      </div>
    </div>
    
<div class="ifMore" id="ifMore">
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>
      <div class="col-md-6">Location Details</div>
    </div>
   
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Country living in</label>  
      <div class="col-md-6">
      	<form:select path="rCountry" class="form-control u">
			<form:option value="">-- Choose Country --</form:option>
			<form:options items="${countries}"></form:options>
			
		</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">State living in</label>  
      <div class="col-md-6">
      	<form:select path="rState" class="form-control u">
			<form:option value="">-- Choose State --</form:option>
			<form:option value="AP">AP</form:option>
			<form:option value="Telangana">Telangana</form:option>
		</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>
      <div class="col-md-6">Education & Profession Details</div>
    </div>
<!--      rCountry,rState,rEducation,rWorkingWith,rOccupation,rAnnualIncome,rCreateProfileFor,rDiet -->
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Education</label>  
      <div class="col-md-6">
      	<form:select path="rEducation" class="form-control u">
			<form:option value="Doesn't Matter">Doesn't Matter</form:option>
			<form:options items="${education}"></form:options>
		</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Working with</label>  
      <div class="col-md-6">
      	<form:select path="rWorkingWith" class="form-control u1">
			<form:option value="Doesn't Matter">Doesn't Matter</form:option>
			<form:option value="Private Company">Private Company</form:option>
			<form:option value="Government/Public Sector">Government/Public Sector</form:option>
			<form:option value="Defense/Civil Services">Defense/Civil Services</form:option>
			<form:option value="Not Working">Not Working</form:option>
		</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Profession area</label>  
      <div class="col-md-6">
      	<form:select path="rOccupation" class="form-control u">
			<form:option value="Doesn't Matter">Doesn't Matter</form:option>
			<form:options items="${occupation}"></form:options>
		</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Annual Income</label>  
      <div class="col-md-6">
      	<input type="radio" name="annualIncome" class="incomeMatter" id="ai1" value="Doesn't Matter"> <label for="ai1">Doesn't Matter</label>
      	<input type="radio" name="annualIncome" class="incomeRange" id="ai2" value="Specify an income range"> <label for="ai2">Specify an income range</label>
      	<%-- <form:select path="education" class="form-control u">
			<form:option value="Doesn't Matter">Doesn't Matter</form:option>
			<form:option value="Specify an income range">Specify an income range</form:option>
		</form:select> --%>
      </div>
    </div>
    
    <div class="form-group incomeBlock">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
      	<form:select path="rAnnualIncome" class="form-control u1">
			<form:option value="">-- Annual Income --</form:option>
			<form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
			<form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
			<form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
			<form:option value="Above INR 7 Lakh">Above INR 7 Lakh</form:option>
		</form:select>
      </div>
    </div>
    
    <div class="form-group incomeBlock">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-8">
      	<!-- <input type="checkbox" name="includeProfiles" id="includeProfiles"> -->
      	<%-- <form:checkbox path="specifiedIncome" value="specifiedIncome" placeholder="Enter Height"/>
      	Include Profiles who have not specified their income --%>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>
      <div class="col-md-6">Other Details</div>
    </div>
    
     <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Profile created by</label>  
      <div class="col-md-6">
      
      	<form:select	path="rCreateProfileFor" id="createProfileFor" onfocus="removeBorder(this.id)" class="form-control">
									<form:option value="">Select</form:option>
									<form:option value="Self">Self</form:option>
									<form:option value="Son">Son</form:option>
									<form:option value="Daughter">Daughter</form:option>
									<form:option value="Brother">Brother</form:option>
									<form:option value="Sister">Sister</form:option>
									<form:option value="Friend">Friend</form:option>
									<form:option value="Relative">Relative</form:option>
			</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Diet</label>  
      <div class="col-md-6">
      	<form:select path="rDiet" class="form-control u" >
			<form:option value="">-- Select Diet--</form:option>
			<form:option value="Veg">Veg</form:option>
			<form:option value="Non-Veg">Non-Veg</form:option>
			<form:option value="Occasionally Non-Veg">Occasionally Non-Veg</form:option>
			<form:option value="Eggetarian">Eggetarian</form:option>
			<form:option value="Jain">Jain</form:option>
			<form:option value="Vegan">Vegan</form:option>
		</form:select>
      </div>
    </div>
    
</div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6 text-center">
     	<button type="submit" id="firstButton" class="btn1 btn btn-info">Save & Continue</button> 
      <!-- 	<a href="savePartnerProfile" class="btn1 btn btn-info">Save & Continue</a> -->
      </div>
    </div>
</div>
<!-- 1st Step ends here-->

</fieldset>
</form:form>
   
   </div>
   
   <div class="col-md-4">
     <img src="user/images/pad.jpg" class="img-responsive">
   </div>
    
   <div class="clearfix"></div>
   
   </div>
   
   </div>  
     

     
    
    
    <footer class="footer" id="footer"><!-- Section id-->
    	<div class="row">
            	<div class="col-md-6 col-sm-6">
                	<div class="logo-footer">
                    	<img src="user/images/logo-b.png" alt="" class="img-responsive" />
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                	<div class="contact-info">
                        <h5>Our Office</h5>
                        <p class="fs-12 address"><i class="fa fa-map-marker"></i>#### ###### ######,</p>
                        <p class="fs-12"><i class="fa fa-phone"></i>+91 ##########</p>
                	</div>
                </div>
            </div>
			<div class="row">
                <div class="col-md-6 col-sm-6">
                	<div class="social">
                    	<ul class="list-inline">
                        	<li><a href="#" ><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#" ><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" ><i class="fa fa-instagram"></i></a></li>
                            <li><a href="#" ><i class="fa fa-pinterest-p"></i></a></li>
                        </ul>
                    </div>                	
                </div>
                <div class="col-md-6 col-sm-6">
                	<div class="contact-info">
                        <p class="email-add"><span>Email:</span> info@############.com</p>
                    </div>
                </div>                
            </div>
    </footer>
        </div>
        <div class="copyright clearfix">
            <div class="">
                <p class="copy">Copyright 2017  | All Rights Reserved</p>
		    </div>
        </div>
   
    
    <script src="user/js/ie10-viewport-bug-workaround.js"></script>
    <script src="user/vendor/jquery/jquery.min.js"></script>
    <script src="user/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="user/vendor/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="user/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="user/js/theme.js"></script>
    <script src="user/js/custom.js"></script>
    <script defer src="user/vendor/woocommerce-FlexSlider/jquery.flexslider.js"></script>
    <script src="user/js/toucheffects.js"></script>
    <script src="js/custemValidation.js"></script>
    <script src="js/ajax.js"></script>

<script type="text/javascript">

function hideChildren() {
	 var maritalStatus=$("#maritalStatus").val();
	 if(maritalStatus == "Unmarried"){
		 $("#haveChildrenId").hide();
	 }else{
		 $("#haveChildrenId").show();
	 }
		
	}
</script>
</body>

</html>
