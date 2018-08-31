<%@ include file="userHeader.jsp"%>
			
			<div class="col-md-9 products-grid-left">
				<form:form commandName="createProfile" id="userProfile" method="post" action="saveUserProfile">
					<form:hidden path="redirectPage" value="myProfile"></form:hidden>
					<div class="panel panel-default">
						<div class="panel-heading">Edit Profile</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">Basic Information</div>
						<div class="panel-body">
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">First Name <span style="color:red;">*</span></label>
										<div class="col-md-7">
									  		<form:input path="firstName" type="text" class="form-control onlyCharacters validate u" placeholder="Enter First Name" maxlength="255"/>
									  		<span class="hasError" id="firstNameError"></span>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Last Name <span style="color:red;">*</span></label>
										<div class="col-md-7">
									  		<form:input path="lastName" type="text" class="form-control onlyCharacters validate u" placeholder="Enter Last Name" maxlength="255"/>
									  		<span class="hasError" id="lastNameError"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Gender</label>
										<div class="col-md-7">
									  		<form:input path="gender" type="text" class="form-control" readonly="true"/>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Email</label>
										<div class="col-md-7">
									  		<form:input path="email" type="text" class="form-control" readonly="true"/>
										</div>
									</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Date of Birth <span style="color:red;">*</span></label>
										<div class="col-md-7">
											<form:input path="dob" onchange="removeBorder(this.id)" class="form-control" onblur="validate(this.id,'');" placeholder="Enter Date of Birth" readonly="true"/>
									  		<div><form:errors path="dob" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Religion <span style="color:red;">*</span></label>
										<div class="col-md-7">
										  	<form:select path="religion" onfocus="removeBorder(this.id)" onblur="validate(this.id,'');" class="form-control u" >
												<form:option value="">-- Choose Religion --</form:option>
												<form:options items="${religion}"></form:options>
											</form:select>
									  		<div><form:errors path="religion" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Mother tongue <span style="color:red;">*</span></label>
										<div class="col-md-7">
										  	<form:select path="motherTongue" onfocus="removeBorder(this.id)" onblur="validate(this.id,'');" class="form-control u" >
												<form:option value="">-- Choose Mother Tongue --</form:option>
												<form:options items="${language}"></form:options>
											</form:select>
									  		<div><form:errors path="motherTongue" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Country <span style="color:red;">*</span></label>
										<div class="col-md-7">
										  	<form:select path="currentCountry" onfocus="removeBorder(this.id)" onblur="validate(this.id,'');" class="form-control u" >
												<form:option value="">-- Choose Country --</form:option>
												<form:options items="${countries}"></form:options>
											</form:select>
									  		<div><form:errors path="currentCountry" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">State <span style="color:red;">*</span></label>
										<div class="col-md-7">
										  	<form:select path="currentState" onfocus="removeBorder(this.id)" onchange="getCitys(this.id)" onblur="validate(this.id,'');" class="form-control u" >
												<form:option value="">-- Choose State --</form:option>
													<form:options items="${states }" ></form:options>
											</form:select>
									  		<div><form:errors path="currentState" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">City <span style="color:red;">*</span></label>
										<div class="col-md-7">
										  	<form:select path="currentCity" onfocus="removeBorder(this.id)" onblur="validate(this.id,'');" onchange="updateUserName(this.value)" class="form-control u" >
												<form:option value="">-- Choose City --</form:option>
												<form:options items="${citys }"></form:options>
											</form:select>
									  		<div><form:errors path="currentCity" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Marital Status <span style="color:red;">*</span></label>
										<div class="col-md-7">
											<form:select path="maritalStatus" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
												<form:option value="">-- Marital Status --</form:option>
												<form:option value="Married">Married</form:option>
												<form:option value="Unmarried">Unmarried</form:option>
												<form:option value="Widow/Divorced">Widow/Divorced</form:option>
											</form:select>
									  		<div><form:errors path="maritalStatus" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Community <span style="color:red;">*</span></label>
										<div class="col-md-7">
										  	<form:select path="caste" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
												<form:option value="">-- Choose Community --</form:option>
												<form:options items="${cast}"></form:options>
											</form:select>
									  		<div><form:errors path="caste" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Gotram </label>
										<div class="col-md-7">
										  	<form:input path="gotram" type="text" class="form-control onlyCharacters u" placeholder="Enter Gotram" maxlength="255"/>
									  		<div><form:errors path="gotram" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Nakshatram </label>
										<div class="col-md-7">
											<form:select path="star" class="form-control u">
												<form:option value="">-- Choose Nakshatram --</form:option>
												<form:options items="${star}"></form:options>
											</form:select>
									  		<div><form:errors path="star" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Dosham </label>
										<div class="col-md-7">
										  	<form:select path="dosam" class="form-control u">
												<form:option value="">-- Dosham --</form:option>
												<form:option value="Yes">Yes</form:option>
												<form:option value="No">No</form:option>
												<form:option value="Don't Know">Don't Know</form:option>
											</form:select>
									  		<div><form:errors path="dosam" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Dosham Name </label>
										<div class="col-md-7">
											<form:input path="dosamName" type="text" class="form-control onlyCharacters u" placeholder="Enter Dosham Name" maxlength="255"/>
											<div><form:errors path="dosamName" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-warning">
						<div class="panel-heading">Education & Career Details</div>
						<div class="panel-body">
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Education <span style="color:red;">*</span></label>
										<div class="col-md-7">
											<form:select path="education" class="form-control u"  onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
												<form:option value="">-- Choose Education --</form:option>
												 <form:option value="any">Doesn't Matter</form:option>
												<form:options items="${education}"></form:options>
											</form:select>
									  		<div><form:errors path="education" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">You work with </label>
										<div class="col-md-7">
											<form:select path="workingWith" class="form-control u">
												<form:option value="">-- Select --</form:option>
												<form:option value="Private Company">Private Company</form:option>
												<form:option value="Government/Public Sector">Government/Public Sector</form:option>
												<form:option value="Defense/Civil Services">Defense/Civil Services</form:option>
												<form:option value="Not Working">Not Working</form:option>
											</form:select>
									  		<div><form:errors path="workingWith" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<%-- <div class="col-md-6">
									<div class="form-group" style="display: none;">
										<label class="col-md-5 control-label required">Company Name </label>
										<div class="col-md-7">
											<form:input path="companyName" type="text" class="form-control onlyCharacters u" placeholder="Enter Company Name" maxlength="255"/>
											<div><form:errors path="companyName" cssClass="error" /></div>
										</div>
								  	</div>
								</div> --%>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">As </label>
										<div class="col-md-7">
											<form:select path="occupation" class="form-control u">
												<form:option value="">-- Choose Occupation --</form:option>
												<form:options items="${occupation}"></form:options>
											</form:select>
									  		<div><form:errors path="occupation" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Annual Income </label>
										<div class="col-md-7">
											<form:select path="annualIncome" class="form-control u" onblur="validate('salaryperyear','');" onfocus="removeBorder(this.id)">
												<form:option value="">-- Annual Income --</form:option>
												<form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
												<form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
												<form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
												<form:option value="Above INR 7 Lakh">Above INR 7 Lakh</form:option>
											</form:select>
											<div><form:errors path="annualIncome" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">Personal Details</div>
						<div class="panel-body">
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Diet? </label>
										<div class="col-md-7">
											<form:select path="diet" class="form-control u" >
												<form:option value="">-- What's your Diet--</form:option>
												<form:option value="Veg">Veg</form:option>
												<form:option value="Non-Veg">Non-Veg</form:option>
												<form:option value="Occasionally Non-Veg">Occasionally Non-Veg</form:option>
												<form:option value="Eggetarian">Eggetarian</form:option>
												<form:option value="Jain">Jain</form:option>
												<form:option value="Vegan">Vegan</form:option>
											</form:select>
									  		<div><form:errors path="diet" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Smoke? <span style="color:red;">*</span></label>
										<div class="col-md-7">
											<form:select path="smoking" class="form-control u"   onblur="validate(this.id,'');"  onfocus="removeBorder(this.id)">
												<form:option value="">-- Do you Smoke --</form:option>
												<form:option value="No">No</form:option>
												<form:option value="Occasionally">Occasionally</form:option>
												<form:option value="Yes">Yes</form:option>
											</form:select>
									  		<div><form:errors path="smoking" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Drink? <span style="color:red;">*</span></label>
										<div class="col-md-7">
											<form:select path="drinking" class="form-control u"  onblur="validate(this.id,'');"   onfocus="removeBorder(this.id)">
												<form:option value="">-- Do you Drink --</form:option>
												<form:option value="No">No</form:option>
												<form:option value="Occasionally">Occasionally</form:option>
												<form:option value="Yes">Yes</form:option>
											</form:select>
											<div><form:errors path="drinking" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Your Height? <span style="color:red;">*</span></label>
										<div class="col-md-7">
											<form:select path="height" class="form-control u"  onblur="validate(this.id,'');"   onfocus="removeBorder(this.id)">
												<form:option value="">-- Choose Height --</form:option>
												<form:options items="${height}"></form:options>
											</form:select>
									  		<div><form:errors path="height" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Body Type</label>
										<div class="col-md-7">
											<form:select path="bodyType" class="form-control u">
												<form:option value="">-- Choose Body Type --</form:option>
												<form:options items="${bodyType}"></form:options>
											</form:select>
									  		<div><form:errors path="bodyType" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Skin tone</label>
										<div class="col-md-7">
											<form:select path="complexion" class="form-control u">
												<form:option value="">-- Choose Skin tone --</form:option>
												<form:options items="${complexion}"></form:options>
											</form:select>
											<div><form:errors path="complexion" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Mobile <span style="color:red;">*</span></label>
										<div class="col-md-7">
											<form:input path="mobile" class="form-control numericOnly u" onblur="validate(this.id,'Enter Mobile');"   onkeydown="removeBorder(this.id)" maxlength="13" placeholder="Mobile Number"/>
											<div><form:errors path="mobile" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Any Disability?</label>
										<div class="col-md-7">
											<form:select path="disability" class="form-control u">
												<form:option value="">-- Choose Disability --</form:option>
												<form:option value="None">None</form:option>
												<form:option value="Physical Disability">Physical Disability</form:option>
											</form:select>
											<div><form:errors path="disability" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">About myself</label>
										<div class="col-md-7">
											<form:textarea rows="3" path="aboutMyself" class="form-control onlyCharacters u" placeholder="Enter few words about you"></form:textarea>
									  		<div><form:errors path="aboutMyself" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-warning">
						<div class="panel-heading">Family Details</div>
						<div class="panel-body">
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Father Name </label>
										<div class="col-md-7">
											<form:input path="fatherName" class="form-control u" placeholder="Enter Father Name"/>
									  		<div><form:errors path="fatherName" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Mother Name <span style="color:red;">*</span></label>
										<div class="col-md-7">
											<form:input path="motherName" class="form-control u" placeholder="Enter Mother Name"/>
									  		<div><form:errors path="smoking" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Father's Occupation<span style="color:red;">*</span></label>
										<div class="col-md-7">
											<form:select path="fOccupation" class="form-control u" >
												<form:options items="${maleOccupation}"></form:options>
											</form:select>
											<div><form:errors path="drinking" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Mother Occupation <span style="color:red;">*</span></label>
										<div class="col-md-7">
											<form:select path="mOccupation" class="form-control u" >
									      		<form:options items="${occupation}"></form:options>
											</form:select>
									  		<div><form:errors path="mOccupation" cssClass="error" /></div>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">No. of Brothers</label>
										<div class="col-md-7">
											<form:select path="noOfBrothers" class="form-control u">
												<form:option value="">-- Select --</form:option>
												<form:option value="1">1</form:option>
												<form:option value="2">2</form:option>
												<form:option value="3">3</form:option>
											</form:select>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">No. of Sisters</label>
										<div class="col-md-7">
											<form:select path="noOfSisters" class="form-control u">
												<form:option value="">-- Select --</form:option>
												<form:option value="1">1</form:option>
												<form:option value="2">2</form:option>
												<form:option value="3">3</form:option>
											</form:select>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Brother's Married</label>
										<div class="col-md-7">
											<form:select path="noOfBrothersMarried" class="form-control u">
												<form:option value="">-- Select --</form:option>
												<form:option value="1">1</form:option>
												<form:option value="2">2</form:option>
												<form:option value="3">3</form:option>
											</form:select>
										</div>
								  	</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Sister's Married</label>
										<div class="col-md-7">
											<form:select path="noOfSistersMarried" class="form-control u">
												<form:option value="">-- Select --</form:option>
												<form:option value="1">1</form:option>
												<form:option value="2">2</form:option>
												<form:option value="3">3</form:option>
											</form:select>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Any Disability?</label>
										<div class="col-md-7">
											<form:select path="disability" class="form-control u">
												<form:option value="">-- Choose Disability --</form:option>
												<form:option value="None">None</form:option>
												<form:option value="Physical Disability">Physical Disability</form:option>
											</form:select>
										</div>
								  	</div>
								</div>
							</div>
							<div class="row" style="margin-bottom: 0.4em;">
								<div class="col-md-6">
									<div class="form-group">
										<label class="col-md-5 control-label required">Any Disability?</label>
										<div class="col-md-7">
										</div>
								  	</div>
								</div>
							</div>
						</div>
					</div>
					
					<jsp:include page="includeEditProfile.jsp" />
					
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
											<input class="btn btn btn-primary" type="submit" id="submit11" name="yt0" value="Update">
											<input class="btn btn btn-danger" type="reset" id="reset11" name="yt1" value="Reset">
									</div>
								</div>
							</div>
				</form:form>
			</div>
			
			<div class="clearfix"></div>

<!-- //products -->


<script type="text/javascript">

$(document).ready(function(){
	var selected_values = "${createProfile.rMaritalStatus}";
	$("#rMaritalStatus").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rCaste}";
	$("#rCaste").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rState}";
	$("#rState").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rEducation}";
	$("#rEducation").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rReligion}";
	$("#rReligion").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rMotherTongue}";
	$("#rMotherTongue").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rCountry}";
	$("#rCountry").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rWorkingWith}";
	$("#rWorkingWith").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rOccupation}";
	$("#rOccupation").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rDiet}";
	$("#rDiet").val(selected_values.split(","));
});
$(function(){
    $("#ageFrom").append('<option value="">From</option>');
    $("#ageTo").append('<option value="">To</option>');
    for (var i=18;i<=55;i++){
        $("#ageFrom,#ageTo").append('<option value='+i+'>'+i+'</option>');
    }
});


//var listOrders1 = ${allOrders1};
/* if (listOrders1 != "") {
	displayMatches(listOrders1);
}
 */function displayMatches(listOrders) {
	$('#matches').html('');
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) 
	{
		serviceUnitArray[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.image;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
			});
		}
		if(orderObj.firstName !=null)
		{
			var tblRow = '<div class="row container-fluid">'
				+ '<div class="col-md-2" style="margin-right:0; padding-right:0;">'
	            + 	"<img src="+image+" class='img-responsive thumbnail' style='margin-bottom: 0px;'>"
	            + '</div>'
	            + '<div class="col-md-9">'
	            + 	'<div class="profilesimilar">'
	            + 		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
	            + 			'<tr><td><h4>'+orderObj.firstName+'&nbsp;'+orderObj.lastName+'</h4></td></tr>'
	            + 			'<tr><td><p>'+orderObj.dob+', '+orderObj.religionName+', '+orderObj.casteName+',</p></td></tr>'
	            + 			'<tr><td><p>'+orderObj.occupationName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'.</p></td></tr>'
	            + 			'<tr><td><span>Full Profile</span> >></td></tr>'
	            + 		'</table>'
	            + 	'</div>'
	            + '</div>'
	            + '<div class="clearfix"></div>'
	            + '<hr>'
	            + '</div>';
			$(tblRow).appendTo("#matches"); 
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
// 			$('#'+id).css('color','#cc0000');
// 			$('#'+id+'Error').text(errorMessage);
 	}else{
 		$('#'+id).css('border-color','');
 		$('#'+id).removeClass('placeholder-style your-class');
// 			$('#'+id).css('color','');
// 			$('#'+id+'Error').text("");
 	}
 	
 }
 $('.u').blur(function() {
		var id = $(this).attr('id');
		var value=$("#"+id).val();
		var constant ='u';
		var formData = new FormData();
	     formData.append('id', id);
	     formData.append('value', value);
	     formData.append('constant', constant);
		$.fn.makeMultipartRequest('POST', 'autoCompleteSave', false,
				formData, false, 'text', function(data){
			
		});
		
	});
</script>
<%@ include file="userFooter.jsp"%>