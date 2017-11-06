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
				<span style="color: #999;cursor: auto;">Create Profile</span>
			</li>
		</ul>
		
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet" id="yw0">
				<div class="portlet-content w3-animate-zoom">
					<!-- Create Profile Form Starts Here -->
					<form:form commandName="createProfile" class="form-horizontal" id="creteProfile-form" role="form"  action="${baseurl }/admin/addProfile" method="post">
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
								<legend>Basic Information</legend>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Email-Id <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:input	path="email" onkeydown="removeBorder(this.id)" class="form-control"  onblur="validate(this.id,'Enter Email');"  placeholder="Enter Email"/>
								  		<div><form:errors path="email" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Create Password <span style="color:red;"></span></label>
									<div class="col-sm-8">
									  	<form:password path="password" class="form-control"   placeholder=" Enter Password"/> 
								  		<div><form:errors path="password" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Create Profile for <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:select path="createProfileFor" onfocus="removeBorder(this.id)" onblur="validate(this.id,'');"  class="form-control">
											<form:option value="">-- Select --</form:option>
											<form:option value="Self">Self</form:option>
											<form:option value="Son">Son</form:option>
											<form:option value="Daughter">Daughter</form:option>
											<form:option value="Brother">Brother</form:option>
											<form:option value="Sister">Sister</form:option>
											<form:option value="Friend">Friend</form:option>
											<form:option value="Relative">Relative</form:option>
										</form:select>
								  		<div><form:errors path="createProfileFor" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Gender <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<label class="radio-inline" for="radios-0">
								  			<form:radiobutton path="gender" onmouseover="removeBorder(this.id)"   onclick="validate1(this.id,'');"  value="Male"/>Male
<!-- 										<input	name="gender" id="radios-0" value="Male" checked="checked" type="radio"> Male -->
										</label>
										<label class="radio-inline" for="radios-1"> 
<!-- 										<input name="gender" id="radios-1" value="Female" type="radio"> Female -->
											<form:radiobutton path="gender"  onclick="validate1(this.id,'');"  value="Female"/>Female
										</label>
								  		<div><form:errors path="gender" cssClass="error" /></div>
									<div ><span id="dis"></span></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">First Name <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:input path="firstName" onkeydown="removeBorder(this.id)" onblur="validate(this.id,'Enter  FirstName');"  class="form-control onlyCharacters"  placeholder="First Name"/>
<!-- 									  	<input type="text" name="firstName" onkeydown="removeBorder(this.id)" class="form-control onlyCharacters" id="firstName" placeholder="First Name"> -->
								  		<span class="hasError" id="firstNameError" style="font-size: 13px;"></span>
								  		<div><form:errors path="firstName" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
									<div class="form-group">
										<label class="col-sm-4 control-label required">Last Name <span style="color:red;">*</span></label>
										<div class="col-sm-8">
										<form:input path="lastName" onkeydown="removeBorder(this.id)"  onblur="validate(this.id,'Enter  LastName');"  class="form-control onlyCharacters"  placeholder="Last Name"/>
<!-- 										  	<input type="text" name="lastName" onkeydown="removeBorder(this.id)" class="form-control onlyCharacters" id="firstName" placeholder="Last Name"> -->
									  		<div><form:errors path="lastName" cssClass="error" /></dlastNameiv>
										</div>
								  	</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Date of Birth <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:input path="dob" onchange="removeBorder(this.id)" class="form-control"  onblur="validate(this.id,'');"  placeholder="Enter Date of Birth" readonly="true"/>
<!-- 									  	<input type="text" name="dob" onclick="removeBorder(this.id)" class="form-control" id="dob" placeholder="Enter Date of Birth" readonly="readonly"> -->
								  		<div><form:errors path="dob" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Religion <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:select path="religion" onfocus="removeBorder(this.id)" onblur="validate(this.id,'');"  class="form-control" >
											<form:option value="">-- Choose Religion --</form:option>
											<form:options items="${religion}"></form:options>
										</form:select>
								  		<div><form:errors path="religion" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Mother tongue <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:select path="motherTongue" onfocus="removeBorder(this.id)"   onblur="validate(this.id,'');"  class="form-control" >
											<form:option value="">-- Choose Mother Tongue --</form:option>
											<form:options items="${language}"></form:options>
										</form:select>
								  		<div><form:errors path="motherTongue" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Where you live? <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:select path="currentCountry" onfocus="removeBorder(this.id)"  onblur="validate(this.id,'');"   class="form-control" >
											<form:option value="">-- Choose Country --</form:option>
											<form:options items="${countries}"></form:options>
										</form:select>
								  		<div><form:errors path="currentCountry" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">You live in <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:select path="currentState" onfocus="removeBorder(this.id)" onchange="getCitys(this.id)" onblur="validate(this.id,'');"    class="form-control" >
											<form:option value="">-- Choose State --</form:option>
												<form:options items="${states }" ></form:options>
										</form:select>
								  		<div><form:errors path="currentState" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">You live in <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:select path="currentCity" onfocus="removeBorder(this.id)"  onblur="validate(this.id,'');"   class="form-control" >
											<form:option value="">-- Choose City --</form:option>
											<form:options items="${citys }"></form:options>
										</form:select>
								  		<div><form:errors path="currentCity" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Marital Status <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="maritalStatus" class="form-control u"   onblur="validate(this.id,'');"  onfocus="removeBorder(this.id)">
											<form:option value="">-- Martial Status --</form:option>
											<form:option value="Married">Married</form:option>
											<form:option value="Unmarried">Unmarried</form:option>
											<form:option value="Widow/Divorced">Widow/Divorced</form:option>
										</form:select>
								  		<div><form:errors path="maritalStatus" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Community <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:select path="caste" class="form-control u"  onblur="validate(this.id,'');"   onfocus="removeBorder(this.id)">
											<form:option value="">-- Choose Community --</form:option>
											<form:options items="${cast}"></form:options>
										</form:select>
								  		<div><form:errors path="caste" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Gotram </label>
									<div class="col-sm-8">
									  	<form:input path="gotram" type="text" class="form-control onlyCharacters u" placeholder="Enter Gotram" maxlength="255"/>
								  		<div><form:errors path="gotram" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Nakshatram </label>
									<div class="col-sm-8">
										<form:select path="star" class="form-control u">
											<form:option value="">-- Choose Nakshatram --</form:option>
											<form:options items="${star}"></form:options>
										</form:select>
								  		<div><form:errors path="star" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Dosham </label>
									<div class="col-sm-8">
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
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Dosham Name </label>
									<div class="col-sm-8">
										<form:input path="dosamName" type="text" class="form-control onlyCharacters u" placeholder="Enter Dosham Name" maxlength="255"/>
										<div><form:errors path="dosamName" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<legend>Education & Career Details</legend>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Education level <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="education" class="form-control u"  onblur="validate(this.id,'');"   onfocus="removeBorder(this.id)">
											<form:option value="">-- Choose Education --</form:option>
											<form:options items="${education}"></form:options>
										</form:select>
								  		<div><form:errors path="education" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">You work with </label>
									<div class="col-sm-8">
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
							<div class="col-md-4">
								<div class="form-group" style="display: none;">
									<label class="col-sm-4 control-label required">Company Name </label>
									<div class="col-sm-8">
										<form:input path="companyName" type="text" class="form-control onlyCharacters u" placeholder="Enter Company Name" maxlength="255"/>
										<div><form:errors path="companyName" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">As </label>
									<div class="col-sm-8">
										<form:select path="occupation" class="form-control u">
											<form:option value="">-- Choose Occupation --</form:option>
											<form:options items="${occupation}"></form:options>
										</form:select>
								  		<div><form:errors path="occupation" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Annual Income </label>
									<div class="col-sm-8">
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
							<div class="col-md-4">
								
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<legend>Personal Details</legend>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">What's your diet? </label>
									<div class="col-sm-8">
										<form:select path="diet" class="form-control u" >
											<form:option value="">-- Select Diet--</form:option>
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
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Smoke? <span style="color:red;">*</span></label>
									<div class="col-sm-8">
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
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Drink? <span style="color:red;">*</span></label>
									<div class="col-sm-8">
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
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Your Height? <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="height" class="form-control u"  onblur="validate(this.id,'');"   onfocus="removeBorder(this.id)">
											<form:option value="">-- Choose Height --</form:option>
											<form:options items="${height}"></form:options>
										</form:select>
								  		<div><form:errors path="height" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Body Type</label>
									<div class="col-sm-8">
										<form:select path="bodyType" class="form-control u">
											<form:option value="">-- Choose Body Type --</form:option>
											<form:options items="${bodyType}"></form:options>
										</form:select>
								  		<div><form:errors path="bodyType" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Skin tone</label>
									<div class="col-sm-8">
										<form:select path="complexion" class="form-control u">
											<form:option value="">-- Choose Skin tone --</form:option>
											<form:options items="${complexion}"></form:options>
										</form:select>
										<div><form:errors path="complexion" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Mobile <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="mobile" class="form-control numericOnly u" onblur="validate(this.id,'Enter Mobile');"   onkeydown="removeBorder(this.id)" maxlength="13" placeholder="Mobile Number"/>
										<div><form:errors path="mobile" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">About myself</label>
									<div class="col-sm-8">
										<form:textarea rows="4" path="aboutMyself" class="form-control onlyCharacters u" placeholder="Enter few words about you"></form:textarea>
								  		<div><form:errors path="aboutMyself" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Any Disability?</label>
									<div class="col-sm-8">
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
						<div class="row">
							<div class="col-md-12">
								<legend>Family Details</legend>
							</div>
							
							<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Father Name </label>
									<div class="col-sm-8">
											<form:input path="fatherName" class="form-control" placeholder="Enter Father Name"/>
								  		<div><form:errors path="fatherName" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Mother Name <span style="color:red;">*</span></label>
									<div class="col-sm-8">
											<form:input path="motherName" class="form-control" placeholder="Enter Mother Name"/>
								  		<div><form:errors path="smoking" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Father's Occupation<span style="color:red;">*</span></label>
									<div class="col-sm-8">
											<form:select path="fOccupation" class="form-control u1" >
											<form:options items="${occupation}"></form:options>
											</form:select>
										<div><form:errors path="drinking" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Mother's Occupation <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="mOccupation" class="form-control u1" >
								      	<form:options items="${occupation}"></form:options>
										</form:select>
								  		<div><form:errors path="height" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">No. of Brothers</label>
									<div class="col-sm-8">
										<form:select path="noOfBrothers" class="form-control u1">
											<form:option value="">-- Select --</form:option>
											<form:option value="1">1</form:option>
											<form:option value="2">2</form:option>
											<form:option value="3">3</form:option>
										</form:select>
								  		<div><form:errors path="bodyType" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">No. of Sisters</label>
									<div class="col-sm-8">
										<form:select path="noOfSisters" class="form-control u1">
											<form:option value="">-- Select --</form:option>
											<form:option value="1">1</form:option>
											<form:option value="2">2</form:option>
											<form:option value="3">3</form:option>
										</form:select>
										<div><form:errors path="complexion" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">noOfBrothersMarried <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="noOfBrothersMarried" class="form-control u1">
											<form:option value="">-- Select --</form:option>
											<form:option value="1">1</form:option>
											<form:option value="2">2</form:option>
											<form:option value="3">3</form:option>
										</form:select>
										<div><form:errors path="mobile" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">noOfSistersMarried</label>
									<div class="col-sm-8">
										<form:select path="noOfSistersMarried" class="form-control u1">
											<form:option value="">-- Select --</form:option>
											<form:option value="1">1</form:option>
											<form:option value="2">2</form:option>
											<form:option value="3">3</form:option>
										</form:select>
								  		<div><form:errors path="aboutMyself" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Any Disability?</label>
									<div class="col-sm-8">
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
							
							
							
						</div>
						<jsp:include page="p1.jsp" /> 
						<div class="row">
							<div class="col-md-offset-5 col-md-4">
								<div class="form-group">
								<div class=" col-md-offset-1 col-md-6">
									<input class="btn btn btn-primary" type="submit" id="submit11" name="yt0" value="Submit">
									<input class="btn btn btn-danger" type="reset" id="reset11" name="yt1" value="Cancel">
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
var ss =new Date().getFullYear()-16;
$("#dob").datepicker({
    dateFormat: "dd-MM-yy",
    changeDate : true,
	changeMonth : true,
	changeYear : true,
// 	maxDate :0,
	yearRange: '1950:' + ss
});
$('#tob').mdtimepicker(); //Initializes the time picker

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

