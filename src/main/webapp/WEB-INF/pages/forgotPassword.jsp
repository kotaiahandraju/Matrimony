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
		             				<input type="radio" name="sendTo" placeholder="Email To"> <span id="emailStr">Email new password to my registered email id.</span>
									<input type="radio" name="sendTo" placeholder="Email To"> <span id="mobileStr">SMS new password to my registered.</span> 
								</div>
						</form>
					</div>
   				</div>
<script src="${baseurl }/js/jquery-ui.min.js"></script>
<script type="text/javascript">

function displayFpNextPage(){
	FormData formData = new FormData();
	var inputVal = $("#forgotPasswordInput").val();
	formData.append("forgotPasswordInput",inputVal);
	$.fn.makeMultipartRequest('POST', 'forgotPasswordPreAction', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var email = jsonobj.emailStr;
			var mobile = jsonobj.mobileStr;
			
				if(email!=""){
    				$("#emailStr").val('Email new password to my registered email id xxxxxxxx'+email);
				}
				if(mobile!=""){
    				var str = 'Email new password to my registered email id xxxxxxxx'+email;
				}
    			$('#matches').html('');
    			$(str).appendTo("#matches");
    			$("#table_footer").prop("hidden",true);
    			$("#altLists").prop("hidden",true);
    		
			
	});
	$("#fpStep1").attr("hidden",true);
	$("#fpStep2").removeAttr("hidden");
}

</script>

<%@ include file="userStepsFooter.jsp"%>