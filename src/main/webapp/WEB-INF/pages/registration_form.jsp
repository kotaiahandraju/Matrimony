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
    <meta name="description" content="">
    <meta name="author" content="">

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

body {
	background:#F1F1F2;
}
.container { background:#FFF;}
.ilogo { padding:15px 0; border-bottom:12px solid #F1F1F2 }
.control-label { text-align:left;}
.midcontnet { border-bottom:12px solid #F1F1F2; padding-bottom:40px; }
.manditory{color: red;}
</style>
  </head>

  <body>
        <div class="container">
            <div class="row">
            <div class="ilogo">
            <div class="col-md-8 col-sm-7">
              <img src="user/images/logo.jpg" class="img-responsive">
              </div>
            <div  class="clearfix"></div>    
    		</div>
     </div>
     
   <div class="row">
   <div class="midcontnet">
   
   <div class="col-md-8">
   <form:form commandName="createProfile" action="#" class="form-horizontal" id="profileRegistration" method="post">
   <form:hidden path="id"/>
   <form:hidden path="userdetailsId"/>
<fieldset>

<!-- 1st Step starts here-->
<div id="firstForm">
    <div class="col-md-12">
      <h3>Thanks for Registering. Now lets build your profile</h3>
    </div>
    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">You live in <span class='manditory'>*</span></label>  
      <div class="col-md-6">
<!--       state,city,dosham,workingWith,companyName,diet,smoke,drink,bodyType,disability -->
      	<form:select path="state" class="form-control">
      		<form:option value="">-- Choose State --</form:option>
			<form:option value="AP">AP</form:option>
      	</form:select>
       	<br>
       	<form:select path="city" class="form-control">
      		<form:option value="">-- Choose City --</form:option>
			<form:option value="Guntur">Guntur</form:option>
			<form:option value="Vijayawada">Vijayawada</form:option>
      	</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your Marital Status <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="maritalStatus" class="form-control">
<%--       		<form:option value="">-- Choose Cast --</form:option> --%>
<%-- 			<form:options items="${cast}"></form:options> --%>
			<form:option value="">-- Martial Status --</form:option>
			<form:option value="Married">Married</form:option>
			<form:option value="Unmarried">Unmarried</form:option>
			<form:option value="Widow/Divorced">Widow/Divorced</form:option>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your Community <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="cast" class="form-control">
			<form:option value="">-- Choose Community --</form:option>
			<form:options items="${cast}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Gothram</label>  
      <div class="col-md-6">
      	<form:input path="gotram" type="text" class="form-control onlyCharacters" placeholder="Enter Gotram" maxlength="255"/>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Nakshatram</label>  
      <div class="col-md-6">
      	<form:select path="star" class="form-control">
			<form:option value="">-- Choose Nakshatram --</form:option>
			<form:options items="${star}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Dosham</label>  
      <div class="col-md-6">
      	<form:select path="dosham" class="form-control">
			<form:option value="">-- Dosham --</form:option>
			<form:option value="Yes">Yes</form:option>
			<form:option value="No">No</form:option>
			<form:option value="Don't Know">Don't Know</form:option>
		</form:select>
      	<!-- <label class="radio-inline" for="dosham-0">
          <input name="dosham" id="dosham-0" value="1" checked="checked" type="radio"> Yes
        </label> 
        <label class="radio-inline" for="dosham-1">
          <input name="dosham" id="dosham-1" value="2" type="radio"> No
        </label> 
        <label class="radio-inline" for="dosham-2">
          <input name="dosham" id="dosham-2" value="3" type="radio"> Don't Know
        </label>  -->
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
      	<button type="submit" id="firstButton" class="btn1 btn btn-info">CONTINUE...</button>
      </div>
    </div>
</div>
<!-- 1st Step ends here-->

<!-- 2nd Step starts here-->
<div id="secondForm">
    <div class="col-md-12">
      <h3>Just a few more steps! Please add your education & career details</h3>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your education level <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="education" class="form-control">
			<form:option value="">-- Choose Education --</form:option>
			<form:options items="${education}"></form:options>
		</form:select>
      </div>
    </div>

    <%-- <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your education field <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="occupation" class="form-control">
			<form:option value="">-- Choose Occupation --</form:option>
			<form:options items="${occupation}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group" style="display: none;">
      <label class="col-md-4 control-label" for="textinput">Colleges you attended</label>  
      <div class="col-md-6">
        <input type="text" name="college1" id="college1" class="form-control" maxlength="100" placeholder="Specify Highest Degree College"><br>
        <input type="text" name="college2" id="college2" class="form-control" maxlength="100" placeholder="Specify another College Name">
      </div>
    </div> --%>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">You work with</label>  
      <div class="col-md-6">
      	<form:select path="workingWith" class="form-control">
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
	  	<form:select path="occupation" class="form-control">
			<form:option value="">-- Choose Occupation --</form:option>
			<form:options items="${occupation}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group" style="display: none;">
      <label class="col-md-4 control-label" for="textinput">Your Employer Name</label>  
      <div class="col-md-6">
      	<form:input path="emply_type"  class="form-control onlyCharacters" maxlength="100" placeholder="Specify Current Organization"/>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your Annual Income <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      	<form:select path="salaryperyear" class="form-control">
			<form:option value="">-- Annual Income --</form:option>
			<form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
			<form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
			<form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
			<form:option value="Above INR 7 Lakh">Above INR 7 Lakh</form:option>
		</form:select>
      </div>
    </div>
    <!-- <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
        <div class="income_required">Why is income required <span title="Your income will be used for matchmaking. You can hide your income from others using Privacy Settings.">?</span>
          <div class="tooltip_wrapper">
            <div class="tt">
              <span onmouseover="cancelclosetime(); img_tool_tip('tool_top98');" onmouseout="set_tooltip_timeout('tool_top98');" id="tool_top98" style="left: 0px; top: 0px; display: none;" class="tooltip">
                <span class="top" style="left: -48px; top: 57px;"></span>
                <span class="middle-tip" style="left: -48px; top: 57px;">
                  Your income will be used for matchmaking. You can hide your income from others using Privacy Settings.
                </span>
                <span class="bottom" style="left: -48px; top: 57px;"></span>
              </span>
            </div>
            <a id="income_required_reg" href="javascript:void(0);" onmouseover="cancelclosetime();ttBehaviour(this.id);show_bubble_tool_tip(this.id, 'tool_top98')" onmouseout="canceldelayclosetime();set_tooltip_timeout('tool_top98')" class="tooltip_icon"></a>
          </div>                                
        </div>
      </div>
    </div> -->
    

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
      <button type="submit" id="secondButton" class="btn2 btn btn-info">CONTINUE...</button>
      </div>
    </div>
</div>
<!-- 2nd Step ends here-->

<!-- 3rd Step starts here-->
<div id="thirdForm">
    <div class="col-md-12">
      <h3>Add your lifestyle details and we are almost done</h3>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">What's your diet?</label>  
      <div class="col-md-6">
      	<form:select path="diet" class="form-control">
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
      	<form:select path="smoke" class="form-control">
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
      	<form:select path="drink" class="form-control">
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
      	<form:select path="height" class="form-control">
			<form:option value="">-- Choose Height --</form:option>
			<form:options items="${height}"></form:options>
		</form:select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Body Type</label>  
      <div class="col-md-6">
      	<form:select path="bodyType" class="form-control">
			<form:option value="">-- Choose Body Type --</form:option>
			<form:options items="${bodyType}"></form:options>
		</form:select>
      <!-- <label class="radio-inline" for="bodyType-0">
          <input name="bodyType" id="bodyType-0" value="1" checked="checked" type="radio">
         Slim
        </label> 
        <label class="radio-inline" for="bodyType-1">
          <input name="bodyType" id="bodyType-1" value="2" type="radio">
          Athletic
        </label> 
        <label class="radio-inline" for="bodyType-2">
          <input name="bodyType" id="bodyType-2" value="3" type="radio">
          Average
        </label> 
        <label class="radio-inline" for="bodyType-3">
          <input name="bodyType" id="bodyType-3" value="4" type="radio">
          Heavy
        </label>  -->
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Skin tone</label>  
      <div class="col-md-6">
      	<form:select path="complexion" class="form-control">
			<form:option value="">-- Choose Skin tone --</form:option>
			<form:options items="${complexion}"></form:options>
		</form:select>
      <!-- <label class="radio-inline" for="skinTone-0">
          <input name="skinTone" id="skinTone-0" value="1" checked="checked" type="radio">
         Very Fair
        </label> 
        <label class="radio-inline" for="skinTone-1">
          <input name="skinTone" id="skinTone-1" value="2" type="radio">
          Fair
        </label> 
        <label class="radio-inline" for="skinTone-2">
          <input name="skinTone" id="skinTone-2" value="3" type="radio">
          Wheatish
        </label> 
        <label class="radio-inline" for="skinTone-3">
          <input name="skinTone" id="skinTone-3" value="4" type="radio">
          Dark
        </label>  -->
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Your Mobile number <span class='manditory'>*</span></label>  
      <div class="col-md-6">
      <form:input path="mobile" class="form-control numericOnly" maxlength="13" placeholder="Mobile Number"/>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
      <button type="button" id="thirdButton" class="btn3 btn btn-info">CONTINUE...</button>
      </div>
    </div>
</div>
<!-- 3rd Step ends here-->

<!-- 4th Step starts here-->
<div id="fourthForm">
    <div class="col-md-12">
      <h3>One last thing! Describe yourself in a few words</h3>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">About myself</label>  
      <div class="col-md-6">
      	<form:textarea rows="6" path="aboutYourself" class="form-control onlyCharacters"></form:textarea>
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Any Disability?</label>  
      <div class="col-md-6">
      	<form:select path="disability" class="form-control">
			<form:option value="">-- Choose Disability --</form:option>
			<form:option value="None">None</form:option>
			<form:option value="Physical Disability">Physical Disability</form:option>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
      <button type="button" id="fourthButton" class="btn4 btn btn-info">Create Profile</button>
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
    <script>
    

</script>
</script>
  </body>

</html>
