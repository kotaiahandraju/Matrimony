<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%-- <% pages1 = "createprofile"; %> --%>
<link href="${baseurl }/css/datepicker1.css" rel="stylesheet" type="text/css" />
<link href="${baseurl }/css/mdtimepicker.css" rel="stylesheet" type="text/css" />

<script src="${baseurl }/js/jquery-ui.min.js"></script>
<script src="${baseurl }/js/mdtimepicker.js"></script>
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>Change Password</h1> 
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li>
					<i class="fa fa-laptop"></i>
					<a href="javascript:void(0)" style="color: blue;text-decoration: none;"><label>${first_name}</label> &nbsp;<label> ${last_name}</label></a>
					<i class="fa fa-angle-right"></i>&nbsp;
				</li>
				<li>
					&nbsp;<i class="fa fa-user"></i>
					<span style="color: #999;cursor: auto;">Change Password</span>
				</li>
			</ul>
			
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="portlet" id="yw0">
					<div class="portlet-content w3-animate-zoom">
						<div class="quote-form row">
							<form:form commandName="changePaddword" class="form-horizontal" id="change-password-form" role="form"   method="post">
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label class="col-sm-4 control-label required"><spring:message code="label.newPasswordName" text="default text" /><span style="color:red;">*</span></label>
											<div class="col-sm-8">
										  		<form:input path="password" onkeydown="removeBorder(this.id);" class="form-control form-control-solid placeholder-no-fix" type="password" required="true" autocomplete="off" placeholder="Enter New Password" />						
										  		<span class="hasError" id="passwordError"></span>
										  		<div><form:errors path="password" cssClass="error" /></div>										
											</div>
									  	</div>
									  </div>
									</div>
									<div class="row">
									  <div class="col-md-4">
									  	<div class="form-group">
											<label class="col-sm-4 control-label required"><spring:message code="label.confirmNewPasswordName" text="default text" /><span style="color:red;">*</span></label>
											<div class="col-sm-8">
										  		<form:input path="reTypedPassword" onkeydown="removeBorder(this.id);" class="form-control form-control-solid placeholder-no-fix" type="password" required="true" autocomplete="off" placeholder="Confirm New Password" />						
											  		<span class="hasError" id="reTypedPasswordError"></span>
											  		<div><form:errors path="reTypedPassword" cssClass="error" /></div>										
												</div>
										  	</div>
										  </div>
										</div>
										<div class="row">
										  <div class="col-md-4">
										  	<div class="form-group">
												<div class="col-sm-9 col-sm-offset-4">
													<label><input type="checkbox" id="chkbox" onclick="showCharacters(this)" title="Show Characters"/> Show Characters</label>
												</div>
										  	</div>
										  </div>
										</div> 
										  	
	                                    <div class="row">
											<div class="col-md-offset-5 col-md-4">
												<div class="form-group">
												<div class=" col-md-offset-1 col-md-6">
													<button class="btn btn btn-primary" type="button" id="submit11" name="yt0" onclick="changePassword()">Change Password</button>
													<input class="btn btn btn-danger" type="reset" id="reset11" name="yt1" value="Reset">
												</div>
												</div>
											</div>
										</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- <script type="text/javascript" src="js/custom.js"></script>		 -->
<script type="text/javascript">

function resetForm()
{
	
	removeBorder('password');
	$('#password').val("");
	$('#password').removeClass('your-class default-class');
	
	removeBorder('reTypedPassword');
	$('#reTypedPassword').val("");
	$('#reTypedPassword').removeClass('your-class default-class');


}

function changePassword(){
	if( $('#password').val().length == 0 || $('#password').val() =="" || $('#password').val()=="undefined" || $('#reTypedPassword').val().length == 0 || $('#reTypedPassword').val() =="" || $('#reTypedPassword').val()=="undefined")
	{
		if($('#password').val().length == 0 || $('#password').val() =="" || $('#password').val()=="undefined") 
		{
			    $('#password').css('color','red');
			    $("#password").css("border-color","#e73d4a");
			    $("#password").attr("placeholder","Please Enter Password");
			    $('#password').addClass('your-class');
		}
		
		if($('#reTypedPassword').val().length == 0 || $('#reTypedPassword').val() =="" || $('#reTypedPassword').val()=="undefined") 
		{
			    $('#reTypedPassword').css('color','red');
			    $("#reTypedPassword").css("border-color","#e73d4a");
			    $("#reTypedPassword").attr("placeholder","Please Enter Password");
			    $('#reTypedPassword').addClass('your-class');
		}

		return false;
	}	

	var password = $("#password").val();
	var reTypedPassword = $("#reTypedPassword").val();
	if(password != reTypedPassword){
		//$("#msg").text("Password and Confirm Password should be same");
		//$("#msg").show();
		alert("New Password and Confirm New Password should be same");
		//alert("Passwords didn't match");
		return false;
		
	}
	var formData = new FormData();

	formData.append('password',password);
	formData.append('reTypedPassword',reTypedPassword);
	
	jQuery.fn.makeMultipartRequest('POST', 'changePasswordAction', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
			//alert(jsonobj.message);
			if(jsonobj.message == "success"){
				alert("Password Updated Successfully");
				//var baseUrl = getUrl .protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
				//window.location.href= baseUrl+'/admin/homepage';
				var location = $("#loc").val();
		 	 	window.location.href =location+"/HomePage";
			}else{
				alert("Password not updated.");
			}
		});
}
function showCharacters(ele){
	if(ele.checked){
		$("#password").removeAttr("type");
		$("#password").attr("type","text");
		
		$("#reTypedPassword").removeAttr("type");
		$("#reTypedPassword").attr("type","text");
		
	}else{
		$("#password").removeAttr("type");
		$("#password").attr("type","password");
		
		$("#reTypedPassword").removeAttr("type");
		$("#reTypedPassword").attr("type","password");
	}
	
}

</script>
</body>

</html>

