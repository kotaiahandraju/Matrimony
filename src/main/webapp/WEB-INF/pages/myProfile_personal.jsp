<h4   style="padding="10px;"></h4><h3>Personal information</h3><hr>
			<div class="panel panel-success" style='box-shadow: 5px 8px 5px;'>
			<div class="panel-body table-responsive">			
			<div class="col-md-11">	<strong class="font">About my ${cacheGuest.createProfileFor}<a href="#" class="all_a  pull-right  edit-style" id="about_a" onclick="toggleDiv('about');"><i class="fa fa-edit"></i>Edit</a></strong>
				<div id="about_view" class="all_visible_divs">
					<p id="aboutMyself_val">
						<c:if test="${not empty profileBean.aboutMyself}">${profileBean.aboutMyself}</c:if>
						<c:if test="${empty profileBean.aboutMyself}">Not Specified</c:if>
					</p></div>
				</div>
				<div id="about_edit" class="all_hidden_divs" hidden="true">
					<form:textarea path="aboutMyself" cols="90" rows="6"/>
					<div class="row">
						<div class="col-md-4">
							<div class="form-group">
									<input class="btn btn btn-primary" type="button" id="about_submit" name="yt0" value="Save" onclick="saveChanges('about');">
									<input type="button" id="about_cancel" name="yt1" value="Cancel" onclick="toggleDiv('about');">
							</div>
						</div>
					</div>
				</div>
			</div></div>
	<br>
		<div class="panel panel-success" style='box-shadow: 5px 8px 5px;'>
			<div class="panel-body table-responsive">
			<div class="col-md-11">	<strong class="font">Basic Details <a href="#" class="all_a  pull-right  edit-style" id="basic_details_a" onclick="toggleDiv('basic_details');"><i class="fa fa-edit"></i>Edit</a></strong>
				<div id="basic_details_view" class="all_visible_divs">
					<table class="col-md-12 table-responsive">
						<tr><td>Name</td>
							<td>:</td>
							<td class="name_val">${profileBean.firstName}&nbsp; ${profileBean.lastName}</td>
							<td>Body Type</td><td>:</td>
							<td id="bodyType_val">
								<c:if test="${not empty profileBean.bodyTypeName}">${profileBean.bodyTypeName}</c:if>
								<c:if test="${empty profileBean.bodyTypeName}">Not specified
								</c:if>
							</td>
						</tr>
						<tr>
							<td>Age</td><td>:</td>
							<td id="age_val">
								<c:if test="${not empty profileBean.age}">${profileBean.age} yrs</c:if>
								<c:if test="${empty profileBean.age}">Not specified</c:if>
							</td>
							<td>Complexion</td><td>:</td>
							<td id="complexion_val">
								<c:if test="${not empty profileBean.complexionName}">${profileBean.complexionName}</c:if>
								<c:if test="${empty profileBean.complexionName}">Not specified</c:if>
							</td>
						</tr>
						<tr>
							<td>Height</td><td>:</td>
							<td id="height_val">
								<c:if test="${not empty profileBean.heightInches}">${profileBean.heightInches}</c:if>
								<c:if test="${empty profileBean.heightInches}">Not specified</c:if>
							</td>
							<td>Physical Status</td><td>:</td>
							<td id="disability_val">
								<c:if test="${not empty profileBean.disability}">${profileBean.disability}</c:if>
								<c:if test="${empty profileBean.disability}">Not specified</c:if>
							</td>
						</tr>
						<tr>
							<%-- <td>Weight</td><td>:</td>
							<td id="height_val">
								<c:if test="${not empty profileBean.weight}">${profileBean.weight}</c:if>
								<c:if test="${empty profileBean.weight}">Not specified</c:if>
							</td> --%>
							<td>Eating Habits</td><td>:</td>
							<td id="diet_val"> 
								<c:if test="${not empty profileBean.diet}">${profileBean.diet}</c:if>
								<c:if test="${empty profileBean.diet}">Not specified</c:if>
							</td>
						</tr>
						<tr>
							<td>Mother Tongue</td><td>:</td>
							<td id="motherTongue_val">
								<c:if test="${not empty profileBean.motherTongueName}">${profileBean.motherTongueName}</c:if>
								<c:if test="${empty profileBean.motherTongueName}">Not specified</c:if>
							</td>
							<td>Drinking Habits</td><td>:</td>
							<td id="drinking_val">
								<c:if test="${not empty profileBean.drinking}">${profileBean.drinking}</c:if>
								<c:if test="${empty profileBean.drinking}">Not specified</c:if>
							</td>
						</tr>
						<tr>
							<td>Marital Status</td><td>:</td>
							<td id="maritalStatus_val">
								<c:if test="${not empty profileBean.maritalStatus}">${profileBean.maritalStatus}</c:if>
								<c:if test="${empty profileBean.maritalStatus}">Not specified</c:if>
							</td>
							<td>Smoking Habits</td><td>:</td>
							<td id="smoking_val">
								<c:if test="${not empty profileBean.smoking}">${profileBean.smoking}</c:if>
								<c:if test="${empty profileBean.smoking}">Not specified</c:if>
							</td>
						</tr>
					</table>
			</div>
			<div id="basic_details_edit" class="all_hidden_divs" hidden="true">
				<jsp:include page="basic_details.jsp" />
			</div></div></div>
		</div><br>
<!-- <div class="col-md-1"><img src="user/images/media.png"></div>
			<div class="col-md-11">	
			<strong class="font">Contact Details</strong>
<p>
<table class="col-md-6 table-responsive">
<tr><td>Contact Number</td><td>:</td><td>-------------</td></tr>
<tr><td>Parent Contact</td><td>:</td><td>-------------</td></tr>
<tr><td>Chat Status</td><td>:</td><td>-------------</td></tr>
<tr><td>Send Mail</td><td>:</td><td>-------------</td></tr>


</table></p>
</div>
<br> -->
	<div class="panel panel-success" style='box-shadow: 5px 8px 5px;'>
			<div class="panel-body table-responsive">
		<div class="col-md-11">	
			<strong class="font">Religion Information</strong><a href="#" class="all_a  pull-right  edit-style" id="religion_info_a" onclick="toggleDiv('religion_info');"><i class="fa fa-edit"></i>Edit</a>
			<div id="religion_info_view" class="all_visible_divs">
				<table class="col-md-6 table-responsive">
				<tr><td>Religion</td><td>:</td>
					<td id="religion_val">
						<c:if test="${not empty profileBean.religionName}">${profileBean.religionName}</c:if>
						<c:if test="${empty profileBean.religionName}">Not specified</c:if>
					</td>
				</tr>
				<tr><td>Caste / Sub Caste</td><td>:</td>
					<td id="caste_val">
					<c:if test="${not empty profileBean.casteName}">${profileBean.casteName}</c:if>
					<c:if test="${empty profileBean.casteName}">Not specified</c:if>
					</td>
				</tr>
				<tr><td>Gothram</td><td>:</td>
					<td id="gotram_val">
						<c:if test="${not empty profileBean.gotram}">${profileBean.gotram}</c:if>
						<c:if test="${empty profileBean.gotram}">Not specified</c:if>
					</td>
				</tr>
				<%-- <tr><td>Zodiac</td><td>:</td>
					<td id="smoking_val">
						<c:if test="${not empty profileBean.smoking}">${profileBean.smoking}</c:if>
						<c:if test="${empty profileBean.smoking}">Not specified</c:if>
					</td>
				</tr> --%>
				<tr><td>Star / Raasi</td><td>:</td>
					<td id="star_val">
						<c:if test="${not empty profileBean.starName}">${profileBean.starName}</c:if>
						<c:if test="${empty profileBean.starName}">Not specified</c:if>
						
						
					</td>
				</tr>
				<tr><td>Dosham</td><td>:</td>
					<td id="dosam_val">
						<c:if test="${not empty profileBean.dosam}">
							<c:if test="${(profileBean.dosam == 'YES')  &&  (not empty profileBean.dosamName)}">
								YES - ${profileBean.dosamName}
							</c:if>
							<c:if test="${(profileBean.dosam == 'YES')  &&  (empty profileBean.dosamName)}">
								YES
							</c:if>
							<c:if test="${profileBean.dosam != 'YES'}">
								${profileBean.dosam}
							</c:if>
						</c:if>
						<c:if test="${empty profileBean.dosam}">Not specified</c:if>
					</td>
				</tr>
				
				</table>
			</div>
			<div id="religion_info_edit" class="all_hidden_divs" hidden="true">
				<jsp:include page="religion_info.jsp"></jsp:include>
				
			</div>
		</div>
		</div>
		</div>
<br>
	<div class="panel panel-success" style='box-shadow: 5px 8px 5px;'>
			<div class="panel-body table-responsive">
			<div class="col-md-11">	<strong class="font">
			<c:if test="${profileBean.gender == 'Female'}">Bride</c:if>
			<c:if test="${profileBean.gender == 'Male'}">Groom</c:if>
			's Location</strong> <a href="#" class="all_a  pull-right  edit-style" id="location_a" onclick="toggleDiv('location');"><i class="fa fa-edit"></i>Edit</a>
	
	<div id="location_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>Country</td><td>:</td>
			<td id="currentCountry_val">
				<c:if test="${not empty profileBean.currentCountryName}">${profileBean.currentCountryName}</c:if>
				<c:if test="${empty profileBean.currentCountryName}">Not Specified</c:if>
			</td>
		</tr>
		<tr>
			<td>City</td><td>:</td>
			<td id="currentState_val">
				<c:if test="${not empty profileBean.currentCityName}">${profileBean.currentCityName}</c:if>
				<c:if test="${empty profileBean.currentCityName}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>State</td><td>:</td>
			<td id="currentCity_val">
				<c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
				<c:if test="${empty profileBean.currentStateName}">Not Specified</c:if>
			</td>
			
		</tr>
	</table>
	</div>
	<div id="location_edit" class="all_hidden_divs" hidden="true">
		<jsp:include page="location.jsp" />
	</div>
	</div>
	</div>
</div>

<br>
	<div class="panel panel-success" style='box-shadow: 5px 8px 5px;'>
			<div class="panel-body table-responsive">	
			<div class="col-md-11">	<strong class="font">Professional Information</strong>
				<a href="#" class="all_a  pull-right  edit-style" id="professional_info_a" onclick="toggleDiv('professional_info');"><i class="fa fa-edit"></i>Edit</a>
	<div id="professional_info_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>Education</td><td>:</td>
			<td id="education_val">
				<c:if test="${not empty profileBean.educationName}">${profileBean.educationName}</c:if>
				<c:if test="${empty profileBean.educationName}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>Employed in</td><td>:</td>
			<td id="workingWith_val">
				<c:if test="${not empty profileBean.workingWith}">${profileBean.workingWith}</c:if>
				<c:if test="${empty profileBean.workingWith}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>Occupation</td><td>:</td>
			<td id="occupation_val">
				<c:if test="${not empty profileBean.occupationName}">${profileBean.occupationName}</c:if>
				<c:if test="${empty profileBean.occupationName}">Not Specified</c:if>
			</td>
		</tr>
	</table>
	</div>
	<div id="professional_info_edit" class="all_hidden_divs" hidden="true">
		<jsp:include page="professional_info.jsp" />
	</div>
	</div>
	</div>
 </div>


<br>
<div class="panel panel-success" style='box-shadow: 5px 8px 5px;'>
			<div class="panel-body table-responsive">
			<div class="col-md-11">	<strong class="font">Family Details</strong>
				<a href="#" class="all_a  pull-right  edit-style" id="family_details_a" onclick="toggleDiv('family_details');"><i class="fa fa-edit"></i>Edit</a>
	<div id="family_details_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>Father's Name</td><td>:</td>
			<td id="fatherName_val">
				<c:if test="${not empty profileBean.fatherName}">${profileBean.fatherName}</c:if>
				<c:if test="${empty profileBean.fatherName}">Not Specified</c:if>
			</td>
			<td>Mother's Name</td><td>:</td>
			<td id="motherName_val"><c:out value="${profileBean.motherName}"/>
				<c:if test="${not empty profileBean.motherName}">${profileBean.motherName}</c:if>
				<c:if test="${empty profileBean.motherName}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>Father's Occupation</td><td>:</td>
			<td id="fOccupation_val">
				<c:if test="${not empty profileBean.fOccupation}">${profileBean.fOccupationName}</c:if>
				<c:if test="${empty profileBean.fOccupation}">Not Specified</c:if>
			</td>
			<td>Mother's Occupation</td><td>:</td>
			<td id="mOccupation_val">
				<c:if test="${not empty profileBean.mOccupation}">${profileBean.mOccupationName}</c:if>
				<c:if test="${empty profileBean.mOccupation}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>No. of Brothers</td><td>:</td>
			<td id="noOfBrothers_val">
				<c:if test="${not empty profileBean.noOfBrothers}">${profileBean.noOfBrothers}</c:if>
				<c:if test="${empty profileBean.noOfBrothers}">Not Specified</c:if>
			</td>
			<td>Brothers Married</td><td>:</td>
			<td id="noOfBrothersMarried_val">
				<c:if test="${not empty profileBean.noOfBrothersMarried}">${profileBean.noOfBrothersMarried}</c:if>
				<c:if test="${empty profileBean.noOfBrothersMarried}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>No. of Sisters</td><td>:</td>
			<td id="noOfSisters_val">
				<c:if test="${not empty profileBean.noOfSisters}">${profileBean.noOfSisters}</c:if>
				<c:if test="${empty profileBean.noOfSisters}">Not Specified</c:if>
			</td>
			<td>Sisters Married</td><td>:</td>
			<td id="noOfSistersMarried_val">
				<c:if test="${not empty profileBean.noOfSistersMarried}">${profileBean.noOfSistersMarried}</c:if>
				<c:if test="${empty profileBean.noOfSistersMarried}">Not Specified</c:if>
			</td>
		</tr>
	</table>
	</div>
	<div id="family_details_edit" class="all_hidden_divs" hidden="true">
		<jsp:include page="family_details.jsp" />
	</div>
	</div>
	</div>
</div>