<%@ include file="userStepsHeader.jsp"%>
<%@ include file="homeMenu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<style>
.btn {
margin-left:8px;
}
.copyright {
position:fixed;
bottom:0;
width:100%;
} 
.form-control {
    display: block;
    width: 30%;
    margin-left: 8px;
    height:34px;
    padding: 6px 10px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555555;
    background-color: #ffffff;
    background-image: none;
    border: 1px solid #BABABA;
    border-radius: 0px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
.midcontnet {
    border-bottom: none;
    padding-bottom: 40px;
}
@media only screen and (max-width: 640px) and (min-width: 320px) {
.form-control {
    display: block;
    width: 100%;
    margin-bottom:10px;
}
.copyright {
position:relative;

} }
</style>
<script type="text/javascript" src="${baseurl }/js/ajax.js"></script>				
				<div class="col-md-5 col-sm-12"></div>
	            <div  class="clearfix"></div>    
			
     
		<div class="col-md-12" style="min-height:350px;"><br><br>
			<div class="midcontnet">
				<div id="errorMsg" hidden="true" style="color:red;"></div>
				<div id="fpStep1" class="col-md-12">
					<div class="panel panel-success">
	   					<div class="panel-heading"> 
	   						Enter your registered email-id/phone number/username
<!-- 	   						<a class="pull-right" href="HomePage" style=" color:#000;">Go To HomePage </a> -->
	   					</div>
	   					
		             		
		             			<div class="panel-body">
		             				<input type="text" class="col-md-5 form-control" id="forgotPasswordInput" placeholder="email-id/phone number/username"   name="forgotPasswordInput"  /> 
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
		             				<div class="row" style="padding:20px">
		             					<div class="col-md-20" >	
			             				<input type="radio" name="sendTo"  value="emailTo" placeholder="Email To"> <span id="emailStr">New password send to my registered email id.</span>
			             				</div>
			             				<div class="col-md-20" id="mobile_option">	
										<input type="radio" name="sendTo"  value="smsTo" placeholder="Email To"> <span id="mobileStr">New password send to my registered mobile number.</span>
										</div><br>
										<div class="col-md-20">	
										<button type="button" class="btn btn-primary" onclick="checkVal(event);">Send</button>
										</div> 
									</div>
								</div>
						</form>
					</div>
   				</div>
<script src="${baseurl}/js/jquery-ui.min.js"></script>
<script type="text/javascript">

function displayFpNextPage(){
	var formData = new FormData();
	var inputVal = $("#forgotPasswordInput").val();
	
		var retVal = validateInput("forgotPasswordInput", "email-id/phone number/username");
		if(!retVal){
			return false;
		}else{
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
						$("#mobile_option").removeAttr("hidden");
					}else{
						$("#mobile_option").attr("hidden",true);
					}
					$("#fpStep1").attr("hidden",true);
					$("#fpStep2").removeAttr("hidden");
				}
		});
	}
}

function validateInput(id, errorMessage)
{
	var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
	if($('#'+id).val().trim() ==  null || $('#'+id).val().trim() == ""  || $('#'+id).val().trim()=="undefined" ) {
		$('style').append(styleBlock);
		$('#'+id).css('border-color','#cc0000');
		$('#'+id).css('color','#cc0000');
		$('#'+id).val('');
		$('#'+id).attr('placeholder',errorMessage);
		$('#'+id).addClass('placeholder-style your-class');
		return false;
//			$('#'+id).css('color','#cc0000');
//			$('#'+id+'Error').text(errorMessage);
	}else{
		$('#'+id).css('border-color','');
		$('#'+id).removeClass('placeholder-style your-class');
		$('#'+id).attr('placeholder','');
		return true;
//			$('#'+id).css('color','');
//			$('#'+id+'Error').text("");
	}
	
}

function checkVal(event){
	var selected_val = $("input[name=sendTo]:checked").val();
	if((typeof(selected_val) == "undefined") || (selected_val=="")){
		alert("Select any option!");
		return false;
		event.preventDefault();
	}else{
		$("#quote").submit();	
	}
}

</script>
</div></div>
<%@ include file="homeFooter.jsp"%>