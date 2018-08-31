<h4   style="padding="10px;"></h4><h3>Partner Preferences</h3><hr>
<div class="panel panel-success" style='box-shadow: 5px 8px 5px;'>

			<div class="panel-body table-responsive">
			
			<div class="col-md-11">	<strong class="font">Basic & Religion Preferences</strong>
				<a href="#" class="all_a  pull-right  edit-style" id="partner_basic_a" onclick="toggleDiv('partner_basic');"><i class="fa fa-edit"></i>Edit</a>
	<div id="partner_basic_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>
				<c:if test="${profileBean.gender == 'Female'}">Groom</c:if>
				<c:if test="${profileBean.gender == 'Male'}">Bride</c:if>
				's Age
			</td><td>:</td>
			<td id="rAgeFrom_val">
				<c:if test="${not empty profileBean.rAgeFrom}">${profileBean.rAgeFrom} - ${profileBean.rAgeTo} Years</c:if>
				<c:if test="${empty profileBean.rAgeFrom}">Not Specified</c:if>
			</td>
			<td>Height</td><td>:</td>
			<td>
				<span id="rHeight_val"><c:if test="${not empty profileBean.rHeightInches}">${profileBean.rHeightInches} - </c:if></span> <span id="rHeightTo_val"><c:if test="${not empty profileBean.rHeightInches}">${profileBean.rHeightToInches}</c:if></span>
				<span id="rHeight_outer_val"><c:if test="${empty profileBean.rHeightInches}">Not Specified</c:if></span>
			</td>
		</tr>
		<tr><td>Marital Status</td><td>:</td>
			<td id="rMaritalStatus_val">
				<c:if test="${not empty profileBean.rMaritalStatusName}">${profileBean.rMaritalStatusName}</c:if>
				<c:if test="${empty profileBean.rMaritalStatusName}">Not Specified</c:if>
			</td>
			<%-- <td>Physical Status</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.casteName}">${profileBean.casteName}</c:if>
				<c:if test="${empty profileBean.casteName}">Not Specified</c:if>
			</td> --%>
			<td>Eating Habits</td><td>:</td>
			<td id="rDiet_val">
				<c:if test="${not empty profileBean.rDietName}">${profileBean.rDietName}</c:if>
				<c:if test="${empty profileBean.rDietName}">Not Specified</c:if>
			</td>
		</tr>
		<tr>
			<%-- <td>Smoking Habits</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.casteName}">${profileBean.casteName}</c:if>
				<c:if test="${empty profileBean.casteName}">Not Specified</c:if> 
			</td>  --%>
		</tr>
		<tr>
			<%-- <td>Drinking Habits</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
				<c:if test="${empty profileBean.currentStateName}">Not Specified</c:if> 
			</td> --%>
			<td>Religion</td><td>:</td>
			<td id="rReligion_val">
				<c:if test="${not empty profileBean.rReligionName}">${profileBean.rReligionName}</c:if>
				<c:if test="${empty profileBean.rReligionName}">Not Specified</c:if>
			</td>
			<td>Mothertongue</td><td>:</td>
			<td id="rMotherTongue_val">
				<c:if test="${not empty profileBean.rMotherTongueName}">${profileBean.rMotherTongueName}</c:if>
				<c:if test="${empty profileBean.rMotherTongueName}">Not Specified</c:if>
			</td>
		</tr>
		<tr>
			<td>Caste</td><td>:</td>
			<td id="rCaste_val">
				<c:if test="${not empty profileBean.rCasteName}">${profileBean.rCasteName}</c:if>
				<c:if test="${empty profileBean.rCasteName}">Not Specified</c:if>
			</td>
		</tr>
		<%-- <tr>
			<td>Star</td><td>:</td>
			 <td>
				<c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
				<c:if test="${empty profileBean.currentStateName}">Not Specified</c:if>
			</td> 
			
		</tr> --%>
	</table>
	</div>
	<div id="partner_basic_edit" class="all_hidden_divs" hidden="true">
		<jsp:include page="partner_basics.jsp" />
	</div>
	</div>
	</div>
</div>

<br>
<div class="panel panel-success" style='box-shadow: 5px 8px 5px; border: none;'>
			<div class="panel-body table-responsive">
			<div class="col-md-11">	<strong class="font">Professional Preferences</strong>
				<a href="#" class="all_a  pull-right  edit-style" id="partner_professional_a" onclick="toggleDiv('partner_professional');"><i class="fa fa-edit"></i>Edit</a>
	<div id="partner_professional_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>Education</td><td>:</td>
			<td id="rEducation_val">
				<c:if test="${not empty profileBean.rEducationName}">${profileBean.rEducationName}</c:if>
				<c:if test="${empty profileBean.rEducationName}">Not Specified</c:if>
			</td>
			
		</tr>
		<tr><td>Working With</td><td>:</td>
			<td id="rWorkingWith_val">
				<c:if test="${not empty profileBean.rWorkingWith}">${profileBean.rWorkingWith}</c:if>
				<c:if test="${empty profileBean.rWorkingWith}">Not Specified</c:if>
			</td>
			
		</tr>
		<tr><td>Occupation</td><td>:</td>
			<td id="rOccupation_val">
				<c:if test="${not empty profileBean.rOccupationName}">${profileBean.rOccupationName}</c:if>
				<c:if test="${empty profileBean.rOccupationName}">Not Specified</c:if>
			</td>
			
		</tr>
		<tr><td>Annual Income</td><td>:</td>
			<td id="rAnnualIncome_val">
				<c:if test="${not empty profileBean.rAnnualIncome}">${profileBean.rAnnualIncome}</c:if>
				<c:if test="${empty profileBean.rAnnualIncome}">Not Specified</c:if>
			</td>
			
		</tr>
	</table>
	</div>
	<div id="partner_professional_edit" class="all_hidden_divs" hidden="true">
	  <div class="row">
		<div class="form-group">
	      <label class="col-md-4 control-label" for="textinput">Education</label>  
	      <div class="col-md-7">
	      	<form:select path="rEducation" class="multiSelect" multiple="true">
	      	 <form:option value="any">Doesn't Matter</form:option>
	      		<form:options items="${education}"></form:options>
			</form:select>
	      </div>
	    </div>
	   </div>
	   
	   <div class="row"> 
	    <div class="form-group">
	      <label class="col-md-4 control-label" for="textinput">Working with</label>  
	      <div class="col-md-7">
	      	<form:select path="rWorkingWith" class="multiSelect" multiple="true">
				<form:option value="any">Doesn't Matter</form:option>
				<form:option value="Private Company">Private Company</form:option>
				<form:option value="Government/Public Sector">Government/Public Sector</form:option>
				<form:option value="Defense/Civil Services">Defense/Civil Services</form:option>
				<form:option value="Not Working">Not Working</form:option>
			</form:select>
	      </div>
	    </div>
	    </div>
	    <div class="row">
	    <div class="form-group">
	      <label class="col-md-4 control-label" for="textinput">Profession area</label>  
	      <div class="col-md-7">
	      	<form:select path="rOccupation" class="multiSelect" multiple="true">
				<form:options items="${occupation}"></form:options>
			</form:select>
	      </div>
	    </div>
	    </div>
	    <div class="row">
	    <div class="form-group">
	      <label class="col-md-4 control-label" for="textinput">Annual Income</label>  
	      <div class="col-md-7">
	      	<input type="radio" name="annualIncome" class="incomeMatter" id="ai1" value=""> <label for="ai1">Doesn't Matter</label>
	      	<input type="radio" name="annualIncome" class="incomeRange" id="ai2" value="Specify an income range"> <label for="ai2">Specify an income range</label>
	      	<%-- <form:select path="education" class="form-control u">
				<form:option value="">Doesn't Matter</form:option>
				<form:option value="Specify an income range">Specify an income range</form:option>
			</form:select> --%>
	      </div>
	    </div>
	    </div>
	    <div class="row">
		    <div class="form-group incomeBlock">
		      <label class="col-md-4 control-label" for="textinput"></label>  
		      <div class="col-md-7">
		      	<form:select path="rAnnualIncome" class="form-control u1">
					<form:option value="">-- Annual Income --</form:option>
					<form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
					<form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
					<form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
					<form:option value="Above INR 7 Lakh">Above INR 7 Lakh</form:option>
				</form:select>
		      </div>
		    </div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4 pull-right">
				<div class="form-group">
						<input class="btn btn btn-primary" style="padding: 8px 24px;" type="button" id="partner_professional_submit" name="yt0" value="Save" onclick="saveChanges('partner_professional');">
						<input class="btn btn btn-success" style="padding: 8px 24px;" type="button" id="partner_professional_cancel" name="yt1" value="Cancel" onclick="toggleDiv('partner_professional');">
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
</div>
<br>
<div class="panel panel-success" style='box-shadow: 5px 8px 5px;'>
			<div class="panel-body table-responsive">
			<div class="col-md-11">	<strong class="font">Location Preferences</strong>
				<a href="#" class="all_a  pull-right  edit-style" id="partner_location_a" onclick="toggleDiv('partner_location');"><i class="fa fa-edit"></i>Edit</a>
	<div id="partner_location_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>Country</td><td>:</td>
			<td id="rCountry_val">
				<c:if test="${not empty profileBean.rCountryName}">${profileBean.rCountryName}</c:if>
				<c:if test="${empty profileBean.rCountryName}">Not Specified</c:if>
			</td>
		</tr>
		<tr>
			<td>Residing State</td><td>:</td>
			<td id="rState_val">
				<c:if test="${not empty profileBean.rStateName}">${profileBean.rStateName}</c:if>
				<c:if test="${empty profileBean.rStateName}">Not Specified</c:if>
			</td>
			<!-- <td>City</td><td>:</td> -->
			
		</tr>
		
		<%-- <tr><td>Residing City</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rCity}">${profileBean.rCity}</c:if>
				<c:if test="${empty profileBean.rCity}">Not Specified</c:if>
			</td>
			
			
		</tr>
		<tr><td>Citizenship</td><td>:</td>
			<td>
				 <c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
				<c:if test="${empty profileBean.currentStateName}"><a>Add State</a></c:if> 
			</td>
			
		</tr> --%>
	</table>
	</div>
	<div id="partner_location_edit" class="all_hidden_divs" hidden="true">
		<div class="form-group">
	      <label class="col-md-4 control-label" for="textinput">Country living in</label>  
	      <div class="col-md-7">
	      	<form:select path="rCountry" class="multiSelect" multiple="true">
				<form:options items="${countries}"></form:options>
				
			</form:select>
	      </div>
	    </div>
	    
	    <div class="form-group">
	      <label class="col-md-4 control-label" for="textinput">State living in</label>  
	      <div class="col-md-7">
	      	<form:select path="rState" class="multiSelect" multiple="true">
				<form:options items="${states }"></form:options>
			</form:select>
	      </div>
	    </div>
		<br>
		<div class="row">
			<div class="col-md-4 pull-right">
				<div class="form-group">
						<input class="btn btn btn-primary" style="padding: 8px 24px;" type="button" id="partner_location_submit" name="yt0" value="Save" onclick="saveChanges('partner_location');">
						<input class="btn btn btn-success" style="padding: 8px 24px;" type="button" id="partner_location_cancel" name="yt1" value="Cancel" onclick="toggleDiv('partner_location');">
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
</div>