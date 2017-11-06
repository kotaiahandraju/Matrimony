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
					<form:form commandName="createProfile" class="form-horizontal" role="form"  action="${baseurl }/admin/addProfile" method="post">
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
								  		<form:input	path="email" onkeydown="removeBorder(this.id)" class="form-control" placeholder="Enter Email"/>
										<span class="hasError" id="emailError" style="font-size: 13px;"></span>
								  		<div><form:errors path="email" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Create Password <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:password path="password" class="form-control" onkeydown="removeBorder(this.id)" placeholder=" Enter Password"/>
								  		<div><form:errors path="password" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Create Profile for <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:select path="createProfileFor" onfocus="removeBorder(this.id)" class="form-control">
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
								  			<form:radiobutton path="gender"  value="Male"/>Male
<!-- 										<input	name="gender" id="radios-0" value="Male" checked="checked" type="radio"> Male -->
										</label>
										<label class="radio-inline" for="radios-1"> 
<!-- 										<input name="gender" id="radios-1" value="Female" type="radio"> Female -->
											<form:radiobutton path="gender"  value="Female"/>Female
										</label>
								  		<div><form:errors path="gender" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">First Name <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:input path="firstName" onkeydown="removeBorder(this.id)" class="form-control onlyCharacters"  placeholder="First Name"/>
<!-- 									  	<input type="text" name="firstName" onkeydown="removeBorder(this.id)" class="form-control onlyCharacters" id="firstName" placeholder="First Name"> -->
								  		<div><form:errors path="firstName" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
									<div class="form-group">
										<label class="col-sm-4 control-label required">Last Name <span style="color:red;">*</span></label>
										<div class="col-sm-8">
										<form:input path="lastName" onkeydown="removeBorder(this.id)" class="form-control onlyCharacters"  placeholder="Last Name"/>
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
									<form:input path="dob" onclick="removeBorder(this.id)" class="form-control"  placeholder="Enter Date of Birth" readonly="true"/>
<!-- 									  	<input type="text" name="dob" onclick="removeBorder(this.id)" class="form-control" id="dob" placeholder="Enter Date of Birth" readonly="readonly"> -->
								  		<div><form:errors path="dob" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Religion <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:select path="religion" onfocus="removeBorder(this.id)"  class="form-control" >
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
									  	<form:select path="motherTongue" onfocus="removeBorder(this.id)" class="form-control" >
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
									  	<form:select path="currentCountry" onfocus="removeBorder(this.id)" class="form-control" >
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
									  	<form:select path="currentState" onfocus="removeBorder(this.id)" class="form-control" >
											<form:option value="">-- Choose State --</form:option>
											<form:options items="${states}"></form:options>
										</form:select>
								  		<div><form:errors path="currentState" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">You live in <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									  	<form:select path="currentCity" onfocus="removeBorder(this.id)" class="form-control" >
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
										<form:select path="maritalStatus" class="form-control u" onblur="validate('maritalStatus','');" onfocus="removeBorder(this.id)">
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
									  	<form:select path="caste" class="form-control u" onblur="validate('cast','');" onfocus="removeBorder(this.id)">
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
										<form:select path="education" class="form-control u" onblur="validate('education','');" onfocus="removeBorder(this.id)">
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
										<form:select path="smoking" class="form-control u" onblur="validate('smoke','');" onfocus="removeBorder(this.id)">
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
										<form:select path="drinking" class="form-control u" onblur="validate('drink','');" onfocus="removeBorder(this.id)">
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
										<form:select path="height" class="form-control u" onblur="validate('height','');" onfocus="removeBorder(this.id)">
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
										<form:input path="mobile" class="form-control numericOnly u" onblur="validate('mobile','Enter Mobile');" onkeydown="removeBorder(this.id)" maxlength="13" placeholder="Mobile Number"/>
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


function validate(id){
	if($('#created_by').val() ==  null || $('#created_by').val() == ""  || $('#created_by').val()=="undefined" ) {
		$('#created_byError').css('color','red');
	    $("#created_byError").text("Created By Cannot be blank.");
	}else{
		$("#created_byError").text("");
	}
	}
function validate1(id){
	if($('#executiveName').val() ==  null || $('#executiveName').val() == ""  || $('#executiveName').val()=="undefined" ) {
		$('#executiveNameError').css('color','red');
	    $("#executiveNameError").text("Executive Name Cannot be blank.");
	}else{
		$("#executiveNameError").text("");
	}
	}
function validate2(id){
	if($('#cast').val() ==  null || $('#cast').val() == ""  || $('#cast').val()=="undefined" ) {
		$('#castError').css('color','red');
	    $("#castError").text("Cast Cannot be blank.");
	}else{
		$("#castError").text("");
	}
	}
function validate3(id){
	if($('#subCaste').val() ==  null || $('#subCaste').val() == ""  || $('#subCaste').val()=="undefined" ) {
		$('#subCasteError').css('color','red');
	    $("#subCasteError").text("Sub Caste Cannot be blank.");
	}else{
		$("#subCasteError").text("");
	}
	}
function validate4(id){
	if($('#sname').val() ==  null || $('#sname').val() == ""  || $('#sname').val()=="undefined" ) {
		$('#snameError').css('color','red');
	    $("#snameError").text("SurName Cannot be blank.");
	}else{
		$("#snameError").text("");
	}
	}
function validate5(id){
	if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" ) {
		$('#nameError').css('color','red');
	    $("#nameError").text("Name Cannot be blank.");
	}else{
		$("#nameError").text("");
	}
	}
function validate6(id){
	if($('#gender').val() ==  null || $('#gender').val() == ""  || $('#gender').val()=="undefined" ) {
		$('#genderError').css('color','red');
	    $("#genderError").text("Gender Cannot be blank.");
	}else{
		$("#genderError").text("");
	}
	}
function validate7(id){
	if($('#dob').val() ==  null || $('#dob').val() == ""  || $('#dob').val()=="undefined" ) {
		$('#dobError').css('color','red');
	    $("#dobError").text("Date of Brith Cannot be blank.");
	}else{
		$("#dobError").text("");
	}
	}
function validate8(id){
	if($('#pob').val() ==  null || $('#pob').val() == ""  || $('#pob').val()=="undefined" ) {
		$('#pobError').css('color','red');
	    $("#pobError").text("Place of Brith Cannot be blank.");
	}else{
		$("#pobError").text("");
	}
	}
function validate9(id){
	if($('#height').val() ==  null || $('#height').val() == ""  || $('#height').val()=="undefined" ) {
		$('#heightError').css('color','red');
	    $("#heightError").text(" Height Cannot be blank.");
	}else{
		$("#heightError").text("");
	}
	}
function validate10(id){
	if($('#complexion').val() ==  null || $('#complexion').val() == ""  || $('#complexion').val()=="undefined" ) {
		$('#complexionError').css('color','red');
	    $("#complexionError").text(" Complexion Cannot be blank.");
	}else{
		$("#complexionError").text("");
	}
	}
function validate11(id){
	if($('#gotram').val() ==  null || $('#gotram').val() == ""  || $('#gotram').val()=="undefined" ) {
		$('#gotramError').css('color','red');
	    $("#gotramError").text(" Gotram Cannot be blank.");
	}else{
		$("#gotramError").text("");
	}
	}
function validate12(id){
	if($('#religion').val() ==  null || $('#religion').val() == ""  || $('#religion').val()=="undefined" ) {
		$('#religionError').css('color','red');
	    $("#religionError").text(" Religion Cannot be blank.");
	}else{
		$("#religionError").text("");
	}
	}
function validate13(id){
	if($('#mtongue').val() ==  null || $('#mtongue').val() == ""  || $('#mtongue').val()=="undefined" ) {
		$('#mtongueError').css('color','red');
	    $("#mtongueError").text(" Mother Tongue Cannot be blank.");
	}else{
		$("#mtongueError").text("");
	}
	}
/* function validate13(id){
	if($('#mtongue').val() ==  null || $('#mtongue').val() == ""  || $('#mtongue').val()=="undefined" ) {
		$('#mtongueError').css('color','red');
	    $("#mtongueError").text(" Mtongue cannot be blank.");
	}else{
		$("#mtongueError").text("");
	}
	} */
function validate14(id){
	if($('#aboutYourself').val() ==  null || $('#aboutYourself').val() == ""  || $('#aboutYourself').val()=="undefined" ) {
		$('#aboutYourselfError').css('color','red');
	    $("#aboutYourselfError").text(" About YourSelf Cannot be blank.");
	}else{
		$("#aboutYourselfError").text("");
	}
	}
function validate15(id){
	if($('#fname').val() ==  null || $('#fname').val() == ""  || $('#fname').val()=="undefined" ) {
		$('#fnameError').css('color','red');
	    $("#fnameError").text(" Father Name Cannot be blank.");
	}else{
		$("#fnameError").text("");
	}
	}
function validate16(id){
	if($('#feducation').val() ==  null || $('#feducation').val() == ""  || $('#feducation').val()=="undefined" ) {
		$('#feducationError').css('color','red');
	    $("#feducationError").text(" Father Education Cannot be blank.");
	}else{
		$("#feducationError").text("");
	}
	}
function validate17(id){
	if($('#foccupation').val() ==  null || $('#foccupation').val() == ""  || $('#foccupation').val()=="undefined" ) {
		$('#foccupationError').css('color','red');
	    $("#foccupationError").text(" Father Occupation Cannot be blank.");
	}else{
		$("#foccupationError").text("");
	}
	}
function validate18(id){
	if($('#fnativeAddress').val() ==  null || $('#fnativeAddress').val() == ""  || $('#fnativeAddress').val()=="undefined" ) {
		$('#fnativeAddressError').css('color','red');
	    $("#fnativeAddressError").text(" Father Native Address Cannot be blank.");
	}else{
		$("#fnativeAddressError").text("");
	}
	}
function validate19(id){
	if($('#presentAddress').val() ==  null || $('#presentAddress').val() == ""  || $('#presentAddress').val()=="undefined" ) {
		$('#presentAddressError').css('color','red');
	    $("#presentAddressError").text(" Present Address Cannot be blank.");
	}else{
		$("#presentAddressError").text("");
	}
	}
function validate20(id){
	if($('#mobile').val() ==  null || $('#mobile').val() == ""  || $('#mobile').val()=="undefined" ) {
		$('#phone1Error').css('color','red');
	    $("#phone1Error").text(" Mobile Cannot be blank.");
	}else{
		$("#phone1Error").text("");
	}
	}
function validate21(id){
	if($('#email').val() ==  null || $('#email').val() == ""  || $('#email').val()=="undefined" ) {
		$('#emailError').css('color','red');
	    $("#emailError").text(" Email Cannot be blank.");
	}else{
		$("#emailError").text("");
	}
	}
function validate22(id){
	if($('#mname').val() ==  null || $('#mname').val() == ""  || $('#mname').val()=="undefined" ) {
		$('#mnameError').css('color','red');
	    $("#mnameError").text("Mother Name Cannot be blank.");
	}else{
		$("#mnameError").text("");
	}
	}
function validate23(id){
	if($('#meducation').val() ==  null || $('#meducation').val() == ""  || $('#meducation').val()=="undefined" ) {
		$('#meducationError').css('color','red');
	    $("#meducationError").text(" Mother Education Cannot be blank.");
	}else{
		$("#meducationError").text("");
	}
	}
function validate24(id){
	if($('#mfName').val() ==  null || $('#mfName').val() == ""  || $('#mfName').val()=="undefined" ) {
		$('#mfNameError').css('color','red');
	    $("#mfNameError").text(" Mother Father's Cannot be blank.");
	}else{
		$("#mfNameError").text("");
	}
	}
function validate25(id){
	if($('#mnativeAddress').val() ==  null || $('#mnativeAddress').val() == ""  || $('#mnativeAddress').val()=="undefined" ) {
		$('#mnativeAddressError').css('color','red');
	    $("#mnativeAddressError").text(" Mother Native Address Cannot be blank.");
	}else{
		$("#mnativeAddressError").text("");
	}
	}
function validate26(id){
	if($('#sibilings').val() ==  null || $('#sibilings').val() == ""  || $('#sibilings').val()=="undefined" ) {
		$('#sibilingsError').css('color','red');
	    $("#sibilingsError").text("Sibilings Cannot be blank.");
	}else{
		$("#sibilingsError").text("");
	}
	}
function validate27(id){
	if($('#property').val() ==  null || $('#property').val() == ""  || $('#property').val()=="undefined" ) {
		$('#propertyError').css('color','red');
	    $("#propertyError").text(" Property Cannot be blank.");
	}else{
		$("#propertyError").text("");
	}
	}
function validate28(id){
	if($('#branch').val() ==  null || $('#branch').val() == ""  || $('#branch').val()=="undefined" ) {
		$('#branchError').css('color','red');
	    $("#branchError").text(" Branch Cannot be blank.");
	}else{
		$("#branchError").text("");
	}
	}
function validate29(id){
	if($('#education').val() ==  null || $('#education').val() == ""  || $('#education').val()=="undefined" ) {
		$('#educationError').css('color','red');
	    $("#educationError").text(" Education Cannot be blank.");
	}else{
		$("#educationError").text("");
	}
	}
function validate30(id){
	if($('#occupation').val() ==  null || $('#occupation').val() == ""  || $('#occupation').val()=="undefined" ) {
		$('#occupationError').css('color','red');
	    $("#occupationError").text(" Occupation Cannot be blank.");
	}else{
		$("#occupationError").text("");
	}
	}
function validate31(id){
	if($('#occupationDetails').val() ==  null || $('#occupationDetails').val() == ""  || $('#occupationDetails').val()=="undefined" ) {
		$('#occupationDetailsError').css('color','red');
	    $("#occupationDetailsError").text(" Occupation Details Cannot be blank.");
	}else{
		$("#occupationDetailsError").text("");
	}
	}
function validate32(id){
	if($('#sinceWorking').val() ==  null || $('#sinceWorking').val() == ""  || $('#sinceWorking').val()=="undefined" ) {
		$('#sinceWorkingError').css('color','red');
	    $("#sinceWorkingError").text(" Since Working Cannot be blank.");
	}else{
		$("#sinceWorkingError").text("");
	}
	}
function validate33(id){
	if($('#ncitizenOf').val() ==  null || $('#ncitizenOf').val() == ""  || $('#ncitizenOf').val()=="undefined" ) {
		$('#ncitizenOfError').css('color','red');
	    $("#ncitizenOfError").text(" Citizen of Cannot be blank.");
	}else{
		$("#ncitizenOfError").text("");
	}
	}
function validate34(id){
	if($('#crCountry').val() ==  null || $('#crCountry').val() == ""  || $('#crCountry').val()=="undefined" ) {
		$('#crCountryError').css('color','red');
	    $("#crCountryError").text(" Country Cannot be blank.");
	}else{
		$("#crCountryError").text("");
	}
	}
function validate35(id){
	if($('#ageGap').val() ==  null || $('#ageGap').val() == ""  || $('#ageGap').val()=="undefined" ) {
		$('#ageGapError').css('color','red');
	    $("#ageGapError").text(" Age Gap Cannot be blank.");
	}else{
		$("#ageGapError").text("");
	}
	}
function validate36(id){
	if($('#rHeightFrom').val() ==  null || $('#rHeightFrom').val() == ""  || $('#rHeightFrom').val()=="undefined" ) {
		$('#rHeightFromError').css('color','red');
	    $("#rHeightFromError").text("Height From Cannot be blank.");
	}else{
		$("#rHeightFromError").text("");
	}
	}
function validate37(id){
	if($('#rHeightTo').val() ==  null || $('#rHeightTo').val() == ""  || $('#rHeightTo').val()=="undefined" ) {
		$('#rHeightToError').css('color','red');
	    $("#rHeightToError").text(" Height To Cannot be blank.");
	}else{
		$("#rHeightToError").text("");
	}
	}
function validate38(id){
	if($('#rComplexion').val() ==  null || $('#rComplexion').val() == ""  || $('#rComplexion').val()=="undefined" ) {
		$('#rComplexionError').css('color','red');
	    $("#rComplexionError").text(" Complexion Cannot be blank.");
	}else{
		$("#rComplexionError").text("");
	}
	}
function validate39(id){
	if($('#rprofession').val() ==  null || $('#rprofession').val() == ""  || $('#rprofession').val()=="undefined" ) {
		$('#rprofessionError').css('color','red');
	    $("#rprofessionError").text(" Profession Cannot be blank.");
	}else{
		$("#rprofessionError").text("");
	}
	}
function validate40(id){
	if($('#Users_terms').prop("checked") == false || $('#Users_terms').val() != 1 || $('#Users_terms').val()=="undefined") {
		$('#Users_termsError').css('color','red');
	    $("#Users_termsError").text("Please Check The Terms & Conditions.");
	}else if($('#Users_terms').prop("checked") == true){$('#Users_termsError').text("");}
	} 
	
	
	
	
	
	
	
	
	
	
	
	
$("#submit11").click(function()
		{			
			if($('#created_by').val() ==  null || $('#created_by').val() == ""  || $('#created_by').val()=="undefined" ||$('#executiveName').val() ==  null || $('#executiveName').val() == ""  || $('#executiveName').val()=="undefined"||$('#cast').val() ==  null || $('#cast').val() == ""  || $('#cast').val()=="undefined" ||$('#subCaste').val() ==  null || $('#subCaste').val() == ""  || $('#subCaste').val()=="undefined"||$('#sname').val() ==  null || $('#sname').val() == ""  || $('#sname').val()=="undefined" ||$('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" ||$('#gender').val() ==  null || $('#gender').val() == ""  || $('#gender').val()=="undefined" ||$('#dob').val() ==  null || $('#dob').val() == ""  || $('#dob').val()=="undefined"||$('#pob').val() ==  null || $('#pob').val() == ""  || $('#pob').val()=="undefined"||$('#height').val() ==  null || $('#height').val() == ""  || $('#height').val()=="undefined"||$('#complexion').val() ==  null || $('#complexion').val() == ""  || $('#complexion').val()=="undefined"||$('#gotram').val() ==  null || $('#gotram').val() == ""  || $('#gotram').val()=="undefined"||$('#religion').val() ==  null || $('#religion').val() == ""  || $('#religion').val()=="undefined"||$('#mtongue').val() ==  null || $('#mtongue').val() == ""  || $('#mtongue').val()=="undefined"||$('#aboutYourself').val() ==  null || $('#aboutYourself').val() == ""  || $('#aboutYourself').val()=="undefined"||$('#fname').val() ==  null || $('#fname').val() == ""  || $('#fname').val()=="undefined"||$('#feducation').val() ==  null || $('#feducation').val() == ""  || $('#feducation').val()=="undefined"||$('#foccupation').val() ==  null || $('#foccupation').val() == ""  || $('#foccupation').val()=="undefined"||$('#fnativeAddress').val() ==  null || $('#fnativeAddress').val() == ""  || $('#fnativeAddress').val()=="undefined"||$('#presentAddress').val() ==  null || $('#presentAddress').val() == ""  || $('#presentAddress').val()=="undefined"||$('#mobile').val() ==  null || $('#mobile').val() == ""  || $('#mobile').val()=="undefined"||$('#email').val() ==  null || $('#email').val() == ""  || $('#email').val()=="undefined"||$('#mname').val() ==  null || $('#mname').val() == ""  || $('#mname').val()=="undefined"||$('#meducation').val() ==  null || $('#meducation').val() == ""  || $('#meducation').val()=="undefined"||$('#mfName').val() ==  null || $('#mfName').val() == ""  || $('#mfName').val()=="undefined"||$('#mnativeAddress').val() ==  null || $('#mnativeAddress').val() == ""  || $('#mnativeAddress').val()=="undefined"||$('#sibilings').val() ==  null || $('#sibilings').val() == ""  || $('#sibilings').val()=="undefined"||$('#property').val() ==  null || $('#property').val() == ""  || $('#property').val()=="undefined"||$('#branch').val() ==  null || $('#branch').val() == ""  || $('#branch').val()=="undefined"||$('#education').val() ==  null || $('#education').val() == ""  || $('#education').val()=="undefined"||$('#occupation').val() ==  null || $('#occupation').val() == ""  || $('#occupation').val()=="undefined"||$('#occupationDetails').val() ==  null || $('#occupationDetails').val() == ""  || $('#occupationDetails').val()=="undefined"||($('#sinceWorking').val() ==  null || $('#sinceWorking').val() == ""  || $('#sinceWorking').val()=="undefined")||$('#ncitizenOf').val() ==  null || $('#ncitizenOf').val() == ""  || $('#ncitizenOf').val()=="undefined"||$('#crCountry').val() ==  null || $('#crCountry').val() == ""  || $('#crCountry').val()=="undefined"||$('#ageGap').val() ==  null || $('#ageGap').val() == ""  || $('#ageGap').val()=="undefined"||$('#rHeightFrom').val() ==  null || $('#rHeightFrom').val() == ""  || $('#rHeightFrom').val()=="undefined"||$('#rHeightTo').val() ==  null || $('#rHeightTo').val() == ""  || $('#rHeightTo').val()=="undefined"||$('#rComplexion').val() ==  null || $('#rComplexion').val() == ""  || $('#rComplexion').val()=="undefined"||$('#rprofession').val() ==  null || $('#rprofession').val() == ""  || $('#rprofession').val()=="undefined"||!this.form.Users_terms.checked || $('#Users_terms').val() != 1 || $('#Users_terms').val()=="undefined")
			{
				if($('#created_by').val() ==  null || $('#created_by').val() == ""  || $('#created_by').val()=="undefined" ) 
				{			    
				    $('#created_byError').css('color','red');
				    $("#created_byError").text("Created By Cannot be blank.");
			    }
				if($('#executiveName').val() ==  null || $('#executiveName').val() == ""  || $('#executiveName').val()=="undefined" ) 
				{			    
				    $('#executiveNameError').css('color','red');
				    $("#executiveNameError").text("Executive Name Cannot be blank.");
			    }
				if($('#cast').val() ==  null || $('#cast').val() == ""  || $('#cast').val()=="undefined" ) 
				{			    
				    $('#castError').css('color','red');
				    $("#castError").text("Cast Cannot be blank.");
			    }
				if($('#subCaste').val() ==  null || $('#subCaste').val() == ""  || $('#subCaste').val()=="undefined" ) 
				{			    
				    $('#subCasteError').css('color','red');
				    $("#subCasteError").text("Sub Cast Cannot be blank.");
			    }
				if($('#sname').val() ==  null || $('#sname').val() == ""  || $('#sname').val()=="undefined" ) 
				{			    
				    $('#snameError').css('color','red');
				    $("#snameError").text("Surname Cannot be blank.");
			    }
				if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" ) 
				{			    
				    $('#nameError').css('color','red');
				    $("#nameError").text("Name Cannot be blank.");
			    }
				if($('#gender').val() ==  null || $('#gender').val() == ""  || $('#gender').val()=="undefined" ) 
				{			    
				    $('#genderError').css('color','red');
				    $("#genderError").text("Gender Cannot be blank.");
			    }
				if($('#dob').val() ==  null || $('#dob').val() == ""  || $('#dob').val()=="undefined" ) 
				{			    
				    $('#dobError').css('color','red');
				    $("#dobError").text("Date of Brith Cannot be blank.");
			    }
				if($('#pob').val() ==  null || $('#pob').val() == ""  || $('#pob').val()=="undefined" ) 
				{			    
				    $('#pobError').css('color','red');
				    $("#pobError").text("Place of Brith Cannot be blank.");
			    }
				if($('#height').val() ==  null || $('#height').val() == ""  || $('#height').val()=="undefined" ) 
				{			    
				    $('#heightError').css('color','red');
				    $("#heightError").text("Height  Cannot be blank.");
			    }
				if($('#complexion').val() ==  null || $('#complexion').val() == ""  || $('#complexion').val()=="undefined" ) 
				{			    
					$('#complexionError').css('color','red');
				    $("#complexionError").text("Complexion  Cannot be blank.");
			    }
				if($('#gotram').val() ==  null || $('#gotram').val() == ""  || $('#gotram').val()=="undefined" ) 
				{			    
				    $('#gotramError').css('color','red');
				    $("#gotramError").text("Gotram  Cannot be blank.");
			    }
				if($('#religion').val() ==  null || $('#religion').val() == ""  || $('#religion').val()=="undefined" ) 
				{			    
				    $('#religionError').css('color','red');
				    $("#religionError").text("Religion  Cannot be blank.");
			    }
				if($('#mtongue').val() ==  null || $('#mtongue').val() == ""  || $('#mtongue').val()=="undefined" ) 
				{			    
				    $('#mtongueError').css('color','red');
				    $("#mtongueError").text("Mother Tongue  Cannot be blank.");
			    }
				/* if($('#mtongue').val() ==  null || $('#mtongue').val() == ""  || $('#mtongue').val()=="undefined" ) 
				{			    
				    $('#mtongueError').css('color','red');
				    $("#mtongueError").text("MTongue  cannot be blank.");
			    } */
				if($('#aboutYourself').val() ==  null || $('#aboutYourself').val() == ""  || $('#aboutYourself').val()=="undefined" ) 
				{			    
				    $('#aboutYourselfError').css('color','red');
				    $("#aboutYourselfError").text("About Yourself  cannot be blank.");
			    }
				if($('#fname').val() ==  null || $('#fname').val() == ""  || $('#fname').val()=="undefined" ) 
				{			    
				    $('#fnameError').css('color','red');
				    $("#fnameError").text("Father Name  Cannot be blank.");
			    }
				if($('#feducation').val() ==  null || $('#feducation').val() == ""  || $('#feducation').val()=="undefined" ) 
				{			    
				    $('#feducationError').css('color','red');
				    $("#feducationError").text("Father Education  Cannot be blank.");
			    }
				if($('#foccupation').val() ==  null || $('#foccupation').val() == ""  || $('#foccupation').val()=="undefined" ) 
				{			    
				    $('#foccupationError').css('color','red');
				    $("#foccupationError").text("Father Occupation  Cannot be blank.");
			    }
				if($('#fnativeAddress').val() ==  null || $('#fnativeAddress').val() == ""  || $('#fnativeAddress').val()=="undefined" ) 
				{			    
				    $('#fnativeAddressError').css('color','red');
				    $("#fnativeAddressError").text("Father Native Address  Cannot be blank.");
			    }
				if($('#presentAddress').val() ==  null || $('#presentAddress').val() == ""  || $('#presentAddress').val()=="undefined" ) 
				{			    
				    $('#presentAddressError').css('color','red');
				    $("#presentAddressError").text("Present Address  Cannot be blank.");
			    }
				if($('#mobile').val() ==  null || $('#mobile').val() == ""  || $('#mobile').val()=="undefined" ) 
				{			    
				    $('#phone1Error').css('color','red');
				    $("#phone1Error").text("Mobile Number  Cannot be blank.");
			    }
				if($('#email').val() ==  null || $('#email').val() == ""  || $('#email').val()=="undefined" ) 
				{			    
				    $('#emailError').css('color','red');
				    $("#emailError").text("Email  Cannot be blank.");
			    }
				if($('#mname').val() ==  null || $('#mname').val() == ""  || $('#mname').val()=="undefined" ) 
				{			    
				    $('#mnameError').css('color','red');
				    $("#mnameError").text("Mother Name  Cannot be blank.");
			    }
				if($('#meducation').val() ==  null || $('#meducation').val() == ""  || $('#meducation').val()=="undefined" ) 
				{			    
				    $('#meducationError').css('color','red');
				    $("#meducationError").text("Mother Education  Cannot be blank.");
			    }
				if($('#mfName').val() ==  null || $('#mfName').val() == ""  || $('#mfName').val()=="undefined" ) 
				{			    
				    $('#mfNameError').css('color','red');
				    $("#mfNameError").text("Mother Father's Name  Cannot be blank.");
			    }
				if($('#mnativeAddress').val() ==  null || $('#mnativeAddress').val() == ""  || $('#mnativeAddress').val()=="undefined" ) 
				{			    
				    $('#mnativeAddressError').css('color','red');
				    $("#mnativeAddressError").text("Mother Native Address  Cannot be blank.");
			    }
				if($('#sibilings').val() ==  null || $('#sibilings').val() == ""  || $('#sibilings').val()=="undefined" ) 
				{			    
				    $('#sibilingsError').css('color','red');
				    $("#sibilingsError").text("Sibilings  Cannot be blank.");
			    }
				if($('#property').val() ==  null || $('#property').val() == ""  || $('#property').val()=="undefined" ) 
				{			    
				    $('#propertyError').css('color','red');
				    $("#propertyError").text("Property  Cannot be blank.");
			    }
				if($('#branch').val() ==  null || $('#branch').val() == ""  || $('#branch').val()=="undefined" ) 
				{			    
				    $('#branchError').css('color','red');
				    $("#branchError").text("Branch  Cannot be blank.");
			    }
				if($('#education').val() ==  null || $('#education').val() == ""  || $('#education').val()=="undefined" ) 
				{			    
				    $('#educationError').css('color','red');
				    $("#educationError").text("Education  Cannot be blank.");
			    }
				if($('#occupation').val() ==  null || $('#occupation').val() == ""  || $('#occupation').val()=="undefined" ) 
				{			    
				    $('#occupationError').css('color','red');
				    $("#occupationError").text("Occupation  Cannot be blank.");
			    }
				if($('#occupationDetails').val() ==  null || $('#occupationDetails').val() == ""  || $('#occupationDetails').val()=="undefined" ) 
				{			    
				    $('#occupationDetailsError').css('color','red');
				    $("#occupationDetailsError").text("Occupation Details  Cannot be blank.");
			    }
				if($('#sinceWorking').val() ==  null || $('#sinceWorking').val() == ""  || $('#sinceWorking').val()=="undefined" ) 
				{			    
				    $('#sinceWorkingError').css('color','red');
				    $("#sinceWorkingError").text("Since Working  Cannot be blank.");
			    }
				if($('#ncitizenOf').val() ==  null || $('#ncitizenOf').val() == ""  || $('#ncitizenOf').val()=="undefined" ) 
				{			    
				    $('#ncitizenOfError').css('color','red');
				    $("#ncitizenOfError").text("CitizenOf  Cannot be blank.");
			    }
				if($('#crCountry').val() ==  null || $('#crCountry').val() == ""  || $('#crCountry').val()=="undefined" ) 
				{			    
				    $('#crCountryError').css('color','red');
				    $("#crCountryError").text("Country  Cannot be blank.");
			    }
				if($('#ageGap').val() ==  null || $('#ageGap').val() == ""  || $('#ageGap').val()=="undefined" ) 
				{			    
				    $('#ageGapError').css('color','red');
				    $("#ageGapError").text("Age Gap  Cannot be blank.");
			    }
				if($('#rHeightFrom').val() ==  null || $('#rHeightFrom').val() == ""  || $('#rHeightFrom').val()=="undefined" ) 
				{			    
				    $('#rHeightFromError').css('color','red');
				    $("#rHeightFromError").text("Height from  Cannot be blank.");
			    }
				if($('#rHeightTo').val() ==  null || $('#rHeightTo').val() == ""  || $('#rHeightTo').val()=="undefined" ) 
				{			    
				    $('#rHeightToError').css('color','red');
				    $("#rHeightToError").text("Height To  Cannot be blank.");
			    }
				if($('#rComplexion').val() ==  null || $('#rComplexion').val() == ""  || $('#rComplexion').val()=="undefined" ) 
				{			    
				    $('#rComplexionError').css('color','red');
				    $("#rComplexionError").text("Complexion  Cannot be blank.");
			    }
				if($('#rprofession').val() ==  null || $('#rprofession').val() == ""  || $('#rprofession').val()=="undefined" ) 
				{			    
				    $('#rprofessionError').css('color','red');
				    $("#rprofessionError").text("Profession  Cannot be blank.");
			    }
				if(!this.form.Users_terms.checked || $('#Users_terms').val() != 1 || $('#Users_terms').val()=="undefined" ) {
					$('#Users_termsError').css('color','red');
				    $("#Users_termsError").text("Please Check The Terms & Conditions.");
				}else if(this.form.Users_terms.checked){$('#Users_termsError').text("");}

				return false;
				 $("#creteProfile-form").submit();
			}
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


$(".profiles").addClass("active");
$(".createProfile").addClass("active");
</script>
</body>

</html>

