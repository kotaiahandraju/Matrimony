<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

				<div class="col-md-5 col-sm-12"></div>
	            <div  class="clearfix"></div>    
			</div>
		</div>
     
		<div class="row">
			<div class="midcontnet">
				<div id="errorMsg" hidden="true" style="color:red;"></div>
				<div id="fpStep1">
					<div class="panel panel-success">
	   					<div class="panel-heading"> 
	   						Enter your registered email-id/phone number/username
	   					</div>
	   					
		             		
		             			<div class="panel-body">
		             				<input type="text" id="forgotPasswordInput" name="forgotPasswordInput" placeholder="" /> 
		             				<button name="fpNextBtn" type="button" id="fpNextBtn" class="btn btn-primary" onclick="displayFpNextPage()">Next</button>
								</div>
						
					</div>
				</div>
				
				<div id="fpStep2" hidden="true">
					<div class="panel panel-success">
	   					<div class="panel-heading"> 
	   						Select any of bellow options to send the new password to.
	   					</div>
	   					<form action="forgotPasswordAction" id="quote" name="quote" method="post">
		             		
		             			<div class="panel-body">
		             				<div class="row" style="left-padding:20">
		             					<div class="col-md-20">	
			             				<input type="radio" name="sendTo"  value="emailTo" placeholder="Email To"> <span id="emailStr">Email new password to my registered email id.</span>
			             				</div>
			             				<div class="col-md-20">	
										<input type="radio" name="sendTo"  value="smsTo" placeholder="Email To"> <span id="mobileStr">SMS new password to my registered mobile number.</span>
										</div>
										<div class="col-md-20">	
										<button type="submit" class="btn btn-primary" onclick="checkVal();">Send</button>
										</div> 
									</div>
								</div>
						</form>
					</div>
   				</div>
<script src="${baseurl }/js/jquery-ui.min.js"></script>
<script type="text/javascript">

function displayFpNextPage(){
	var formData = new FormData();
	var inputVal = $("#forgotPasswordInput").val();
	formData.append("forgotPasswordInput",inputVal);
	$.fn.makeMultipartRequest('POST', 'forgotPasswordPreAction', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var email_str = jsonobj.emailStr;
			var mobile_str = jsonobj.mobileStr;
			var message = jsonobj.message;
			if(message=="no-data"){
				$("#errorMsg").html('No data found for the given input. Please enter valid input.');
				$("#errorMsg").removeAttr("hidden");
			}else{
				$("#errorMsg").html('');
				$("#errorMsg").attr("hidden",true);
				if(email_str!=""){
    				$("#emailStr").html('Email new password to my registered email id xxxxxxxx'+email_str);
				}
				if(mobile_str!=""){
					$("#mobileStr").html('SMS new password to my registered mobile number xxxxxxx'+mobile_str);
				}
				$("#fpStep1").attr("hidden",true);
				$("#fpStep2").removeAttr("hidden");
			}
	});
	
}



function checkVal(){
	var selected_val = $("input[name=sendTo]:checked").val();
	if((typeof(selected_val) == "undefined") || (selected_val=="")){
		alert("Select any option!");
		return false;
	}
}

</script>

<%@ include file="userStepsFooter.jsp"%>