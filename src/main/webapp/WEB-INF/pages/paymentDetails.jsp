<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style>
 .error {
        color: red; font-weight: bold;
    }
</style>
<%-- <% pages1 = "createprofile"; %> --%>
<link href="${baseurl }/css/datepicker1.css" rel="stylesheet" type="text/css" />
<link href="${baseurl }/css/mdtimepicker.css" rel="stylesheet" type="text/css" />

<script src="${baseurl }/js/jquery-ui.min.js"></script>
<script src="${baseurl }/js/mdtimepicker.js"></script>
<div id="main">
<div class="container-fluid">
	<div class="page-header">
		<div class="pull-left">
			<h1>Create Profile</h1> 
		</div>
	</div>
	<div class="breadcrumbs">
		<ul>
			<li>
				<i class="fa fa-laptop"></i>
				<a href="javascript:void(0)" style="color: blue;text-decoration: none;">Profiles</a>
				<i class="fa fa-angle-right"></i>&nbsp;
			</li>
			<li>
				&nbsp;<i class="fa fa-user"></i>
				<span style="color: #999;cursor: auto;">Payment Details</span>
			</li>
		</ul>
		
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet" id="yw0">
				<div class="portlet-content w3-animate-zoom">
					<!-- Create Profile Form Starts Here -->
					<form:form commandName="partnerProfile" action="savePayment" class="form-horizontal" id="creteProfile-form" role="form"   method="post">
					<form:hidden path="id"/>
					<form:hidden path="userrequirementId"/>
						<div class="form-group">
							<div class="col-sm-12">
								<div class="errorMessage" id="Create Profile_invalid_em_" >
								
									<c:if test="${not empty msg}">
										<div class="alert alert-success fadeIn animated">${msg}</div>
									</c:if>
								</div>
								<form:hidden path="id"/>
								<c:if test="${not empty pageName}">
										<form:hidden path="pageName"/>
									</c:if>
							</div>
					  	</div>
						
						<%-- <div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.createdByName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:input path="created_by" type="text"  placeholder="Enter Created By" class="form-control nospecialCharacter" autocomplete="off" onblur="validate(this.id);" maxlength="255"/>						
								  		<span class="hasError" id="created_byError"></span>
								  		<div><form:errors path="created_by" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.executiveName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:input path="executiveName" type="text" class="form-control onlyCharacters"  placeholder=" Enter ExecutiveName" autocomplete="off" onblur="validate1(this.id);" maxlength="255"/>	
									<span class="hasError" id="executiveNameError"></span>
									<div><form:errors path="executiveName" cssClass="error" /></div>
									</div>
								</div>
							</div>
							<div class="col-md-3"></div>
						</div> --%>
						
						<div class="row">
							<div class="col-md-12">
								<legend>Payment Details: </legend>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Package<span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		 <form:select path="packageId" onfocus="removeBorder(this.id)" onblur="validate(this.id,'');"  class="form-control">
											<form:option value="">-- Select --</form:option>
											<form:options items="${packages}"/>
										</form:select>
								  		<div><form:errors path="packageId" cssClass="error" /></div> 
									</div>
							  	</div>
							</div>
							<%-- <div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Executive Name <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:input path="paymentObject.executiveName" class="form-control" placeholder="Enter executive name"/> 
								  		<div><form:errors path="payment.executiveName" cssClass="error" /></div>
									</div>
							  	</div>
							</div> --%>
							<%-- <div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Amount <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:input path="payment.paidAmount" class="form-control" placeholder="Enter amount"/> 
								  		<div><form:errors path="payment.paidAmount" cssClass="error" /></div>
									</div>
							  	</div>
							</div> --%>
							<%-- <div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Valid From<span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:input path="payment.validFrom" class="form-control" placeholder=""/> 
								  		<div><form:errors path="payment.validFrom" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Note/Comments<span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:textarea path="payment.note" class="form-control" placeholder="Enter note"/> 
								  		<div><form:errors path="payment.note" cssClass="error" /></div>
									</div>
							  	</div>
							</div> --%>
						</div>
						<div class="row">
							<div class="col-md-offset-5 col-md-4">
								<div class="form-group">
								<div class=" col-md-offset-1 col-md-6">
									<input class="btn btn btn-primary" type="submit" id="submit11" name="yt0" value="Add Payment">
									<input class="btn btn btn-danger" type="reset" id="reset11" name="yt1" value="Reset">
								</div>
								</div>
							</div>
						</div>	
					</form:form>					
					<!-- Create Profile Form Ends Here-->
				</div>
			</div>
		</div>
	</div>

</div>
</div>

<!-- <script type="text/javascript" src="js/custom.js"></script>		 -->
<script type="text/javascript">
/* var ss =new Date().getFullYear()-16;
$("#payment.validFrom").datepicker({
    dateFormat: "dd-MM-yy",
    changeDate : true,
	changeMonth : true,
	changeYear : true,
// 	maxDate :0,
	yearRange: '1950:' + ss
});
function validate(id, errorMessage)
{
	var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
	if($('#'+id).val() ==  null || $('#'+id).val() == ""  || $('#'+id).val()=="undefined" ) {
		$('style').append(styleBlock);
		$('#'+id).css('border-color','#cc0000');
		$('#'+id).attr('placeholder',errorMessage);
		$('#'+id).addClass('placeholder-style');
//			$('#'+id).css('color','#cc0000');
//			$('#'+id+'Error').text(errorMessage);
	}else{
		$('#'+id).css('border-color','');
		$('#'+id).removeClass('placeholder-style');
//			$('#'+id).css('color','');
//			$('#'+id+'Error').text("");
	}
}
 */



			$("#submit11").click(function()
					{
				
						if($('#email').val() ==  null || $('#email').val() == "" || $('#email').val()=="undefined"||$('#createProfileFor').val() ==  null || $('#createProfileFor').val() == ""  || $('#createProfileFor').val()=="undefined"||$('#lastName').val() ==  null || $('#lastName').val() == ""  || $('#lastName').val()=="undefined"||$('#dob').val() ==  null || $('#dob').val() == ""  || $('#dob').val()=="undefined"||$('#religion').val() ==  null || $('#religion').val() == ""  || $('#religion').val()=="undefined"||$('#motherTongue').val() ==  null || $('#motherTongue').val() == ""  || $('#motherTongue').val()=="undefined"||$('#currentCountry').val() ==  null || $('#currentCountry').val() == ""  || $('#currentCountry').val()=="undefined"||$('#currentState').val() ==  null || $('#currentState').val() == ""  || $('#currentState').val()=="undefined"||$('#currentCity').val() ==  null || $('#currentCity').val() == ""  || $('#currentCity').val()=="undefined"||$('#maritalStatus').val() ==  null || $('#maritalStatus').val() == ""  || $('#maritalStatus').val()=="undefined"||$('#caste').val() ==  null || $('#caste').val() == ""  || $('#caste').val()=="undefined"||$('#education').val() ==  null || $('#education').val() == ""  || $('#education').val()=="undefined"||$('#smoking').val() ==  null || $('#smoking').val() == ""  || $('#smoking').val()=="undefined"||$('#drinking').val() ==  null || $('#drinking').val() == ""  || $('#drinking').val()=="undefined"||$('#height').val() ==  null || $('#height').val() == ""  || $('#height').val()=="undefined"||$('#mobile').val() ==  null || $('#mobile').val() == ""  || $('#mobile').val()=="undefined"||$("input[name='gender']").is(':checked') != true||$("#mobile").val().length<10)
						{
							 if($('#email').val() ==  null || $('#email').val() == ""  || $('#email').val()=="undefined" ) 
							{
								$('#email').css('color','#cc0000');
								$('#email').css('border-color','#cc0000');
								$('#email').attr('placeholder','Please Enter Email');
								$('#email').addClass('placeholder-style');
							}
							 if($('#createProfileFor').val() ==  null || $('#createProfileFor').val() == ""  || $('#createProfileFor').val()=="undefined" ) 
							{
								$('#createProfileFor').css('color','#cc0000');
								$('#createProfileFor').css('border-color','#cc0000');
								$('#createProfileFor').attr('placeholder','Please CreateProfileFor');
								$('#createProfileFor').addClass('placeholder-style');
							}
							if($('#firstName').val() ==  null || $('#firstName').val() == ""  || $('#firstName').val()=="undefined" ) 
							{
								$('#firstName').css('color','#cc0000');
								$('#firstName').css('border-color','#cc0000');
								$('#firstName').attr('placeholder','Please FirstName');
								$('#firstName').addClass('placeholder-style');
							}
							if($('#lastName').val() ==  null || $('#lastName').val() == ""  || $('#lastName').val()=="undefined" ) 
							{
								$('#lastName').css('color','#cc0000');
								$('#lastName').css('border-color','#cc0000');
								$('#lastName').attr('placeholder','Please LastName');
								$('#lastName').addClass('placeholder-style');
							}
							if($('#dob').val() ==  null || $('#dob').val() == ""  || $('#dob').val()=="undefined" ) 
							{
								$('#dob').css('color','#cc0000');
								$('#dob').css('border-color','#cc0000');
								$('#dob').attr('placeholder','Please Enter Date Of Brith');
								$('#dob').addClass('placeholder-style');
							}
							if($('#religion').val() ==  null || $('#religion').val() == ""  || $('#religion').val()=="undefined" ) 
							{
								$('#religion').css('color','#cc0000');
								$('#religion').css('border-color','#cc0000');
								$('#religion').attr('placeholder','Please Enter Religion');
								$('#religion').addClass('placeholder-style');
							}
							if($('#motherTongue').val() ==  null || $('#motherTongue').val() == ""  || $('#motherTongue').val()=="undefined" ) 
							{
								$('#motherTongue').css('color','#cc0000');
								$('#motherTongue').css('border-color','#cc0000');
								$('#motherTongue').attr('placeholder','Please Enter Mother Tongue');
								$('#motherTongue').addClass('placeholder-style');
							}
							if($('#currentCountry').val() ==  null || $('#currentCountry').val() == ""  || $('#currentCountry').val()=="undefined" ) 
							{
								$('#currentCountry').css('color','#cc0000');
								$('#currentCountry').css('border-color','#cc0000');
								$('#currentCountry').attr('placeholder','Please Enter CurrentCountry');
								$('#currentCountry').addClass('placeholder-style');
							}
							if($('#currentState').val() ==  null || $('#currentState').val() == ""  || $('#currentState').val()=="undefined" ) 
							{
								$('#currentState').css('color','#cc0000');
								$('#currentState').css('border-color','#cc0000');
								$('#currentState').attr('placeholder','Please Enter Current State');
								$('#currentState').addClass('placeholder-style');
							}
							if($('#currentCity').val() ==  null || $('#currentCity').val() == ""  || $('#currentCity').val()=="undefined" ) 
							{
								$('#currentCity').css('color','#cc0000');
								$('#currentCity').css('border-color','#cc0000');
								$('#currentCity').attr('placeholder','Please Enter Current City');
								$('#currentCity').addClass('placeholder-style');
							}
							if($('#maritalStatus').val() ==  null || $('#maritalStatus').val() == ""  || $('#maritalStatus').val()=="undefined" ) 
							{
								$('#maritalStatus').css('color','#cc0000');
								$('#maritalStatus').css('border-color','#cc0000');
								$('#maritalStatus').attr('placeholder','Please Enter Marital Status');
								$('#maritalStatus').addClass('placeholder-style');
							}
							if($('#caste').val() ==  null || $('#caste').val() == ""  || $('#caste').val()=="undefined" ) 
							{
								$('#caste').css('color','#cc0000');
								$('#caste').css('border-color','#cc0000');
								$('#caste').attr('placeholder','Please Enter Caste');
								$('#caste').addClass('placeholder-style');
							}
							if($('#education').val() ==  null || $('#education').val() == ""  || $('#education').val()=="undefined") 
							{
								$('#education').css('color','#cc0000');
								$('#education').css('border-color','#cc0000');
								$('#education').attr('placeholder','Please Enter Education');
								$('#education').addClass('placeholder-style');
							}
							if($('#smoking').val() ==  null || $('#smoking').val() == ""  || $('#smoking').val()=="undefined") 
							{
								$('#smoking').css('color','#cc0000');
								$('#smoking').css('border-color','#cc0000');
								$('#smoking').attr('placeholder','Please Enter Smoking');
								$('#smoking').addClass('placeholder-style');
							}
							if($('#drinking').val() ==  null || $('#drinking').val() == ""  || $('#drinking').val()=="undefined") 
							{
								$('#drinking').css('color','#cc0000');
								$('#drinking').css('border-color','#cc0000');
								$('#drinking').attr('placeholder','Please Enter Drinking');
								$('#drinking').addClass('placeholder-style');
							}
							if($('#height').val() ==  null || $('#height').val() == ""  || $('#height').val()=="undefined") 
							{
								$('#height').css('color','#cc0000');
								$('#height').css('border-color','#cc0000');
								$('#height').attr('placeholder','Please Enter Height');
								$('#height').addClass('placeholder-style');
							}
							if($('#mobile').val() ==  null || $('#mobile').val() == ""  || $('#mobile').val()=="undefined") 
							{
								$('#mobile').css('color','#cc0000');
								$('#mobile').css('border-color','#cc0000');
								$('#mobile').attr('placeholder','Please Enter Mobile Number');
								$('#mobile').addClass('placeholder-style');
							}
							if($('#mobile').val().length<10) 
							{
								$('#mobile').css('color','#cc0000');
								$('#mobile').css('border-color','#cc0000');
								$('#mobile').attr('placeholder','Invalid Mobile Number');
								$('#mobile').addClass('placeholder-style');
							}
							if($("input[name='gender']").is(':checked') != true) 
							{
								
								$('#dis').css('color','#cc0000');
								$('#dis').css('border-color','#cc0000');
								$('#dis').text('Please Enter Gender');
								$('#dis').addClass('placeholder-style');
								
							} 
							return false;

						}
						
						
						$("#creteProfile").submit();
					});








$('.widow_divorcee_details').hide();
$(function(){
	check_mstatus();
});

function check_mstatus()
{
	var checked = $('input[name="maritalStatus"]:checked').val();

	if(checked!='Unmarried')
		$('.widow_divorcee_details').show();
	else
		$('.widow_divorcee_details').hide();
}

function validate1(id){
	var gender = $("#"+id).val()
	if(gender != null){
		$("#dis").text("");
	}
}

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
		$.fn.makeMultipartRequest('POST', '../getCitys', false,
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
$(".profiles").addClass("active");
$(".createProfile").addClass("active");
</script>
</body>

</html>

