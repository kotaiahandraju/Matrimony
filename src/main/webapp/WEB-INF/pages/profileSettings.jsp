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
			  margin-bottom: 18px;
			  margin-left: 0;
			  list-style: none;
			}

			.nav > li > a {
			  display: block;
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
			
			li {
			  line-height: 18px;
			}
			
			.tab-content.active{
				display: block;
			}
			
			.tab-content.hide{
				display: none;
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
					<div class="row">
					<div class="col-md-4">
						<h3 style='color: black;'>Enter Current Password</h3><br>
						<input style='border-style: solid; border-radius: 4px;' type="password" id="currentPassword" required="required">
						</div>
						<div class="col-md-3">
						<h3 style='color: black;'>Enter New Password</h3><br>
						<input style='border-style: solid; border-radius: 4px;' type="password" id="newPassword1" required="required">
						</div>
						<div class="col-md-4 col-md-offset-1">
						<h3 style='color: black;'>Confirm New Password</h3><br>
						<input style='border-style: solid; border-radius: 4px;' type="password" id="newPassword2" required="required">						
						</div>						
					</div>
					<br>
						<div class="col-md-3 col-md-offset-9">
						<input style='background: teal;color: whitesmoke;border-radius: 6px;padding: 7px;width: 102px;' type="button" type="button" value="Submit" onclick="submitProfileSettings('change_password')" />
						</div>
					</div>

		
					<div id="profile_settings" class="all_settings_divs" hidden="true">
						<input type="checkbox" id="know_ishortlisted"> Let others know that I shortlisted their profile.
						<input type="button" type="button" value="Submit" onclick="submitProfileSettings('profile_settings')" />
					</div>
					<div id="membership_details" class="all_settings_divs" hidden="true">
						<div class="panel panel-success">
							<div class="panel-heading">
								Membership Details
							</div>
							<div class="panel-body">
								<table>
									<tr>
										<td>Matrimony ID</td>
										<td>:</td>
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
										<td>Membership Validity</td>
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
								<table>
									<tr>
										<td>Total Profile Count</td>
										<td>:</td>
										<td id="total_profile_count"></td>
									</tr>
									<tr>
										<td>Profile Count Left</td>
										<td>:</td>
										<td id="left_profile_count"></td>
									</tr>
								</table>
								
								
							</div>
						</div>
					</div>
					<div id="deactivate_profile" class="all_settings_divs" hidden="true">
						Activate/Deactivate Profile<br>
						
						<c:if test="${cacheGuest.status == '1'}">
							Your profile is currently Active. <br>
							Click on below button if you want to deactivate your profile.You can activate it again whenever you want using settings.<br>
							
							<input type="button" type="button" value="Deactivate My Account" onclick="changeProfileStatus(0)" />
						</c:if>
						<c:if test="${cacheGuest.status == '0'}">
							Your profile is currently In-Active. Click on below button to activate your profile.<br>
							<input type="button" type="button" value="Activate My Account" onclick="changeProfileStatus(1)" />
						</c:if>
						
						
					</div>
					<div id="delete_profile" class="all_settings_divs" hidden="true">
						Delete Profile
						Please choose a reason for profile deletion.
						<input type="radio" /> Marriage Fixed
						<input type="radio" /> Married
						<input type="radio" /> Other Reasons<br>
						<input type="button" type="button" value="Delete Account" onclick="submitProfileSettings('delete_profile')" />
					</div>
	
					
	
				</form:form>	
			</div>
			
			
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