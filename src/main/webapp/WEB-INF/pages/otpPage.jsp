<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<style>
.copyright {
position:fixed;
bottom:0;
width:100%;
}
.midcontnet {
    border-bottom: 12px solid #eeeeee;
    padding-bottom: 40px;
}
</style>
            <div class="col-md-5 col-sm-12">
            	
            </div>
            <div  class="clearfix"></div>    
    		</div>
     </div>
     
   <div class="row">
   <div class="midcontnet"><br>
    <div class="col-md-1"></div>
   <div class="col-md-8" style="min-height:350px;">
   	<form:form commandName="createProfile" class="form-horizontal" id="otpForm" role="form"   method="post">
   		<c:set var="msg" value="success"/>
   		<c:set var="msg2" value="failed"/>
   		<c:set var="msg3" value="mismatched"/>
	   <c:if test="${message == msg || message == msg3}">
	   		  <div class="form-group">
		   			<c:if test="${message == msg}">
			   			<span id="displayMsg">Enter OTP that has been sent on your mobile number xxxxxxx${mobileStr}</span> <br>
			   			<span id="displayErrMsg" class="hasError" style="font-size: 13px;color:red"></span><br>
			   		</c:if>
			   		<c:if test="${message == msg3 }">
			   			<span id="displayMsg"></span><br>
			   			<span id="displayErrMsg" class="hasError" style="font-size: 13px;color:red">OTP mismatched!! Please try again.</span> <br>
			   		</c:if>
			      <div class="col-md-3">
			      	<input id="otp1" type="password" name="otp1" class="form-control numericOnly u1"/>
			      </div>
		      		<div class="col-md-3">
			      		<button type="button" id="fourthButton" onclick="checkOTP();" value="Create Profile" class="btn4 btn btn-info">Continue</button>
			      	
			      	</div>
			  </div>
<!-- 			  <div class="form-group"> -->
		   		
			   		
<!-- 		      		<div class="col-md-3"> -->
<!-- 		      			<input type="text" placeholder="enter mobile Number" id="mobile" name="mobile" /> -->
<!-- 			      		<button type="button" id="editBtn" onclick="updateMobileNumber();" value="Edit MobileNmuber" class="btn4 btn btn-info">Edit MobileNmuber</button> -->
			      	
<!-- 			      	</div> -->
<!-- 			  </div> -->
			  <div class="form-group">
		   		
			   		
		      		<div class="col-md-3">
			      		<button type="button" id="resendBtn" onclick="resendOtp();" value="Create Profile" class="btn4 btn btn-info">Resend OTP</button>
			      	
			      	</div>
			  </div><br>
			  
		</c:if>
		<c:if test="${message == msg2 }">
    		<span>Some problem occured while sending OTP(check your internet connection)!! Please Try again.</span><br>
    		<div class="col-md-6">
		      	<a href="profile.htm?page=3" class="btn4 btn btn-info">Edit Mobile no.</a>
		      	
		      </div>
    	</c:if>
   		<div id="homepageBtn" hidden="true">
   			<div class="col-md-6">
		      	<a href="HomePage" class="btn4 btn btn-info">Go to HomePage</a>
		      	
		      </div>
   		</div>
   	</form:form>
   </div><br>
  <script type="text/javascript">
function checkOTP(){
	var receivedOTP = $("#otp1").val();
		if(receivedOTP==""){
			alert("Enter OTP");
			return false;
		}
		
		$('#otpForm').attr('action',"checkOtp");
		$("#otpForm").submit();
    	/* var formData = new FormData();
    	var mobileNum = ${profileToBeCreated.mobile};
    	
    	formData.append('mobileNo', mobileNum);
    	formData.append('otp1', receivedOTP);
		$.fn.makeMultipartRequest('POST', 'checkOtp', false,
				formData, false, 'text', function(data){
			if(data=="fail"){
				alert("OTP mismatched!!");
				$("#homepageBtn").removeAttr("hidden");
			}
		
	});  */
}
function resendOtp(){
	var formData = new FormData();
 		$.fn.makeMultipartRequest('POST', 'resendOtp', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var msg = jsonobj.message;
			var mobileStr = jsonobj.mobileStr;
			if(msg != "undefined" && "success"==msg){
				$("#displayErrMsg").html('');
				$("#displayMsg").html("For your request, we have resent the otp to your mobile number xxxxxxx"+mobileStr);
			}else if(msg != "undefined" && "limit_exceeded"==msg){
				$("#displayMsg").html('');
				$("#displayErrMsg").html("OTP limit for the day has been exceeded. Please try again later.");
			}	
			
		});
	
}
function validate(id, errorMessage)
{
	var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
	if($('#'+id).val() ==  null || $('#'+id).val() == ""  || $('#'+id).val()=="undefined" ) {
		$('style').append(styleBlock);
		$('#'+id).css('border-color','#cc0000');
		$('#'+id).css('color','#cc0000');
		$('#'+id).attr('placeholder',errorMessage);
		$('#'+id).addClass('placeholder-style your-class');
		return false;
	}else{
		$('#'+id).css('border-color','');
		$('#'+id).removeClass('placeholder-style your-class');
		return true;
	}
	
}
</script> 
<%@ include file="homeFooter2.jsp"  %>