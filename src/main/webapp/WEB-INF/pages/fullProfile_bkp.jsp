<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="userCommonHeader.jsp"%>
            	<style>

</style>

<script src="js/plugins/jquery.ImageGallery.js"></script> 
<script src="js/plugins/jquery.imagesloaded.min.js"></script> 

<div class="products">
	<div class="container" style="background: #FFF;">
	
		<div class="mid-grids">
		<form:form commandName="createProfile" id="userProfile"  name="searchForm2"  method="post" action="">
			<form:hidden path="redirectPage" value="dashboard"></form:hidden>
			<form:hidden path="pageName"/>
			<form:hidden path="id"/>
			
		<div class="col-md-9 products-grid-left">
            	<div class="panel panel-success">
            	
					<div class="col-md-5"> <h4></h4>
						<c:if test="${empty photosList}">
							<img src="img/default.png" class="img-responsive" style="margin-bottom:0;">
						</c:if>
						<c:if test="${not empty photosList}">
							<div id="gallery-wrapper">
	
								  <!-- gallery viewer -->
								  <div id="viewer-wrapper">
								    <div id="gallery-viewer"> 
								      <img alt="Placeholder" src="img/default.png"> 
								    </div>  
								  </div>
								  <div class="clearfix"></div>
								  <br>
								  <!-- navigation -->
								  <div id="viewer-nav"> 
								    <a id="gallery-viewer-next" style="margin-top:-180px; margin-right:0px;"  href="#">next</a> 
								    <a id="gallery-viewer-prev" style="margin-top:-180px; margin-left:0px;" href="#">previous</a> 
								  </div>
								  
								  
								  
								  <!-- thumbnail images -->
								  <div id="thumbs-wrapper">
								    <div id="gallery">
								    	<c:forEach items="${photosList}" var="photo" >
									      	<div class="thumbnail" style=""> 
										        <img src="${photo.image}" /> 
										    </div>
										</c:forEach>
								    </div> 
								  </div>
								  
								  <!-- thumbnail navigation -->
								  <div id="thumbs-nav"> 
								    <a id="gallery-next" style="margin-right:0px; margin-top:-80px;" href="#">next</a>
								    <a id="gallery-prev" style="margin-left:0px; margin-top:-80px;" href="#">previous</a>
								    <p id="gallery-pos" hidden="true">page 1 of 2</p>
								  </div>
								  
								</div>
							</c:if>
						<c:if test="${profileBean.id == cacheGuest.id}">
							<div style="text-align:center;background:#f1f1f1;line-height:25px;" >
	                            <a href="myPhotos"> Add / Edit  Photos</a>
	                        </div>
						</c:if>
						
                     </div>
                     <div class="col-md-7"><h4></h4>
						 <h3>
						 	<c:if test="${cacheGuest.roleId == 4}">
						 		xxxxxx&nbsp;xxxxxx
						 	</c:if>
						 	<c:if test="${cacheGuest.roleId != 4}">
						 		${profileBean.firstName}&nbsp;${profileBean.lastName}
						 	</c:if>&nbsp;
						 	(${profileBean.username})
						 </h3><p></p>
						<p style="line-height:2; color:#000;font-size: 14px;"><span>Profile created for ${profileBean.createProfileFor}</span><br>
						${profileBean.age} Yrs, ${profileBean.heightInches}<Br>
						${profileBean.religionName}, ${profileBean.casteName}<br>
						${profileBean.currentCityName}, ${profileBean.currentStateName}, ${profileBean.currentCountryName}<br>
						${profileBean.educationName}, ${profileBean.occupationName}</p>
						
						<c:if test="${profileBean.mobileNumViewed == '1'}">
					 		<p><span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-${profileBean.mobile}&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span></p>
					 	</c:if>
					 	<c:if test="${profileBean.mobileNumViewed != '1'}">
					 		<p id="mobileTD${profileBean.id}">
						 		<a href="#" type="button" class="btn1 btn btn-info"  id="mobileBtn" onclick="displayMobileNum(${profileBean.id})">View Mobile Number</a>
						 	</p>
					 	</c:if>
						 
						 
						 
						
						</div>
						<div class="clearfix"></div>

<div class="clearfix"></div>
            	


					
			</div>
			<div class="panel panel-success"><div class="panel-body table-responsive">
			<h4   style="padding="10px;"></h4><h3>Personal information</h3><hr>
			<div class="col-md-1"><img src="user/images/edit.png"></div>
			<div class="col-md-11">	<strong class="font">About my ${profileBean.createProfileFor}</strong>
					<p>
						<c:if test="${not empty profileBean.aboutMyself}">${profileBean.aboutMyself}</c:if>
						<c:if test="${empty profileBean.aboutMyself}">Not Specified</c:if>
					</p></div>
	
	<br><div>&nbsp;</div>
		<div class="col-md-1"><img src="user/images/details.png"></div>
			<div class="col-md-11">	<strong class="font">Basic Details </strong>
				<div id="basic_details_view" class="all_visible_divs">
					<table class="col-md-12 table-responsive">
						
						<tr>
							<td>Age</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.age}">${profileBean.age}</c:if>
								<c:if test="${empty profileBean.age}">Not specified</c:if>
							</td>
							
							
						</tr>
						<tr>
							<td>Body Type</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.bodyTypeName}">${profileBean.bodyTypeName}</c:if>
								<c:if test="${empty profileBean.bodyTypeName}">Not specified</c:if>
							</td>
							<td>Complexion</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.complexionName}">${profileBean.complexionName}</c:if>
								<c:if test="${empty profileBean.complexionName}">Not specified</c:if>
							</td>
						</tr>
						<tr>
							<td>Height</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.heightInches}">${profileBean.heightInches}</c:if>
								<c:if test="${empty profileBean.heightInches}">Not specified</c:if>
							</td>
							<td>Physical Status</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.disability}">${profileBean.disability}</c:if>
								<c:if test="${empty profileBean.disability}">Not specified</c:if>
							</td>
						</tr>
						<tr>
							<td>Weight</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.weight}">${profileBean.weight}</c:if>
								<c:if test="${empty profileBean.weight}">Not specified</c:if>
							</td>
							<td>Eating Habits</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.diet}">${profileBean.diet}</c:if>
								<c:if test="${empty profileBean.diet}">Not specified</c:if>
							</td>
						</tr>
						<tr>
							<td>Mother Tongue</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.motherTongueName}">${profileBean.motherTongueName}</c:if>
								<c:if test="${empty profileBean.motherTongueName}">Not specified</c:if>
							</td>
							<td>Drinking Habits</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.drinking}">${profileBean.drinking}</c:if>
								<c:if test="${empty profileBean.drinking}">Not specified</c:if>
							</td>
						</tr>
						<tr>
							<td>Marital Status</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.maritalStatus}">${profileBean.maritalStatus}</c:if>
								<c:if test="${empty profileBean.maritalStatus}">Not specified</c:if>
							</td>
							<td>Smoking Habits</td><td>:</td>
							<td>
								<c:if test="${not empty profileBean.smoking}">${profileBean.smoking}</c:if>
								<c:if test="${empty profileBean.smoking}">Not specified</c:if>
							</td>
						</tr>
					</table>
			</div>
			
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
<br> --><div>&nbsp;</div>
	<div class="col-md-1"><img src="user/images/rel.png"></div>
		<div class="col-md-11">	
			<strong class="font">Religion Information</strong>
			<div id="religion_info_view" class="all_visible_divs">
				<table class="col-md-6 table-responsive">
				<tr><td>Religion</td><td>:</td>
					<td>
						<c:if test="${not empty profileBean.religionName}">${profileBean.religionName}</c:if>
						<c:if test="${empty profileBean.religionName}">Not specified</c:if>
					</td>
				</tr>
				<tr><td>Caste / Sub Caste</td><td>:</td>
					<td>
					<c:if test="${not empty profileBean.casteName}">${profileBean.casteName}</c:if>
					<c:if test="${empty profileBean.casteName}">Not specified</c:if>
					</td>
				</tr>
				<tr><td>Gothram</td><td>:</td>
					<td>
						<c:if test="${not empty profileBean.gotram}">${profileBean.gotram}</c:if>
						<c:if test="${empty profileBean.gotram}">Not specified</c:if>
					</td>
				</tr>
				<tr><td>Zodiac</td><td>:</td>
					<td>
						<c:if test="${not empty profileBean.smoking}">${profileBean.smoking}</c:if>
						<c:if test="${empty profileBean.smoking}">Not specified</c:if>
					</td>
				</tr>
				<tr><td>Star / Raasi</td><td>:</td>
					<td>
						<c:if test="${not empty profileBean.starName}">${profileBean.starName}</c:if>
						<c:if test="${empty profileBean.starName}">Not specified</c:if>
						
						
					</td>
				</tr>
				<tr><td>Dosham</td><td>:</td>
					<td>
						<c:if test="${not empty profileBean.dosamName}">${profileBean.dosamName}</c:if>
						<c:if test="${empty profileBean.dosamName}">Not specified</c:if>
					</td>
				</tr>
				
				</table>
			</div>
			
		</div>
<br><div>&nbsp;</div>
<div class="col-md-1"><img src="user/images/bride.png" style='width: 48px;'></div>
			<div class="col-md-11">	<strong class="font">
			<c:if test="${profileBean.gender == 'Female'}">Bride</c:if>
			<c:if test="${profileBean.gender == 'Male'}">Groom</c:if>
			's Location</strong> 
	
	<div id="location_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>Country</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.currentCountryName}">${profileBean.currentCountryName}</c:if>
				<c:if test="${empty profileBean.currentCountryName}">Not Specified</c:if>
			</td>
			<td>City</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.currentCityName}">${profileBean.currentCityName}</c:if>
				<c:if test="${empty profileBean.currentCityName}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>State</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
				<c:if test="${empty profileBean.currentStateName}">Not Specified</c:if>
			</td>
			<td>Citizenship</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.casteName}">${profileBean.casteName}</c:if>
				<c:if test="${empty profileBean.casteName}">Not Specified</c:if>
			</td>
		</tr>
	</table>
	</div>
	
</div>

<br><div>&nbsp;</div>
<div class="col-md-1"><img src="user/images/profess.jpg" style='width: 48px;'></div>
			<div class="col-md-11">	<strong class="font">Professional Information</strong>
				
	<div id="professional_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>Education</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.educationName}">${profileBean.educationName}</c:if>
				<c:if test="${empty profileBean.educationName}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>Employed in</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.workingWith}">${profileBean.workingWith}</c:if>
				<c:if test="${empty profileBean.workingWith}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>Occupation</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.occupationName}">${profileBean.occupationName}</c:if>
				<c:if test="${empty profileBean.occupationName}">Not Specified</c:if>
			</td>
		</tr>
	</table>
	</div>
	
 </div>


<br><div>&nbsp;</div>
<div class="col-md-1"><img src="user/images/family.jpg" style='width: 48px;'></div>
			<div class="col-md-11">	<strong class="font">Family Details</strong>
				
	<div id="family_details_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>Father's Name</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.fatherName}">${profileBean.fatherName}</c:if>
				<c:if test="${empty profileBean.fatherName}">Not Specified</c:if>
			</td>
			<td>Mother's Name</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.motherName}">${profileBean.motherName}</c:if>
				<c:if test="${empty profileBean.motherName}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>Father's Status</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.fOccupation}">${profileBean.fOccupation}</c:if>
				<c:if test="${empty profileBean.fOccupation}">Not Specified</c:if>
			</td>
			<td>Mother's Status</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.mOccupation}">${profileBean.mOccupation}</c:if>
				<c:if test="${empty profileBean.mOccupation}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>No. of Brothers</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.noOfBrothers}">${profileBean.noOfBrothers}</c:if>
				<c:if test="${empty profileBean.noOfBrothers}">Not Specified</c:if>
			</td>
			<td>Brothers Married</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.noOfBrothersMarried}">${profileBean.noOfBrothersMarried}</c:if>
				<c:if test="${empty profileBean.noOfBrothersMarried}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>No. of Sisters</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.noOfSisters}">${profileBean.noOfSisters}</c:if>
				<c:if test="${empty profileBean.noOfSisters}">Not Specified</c:if>
			</td>
			<td>Sisters Married</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.noOfSistersMarried}">${profileBean.noOfSistersMarried}</c:if>
				<c:if test="${empty profileBean.noOfSistersMarried}">Not Specified</c:if>
			</td>
		</tr>
	</table>
	</div>
	
</div>
</div>
</div>
<div class="panel panel-success"><div class="panel-body table-responsive">
			<h4   style="padding="10px;"></h4><h3>Partner Preferences</h3><hr>

<br><div>&nbsp;</div>
<!-- <div class="col-md-1"><img src="user/images/location.png"></div> -->
			<div class="col-md-11">	<strong class="font">Basic & Religion Preferences</strong>
				
	<div id="partner_basic_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>
				<c:if test="${profileBean.gender == 'Female'}">Groom</c:if>
				<c:if test="${profileBean.gender == 'Male'}">Bride</c:if>
				's Age
			</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rAgeFrom}">${profileBean.rAgeFrom} - ${profileBean.rAgeTo} Years</c:if>
				<c:if test="${empty profileBean.rAgeFrom}">Not Specified</c:if>
			</td>
			<td>Height</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rHeight}">${profileBean.rHeight} - ${profileBean.rHeightTo} </c:if>
				<c:if test="${empty profileBean.rHeight}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>Marital Status</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rMaritalStatus}">${profileBean.rMaritalStatus}</c:if>
				<c:if test="${empty profileBean.rMaritalStatus}">Not Specified</c:if>
			</td>
			<td>Physical Status</td><td>:</td>
			<td>
				<%-- <c:if test="${not empty profileBean.casteName}">${profileBean.casteName}</c:if>
				<c:if test="${empty profileBean.casteName}">Not Specified</c:if> --%>
			</td>
		</tr>
		<tr><td>Eating Habits</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rDiet}">${profileBean.rDiet}</c:if>
				<c:if test="${empty profileBean.rDiet}">Not Specified</c:if>
			</td>
			<td>Smoking Habits</td><td>:</td>
			<td>
				<%-- <c:if test="${not empty profileBean.casteName}">${profileBean.casteName}</c:if>
				<c:if test="${empty profileBean.casteName}">Not Specified</c:if> --%>
			</td>
		</tr>
		<tr><td>Drinking Habits</td><td>:</td>
			<td>
				<%-- <c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
				<c:if test="${empty profileBean.currentStateName}">Not Specified</c:if> --%>
			</td>
			<td>Religion</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rReligion}">${profileBean.rReligion}</c:if>
				<c:if test="${empty profileBean.rReligion}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>Mothertongue</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rMotherTongue}">${profileBean.rMotherTongue}</c:if>
				<c:if test="${empty profileBean.rMotherTongue}">Not Specified</c:if>
			</td>
			<td>Caste</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rCaste}">${profileBean.rCaste}</c:if>
				<c:if test="${empty profileBean.rCaste}">Not Specified</c:if>
			</td>
		</tr>
		<tr><td>Star</td><td>:</td>
			<%-- <td>
				<c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
				<c:if test="${empty profileBean.currentStateName}">Not Specified</c:if>
			</td> --%>
			
		</tr>
	</table>
	</div>
	
</div>

<br><div>&nbsp;</div>
<!-- <div class="col-md-1"><img src="user/images/location.png"></div> -->
			<div class="col-md-11">	<strong class="font">Professional Preferences</strong>
				
	<div id="partner_professional_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>Education</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rEducation}">${profileBean.rEducation}</c:if>
				<c:if test="${empty profileBean.rEducation}">Not Specified</c:if>
			</td>
			
		</tr>
		<tr><td>Occupation</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rOccupation}">${profileBean.rOccupation}</c:if>
				<c:if test="${empty profileBean.rOccupation}">Not Specified</c:if>
			</td>
			
		</tr>
		<tr><td>Annual Income</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rAnnualIncome}">${profileBean.rAnnualIncome}</c:if>
				<c:if test="${empty profileBean.rAnnualIncome}">Not Specified</c:if>
			</td>
			
		</tr>
	</table>
	</div>
	
</div>

<br><div>&nbsp;</div>
<!-- <div class="col-md-1"><img src="user/images/location.png"></div> -->
			<div class="col-md-11">	<strong class="font">Location Preferences</strong>
				
	<div id="partner_location_view" class="all_visible_divs">
	<table class="col-md-12 table-responsive">
		<tr><td>Country</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rCountry}">${profileBean.rCountry}</c:if>
				<c:if test="${empty profileBean.rCountry}">Not Specified</c:if>
			</td>
			<td>City</td><td>:</td>
			
		</tr>
		<tr><td>Residing State</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.rState}">${profileBean.rState}</c:if>
				<c:if test="${empty profileBean.rState}">Not Specified</c:if>
			</td>
			
			
		</tr>
		<tr><td>Residing City</td><td>:</td>
			<td>
				<%-- <c:if test="${not empty profileBean.rCity}">${profileBean.rCity}</c:if>
				<c:if test="${empty profileBean.rCity}">Not Specified</c:if> --%>
			</td>
			
			
		</tr>
		<tr><td>Citizenship</td><td>:</td>
			<td>
				<%-- <c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
				<c:if test="${empty profileBean.currentStateName}"><a>Add State</a></c:if> --%>
			</td>
			
		</tr>
	</table>
	</div>
	
</div>
	
</div>
</div></div>
</form:form></div></div></div></div>
<div class="col-sm-3" style='margin: 31px 0px 0px 0px;'>
			<div class="col-md-3 products-grid-right">
			<div class="panel panel-success" style="width: 654%;">
			<div class="panel-heading">Add Horoscope</div>
					<div class="panel-body table-responsive">
		            	<div class="col-md-3"">
					<img src="user/images/edit-add-horoscope.gif" width="40">
				</div><div class="col-md-9"><p>It is simple and absolutely FREE!</p></div>
	            	</div>
	            </div>
			<div class="panel panel-success" style="width: 654%;">
			<div class="panel-heading">Add Photos Now</div>
					<div class="panel-body table-responsive">
		            	<div class="col-md-3"">
					<img src="user/images/add-photo-edit-avatar.png" width="40">
				</div><div class="col-md-9"><p>Photos are the first
things members look for
in a profile. </p></div>
	            	</div>
	            </div></div><div class="clearfix"></div>
			
			
			
			
			<div class="col-md-3 products-grid-right">
			</div></div>
</div></div>
<script type="text/javascript">
var allowed_limit = ${allowed_profiles_limit};
$(document).ready(function(){
	$('#gallery').gallery({

		  // the number of rows of the thumbnail navigation
		  'rows': 1,

		  // the number of columns of the thumbnail navigation
		  'cols': 4,

		  // animation duration
		  //duration: 400,

		  // easing effect
		  easing: 'swing'
		  
		});
	$("#rReligion").select2({
	    placeholder: "-- Choose Religion --"
	});
	$("#rMaritalStatus").select2({
	    placeholder: "-- Choose MaritalStatus --"
	});
	$("#rCaste").select2({
	    placeholder: "-- Choose Community --"
	});
	$("#rMotherTongue").select2({
	    placeholder: "-- Choose Mother Tongue --"
	});
	$("#rCountry").select2({
	    placeholder: "-- Choose Country --",
	    allowClear: true
	});
	$("#rState").select2({
	    placeholder: "-- Choose State --",
	    allowClear: true
	});
	$("#rEducation").select2({
	    placeholder: "-- Choose Education --"
	});
	$("#rWorkingWith").select2({
	    placeholder: "-- Choose Working With --"
	});
	$("#rOccupation").select2({
	    placeholder: "-- Choose Profession Area --"
	});
	$("#rDiet").select2({
	    placeholder: "-- Choose Diet --"
	});
	//selected_values="";
	
	 var selected_values = "${profileBean.rMaritalStatus}";
	 if(selected_values!="")
	$("#rMaritalStatus").select2('val',selected_values.split(","));
	
	selected_values = "${createProfile.rReligion}";
	if(selected_values!="")
	$("#rReligion").select2('val',selected_values.split(","));
	
	selected_values = "${createProfile.rCaste}";
	if(selected_values!="")
	$("#rCaste").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rState}";
	if(selected_values!="")
	$("#rState").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rEducation}";
	if(selected_values!="")
	$("#rEducation").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rMotherTongue}";
	if(selected_values!="")
		$("#rMotherTongue").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rCountry}";
	if(selected_values!="")
	$("#rCountry").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rWorkingWith}";
	if(selected_values!="")
	$("#rWorkingWith").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rOccupation}";
	if(selected_values!="")
	$("#rOccupation").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rDiet}";
	if(selected_values!="")
	$("#rDiet").select2('val',selected_values.split(",")); 
	
	 var genderVal = "${profileBean.gender}";
	$('input[name=gender][value='+genderVal+']').prop("checked",true); 
	
	
});
function displayMobileNum(profileId){
	
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profileId);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		var membershipStatus = ${cacheGuest.membership_status};
		if(membershipStatus!="1"){
			alert("Your membership validity period is over. Renew your membership plan and get more profiles");
			return false;
		}
		if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		}
		var formData = new FormData();
		formData.append('profile_id',profileId);
		jQuery.fn.makeMultipartRequest('POST', 'viewedMobileNumber', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var limit = jsonobj.allowed_limit;
	    		var msg = jsonobj.message;
	    		if(typeof msg != "undefined"){
	    			if(msg=="success"){
	    				var mobStr = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-${profileBean.mobile}&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
	    				$("#mobileTD"+profileId).html(mobStr);
	    				allowed_limit = limit;
	    			}else{
	    				alert("Some problem occured. Please try again.");
	    			}
	    		}
	    		
		});
	}
}
/* function displayMobileNum(profileId,listType){
	 var profileObj = serviceUnitArray[profileId];
	var formData = new FormData();
	formData.append('profile_id',profileId);
	formData.append('list_type',listType);
	jQuery.fn.makeMultipartRequest('POST', 'viewedMobileNumber', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var msg = jsonobj.message;
    		if(typeof msg != "undefined"){
    			if(msg=="success"){
    				$("#row"+profileId).html('<td>'+profileObj.mobile+'</td>');
    			}else{
    				alert("Some problem occured. Please try again.");
    			}
    		}
    		
	}); 
	
} */

$(".dashboard").addClass("active");
</script>
<script>
jQuery(document).ready(function($){
	//open popup
	$('.cd-popup-trigger').on('click', function(event){
		event.preventDefault();
		$('.cd-popup').addClass('is-visible');
	});
	
	//close popup
	$('.cd-popup').on('click', function(event){
		if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.cd-popup').removeClass('is-visible');
	    }
    });
});
function toggleDiv(divElem){
	var isHidden = $("#"+divElem+"_edit").attr("hidden");
	$(".all_hidden_divs").attr("hidden",true);
	$(".all_visible_divs").removeAttr("hidden");
	$(".all_a").html("Edit");
	if(isHidden){
		$("#"+divElem+"_view").attr("hidden",true);
		$("#"+divElem+"_edit").removeAttr("hidden");
		$("#"+divElem+"_a").html("Close");
	}else{
		$("#"+divElem+"_edit").attr("hidden",true);
		$("#"+divElem+"_view").removeAttr("hidden");
		$("#"+divElem+"_a").html("Edit");
	}
	
}
  function saveChanges(data_type){
	$("#pageName").val(data_type);
	
	
	  
	 var formData = new FormData();
   	formData.append("pageName",data_type);
   	formData.append("createProfileFor",$("#createProfileFor").val());
   	formData.append("gender",$("#gender").val());
   	formData.append("firstName",$("#firstName").val());
   	formData.append("lastName",$("#lastName").val());
   	formData.append("dob",$("#dob").val());
   	formData.append("height",$("#height").val());
   	formData.append("maritalStatus",$("#maritalStatus").val());
   	formData.append("bodyType",$("#bodyType").val());
   	formData.append("complexion",$("#complexion").val());
   	formData.append("disability",$("#disability").val());
   	formData.append("motherTongue",$("#motherTongue").val());
   	formData.append("diet",$("#diet").val());
   	formData.append("smoking",$("#smoking").val());
   	formData.append("drinking",$("#drinking").val());
   	// religion info
   	formData.append("religion",$("#religion").val());
   	formData.append("caste",$("#caste").val());
   	formData.append("gotram",$("#gotram").val());
   	formData.append("star",$("#star").val());
   	formData.append("dosam",$("#dosam").val());
   	//formData.append("drinking",$("#drinking").val());
   	// location info
   	formData.append("currentCountry",$("#currentCountry").val());
   	formData.append("currentState",$("#currentState").val());
   	formData.append("currentCity",$("#currentCity").val());
   	// professional info
   	formData.append("education",$("#education").val());
   	formData.append("workingWith",$("#workingWith").val());
   	formData.append("occupation",$("#occupation").val());
   	// family details
   	formData.append("fatherName",$("#fatherName").val());
   	formData.append("motherName",$("#motherName").val());
   	formData.append("fOccupation",$("#fOccupation").val());
   	formData.append("mOccupation",$("#mOccupation").val());
   	formData.append("noOfBrothers",$("#noOfBrothers").val());
   	formData.append("noOfBrothersMarried",$("#noOfBrothersMarried").val());
   	formData.append("noOfSisters",$("#noOfSisters").val());
   	formData.append("noOfSistersMarried",$("#noOfSistersMarried").val());
	$.fn.makeMultipartRequest('POST', 'editProfile', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		
		
	});
} 
 
  function displayImage(imageName){
		$("#profImage").prop("src",imageName);
  }
  
  function picsPagination(){
	  
  }
  
</script>

<%@ include file="userFooter.jsp"%>