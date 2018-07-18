<%@ include file="userCommonHeader.jsp"%>
 	
		<script>
			 $(document).ready(function() {
				$('.multiSelect').select2();
				$("#rMaritalStatus").select2({
				    placeholder: "-- Choose Marital Status --"
				});
				$("#rReligion").select2({
				    placeholder: "-- Choose Religion --"
				});
			    $("#rCaste").select2({
				    placeholder: "-- Choose Community --"
				});
				$("#rMotherTongue").select2({
				    placeholder: "-- Choose Mother Tongue --"
				});
				$("#rCountry").select2({
				    placeholder: "-- Choose Country --",
				});
			}); 
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
			@media (min-width: 768px) {
.form-horizontal .control-label {
    padding-top: 7px;
    margin-bottom: 0;
    text-align: left;
}
}
td:first-child {width:150px;}
/* td:nth-child(2) { width:10px;} */
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
 td, th {
    padding: 0;
    vertical-align: text-bottom;
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
			<div class="col-md-9 products-grid-left">
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
     <label class="col-sm-3 control-label">Current Password</label>
     <div class="col-sm-5">
     <input class="form-control" type="password" id="currentPassword" placeholder="Current Password" onkeypress="onKeyPress(this.id);" onblur="this.placeholder='Current Password'" onfocus="this.placeholder=''" required="required" >
    </div>
    </div>
    <div class="form-group">
     <label class="col-sm-3 control-label">New Password</label>
     <div class="col-sm-5">
     <input class="form-control" type="password" id="newPassword1" placeholder="New Password"  onkeypress="onKeyPress(this.id);" onchange="cheackOldAndNewPassword();" onblur="this.placeholder='New Password'" onfocus="this.placeholder=''" required="required" >
   </div>
    <span class="col-sm-2" id="errMsg"></span> 
    </div>
     <div class="form-group">
     <label class="col-sm-3 control-label">Confirm New Password</label>
     <div class="col-sm-5">
     <input class="form-control" type="password" id="newPassword2" placeholder="Confirm New Password"  onkeypress="onKeyPress(this.id);" onblur="this.placeholder='Confirm New Password'" onfocus="this.placeholder=''" required="required" >
    </div>
    </div>
					<br>
					<div class="col-md-12">
					<div class="col-md-6"></div>
						<div class="col-md-2">
						<input  type="button" class="btn btn-primary btnre"  value="Submit" onclick="submitProfileSettings('change_password')" />
						</div>
						<div class="col-md-2 ">
						<input  type="button" class="btn btn-danger btnre"  value="Reset" onclick="resetProfileSettings()" />
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
						<p style='line-height: color: black; 41px; margin-bottom:5px; '><input type="radio" name="show_profile_to" value="all" style='color: black;'> Show my Profile to all including visitors.
						<br>
						<input type="radio" name="show_profile_to" value="registered" style='color: black; margin-bottom:5px;'> Show my Profile to registered members only.</p>
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
						
						<p style="color: black;">Please choose a reason for profile deletion.</p><br>
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
						</div><br>
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
    							<!-- 
    							 --><div class="input-group mb-3">
      								<input type="text" placeholder="Enter Email id"  id="changeEmail" onkeyup="borderColor()" class="form-control" aria-label="Amount (to the nearest dollar)">      								     								
    							<span class="hasError" id="emailError1" style="color:red;"></span>
    							</div>
    							<br>
      								<input type="Submit" class="btn btn-success" id="submitId" onclick="submitEmail()"  value="Save"  />
									 
									 <input type="button" class="btn btn-danger" onclick="cancelEmail()" type="button" value="Reset"  />
									
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
					<div class="col-md-2"><input type="checkbox" id="promotions_chkbox" class="fcheck"></div>
					<div class="clearfix"></div><hr>
					<div class="col-md-10">
					<p><b>Daily MatchWatch mailer</b><br>
Receive matches as per your criteria</p>
					</div>
					<div class="col-md-2"><input type="checkbox"  id="daily_matches_chkbox"  class="fcheck" ></div>
					<div class="clearfix"></div><hr>
					<div class="col-md-10">
					<p><b>Weekly Photo MatchWatch mailer</b><br>
Receive weekly matches with photos as per your criteria</p>
					</div>
					<div class="col-md-2"><input type="checkbox" id="weekly_matches_chkbox" class="fcheck" ></div>
					<div class="clearfix"></div><hr>
					<!-- <div class="col-md-10">
					<p><b>Weekly Horoscope MatchWatch mailer</b><br>
Receive weekly matches with horoscope as per your criteria</p>
					</div>
					<div class="col-md-2"><input type="checkbox"  class="fcheck" checked></div>
					<div class="clearfix"></div><hr> -->
					<div class="col-md-10">
					<p><b>Auto Login</b><br>
Auto-login saves you the process of logging into your account with your e-mail ID and password when you click the link on an e-mail from us</p>
					</div>
					<div class="col-md-2"><input type="checkbox" id="auto_login_chkbox" class="fcheck" ></div>
					<div class="clearfix"></div>
						<div align="right"><button class="btn btn-warning" onclick="submitEmailAlertsSettings()"> Submit </button></div>
						<hr>
						<p class="notepa">Note: In addition to the above mailers, you will receive e-mail notifications whenever a member sends you an Interest or a Personalised Message, when a member accepts or declines your Interest or Personalised Message. You cannot unsubscribe from these e-mail notifications as long as you're a member of AarnaMatrimony.</p>
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
  <p><input type="radio" name="contact_filter" value="anyone" onclick="show1();" />  Anyone</p>
<p><input type="radio" name="contact_filter" value="filter" onclick="show2();" />  Only members who meet my criteria.</p>
<div id="div1" style="display:none;">
<hr>
<p><b>Filter</b></p>
<p>Select your preferences and click Update.</p>
					<form:form commandName="settingsForm"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form" method="post">
						<form:hidden path="id" />
<div class="form-group">
									<label class="col-md-1 control-label" for="textinput">Age</label>  
									<div class="col-md-2">
										<%-- <form:input path="rAgeFrom" class="form-control  numericOnly u1" placeholder="From" /> --%>
										
								<select id="age_from" name="age_from" class="form-control numericOnly u1" >
									<option value="">--From--</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
									<option value="32">32</option>
									<option value="33">33</option>
									<option value="34">34</option>
									<option value="35">35</option>
									<option value="36">36</option>
									<option value="37">37</option>
									<option value="38">38</option>
									<option value="39">39</option>
									<option value="40">40</option>
									<option value="41">41</option>
									<option value="42">42</option>
									<option value="43">43</option>
									<option value="44">44</option>
									<option value="45">45</option>
									<option value="46">46</option>
									<option value="47">47</option>
									<option value="48">48</option>
									<option value="49">49</option>
									<option value="50">50</option>
									
								</select>
									</div>
									<label class="col-md-1 control-label" for="textinput">To</label>  
									<div class="col-md-2">
<%-- 										<form:input path="rAgeTo" class="form-control numericOnly u1" placeholder="To" />
 --%>	
 									<select id="age_to" name="age_to" class="form-control numericOnly u1">
									<option value="" selected="">--To--</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
									<option value="32">32</option>
									<option value="33">33</option>
									<option value="34">34</option>
									<option value="35">35</option>
									<option value="36">36</option>
									<option value="37">37</option>
									<option value="38">38</option>
									<option value="39">39</option>
									<option value="40">40</option>
									<option value="41">41</option>
									<option value="42">42</option>
									<option value="43">43</option>
									<option value="44">44</option>
									<option value="45">45</option>
									<option value="46">46</option>
									<option value="47">47</option>
									<option value="48">48</option>
									<option value="49">49</option>
									<option value="50">50</option>
								
								</select>
 								</div>
 								<label class="col-md-1 control-label" for="textinput">Years</label>  
 							
								</div>
									<div class="form-group prfic">
									      <label class="col-md-4 control-label" for="textinput">Marital Status</label>  
									      <div class="col-md-6">
									      	<form:select path="rMaritalStatus" class="multiSelect"  multiple="true" >
												<form:option value="">Doesn't Matter</form:option>
												<form:option value="Married">Married</form:option>
												<form:option value="Unmarried">Unmarried</form:option>
												<form:option value="Widow/Divorced">Widow/Divorced</form:option>
											</form:select>
									      </div>
									    </div>
									      <div class="form-group">
										      <label class="col-md-4 control-label" for="textinput">Religion</label>  
										      <div class="col-md-6">
										      	<form:select path="rReligion" onchange="getReliginCastAjax()" class="multiSelect" multiple="true">
													<form:options items="${religion}"></form:options>
												</form:select>
										      </div>
										    </div>
									    <div class="form-group">
									      <label class="col-md-4 control-label" for="textinput">Community</label>  
									      <div class="col-md-6">
									      	<form:select path="rCaste" class="multiSelect" multiple="true">
											<form:options items="${castes_list}"></form:options> 
											</form:select>
									      </div>
									    </div>
									
									    <div class="form-group">
									      <label class="col-md-4 control-label" for="textinput">Mother Tongue</label>  
									      <div class="col-md-6">
									      	<form:select path="rMotherTongue" class="multiSelect" multiple="true">
												<form:options items="${language}"></form:options>
											</form:select>
									      </div>
									    </div>
									    
									    <div class="form-group">
											<label class="col-md-4 control-label required">Country living in </label>
											<div class="col-md-6">
												<form:select path="rCountry" class="multiSelect"  multiple="true" onchange="getFilteredStatesMultiSelect(this.id)">
													<form:options items="${countries}"></form:options>
												</form:select>
										  		<div><form:errors path="rCountry" cssClass="error" /></div>
											</div>
									  	</div>


</form:form>
					</div></div></div>
		<div align="right"><button class="btn btn-warning" onclick="submitContactFilterSettings()"> Update </button></div>			
					</div>
					</div></div>
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
  <p><input type="radio" name="marketing_calls" value="15d">  Call me once in 15 days</p>
<p><input type="radio" name="marketing_calls" value="1m">  Call me once a month</p>
 <p><input type="radio" name="marketing_calls" value="2m">  Call me once in two months</p>
<p><input type="radio" name="marketing_calls" value="do_not_call">  Do not call</p>

<div align="right"><button class="btn btn-warning" onclick="submitUnsubscribeFromCallingList()"> Submit </button></div>
					</div></div></div></div>
					</div>
					<div id="privacy" class="all_settings_divs" hidden="true">
					<!-- <div class="panel panel-success">
							<div class="panel-heading">
							Privacy
							</div>
							<div class="panel-body">
							<div class="row">
							<div class="col-md-12">
							<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Mobile Privacy</a></li>
    <li><a data-toggle="tab" href="#menu1">Photo Privacy</a></li>
    <li><a data-toggle="tab" href="#menu2">Horoscope Privacy</a></li>
   
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
    <div class="panel-group" id="accordion">
    <div class="panel panel-default">
        <div class="panel-heading"><p>Verified Contact</p>
<p>Change / Edit your mobile number and verify it.<span class="pull-right">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel1"><i class="fa fa-chevron-down"></i></a>
            </span></p>
             

        </div>
        <div id="panel1" class="panel-collapse collapse in" style="">
            <div class="panel-body">
<p>Given below are your contact details. In case, your mobile number has changed, please verify your mobile number to continue using our services. Profiles without verified mobile numbers cannot be part of our site anymore.
</p><p>aarnaMatrimony is the world's only matrimony site to have 100% mobile verified profiles.</p><br>
   <div class="panel panel-success">
	<div class="panel-heading">Contact Details</div>
							<div class="panel-body">
							<p>Contact Number <a style="display:none" class="pull-right contactNumb" onclick="show3()" href="#">Edit</a></p>
							<hr>
							<div id="contactNumb">
							<div class="form-group">
     <label class="col-sm-4 control-label">Country</label>
     <div class="col-sm-5">
     <select class="form-control numericOnly u1">
     <option>India</option>
     <option>Australia</option>
     <option>USA</option>
     </select>
       </div>
    </div>
    <div class="form-group">
     <label class="col-sm-4 control-label">Primary Mobile Number</label>
     <div class="col-sm-5">
     <input class="form-control" type="text" id="" placeholder="Enter Number" onblur="this.placeholder='Enter Mobile Number'" onfocus="this.placeholder=''" required="required" >
    </div>
    </div>
     <div class="form-group">
     <label class="col-sm-4 control-label">Parent Contact Number</label>
     <div class="col-sm-5">
     <input class="form-control" type="text" id="" placeholder="Parent contact Number" onblur="this.placeholder='Parent Contact Number'" onfocus="this.placeholder=''" required="required" >
    </div>
    </div>
      <div class="form-group ">
         <div class="col-sm-4"></div>
    <span class="btn btn-primary">Save</span> <span class="btn btn-danger">Cancel</span></div>
							<p>Contact Preferences <a class="pull-right" onclick="show4()" href="#">Edit </a></p>
							
							<hr>
							<table>
							<tr><td>Whom to contact</td><td>: </td><td> Not Specified</td></tr>
<tr><td>Contact person's name</td><td>:</td><td> Not Specified</td></tr>
<tr><td>Convenient time to call</td><td>:</td><td>Not Specified</td></tr>
<tr><td>Comments</td><td>:</td><td>Not Specified</td></tr>
			</table>
			</div>
			<div id="contactRefer" style="display:none;">
			<table><tr><td>Country Code</td><td>:<td>091</td></tr>
<tr><td>Primary Mobile Number</td><td>:</td><td>9700088107</td></tr>
<tr><td>Parents' Contact Number</td><td>:</td><td>9440414045</td></tr></table>
<br>
			<p>Contact Preferences <a class="pull-right contactRefer" onclick="show3()" href="#">Edit </a></p>
			<hr>
			<div class="form-group">
     <label class="col-sm-4 control-label">Whom to contact </label>
     <div class="col-sm-5">
     <select  class="form-control numericOnly u1">
     <option>--Select--</option>
     <option>Parent</option>
     <option>Self</option>
     <option>brother</option>
     <option>sister</option>
     </select>
      </div>
    </div>
			 <div class="form-group">
     <label class="col-sm-4 control-label">Contact person's name </label>
     <div class="col-sm-5">
     <input class="form-control" type="text" id="" placeholder="Contact person's name" onblur="this.placeholder='Contact person's name'" onfocus="this.placeholder=''" required="required" >
    </div>
    </div>
     <div class="form-group">
     <label class="col-sm-4 control-label">Convenient time to call</label>
     <div class="col-sm-5">
     <input class="form-control" type="text" id="" placeholder="Convenient time to call" onblur="this.placeholder='Convenient time to call'" onfocus="this.placeholder=''" required="required" >
    </div>
    </div>
    <div class="form-group">
     <label class="col-sm-4 control-label">Comments</label>
     <div class="col-sm-5">
     <input class="form-control" type="textarea" id="" placeholder="comments" onblur="this.placeholder='comments'" onfocus="this.placeholder=''" required="required" >
    </div>
    </div>
      <div class="form-group ">
         <div class="col-sm-5"></div>
    <span class="btn btn-primary">Save</span> <span class="btn btn-danger">Cancel</span></div>
			</div><br>
<p>By verifying your mobile number, members can contact you through mobile.	</p>			
							
							</div>
							</div>
						
   
    </div></div>
     <div class="panel panel-default">
        <div class="panel-heading"><p>Mobile Privacy</p>

<p>Control who can view your mobile number.
             <span class="pull-right">
                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#panel2"><i class="fa fa-chevron-down"></i></a>
            </span></p>

        </div>
        <div id="panel2" class="panel-collapse collapse">
            <div class="panel-body">
<p><input type="radio" name="show_mobileno_to" value="paid_members"> Show mobile number to paid members</p>
<p> &nbsp;<i class="fa fa-chevron-right"></i> Paid members can reach you directly or through SMS</p>
<hr>
<p><input type="radio" name="show_mobileno_to" value="paid_mycommunity_members"> Show mobile number only to paid members from my community</p>
<p> &nbsp;<i class="fa fa-chevron-right"></i> Paid members from your community can reach you directly or through SMS</p>
<hr>
<p><input type="radio"cname="show_mobileno_to" value="paid_icontacted_members">  Show mobile number only to paid members whom I had contacted / responded</p>
<p> &nbsp;<i class="fa fa-chevron-right"></i> Paid members whom you have contacted / responded can reach you directly or through SMS</p>
<hr>
<p><input type="radio" name="show_mobileno_to" value="hide">  Hide my mobile number</p>
<p> &nbsp;<i class="fa fa-chevron-right"></i> Your mobile number will be hidden, however you can receive SMS from other paid members</p>
<hr>
<input type="button" class="btn btn-warning" value="Submit" onclick="submitProfileSettings('privacy')" />
</div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading"><p>Mobile Alerts</p>
<p>Choose if you want to receive Notifications through SMS.
             <span class="pull-right">
                <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#panel3"><i class="fa  fa-chevron-down"></i></a>
            </span></p>

        </div>
        <div id="panel3" class="panel-collapse collapse">
            <div class="panel-body">
          <p>  You will get SMS notifications to 9700088107, when<br>
 * You receive a new message<br>
  * You get an interest<br>
  * You get a reply for your message<br>
  * Your interest gets accepted<br>
  * Member requests you to add Photo<br>
  * Member sends you a reminder for Interest<br>
<b>*  Members using our app will be notified through instant push notifications instead of SMS.</b><br>
As a member, you have the benefit of receiving mobile alerts. We recommend you to keep your mobile alerts on all the time for instant notifications. You may choose to turn off the alerts
<br>
* Sent only to members registered with Indian Mobile number<br>
* To turn off App notifications go to BharatMatrimony App settings</p>
            
            </div>
        </div>
        </div></div></div></div>
    <div id="menu1" class="tab-pane fade">
     <p>Your Photo Privacy has been set to "Visible to All"</p>
      <p><input type="radio" onclick="show5();"/> Visible to all </p>
      <p><input type="radio" onclick="show6();"/> Protect Photo </p>
      <p>* With this option, you can choose to share your photo when sending or receiving communication<p>
       <div id="photoPrive" style="display:none;">
    <span class="btn btn-primary">Submit</span>
    </div>
    </div>
   
    <div id="menu2" class="tab-pane fade">
     <p>Your Horoscope Privacy has been set to "Visible to All".</p>
       <p><input type="radio" onclick="show7();"/> Visible to all </p>
      <p><input type="radio" onclick="show8();"/>  Visible only to members whom I had contacted / responded. </p>
        <p><input type="radio" onclick="show9();"/> Protect with Horoscope Password </p>
        <p> With this option you can</p>
        <p> *  Share your Horoscope Password to a member of your choice.<br>
   *  Grant access to your Horoscope at the time of contacting.</p>
      <p> * Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    <div id="horoscopeVis" style="display:none;">
    
    <span class="btn btn-primary"> Submit</span>
    
    </div>
    <div id="horoscopePro" style="display:none;">
    
    <span class="btn btn-primary"> Hide</span>
    
    </div>
    </div>
  </div></div>
        </div>
    </div>
   

					</div> -->
					</div></div></div>
					</div>
				</form:form>	
			</div>
			<div class="clearfix"></div><br>
			
			
       <script>
     
       function submitEmail(){

    	   var email=$("#changeEmail").val();
    	   if (email == null || email == "" || email == "undefiend"){
    		   $('#changeEmail').css('border-color','red');
    			$('#changeEmail').css('color','#cc0000');
    			$('#changeEmail').attr('placeholder','Enter Email Id');
    			return false;
    	   }
    	   var formData = new FormData();
    	   formData.append("email",email)
   		$.fn.makeMultipartRequest('POST', 'changeEmailAction', false,
   				formData, false, 'text', function(data){
   			var jsonobj = $.parseJSON(data);
   			var msg = jsonobj.message;
   		   var email=$("#changeEmail").val('');
   		   alert("email updated successfully");
   			
   		});
    	   
       }
       var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
       $('#changeEmail').blur(function() {
       	var email = $('#changeEmail').val();
       	if(email != "" && !email.match(expr)){
//        		alert("Please Enter Valid Email");
           	$("#changeEmail").css("border-color","red");
           	$("#changeEmail").attr("title","Email-ID");
           	$('#changeEmail').css('color','red');
           	$('#emailError1').text("Valid Email-ID..");
           	$('#submitId').attr("disabled","true");
       		return false;
       	}
       	else{
       		$('#emailError1').text("");
       	  $('#submitId').removeAttr("disabled");
       	}
       });
       
       function borderColor(){
    	   $('#changeEmail').css('border-color','');
  			$('#changeEmail').css('color','');
       }
       function cancelEmail(){
    	   $("#changeEmail").val('');
    	   $('#changeEmail').css('border-color','');
  			$('#changeEmail').css('color','');
  		  	$('#emailError1').text('');
  		  $('#submitId').removeAttr("disabled");
       }
       
       $(window).scrollTop($('#contactNumb').offset().top);
       function show1(){
    	   document.getElementById('div1').style.display ='none';
    	 }
    	 function show2(){
    	   document.getElementById('div1').style.display = 'block';
    	 }
    	  
    	 function show3(){
    	   $(".contactRefer").css('display','block');
    	   $(".contactNumb").css('display','none');
    	   $("#contactRefer").css('display','none');
    	   $("#contactNumb").css('display','block');
      	 }
      	 function show4(){
    	   $(".contactRefer").css('display','none');
    	   $(".contactNumb").css('display','block');
    	   $("#contactRefer").css('display','block');
    	   $("#contactNumb").css('display','none');
      	 }
      	function show5(){
        	   document.getElementById('photoPrive').style.display ='none';
        	 }
        	 function show6(){
        	   document.getElementById('photoPrive').style.display = 'block';
        	 }
        		function show7(){
        			$('#horoscopePro').hide();
        			$('#horoscopeVis').hide();
             	  $('#horoscopePro').attr('checked', false);
             	 $('#horoscopeVis').attr('checked', false);
             	 }
             	 function show8(){
             		$('#horoscopePro').hide();
              	  $('#horoscopePro').attr('checked', false);
              	 $('#horoscopeVis').show();
             	 }
             	function show9(){
              	 $('#horoscopeVis').attr('checked', false);
              	 $('#horoscopePro').show();
              	$('#horoscopeVis').hide();
              	 }
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
	if(divId=="manage_mailalerts"){
		var formData = new FormData();
		$.fn.makeMultipartRequest('POST', 'getMailAlertsSettings', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var msg = jsonobj.message;
			var settingsMap = jsonobj.settings;
			if(msg=="success"){
				
				var checked_val = settingsMap.product_promotion_emails	;
				if(checked_val=="1"){
					$("#promotions_chkbox").prop("checked",true);
				}else{
					$("#promotions_chkbox").prop("checked",false);
				}
				checked_val = settingsMap.daily_matches_emails	;
				if(checked_val=="1"){
					$("#daily_matches_chkbox").prop("checked",true);
				}else{
					$("#daily_matches_chkbox").prop("checked",false);
				}
				checked_val = settingsMap.weekly_matches_emails	;
				if(checked_val=="1"){
					$("#weekly_matches_chkbox").prop("checked",true);
				}else{
					$("#weekly_matches_chkbox").prop("checked",false);
				}
				checked_val = settingsMap.auto_login	;
				if(checked_val=="1"){
					$("#auto_login_chkbox").prop("checked",true);
				}else{
					$("#auto_login_chkbox").prop("checked",false);
				}
			}
		});
	}
	if(divId=="profile_settings"){
		var formData = new FormData();
		$.fn.makeMultipartRequest('POST', 'getProfileSettings', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var msg = jsonobj.message;
			var settingsMap = jsonobj.settings;
			if(msg=="success"){
				var show_profile_to = settingsMap.show_profile_to;
				var know_shortlisted_option = settingsMap.know_shortlisted_option;
				if(know_shortlisted_option=="1"){
					$("#know_ishortlisted").prop("checked",true);
				}else{
					$("#know_ishortlisted").prop("checked",false);
				}
				$('[name="show_profile_to"]').removeAttr('checked');
				$("input[name=show_profile_to][value="+show_profile_to+"]").prop('checked', true);
			}
		});
	}
	if(divId=="privacy"){
		var formData = new FormData();
		$.fn.makeMultipartRequest('POST', 'getPrivacySettings', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var msg = jsonobj.message;
			var settingsMap = jsonobj.settings;
			if(msg=="success"){
				var show_mobile_no_to = settingsMap.show_mobile_no_to;
				$('[name="show_mobileno_to"]').removeAttr('checked');
				$("input[name=show_mobileno_to][value="+show_mobile_no_to+"]").prop('checked', true);
			}
		});
	}
	if(divId=="contact_filters"){
		var formData = new FormData();
		$.fn.makeMultipartRequest('POST', 'getContactFilterSettings', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var msg = jsonobj.message;
			var settingsMap = jsonobj.settings;
			var castesList = jsonobj.castes_list;
			if(msg=="success"){
				var selected_val = settingsMap.contact_filter;
				$('[name="contact_filter"]').removeAttr('checked');
				if(selected_val=="anyone"){
						$("input[name=contact_filter][value=anyone]").prop('checked', true);
				}else{
						$("input[name=contact_filter][value=filter]").prop('checked', true);
						//set other field values
						var age_from = settingsMap.filter_age_from;
						var age_to = settingsMap.filter_age_to;
						var marital_status = settingsMap.filter_marital_status;
						var religion = settingsMap.filter_religion;
						var caste = settingsMap.filter_caste;
						var mothertongue = settingsMap.filter_mothertongue;
						var country = settingsMap.filter_country;
						$("#age_from").val(age_from);
						$("#age_from").trigger("chosen:updated");
						$("#age_to").val(age_to);
						$("#age_to").trigger("chosen:updated");
						
						var selected_values = "";
						selected_values = marital_status;
					    if(selected_values == "" || selected_values==null){
					    	$("#rMaritalStatus").select2({
					    	    placeholder: "-- Choose MaritalStatus --"
					    	});
					    }else{
					    	var tt = selected_values.split(",");
					        $("#rMaritalStatus").val(selected_values.split(","));
					    }
					    
					    selected_values="";
						selected_values = religion;
					    if(selected_values == "" || selected_values==null){
					    	$("#rReligion").select2({
					    	    placeholder: "-- Choose Religion --"
					    	});
					    }else{
					    	var tt = selected_values.split(",");
					        $("#rReligion").val(selected_values.split(","));
					    }
					    
					    selected_values="";
					    selected_values = caste;
					    if(selected_values == "" || selected_values==null){
					    	$("#rCaste").select2({
					    	    placeholder: "-- Choose Community --"
					    	});
					    }else{
					    	var tt = selected_values.split(",");
					        $("#rCaste").val(selected_values.split(","));
					    }
					    
					    selected_values="";
						selected_values = mothertongue;
						if(selected_values == "" || selected_values==null){
					    	$("#rMotherTongue").select2({
					    	    placeholder: "-- Choose MotherTongue --"
					    	});
					    }else{
					    	var tt = selected_values.split(",");
					        $("#rMotherTongue").val(selected_values.split(","));
					    }
						
						selected_values="";
						selected_values = country;
						if(selected_values == "" || selected_values==null){
					    	$("#rCountry").select2({
					    	    placeholder: "-- Choose Country --"
					    	});
					    }else{
					    	var tt = selected_values.split(",");
					    	$("#rCountry").val(selected_values.split(","));
					    } 
						$('.multiSelect').trigger('change.select2');
						show2();
				}
				
			}
		});
	}
	if(divId=="unsubscribe_callinglist"){
		var formData = new FormData();
		 $.fn.makeMultipartRequest('POST', 'getUnsubscribeFromCallingList', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var msg = jsonobj.message;
			var settingsMap = jsonobj.settings;
			if(msg=="success"){
				var selected_val = settingsMap.marketing_calls_permission;
				$('[name="marketing_calls"]').removeAttr('checked');
				$("input[name=marketing_calls][value="+selected_val+"]").prop('checked', true);
			}
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
		var v1 = validate('currentPassword','Current Password');
		var v2 = validate('newPassword1','New Password');
		var v3 = validate('newPassword2','Confirm New Password');
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
		var show_profile_to = $("input[type=radio][name=show_profile_to]:checked").val();
		formData.append("show_profile_to",show_profile_to);
		var short_list_option = $("#know_ishortlisted").prop("checked");
		formData.append("know_shortlisted_option",short_list_option);
		
		actionUrl = "saveProfileSettings";
	}else if(actionStr=="privacy"){
		var show_mobileno_to = $("input[type=radio][name=show_mobileno_to]:checked").val();
		formData.append("show_mobileno_to",show_mobileno_to);
		actionUrl = "savePrivacySettings";
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
				}else if(actionStr=="privacy"){
					alert("Profile settings updated successfully");
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

var oldPass= '${oldPassword}';
 function cheackOldAndNewPassword(){
	var newPassword = $("#newPassword1").val();
	if(oldPass == newPassword){
		alert("Password must differ from old password..");
		 $("#newPassword1").val('').focus();
		return false;
	}
} 
 function resetProfileSettings(){
	 $("#currentPassword").val('').css("border-color", "").css("color","black");
	 $("#newPassword1").val('').css("border-color", "").css("color","black");
	 $("#newPassword2").val('').css("border-color", "").css("color","black");
 }
function onKeyPress(id){
	
	 $("#currentPassword").css("border-color", "").css("color","black");
	 $("#newPassword1").css("border-color", "").css("color","black");
	 $("#newPassword2").css("border-color", "").css("color","black");
	
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

function submitEmailAlertsSettings(){
	var promotion_chkbox = $("#promotions_chkbox").prop("checked");
	var daily_matches_chkbox = $("#daily_matches_chkbox").prop("checked");
	var weekly_matches_chkbox = $("#weekly_matches_chkbox").prop("checked");
	var auto_login_chkbox = $("#auto_login_chkbox").prop("checked");
	var formData = new FormData();
	formData.append("product_promotions",promotion_chkbox);
	formData.append("daily_match_alerts",daily_matches_chkbox);
	formData.append("weekly_match_alerts",weekly_matches_chkbox);
	formData.append("auto_login",auto_login_chkbox);
	$.fn.makeMultipartRequest('POST', 'saveUserMailAlertsSettings', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		if(msg=="success"){
			alert("Mail alerts settings updated successfully");
		}else{
			alert("Some problem occured!! Please try again.");
		}
	});
}
function submitContactFilterSettings(){
var ageFrom = $('#age_from').val();
var ageTo = $('#age_to').val();
var maritalStatus =$("#rMaritalStatus").val();
var religion = $("#rReligion").val();
var caste = $('rCaste').val();
var motherTongue = $('#rMotherTongue').val();
var country = $('#rCountry').val();
if(ageFrom=="" && ageTo=="" && maritalStatus==null && religion==null && caste==null && motherTongue==null && country==null)
{
	alert("Enter any input");
	return false;
}
if(ageFrom > ageTo){
	alert("Sorry, Invalid Age range");
	return false;
	}
	var formData = new FormData();
	var filter_value = $("input[name=contact_filter]:checked").val();
	formData.append("contact_filter",filter_value);
	if(filter_value=="filter"){
		//get other field values
		formData.append("age_from",$("#age_from").val());
		formData.append("age_to",$("#age_to").val());
		formData.append("rMaritalStatus",$("#rMaritalStatus").val());
		formData.append("rReligion",$("#rReligion").val());
		formData.append("rCaste",$("#rCaste").val());
		formData.append("rMotherTongue",$("#rMotherTongue").val());
		formData.append("rCountry",$("#rCountry").val());
	}
	$.fn.makeMultipartRequest('POST', 'saveContactFilterSettings', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		if(msg=="success"){
			alert("Contact Filter settings updated successfully");
		}else{
			alert("Some problem occured!! Please try again.");
		}
	});
	
}

function submitUnsubscribeFromCallingList(){
	var formData = new FormData();
	var unsubscribe_val = $("input[name=marketing_calls]:checked").val();
	formData.append("unsubscribe_from_val",unsubscribe_val);
	
	$.fn.makeMultipartRequest('POST', 'saveUnsubscribeFromCallingList', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		if(msg=="success"){
			alert("Updates saved successfully");
		}else{
			alert("Some problem occured!! Please try again.");
		}
	});
}
function getReliginCastAjax() {
	var religionId = $("#rReligion").val();
		var formData = new FormData();
		formData.append("religionId",religionId);
	$.fn.makeMultipartRequest('POST', '../castesBasedOnReligion', false,
			formData, false, 'text', function(data){
		$("#rCaste").select2('val','');
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		var optionsForClass = "";
		optionsForClass = $("#rCaste").empty();
		$.each(alldata, function(i, tests) {
			var id=tests.id;
			var casteName=tests.name;
			optionsForClass.append(new Option(casteName, id));
		});
		
	});
}

$(".dashboard").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>