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
<script>

function validate(id, errorMessage)
{
	var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
	if($('#'+id).val() ==  null || $('#'+id).val() == ""  || $('#'+id).val()=="undefined" ) {
		$('style').append(styleBlock);
		$('#'+id).css('border-color','#cc0000');
		$('#'+id).css('color','#cc0000');
		$('#'+id).attr('placeholder',errorMessage);
		$('#'+id).addClass('placeholder-style your-class');
//			$('#'+id).css('color','#cc0000');
//			$('#'+id+'Error').text(errorMessage);
	}else{
		$('#'+id).css('border-color','');
		$('#'+id).removeClass('placeholder-style your-class');
//			$('#'+id).css('color','');
//			$('#'+id+'Error').text("");
	}
	
}
/* $('.validate').keydown(function() {
	var id = $(this).attr('id');
	removeBorder(id);
	
}); */

</script>

  </head>

  <body>
  
  
  
  
        <div class="container">
            <div class="row">
            <div class="ilogo">
            <div class="col-md-7 col-sm-7">
              <img src="user/images/logo.jpg" class="img-responsive">
            </div>
            <div class="col-md-5 col-sm-12">
            	<div class="stepwizard">
				    <div class="stepwizard-row">
				        <div class="stepwizard-step">
				            <button type="button" id="step1" class="btn btn-default btn-circle">1</button>
<!-- 				            <p>Cart</p> -->
				        </div>
				        <div class="stepwizard-step">
				            <button type="button" id="step2" class="btn btn-default btn-circle">2</button>
<!-- 				            <p>Shipping</p> -->
				        </div>
				        <div class="stepwizard-step">
				            <button type="button" id="step3" class="btn btn-default btn-circle">3</button>
<!-- 				            <p>Shipping</p> -->
				        </div>
				        <div class="stepwizard-step">
				            <button type="button"  id="step4" class="btn btn-default btn-circle" >4</button>
<!-- 				            <p>Payment</p> -->
				        </div> 
				    </div>
				</div>
            </div>
            <div  class="clearfix"></div>    
    		</div>
     </div>
     
   <div class="row">
   <div class="midcontnet">
   
   <div class="col-md-8">
   <form:form commandName="createProfile" action="#" class="form-horizontal" id="profileRegistration" method="post">
   <form:hidden path="id"/>
   <form:hidden path="redirectPage" value="family-details"></form:hidden>
<%--    <form:hidden path="userdetailsId"/> --%>
   <form:hidden path="email"/>
   <form:hidden path="createProfileFor"/>
   <form:hidden path="gender"/>
   <form:hidden path="firstName"/>
   <form:hidden path="lastName"/>
   <form:hidden path="dob"/>
   <form:hidden path="religion"/>
   <form:hidden path="motherTongue"/>
   <form:hidden path="currentCountry"/>
<fieldset>

<!-- 1st Step starts here-->
<div id="firstForm" class="dispnone">
    <div class="col-md-12">
      <h3>Thanks for Registering. Now let's build your profile</h3>
    </div>
    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">You live in <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="currentState" class="form-control u" onblur="validate(this.id,'');" onchange="getCitys(this.id)" onfocus="removeBorder(this.id)">
      		<form:option value="">-- Choose State --</form:option>
			<form:options items="${states }" ></form:options>
      	</form:select>
       	<br>
       	<form:select path="currentCity" class="form-control u" onblur="validate(this.id,'');" onchange="updateUserName(this.value)"  onfocus="removeBorder(this.id)" disabled="true">
      		<form:option value="">-- Choose City --</form:option>
			<form:options items="${citys }"></form:options>
      	</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your Marital Status <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="maritalStatus" class="form-control u" onchange="hideChildren();" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
			<form:option value="">-- Marital Status --</form:option>
			<form:option value="Married">Married</form:option>
			<form:option value="Unmarried">Unmarried</form:option>
			<form:option value="Widow/Divorced">Widow/Divorced</form:option>
		</form:select>
      </div>
    </div>
    
    <div class="form-group" id="haveChildrenId" style="display: none">
      <label class="col-md-4 control-label" for="textinput" >Have Children</label>  
      <div class="col-md-6">
      	<form:select path="haveChildren" class="form-control u">
			<form:option value="No Children">No Children</form:option>
			<form:option value="1">1</form:option>
			<form:option value="2">2</form:option>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your Community <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="caste" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
			<form:option value="">-- Choose Community --</form:option>
			<form:options items="${cast}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Gothram</label>  
      <div class="col-md-6">
      	<form:input path="gotram" type="text" class="form-control onlyCharacters u" placeholder="Enter Gotram" maxlength="255"/>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Nakshatram</label>  
      <div class="col-md-6">
      	<form:select path="star" class="form-control u">
			<form:option value="">-- Choose Nakshatram --</form:option>
			<form:options items="${star}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Dosham</label>  
      <div class="col-md-6">
      	<form:select path="dosam" class="form-control u">
			<form:option value="">-- Dosham --</form:option>
			<form:option value="Yes">Yes</form:option>
			<form:option value="No">No</form:option>
			<form:option value="Don't Know">Don't Know</form:option>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
      	<button type="submit" id="firstButton" onclick="firstForm(event);" class="btn1 btn btn-info">CONTINUE...</button>
      </div>
    </div>
</div>
<!-- 1st Step ends here-->

<!-- 2nd Step starts here-->
<div id="secondForm" class="dispnone">
    <div class="col-md-12">
      <h3>Just A Few More Steps! Please Add Your Education & Career Details</h3>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your education level <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="education" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
			<form:option value="">-- Choose Education --</form:option>
			<form:options items="${education}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">You work with</label>  
      <div class="col-md-6">
      	<form:select path="workingWith" class="form-control u">
			<form:option value="">-- Select --</form:option>
			<form:option value="Private Company">Private Company</form:option>
			<form:option value="Government/Public Sector">Government/Public Sector</form:option>
			<form:option value="Defense/Civil Services">Defense/Civil Services</form:option>
			<form:option value="Not Working">Not Working</form:option>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">As</label>  
      <div class="col-md-6">
	  	<form:select path="occupation" class="form-control u">
			<form:option value="">-- Choose Occupation --</form:option>
			<form:options items="${occupation}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group" style="display: none;">
      <label class="col-md-4 control-label" for="textinput">Your Employer Name</label>  
      <div class="col-md-6">
      	<form:input path="companyName"  class="form-control onlyCharacters u" maxlength="100" placeholder="Specify Current Organization"/>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your Annual Income <span class='manditory'></span></label>  
      <div class="col-md-6">
      	<form:select path="annualIncome" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
			<form:option value="">-- Annual Income --</form:option>
			<form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
			<form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
			<form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
			<form:option value="Above INR 7 Lakh">Above INR 7 Lakh</form:option>
		</form:select>
      </div>
    </div>
    

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
      <button type="submit" id="secondButton" onclick="secondForm(event);" class="btn2 btn btn-info">CONTINUE...</button>
      </div>
    </div>
</div>
<!-- 2nd Step ends here-->

<!-- 3rd Step starts here-->
<div id="thirdForm" class="dispnone">
    <div class="col-md-12">
      <h3>Add your lifestyle details and we are almost done</h3>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">What's your diet?</label>  
      <div class="col-md-6">
      	<form:select path="diet" class="form-control u" >
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
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Do you smoke? <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="smoking" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
			<form:option value="">-- Do you Smoke --</form:option>
			<form:option value="No">No</form:option>
			<form:option value="Occasionally">Occasionally</form:option>
			<form:option value="Yes">Yes</form:option>
		</form:select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Drink? <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="drinking" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
			<form:option value="">-- Do you Drink --</form:option>
			<form:option value="No">No</form:option>
			<form:option value="Occasionally">Occasionally</form:option>
			<form:option value="Yes">Yes</form:option>
		</form:select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your height <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="height" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
			<form:option value="">-- Choose Height --</form:option>
			<form:options items="${height}"></form:options>
		</form:select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Body Type</label>  
      <div class="col-md-6">
      	<form:select path="bodyType" class="form-control u">
			<form:option value="">-- Choose Body Type --</form:option>
			<form:options items="${bodyType}"></form:options>
		</form:select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Skin tone</label>  
      <div class="col-md-6">
      	<form:select path="complexion" class="form-control u">
			<form:option value="">-- Choose Skin tone --</form:option>
			<form:options items="${complexion}"></form:options>
		</form:select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your Mobile number <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      <form:input path="mobile" class="form-control numericOnly u"  onblur="validate(this.id,'Enter Mobile');" onkeydown="removeBorder(this.id)" maxlength="10" placeholder="Mobile Number"/>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
      <button type="button" id="thirdButton" onclick="thirdForm(event);" class="btn3 btn btn-info">CONTINUE...</button>
      </div>
    </div>
</div>
<!-- 3rd Step ends here-->

<!-- 4th Step starts here-->
<div id="fourthForm" class="dispnone">
    <div class="col-md-12">
      <h3>One last thing! Describe yourself in a few words</h3>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">About myself</label>  
      <div class="col-md-6">
      	<form:textarea rows="6" path="aboutMyself" class="form-control u"></form:textarea>
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Any Disability?</label>  
      <div class="col-md-6">
      	<form:select path="disability" class="form-control u">
			<form:option value="">-- Choose Disability --</form:option>
			<form:option value="None">None</form:option>
			<form:option value="Physical Disability">Physical Disability</form:option>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
      <button type="button" id="fourthButton" onclick="fourthForm(event);" value="Create Profile" class="btn4 btn btn-info">Create Profile</button>
<!--       <button type="button" id="skipfourthButton" onclick="skipfourthForm(event);" value="Skip" class="btn4 btn btn-info">Skip</button> -->
      <a style="color: blue;text-decoration: none;" href="${baseurl}/family-details">&nbsp;&nbsp;Skip</a>
      </div>
    </div>
</div>
<!-- 4th Step ends here-->

</fieldset>
</form:form>
   
   </div>
   
   <div class="col-md-4">
     <img src="user/images/pad.jpg" class="img-responsive"></div>
   
   <div class="clearfix"></div>
   </div>
   </div>  
     
     
     
     
     
     
     
     
     
     
    
    
    <div class="row">
    <footer class="footer" id="footer"><!-- Section id-->
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
        </div>
        <div class="copyright clearfix">
            <div class="">
                <p class="copy">Copyright 2017  | All Rights Reserved</p>
    </footer>
    
    </div>
               
        </div>

    <c:choose>
	    <c:when test="${empty param.page}">
 <c:set var="pagenum" value=""/> 
	    </c:when>
	    <c:otherwise>
	
	<c:set var="pagenum" value="${param.page}"/> 
	    </c:otherwise>
	</c:choose>
    
   
    
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
    <script src="js/common.js"></script>
    <script>
    

</script>
<script>
$( document ).ready(function() {
	if($("#currentState").val()== null   || $("#currentState").val() == "" || $("#currentState").val()=="undefined"){
		$("#currentCity").attr("readonly", true);
	}else{
		$("#currentCity").removeAttr("disabled");
	}
	   $("#secondForm").hide();
	      $("#thirdForm").hide();
	      $("#fourthForm").hide();

	 var pagenum = "${pagenum}";
	   if(pagenum ==1){
		   $("#firstForm").show();
		 	$('#secondForm').hide();
			$("#thirdForm").hide();
			$('#fourthForm').hide();
			 $("#step1").addClass("btn-primary");
			 $("#step2").removeClass("btn-primary");
			 $("#step3").removeClass("btn-primary");
			 $("#step4").removeClass("btn-primary");
			
			
	   }
	   if(pagenum ==2){
		   $("#firstForm").hide();
		 	$('#secondForm').show();
			$("#thirdForm").hide();
			$('#fourthForm').hide();
			
			$("#step1").removeClass("btn-primary");
			 $("#step2").addClass("btn-primary");
			 $("#step3").removeClass("btn-primary");
			 $("#step4").removeClass("btn-primary");
	   }
	   if(pagenum ==3){
		   $("#firstForm").hide();
		 	$('#secondForm').hide();
			$("#thirdForm").show();
			$('#fourthForm').hide();
			
			$("#step1").removeClass("btn-primary");
			 $("#step2").removeClass("btn-primary");
			 $("#step3").addClass("btn-primary");
			 $("#step4").removeClass("btn-primary");
	   }
	   if(pagenum ==4){
		   $("#firstForm").hide();
		 	$('#secondForm').hide();
			$("#thirdForm").hide();
			$('#fourthForm').show();
			
			$("#step1").removeClass("btn-primary");
			 $("#step2").removeClass("btn-primary");
			 $("#step3").removeClass("btn-primary");
			 $("#step4").addClass("btn-primary");
	   }
});

function firstForm(event)
{
	if($('#currentState').val() ==  null || $('#currentState').val() == "" || $('#currentState').val()=="undefined" || 
		$('#currentCity').val() ==  null || $('#currentCity').val() == "" || $('#currentCity').val()=="undefined" ||
		$('#maritalStatus').val() ==  null || $('#maritalStatus').val() == "" || $('#maritalStatus').val()=="undefined" || 
		$('#caste').val() ==  null || $('#caste').val() == "" || $('#caste').val()=="undefined")
	{
		if($('#currentState').val() ==  null || $('#currentState').val() == "" || $('#currentState').val()=="undefined" ) 
		{			    
			$('#currentState').css('border-color','red');
			$('#currentState').css('color','#cc0000');
			$('#currentState').addClass('your-class');
// 			$('#currentStateError').css('color','red');
// 			$("#currentStateError").text("Created By cannot be blank.");
		}
		if($('#currentCity').val() ==  null || $('#currentCity').val() == "" || $('#currentCity').val()=="undefined" ) 
		{			    
			$('#currentCity').css('border-color','red');
		    $('#currentCity').css('color','#cc0000');
			$('#currentCity').addClass('your-class');
	    }
		if($('#maritalStatus').val() ==  null || $('#maritalStatus').val() == "" || $('#maritalStatus').val()=="undefined" ) 
		{			    
		    $('#maritalStatus').css('border-color','red');
		    $('#maritalStatus').css('color','#cc0000');
			$('#maritalStatus').addClass('your-class');
	    }
		if($('#caste').val() ==  null || $('#caste').val() == "" || $('#caste').val()=="undefined" ) 
		{	
			$('#caste').css('border-color','red');
		    $('#caste').css('color','#cc0000');
			$('#caste').addClass('your-class');
	    }
		event.preventDefault();
		return false;
	}
	else
	{
		$("#firstButton").attr("disabled",true);
	    $("#firstButton").val("Please wait...");
	    $("#firstForm").hide();
	    $('#secondForm').css({'display':'block'});
	    ChangeUrl('page1', 'profile.htm?page=2');
	    
	    $("#step1").removeClass("btn-primary");
		 $("#step2").addClass("btn-primary");
		 $("#step3").removeClass("btn-primary");
		 $("#step4").removeClass("btn-primary");
	    
    	event.preventDefault();
    	return true;
	}
}

function secondForm(event)
{
	if($('#education').val() ==  null || $('#education').val() == "" || $('#education').val()=="undefined") 
	{
		if($('#education').val() ==  null || $('#education').val() == "" || $('#education').val()=="undefined" ) 
		{			    
			$('#education').css('border-color','red');
			$('#education').css('color','#cc0000');
			$('#education').addClass('your-class');
		}
		 /* if($('#salaryperyear').val() ==  null || $('#salaryperyear').val() == "" || $('#salaryperyear').val()=="undefined" ) 
		{			    
			$('#salaryperyear').css('border-color','red');
			$('#salaryperyear').css('color','#cc0000');
			$('#salaryperyear').addClass('your-class');
		} */ 
		event.preventDefault();
		return false;
	}
	else
	{
		$("#firstForm").hide();
		$('#secondForm').hide();
		$("#thirdForm").show();
		ChangeUrl('page1', 'profile.htm?page=3');
		event.preventDefault();
		
		$("#step1").removeClass("btn-primary");
		 $("#step2").removeClass("btn-primary");
		 $("#step3").addClass("btn-primary");
		 $("#step4").removeClass("btn-primary");
		return true;
	}
}

function thirdForm(event)
{
	if($('#smoking').val() ==  null || $('#smoking').val() == "" || $('#smoking').val()=="undefined" || 
		$('#drinking').val() ==  null || $('#drinking').val() == ""  || $('#drinking').val()=="undefined" || 
		$('#height').val() ==  null || $('#height').val() == ""  || $('#height').val()=="undefined" || 
		$('#mobile').val() ==  null || $('#mobile').val() == ""  || $('#mobile').val()=="undefined")
	{
		if($('#smoking').val() ==  null || $('#smoking').val() == "" || $('#smoking').val()=="undefined") 
		{			    
			$('#smoking').css('border-color','red');
			$('#smoking').css('color','#cc0000');
			$('#smoking').addClass('your-class');
		}
		if($('#drinking').val() ==  null || $('#drinking').val() == "" || $('#drinking').val()=="undefined") 
		{			    
			$('#drinking').css('border-color','red');
			$('#drinking').css('color','#cc0000');
			$('#drinking').addClass('your-class');
		}
		if($('#height').val() ==  null || $('#height').val() == "" || $('#height').val()=="undefined") 
		{			    
			$('#height').css('border-color','red');
			$('#height').css('color','#cc0000');
			$('#height').addClass('your-class');
		}
		if($('#mobile').val() ==  null || $('#mobile').val() == "" || $('#mobile').val()=="undefined") 
		{			    
			$('#mobile').css('border-color','red');
			$('#mobile').css('color','#cc0000');
			$('#mobile').addClass('your-class');
		}
		event.preventDefault();
		return false;
	}
	else
	{
		$("#firstForm").hide();
		$('#secondForm').hide();
		$("#thirdForm").hide();
		$('#fourthForm').show();
		ChangeUrl('page1', 'profile.htm?page=4');
		event.preventDefault();
		
		$("#step1").removeClass("btn-primary");
		 $("#step2").removeClass("btn-primary");
		 $("#step3").removeClass("btn-primary");
		 $("#step4").addClass("btn-primary");
		return true;
	}
}
function fourthForm(event){
	var formOne = firstForm(event);
	var formTwo = secondForm(event);
	var formThree = thirdForm(event);
	if(!formOne){
		ChangeUrl('page1', 'profile.htm?page=1');
		$("#firstForm").show();
	 	$('#secondForm').hide();
		$("#thirdForm").hide();
		$('#fourthForm').hide();
		return false;
	}
	if(!formTwo){
		ChangeUrl('page1', 'profile.htm?page=2');
		$("#firstForm").hide();
	 	$('#secondForm').show();
		$("#thirdForm").hide();
		$('#fourthForm').hide();
		return false;
	}
	if(!formThree){
		ChangeUrl('page1', 'profile.htm?page=3');
		$("#firstForm").hide();
	 	$('#secondForm').hide();
		$("#thirdForm").show();
		$('#fourthForm').hide();
		return false;
	}
	else
	{
	}
		/* $("#fourthButton").attr("disabled",true);
	    $("#fourthButton").val("Please wait...");
	    // send otp to verify mobile number
	    	var formData = new FormData();
	    	var mobileNum = $("#mobile").val();
	    	formData.append('mobileNo', mobileNum);
			$.fn.makeMultipartRequest('POST', 'createOtp', false,
					formData, false, 'text', function(data){
				var jsonobj = $.parseJSON(data);
				
			
		}); */
	    //
		//$('#profileRegistration').attr('action',"saveUserProfile");
	    $('#profileRegistration').attr('action',"verifyMobileNumber");
		$("#profileRegistration").submit();
		event.preventDefault();
}

function skipfourthForm(){
	var location = "${baseurl}";
	window.location.href =location+"/family-details";
	//event.preventDefault();
}

$("#step1").click(function(){
	$("#firstForm").show();
 	$('#secondForm').hide();
	$("#thirdForm").hide();
	$('#fourthForm').hide();
	ChangeUrl('page1', 'profile.htm?page=1');
	$("#step1").addClass("btn-primary");
	 $("#step2").removeClass("btn-primary");
	 $("#step3").removeClass("btn-primary");
	 $("#step4").removeClass("btn-primary");
});

$("#step2").click(function(){
	$("#firstForm").hide();
 	$('#secondForm').show();
	$("#thirdForm").hide();
	$('#fourthForm').hide();
	ChangeUrl('page1', 'profile.htm?page=2');
	$("#step1").removeClass("btn-primary");
	 $("#step2").addClass("btn-primary");
	 $("#step3").removeClass("btn-primary");
	 $("#step4").removeClass("btn-primary");
});

 $("#step3").click(function(){
	 	$("#firstForm").hide();
	 	$('#secondForm').hide();
		$("#thirdForm").show();
		$('#fourthForm').hide();
		ChangeUrl('page1', 'profile.htm?page=3');
		$("#step1").removeClass("btn-primary");
		 $("#step2").removeClass("btn-primary");
		 $("#step3").addClass("btn-primary");
		 $("#step4").removeClass("btn-primary");
});

$("#step4").click(function(){
	$("#firstForm").hide();
 	$('#secondForm').hide();
	$("#thirdForm").hide();
	$('#fourthForm').show();
	ChangeUrl('page1', 'profile.htm?page=4');
	$("#step1").removeClass("btn-primary");
	 $("#step2").removeClass("btn-primary");
	 $("#step3").removeClass("btn-primary");
	 $("#step4").addClass("btn-primary");
}); 

function getCitys(id){
	
	if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
		$("#currentCity").attr("readonly", true);
		$("#currentCity").attr("disabled" ,"disabled");
		$("#currentCity").val("");
	}else{
		$("#currentCity").removeAttr("disabled");
		$("#currentCity").removeAttr("readonly");
		var stateId =$("#"+id).val();
		var formData = new FormData();
	     formData.append('id', stateId);
		$.fn.makeMultipartRequest('POST', 'getCitys', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.citys;
// 			alert(alldata);
         $("#currentCity").empty();
			$("#currentCity").append("<option value='' >Choose City</option>");
			
			$.each(alldata, function(i, tests) {
				$("#currentCity").append("<option value="+tests.id+" >"+ tests.name+"</option>");
			});
			
		});
		
	}
}

	function ChangeUrl(page, url) {
	      if (typeof (history.pushState) != "undefined") {
	          var obj = { Page: page, Url: url };
	          history.pushState(obj, obj.Page, obj.Url);
	      } else {
	          alert("Browser does not support HTML5.");
	      }
	  }
 
	$('.u').blur(function() {
		var id = $(this).attr('id');
		var value=$("#"+id).val();
		var constant ='u';
		var formData = new FormData();
	     formData.append('id', id);
	     formData.append('value', value);
	     formData.append('constant', constant);
		$.fn.makeMultipartRequest('POST', 'autoCompleteSave', false,
				formData, false, 'text', function(data){
			
		});
// 		alert(id);
		
	});
	$('.u').blur(function() {
		var id = $(this).attr('id');
		var value=$("#"+id).val();
		var constant ='u';
		var formData = new FormData();
	     formData.append('id', id);
	     formData.append('value', value);
	     formData.append('constant', constant);
		$.fn.makeMultipartRequest('POST', 'autoCompleteSave', false,
				formData, false, 'text', function(data){
			
		});
		
	});
	$(function(){
		$("#firstForm").removeClass("dispnone");
		$("#secondForm").removeClass("dispnone");
		$("#thirdForm").removeClass("dispnone");
		$("#fourthForm").removeClass("dispnone");
//	 	$(".dispnone").addClass("hiddencss");
//	 	$('body').removeClass("dispnone");
	});
	function hideChildren() {
		 var maritalStatus=$("#maritalStatus").val();
		 if(maritalStatus == "Unmarried" || maritalStatus ==""){
			 $("#haveChildrenId").hide();
			 $("#haveChildren").val();
		 }else{
			 $("#haveChildrenId").show();
		 }
		}
</script>
  </body>

</html>
