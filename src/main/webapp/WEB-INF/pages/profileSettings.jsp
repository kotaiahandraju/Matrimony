<%@ include file="userCommonHeader.jsp"%>
 	
		<script>
			/* $(document).ready(function() {
				$('.nav-tabs > li > a').click(function(event){
					event.preventDefault();//stop browser to take action for clicked anchor
					
					//get displaying tab content jQuery selector
					var active_tab_selector = $('.nav-tabs > li.active > a').attr('href');					
					
					//find actived navigation and remove 'active' css
					var actived_nav = $('.nav-tabs > li.active');
					actived_nav.removeClass('active');
					
					//add 'active' css into clicked navigation
					$(this).parents('li').addClass('active');
					
					//hide displaying tab content
					$(active_tab_selector).removeClass('active');
					$(active_tab_selector).addClass('hide');
					
					//show target tab content
					var target_tab_selector = $(this).attr('href');
					$(target_tab_selector).removeClass('hide');
					$(target_tab_selector).addClass('active');
				});
			}); */
		</script>
		<style>
			/** Start: to style navigation tab **/
			.nav {
			  margin-bottom: px;
			  margin-left: 0;
			  list-style: none;
			}
			.notepa {
			font-size:13px;
			text-align:justify;
			}
			.btnre {
			margin-bottom:5px;
			float: left;
            margin: 5px;
			}
           .manage {
           border:1px solid #f1f1f1;
           margin-top:8px;
             }
             .fcheck {
             vertical-align: -webkit-baseline-middle;
             float:right;
             margin-top:5px;
             }
			.nav > li > a {
			  display: block;
			}
			a {
			list-style:none;
			text-decoration:none;
			}
			
			.nav-tabs{
			  *zoom: 1;
			}

			.nav-tabs:before,
			.nav-tabs:after {
			  display: table;
			  content: "";
			}

			.nav-tabs:after {
			  clear: both;
			}

			.nav-tabs > li {
			  float: left;
			}
			legend {
			font-size:16px;
			padding:5px;
			margin-bottom:10px;
			}

			.nav-tabs > li > a {
			  padding-right: 12px;
			  padding-left: 12px;
			  margin-right: 2px;
			  line-height: 14px;
			}

			.nav-tabs {
			  border-bottom: 1px solid #ddd;
			}

			.nav-tabs > li {
			  margin-bottom: -1px;
			}

			.nav-tabs > li > a {
			  padding-top: 8px;
			  padding-bottom: 8px;
			  line-height: 18px;
			  border: 1px solid transparent;
			  -webkit-border-radius: 4px 4px 0 0;
				 -moz-border-radius: 4px 4px 0 0;
					  border-radius: 4px 4px 0 0;
			}

			.nav-tabs > li > a:hover {
			  border-color: #eeeeee #eeeeee #dddddd;
			}

			.nav-tabs > .active > a,
			.nav-tabs > .active > a:hover {
			  color: #555555;
			  cursor: default;
			  background-color: #ffffff;
			  border: 1px solid #ddd;
			  border-bottom-color: transparent;
			}
			.control-label {
			color:#000;
			font-size:13px;
			}
			li {
			  line-height: 18px;
			}
			
			.tab-content.active{
				display: block;
			}
			
			.tab-content.hide{
				display: none;
			}
::-webkit-input-placeholder {
color: #cfcfcf !important;

}
 
:-moz-placeholder { /* Firefox 18- */
color: #cfcfcf !important; 

}
 
::-moz-placeholder {  /* Firefox 19+ */
color: #cfcfcf !important;  

}
 
:-ms-input-placeholder {  
color: #cfcfcf !important;  
}
			
			/** End: to style navigation tab **/
		</style>
<div class="products">
	<div class="container" style="background: #FFF;">
		<div class="mid-grids">
			<jsp:include page="sideGridForSettings.jsp" />
			<div class="col-md-8 products-grid-left">
				<form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
	
    
					<div id="change_password" class="all_settings_divs">
					<div class="panel panel-success">
							<div class="panel-heading">
								Change Password
							</div>
							<div class="panel-body">
							<div class="row">
							<div class="col-md-12">
					<!-- <div class="row">
					<div class="col-md-4">
						<h3 style='color: black; font-size: 16px;'>Enter Current Password</h3><br>
						<input style='border-style: solid; border-radius: 4px;' type="password" id="currentPassword" required="required">
						</div>
						<div class="col-md-3">
						<h3 style='color: black; font-size: 16px;'>Enter New Password</h3><br>
						<input style='border-style: solid; border-radius: 4px;' type="password" id="newPassword1" required="required">
						</div>
						<div class="col-md-4 col-md-offset-1">
						<h3 style='color: black; font-size: 16px;'>Confirm New Password</h3><br>
						<input style='border-style: solid; border-radius: 4px;' type="password" id="newPassword2" required="required">						
						</div>						
					</div> -->
					
	<div class="form-group">
     <label class="col-sm-5 control-label">Enter Current Password</label>
     <div class="col-sm-5">
     <input class="form-control" type="password" id="currentPassword" placeholder="Enter Current Password" onblur="this.placeholder='Enter Current Password'" onfocus="this.placeholder=''" required="required" >
    </div>
    </div>
    <div class="form-group">
     <label class="col-sm-5 control-label">Enter New Password</label>
     <div class="col-sm-5">
     <input class="form-control" type="password" id="newPassword1" placeholder="Enter New Password" onblur="this.placeholder='Enter New Password'" onfocus="this.placeholder=''" required="required" >
    </div>
    </div>
     <div class="form-group">
     <label class="col-sm-5 control-label">Confirm New Password</label>
     <div class="col-sm-5">
     <input class="form-control" type="password" id="newPassword2" placeholder="Confirm New Password" onblur="this.placeholder='Confirm New Password'" onfocus="this.placeholder=''" required="required" >
    </div>
    </div>
					<br>
					<div class="col-md-12">
					<div class="col-md-6"></div>
						<div class="col-md-2">
						<input  type="button" class="btn btn-primary btnre"  value="Submit" onclick="submitProfileSettings('change_password')" />
						</div>
						<div class="col-md-2 ">
						<input  type="button" class="btn btn-danger btnre"  value="Reset" onclick="submitProfileSettings('change_password')" />
						</div>
						</div>
					</div></div></div></div></div>
					<div id="profile_settings" class="all_settings_divs" hidden="true">						
					<div class="panel panel-success">
							<div class="panel-heading">
								Profile Settings
							</div>
							<div class="panel-body">
							<div class="row">
							<div class="col-md-12">
								<h4 style='font-size: 16px; line-height: 31px; color: black;'>Your Profile Privacy has been set as "Show my Profile to all including visitors"</h4>
						<p style='line-height: color: black; 41px; margin-bottom:5px; '><input type="radio" style='color: black;'> Show my Profile to all including visitors.
						<br>
						<input type="radio" style='color: black; margin-bottom:5px;'> Show my Profile to registered members only.</p>
						<p style='color: black;'><input  style='color: black;' type="checkbox" id="know_ishortlisted">&nbsp;&nbsp;Let others know that I shortlisted their profile.</p></input><br>
						<input type="button" class="btn btn-success" align='right' value="Submit" onclick="submitProfileSettings('profile_settings')" />
					<br></div>
					</div></div></div></div>
					<div id="membership_details" class="all_settings_divs" hidden="true">
						<div class="panel panel-success">
							<div class="panel-heading">
								Membership Details
							</div>
							<div class="panel-body">
							<div class="row">
							<div class="col-md-6">
								<table>
								<h3><legend>Membership Details</legend></h3>
									<tr>
										<td>Matrimony ID</td>
										<td>: &nbsp;</td>
										<td id="matrimony_id"></td>
									</tr>
									<tr>
										<td>Membership Type</td>
										<td>:</td>
										<td id="membership_type"></td>
									</tr>
									<tr>
										<td>Membership Status</td>
										<td>:</td>
										<td id="membership_status"></td>
									</tr>
									<tr>
										<td>Membership Validity &nbsp;</td>
										<td>:</td>
										<td id="membership_validity"></td>
									</tr>
									<tr>
										<td>Renewal Due Date</td>
										<td>:</td>
										<td id="renewal_date"></td>
									</tr>
									<tr>
										<td>Last Renewed</td>
										<td>:</td>
										<td id="last_renewed"></td>
									</tr>
								</table>
								</div>
								<div class="col-md-6">
								<table>
								<h3><legend>Mobile Number Count</legend></h3>
									<tr>
										<td>Total  Count &nbsp;</td>
										<td>: &nbsp;</td>
										<td id="total_profile_count"></td>
									</tr>
									<tr>
										<td> Count Left</td>
										<td>:</td>
										<td id="left_profile_count"></td>
									</tr> 
								</table>
								<br>
								<table>
								<h3><legend>SMS Count</legend></h3>
									<tr>
										<td>Total Count &nbsp;</td>
										<td>: &nbsp;</td>
										<td id="total_profile_count"></td>
									</tr>
									<tr>
										<td>Count Left</td>
										<td>:</td>
										<td id="left_profile_count"></td>
									</tr>
								</table><br>
								</div>
								</div>
								<div class="row" style='border-top: 2px dashed; line-height: 31px;'>
								<div class="col-md-6">
								<table>
								<h2><legend>ADD ON PACKAGES</legend></h2>
								<h4>ASTROMATCH</h4>
								<tr>
								<td>Last Renewed &nbsp;</td>
									<td>: &nbsp;</td>
								<td>09 March 2018</td>
								</tr>
								<tr>
								<td>Total Count &nbsp;</td>
								<td>:</td>
								<td>45</td>
								</tr>
								<tr>
								<td>Count Left</td>
								<td>:</td>
								<td>12</td>
								</tr>
								</table>
								</div>								
								</div>								
							</div>
						</div>
					</div>
					<div id="deactivate_profile" class="all_settings_divs" hidden="true" style="color: black;">
					<div class="panel panel-success">
							<div class="panel-heading">
							Activate/Deactivate Profile
							</div>
							<div class="panel-body">
							<div class="row">
							<div class="col-md-12">
						<c:if test="${cacheGuest.status} == '1'">
							Your profile is currently Active. Click on below button if you want to deactivate your profile.<br>
							<input type="button" type="button" value="Deactivate My Account" onclick="changeProfileStatus(0)" />
						</c:if><br>
						<c:if test="${cacheGuest.status} == '2'">
							Your profile is currently In-Active. Click on below button if you want to activate your profile.<br>
						Activate/Deactivate Profile<br>
						</c:if><br>
						<c:if test="${cacheGuest.status == '1'}">
							Your profile is currently Active. <br>
							Click on below button if you want to deactivate your profile.You can activate it again whenever you want using settings.<br>
							<br>
							<input type="button" class="btn btn-warning"   value="Deactivate My Account" onclick="changeProfileStatus(0)" />
						</c:if><br>
						<c:if test="${cacheGuest.status == '0'}">
							Your profile is currently In-Active. Click on below button to activate your profile.<br>
							<input type="button"  class="btn btn-warning" style="float: right;" value="Activate My Account" onclick="changeProfileStatus(1)" />
						</c:if>
						</div></div></div>
						</div>
					</div>
					<div id="delete_profile" class="all_settings_divs" hidden="true">
						<div class="panel panel-success">
							<div class="panel-heading">
							Delete Profile
							</div>
							<div class="panel-body">
							<div class="row">
							<div class="col-md-12">
						
						<p style="color: black;">Please choose a reason for profile deletion.</p><br><br>
						<div class='row'>
						<div class='col-md-3' style='width: 225px; background: #f1f1f1;border-radius: 12px;padding: 7px 10px;color: black;margin: 0px 0px 10px 14px;'>
						<input type="radio" /> &nbsp;&nbsp;&nbsp;Marriage Fixed&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class='col-md-3' style='width: 225px; background: #f1f1f1;border-radius: 12px;padding: 7px 10px;color: black;margin: 0px 0px 10px 14px;'>
						<input type="radio" /> &nbsp;&nbsp;&nbsp;Married&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class='col-md-3' style='width: 225px; background: #f1f1f1;border-radius: 12px;padding: 7px 10px;color: black;margin: 0px 0px 10px 14px;'>
						<input type="radio" /> &nbsp;&nbsp;&nbsp;Other Reasons
						</div>
						</div><br><br>
						<input type="button" class="btn btn-danger" type="button" value="Delete Account" onclick="deleteProfile('delete_profile')" />
					</div></div></div></div></div>
	
					<div id="edit_emailaddress" class="all_settings_divs" hidden="true">
					<div class="panel panel-success">
							<div class="panel-heading">
							Edit Email Address
							</div>
							<div class="panel-body">
							<div class="row">
							<div class="col-md-12">
					<p style="color: black;">A valid e-mail id will be used to send you partner search mailers, member to member communication mailers and special offers.</p>
					<div class="form-group" style="margin: auto;">
  						<label class="control-label" style="color: black;">Enter Email ID</label>  							
    							<div class="input-group mb-3">
      								<input type="text" placeholder="Enter Email id" class="form-control" aria-label="Amount (to the nearest dollar)">      								     								
    							</div>
    							<br>
      								<input type="button" class="btn btn-success" type="button" value="Save"  />
									 
									 <input type="button" class="btn btn-danger"  type="button" value="Reset"  />
									
					</div></div></div></div></div>
					</div>
					<div id="manage_mailalerts" class="all_settings_divs" hidden="true">
					<div class="panel panel-success">
							<div class="panel-heading">
							Manage Mail Alerts
							</div>
							<div class="panel-body">
							<div class="row">
							<div class="col-md-12">
					<p style="color: black;">Listed below are the alerts you will receive from us through e-mail. If you wish to unsubscribe to any of the alerts, please de-select the alert.</p>
					
					<div class="col-md-12 manage">
					<div class="col-md-10">
					<p><b>Product and feature promotions</b><br>
Get updates on new products and features</p>
					</div>
					<div class="col-md-2"><input type="checkbox" class="fcheck"></div>
					<div class="clearfix"></div><hr>
					<div class="col-md-10">
					<p><b>Daily MatchWatch mailer</b><br>
Receive matches as per your criteria</p>
					</div>
					<div class="col-md-2"><input type="checkbox" class="fcheck" checked></div>
					<div class="clearfix"></div><hr>
					<div class="col-md-10">
					<p><b>Weekly Photo MatchWatch mailer</b><br>
Receive weekly matches with photos as per your criteria</p>
					</div>
					<div class="col-md-2"><input type="checkbox" class="fcheck" checked></div>
					<div class="clearfix"></div><hr>
					<div class="col-md-10">
					<p><b>Weekly Horoscope MatchWatch mailer</b><br>
Receive weekly matches with horoscope as per your criteria</p>
					</div>
					<div class="col-md-2"><input type="checkbox" class="fcheck" checked></div>
					<div class="clearfix"></div><hr>
					<div class="col-md-10">
					<p><b>Auto Login</b><br>
Auto-login saves you the process of logging into your account with your e-mail ID and password when you click the link on an e-mail from us</p>
					</div>
					<div class="col-md-2"><input type="checkbox" class="fcheck" checked></div>
					<div class="clearfix"></div>
						<div align="right"><button class="btn btn-warning"> Submit </button></div>
						<hr>
						<p class="notepa">Note: In addition to the above mailers, you will receive e-mail notifications whenever a member sends you an Interest or a Personalised Message, when a member accepts or declines your Interest or Personalised Message. You will also receive notifications on yet to be viewed profiles and recently updated profiles. You cannot unsubscribe from these e-mail notifications as long as you're a member of BharatMatrimony.</p>
					</div>
					
					</div></div></div></div>
					</div>
					<div id="contact_filters" class="all_settings_divs" hidden="true">
					<div class="panel panel-success">
							<div class="panel-heading">
							Contact Filters
							</div>
							<div class="panel-body">
							<div class="row">
							<div class="col-md-12">
					<p style="color: black;"><b>Contact filters can help you control who contacts you.</b></p>
					<p>For example, if your age range is set as 24 - 27 years in the filters, communication from a member whose age is 30 years will go into your filtered folder.</p>
					<hr>
					<p>With the help of filters you can choose who can contact you.</p>
<p><b>Who can contact me:</b></p>
  <p><input type="radio">  Anyone</p>
<p><input type="radio">  Only members who meet my criteria.</p>
<div align="right"><button class="btn btn-warning"> Update </button></div>
					</div></div></div></div>
					</div>
	<div id="unsubscribe_callinglist" class="all_settings_divs" hidden="true">
					<div class="panel panel-success">
							<div class="panel-heading">
							Unsubscribe from calling list
							</div>
							<div class="panel-body">
							<div class="row">
							<div class="col-md-12">
					<p>Tell us when would you like to receive phone calls from our telemarketing executives.</p>
<hr>
<p><b>I'd like to get calls after:</b></p>
  <p><input type="radio">  Call me once in 15 days</p>
<p><input type="radio">  Call me once a month</p>
 <p><input type="radio">  Call me once in two months</p>
<p><input type="radio">  Do not call</p>

<div align="right"><button class="btn btn-warning"> Submit </button></div>
					</div></div></div></div>
					</div>
				</form:form>	
			</div><div class="clearfix"></div><br><br>
			
			
       <script>

</script>
<script type="text/javascript">
function displaySettingsBlock(divId){
	if(divId=="membership_details"){
		var formData = new FormData();
		$.fn.makeMultipartRequest('POST', 'membershipDetailsAction', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var msg = jsonobj.message;
			var membershipDetails = jsonobj.membership_details;
			if(msg=="success"){
				
					$("#matrimony_id").html(membershipDetails.username);
					$("#membership_type").html(membershipDetails.name);
					var status = membershipDetails.membership_status;
					if(status=="1")
						$("#membership_status").html("Active");
					else
						$("#membership_status").html("In-Active");
					$("#membership_validity").html(membershipDetails.validity+" days");
					$("#renewal_date").html(membershipDetails.renewal_date);
					$("#last_renewed").html(membershipDetails.last_renewed_date);
					$("#total_profile_count").html(membershipDetails.allowed_profiles_limit);
					$("#left_profile_count").html("${allowed_profiles_limit}");
			}
			
			//displaySettingsBlock(actionStr); // actionStr and divid are same value.
			
		});
	}
	$(".all_settings_divs").attr("hidden",true);
	var cls=divId.split('_');
	var clss=cls[0]+'-'+cls[1];
	$(".profileTab tr").removeClass('active');
	$("."+clss).parent('td').parent('tr').addClass('active');
	$("#"+divId).removeAttr("hidden");
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
function submitProfileSettings(actionStr){
	var actionUrl = "";
	var formData = new FormData();
	if(actionStr=="change_password"){
		var currentPassword = $("#currentPassword").val().trim();
		var newPassword = $("#newPassword1").val().trim();
		var confirmedNewPassword = $("#newPassword2").val().trim();
		var v1 = validate('currentPassword','Enter Current Password');
		var v2 = validate('newPassword1','Enter New Password');
		var v3 = validate('newPassword2','Enter Confirm New Password');
		if(v1==false || v2==false || v3==false){
			return false;
		}
		if(newPassword != confirmedNewPassword){
			alert("Passwords mismatched.");
			return false;
		}
		 
		formData.append("currentPassword",currentPassword);
		formData.append("newPassword1",newPassword);
		formData.append("newPassword2",confirmedNewPassword);
		actionUrl = "changePasswordAction";
	}else if(actionStr=="profile_settings"){
		formData.append("know_ishortlisted",$("#know_ishortlisted").val());
		actionUrl = "profileSettingsAction";
	}else if(actionStr=="delete_profile"){
		actionUrl = "deleteProfileAction";
	}
	$.fn.makeMultipartRequest('POST', actionUrl, false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var msg = jsonobj.message;
			var membershipDetails = jsonobj.membership_details;
			if(msg=="success"){
				if(actionStr=="change_password"){
					alert("Password changed successfully");
					$("#currentPassword").val("");
					$("#newPassword1").val("");
					$("#newPassword2").val("");
				}else if(actionStr=="profile_settings"){
					alert("Settings updated successfully");
				}else if(actionStr=="delete_profile"){
					alert("Profile deleted successfully");
				}
				
			}else{
				if(msg=="currentpassword_notexist"){
					alert("Current password doesn't exist!! Try again.");
				}else if(msg=="failed"){
					alert("Some problem occured. Please try again.");
				}
			}
			//displaySettingsBlock(actionStr); // actionStr and divid are same value.
			
	});
}
function changeProfileStatus(status){
	var formData = new FormData();
	formData.append("status",status);
	$.fn.makeMultipartRequest('POST', 'updateProfileStatus', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		var membershipDetails = jsonobj.membership_details;
		if(msg=="success"){
			
				alert("Profile status updated successfully");
			
			
		}
		//displaySettingsBlock(actionStr); // actionStr and divid are same value.
		
});
}
$(".dashboard").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>