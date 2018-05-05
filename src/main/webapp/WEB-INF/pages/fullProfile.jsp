<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="userCommonHeader.jsp"%>
 <!-- for Raxus Slider -->
   <!--  <link rel="stylesheet" href="css/raxus.css" media="screen" type="text/css">
    <script type="text/javascript" src="js/raxus-slider.min.js"></script> -->
    <!-- for Raxus Slider #end -->

    <!-- for documentation: you don't need them -->
    <link rel="stylesheet" href="documentation/css/documentation.css" media="screen" type="text/css">
    <link rel="stylesheet" href="../yandex.st/highlightjs/8.0/styles/default.min.css" media="screen" type="text/css">
    <script type="text/javascript" src="documentation/js/document.js"></script>
    <script src="documentation/js/highlight.pack.js"></script>
     
    <script>hljs.initHighlightingOnLoad();</script>
    <!-- for documentation #end: you don't need them -->

    <style>
        #mySlider {
            width: 580px;
            height: 520px;
            margin: auto; /* for center alignment */
        }
        #mySlider .mini-images li {
            width: 100px;
            height: 50px;
        }
        
       /*  .modal-header .close {
    margin-top: -12px;
} */
/* @media (min-width: 768px) {
.modal-dialog {
   width: px !important;
    margin: 30px 250px !important;
}
} */
#imageName {
height:600px;
}
td, th {
vertical-align:top;
}
        /* for tablet */
        @media screen and (max-width: 980px) {
            #mySlider {
                width: 100%;
                height: 450px;
            }
        }
         td:first-child{ width: 150px; }
         td:nth-child(2) {width:10px !important;}
        td:fourth-child{ width: 150px; } 
        /* for mobile */
        @media screen and (max-width: 640px) {
            #mySlider {
                width: 570px;
                height: 450px;
            }
        }
         @media screen and (max-width: 480px) {
            #mySlider {
                width: 400px;
                height: 380px;
            }
        }
         @media screen and (max-width: 414px) {
            #mySlider {
                width: 350px;
                height: 350px;
            }
        }
          @media screen and (max-width: 360px) {
            #mySlider {
                width: 300px;
                height: 350px;
            }
            /* .box_1 p {
    margin: 45px 47px 37px 0px !important;
} */
        }
          @media screen and (max-width: 320px) {
            #mySlider {
                width: 280px;
                height: 250px;
            }
              td:first-child{ width: 124px !important; }
        td:fourth-child{ width: 124px !important; } 
        }
@media only screen and (max-width: 640px) and (min-width: 320px) {
        
        }
    </style>
            	<style>
.img-replace {
  
  display: inline-block;
  overflow: hidden;
  text-indent: 100%;
  color: transparent;
  white-space: nowrap;
}
.likeprofile {
margin-top:5px;
padding:15px;
background:#ffb7458a;
}
.likeprofile p {
color:#000;
margin-bottom:5px;
}
.font {
color: #006699;

line-height: 2;
font-size:18px;}
            	.cd-nugget-info {
  text-align: center;
  position: absolute;
  width: 100%;
  height: 50px;
  line-height: 50px;
  bottom: 0;
  left: 0;
}
.cd-nugget-info a {
  position: relative;
  font-size: 14px;
  color: #5e6e8d;
  -webkit-transition: all 0.2s;
  -moz-transition: all 0.2s;
  transition: all 0.2s;
}
.no-touch .cd-nugget-info a:hover {
  opacity: .8;
}
.cd-nugget-info span {
  vertical-align: middle;
  display: inline-block;
}
.cd-nugget-info span svg {
  display: block;
}
.cd-nugget-info .cd-nugget-info-arrow {
  fill: #5e6e8d;
}

/* -------------------------------- 

Main components 

-------------------------------- */
header {
  height: 200px;
  line-height: 200px;
  text-align: center;
  background-color: #5e6e8d;
  color: #FFF;
}
header h1 {
  font-size: 20px;
  font-size: 1.25rem;
}
.profileskip {

margin-bottom:5px;}
.cd-popup-trigger {
  display: block;
  width: 170px;
  height: 50px;
  line-height: 50px;
  margin: 3em auto;
  text-align: center;
  color: #FFF;
  font-size: 14px;
  font-size: 0.875rem;
  font-weight: bold;
  text-transform: uppercase;
  border-radius: 50em;
  background: #35a785;
  box-shadow: 0 3px 0 rgba(0, 0, 0, 0.07);
  
}
@media only screen and (min-width: 1170px) {
  .cd-popup-trigger {
    margin: 6em auto;
  }
}

/* -------------------------------- 

xpopup 

-------------------------------- */
.cd-popup {
  position: fixed;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  background-color: rgba(94, 110, 141, 0.9);
  opacity: 0;
  visibility: hidden;
  -webkit-transition: opacity 0.3s 0s, visibility 0s 0.3s;
  -moz-transition: opacity 0.3s 0s, visibility 0s 0.3s;
  transition: opacity 0.3s 0s, visibility 0s 0.3s;
  
}
.cd-popup.is-visible {
  opacity: 1;
  visibility: visible;
  -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
  -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
  transition: opacity 0.3s 0s, visibility 0s 0s;
}

.cd-popup-container {
  position: relative;
  width: 90%;
  max-width: 400px;
  margin: 4em auto;
  background: #FFF;
  border-radius: .25em .25em .4em .4em;
  text-align: center;
  
  -webkit-transform: translateY(-40px);
  -moz-transform: translateY(-40px);
  -ms-transform: translateY(-40px);
  -o-transform: translateY(-40px);
  transform: translateY(-40px);
  /* Force Hardware Acceleration in WebKit */
  -webkit-backface-visibility: hidden;
  -webkit-transition-property: -webkit-transform;
  -moz-transition-property: -moz-transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  -moz-transition-duration: 0.3s;
  transition-duration: 0.3s;
   -moz-box-shadow:    inset 0 0 10px #006699;
   -webkit-box-shadow: inset 0 0 10px #006699;
   box-shadow:         inset 0 0 10px #006699;
}
.cd-popup-container  {
  padding: 3em 1em;
  
}
.cd-popup-container p {
  text-align:left;
}
.cd-popup-container .cd-buttons:after {
  content: "";
  display: table;
  clear: both;
}
.cd-popup-container .cd-buttons li {
  float: left;
  width: 50%;
  list-style: none;
}
.cd-popup-container .cd-buttons a {
  display: block;
  height: 60px;
  line-height: 60px;
  text-transform: uppercase;
  color: #FFF;
  -webkit-transition: background-color 0.2s;
  -moz-transition: background-color 0.2s;
  transition: background-color 0.2s;
}
.cd-popup-container .cd-buttons li:first-child a {
  background: #fc7169;
  border-radius: 0 0 0 .25em;
}
.no-touch .cd-popup-container .cd-buttons li:first-child a:hover {
  background-color: #fc8982;
}
.cd-popup-container .cd-buttons li:last-child a {
  background: #b6bece;
  border-radius: 0 0 .25em 0;
}
.no-touch .cd-popup-container .cd-buttons li:last-child a:hover {
  background-color: #c5ccd8;
}
.cd-popup-container .cd-popup-close {
  position: absolute;
  top: 8px;
  right: 8px;
  width: 30px;
  height: 30px;
}
.cd-popup-container .cd-popup-close::before, .cd-popup-container .cd-popup-close::after {
  content: '';
  position: absolute;
  top: 12px;
  width: 14px;
  height: 3px;
  background-color: #8f9cb5;
}
.cd-popup-container .cd-popup-close::before {
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -o-transform: rotate(45deg);
  transform: rotate(45deg);
  left: 8px;
}
.cd-popup-container .cd-popup-close::after {
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  transform: rotate(-45deg);
  right: 8px;
}
.is-visible .cd-popup-container {
  -webkit-transform: translateY(0);
  -moz-transform: translateY(0);
  -ms-transform: translateY(0);
  -o-transform: translateY(0);
  transform: translateY(0);
}
@media only screen and (min-width: 1170px) {
  .cd-popup-container {
    margin: 8em auto;
  }
}
</style>

<script src="js/plugins/jquery.ImageGallery.js"></script> 
<script src="js/plugins/jquery.imagesloaded.min.js"></script> 

<div class="container" id="printDiv" style=' padding-left: 0px;'>
<div class="row">
<div class="col-sm-8">
<div class="products">
	<div class="container" style="background: #FFF;">
	
		<div class="mid-grids">
		<form:form commandName="createProfile" id="userProfile"  name="searchForm2"  method="post" action="">
			<form:hidden path="redirectPage" value="dashboard"></form:hidden>
			<form:hidden path="pageName"/>
			<form:hidden path="id"/>
			
		<div class="col-md-8 products-grid-left" id="printProfile">
		
            	<div class="panel panel-success">
            	
					<div class="col-md-5"> <h4></h4>
						<c:if test="${empty fullProfilePhotosList}">
							<img id="img_inpage" src="img/default.png" class="img-responsive" style="margin-bottom:0;">
						</c:if>
						<c:if test="${not empty fullProfilePhotosList}">
						<div class="fullprofile" style="height:220px; overflow:hidden;"">	
							<a href="#" id="fullProfilePicOuterTag" data-toggle="modal" data-target="#myModalFullProfile"><img  src="${fullProfilePhotosList[0].image}" class="hover-shadow cursor img img-responsive thumbnail watermark_text" style="margin-bottom:0;height:auto;width: 100%;" /></a>
							<%-- <a href="#" id="fullProfilePicOuterTag"><img src="${photosList[0].image}" style="width:100%; height:auto;" onclick="openModal();currentSlide(1)" class="hover-shadow cursor watermark_text"></a> --%>
						</div>	
							<div id="gallery-wrapper" class="noPrint">
								<!-- thumbnail images -->
								  <div id="thumbs-wrapper">
								    <div id="gallery" style="margin:-10px 8px 8px;width:200%">
								    	<c:set var="counter2" value="${0}" /> 
								    	<c:forEach items="${fullProfilePhotosList}" var="photo" >
								    		<c:set var="counter2" value="${counter2+1}" />
									      	<div class="profilethumbnail" style="float: left;
    width: 69px;
    height: 69px;
    padding: 0px;
    margin: 5px; "> 
										        <img src="${photo.image}" class="watermark_text" style="width:100%; height:auto;"  onclick="currentSlide_inpage('${photo.image}')"/> 
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
						<p style="line-height:2; color:#000;font-size: 14px;"><span>Profile Created for ${profileBean.createProfileFor}</span><br>
						${profileBean.age} Yrs, ${profileBean.heightInches}<Br>
						${profileBean.religionName}, ${profileBean.casteName}<br>
						${profileBean.currentCityName}, ${profileBean.currentStateName}, ${profileBean.currentCountryName}<br>
						${profileBean.educationName}, ${profileBean.occupationName}</p>
						<c:if test="${cacheGuest.id != profileBean.id}">
						 	<div class="noPrint">
						<c:choose>
							<c:when test="${profileBean.mobileNumViewed == '1' || profileBean.message_sent_status == '1' || profileBean.expressedInterest == '1'}">
								<p><span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-${profileBean.mobile}&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span></p>
							</c:when>
							<c:otherwise>
								<p id="mobileTD${profileBean.id}">
							 		<a href="#" type="button" class="btn1 btn btn-info noPrint"  id="mobileBtn" onclick="displayMobileNum(${profileBean.id})">View Mobile Number</a>
							 	</p>
							</c:otherwise>
						</c:choose></div>
						
					 	<div class="col-md-12 likeprofile noPrint">
					 	<p>Like this profile? Take the next step by sending her a mail.</p>
					 	<div class="col-md-4 profileskip">
					 	<a href="#" class="btn btn-warning" onclick="displayMailPopup(${profileBean.id},'${profileBean.firstName}'+' '+'${profileBean.lastName}')"><li  class="fa fa-envelope" aria-hidden="true"></li> Send Mail</a>
					 	</div>
					 	<!-- <div class="col-md-4 profileskip">
					 	<a href="#" class="btn btn-default">Skip</a>
					 	</div> -->
					 	<div class="col-md-4 profileskip">
					 	<div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
    <span class="caret"></span></button>
    <ul class="dropdown-menu">
      <li><a href="#" onclick="shortList_fullprofile(${profileBean.id})">Shortlist</a></li>
      <!-- <li><a href="#">Forward</a></li> -->
      <li><a href="#" class="noPrint" onclick="PrintElem('#printDiv');">Print</a></li>
      <!-- <li><a href="#">Ignore</a></li> -->
      <!-- <li><a href="#" onclick="goBack();">Back</a></li> -->
    </ul>
  </div></div>
					 	
					 	</div></c:if>
					 </div>
						<div class="clearfix"></div>

<div class="clearfix"></div>
            	

<!-- <div class="cd-popup" role="alert">
	<div class="cd-popup-container">
		<h4 >Privacy Settings</h4>
		<p>Your privacy settings have been saved successfully.</p>
		
		<a href="#0" class="cd-popup-close img-replace">Close</a>
	</div> cd-popup-container
</div> --> <!-- cd-popup -->
					
			</div><br>
			<h4   style="padding="10px;"></h4><h3>Personal Information</h3><hr>
			<div class="panel panel-success" >
			<div class="panel-body table-responsive">			
			<div class="col-md-11">	<strong class="font">About My ${profileBean.createProfileFor}</strong>
				<div id="about_view" class="all_visible_divs">
					<p id="aboutMyself_val">
						<c:if test="${not empty profileBean.aboutMyself}">${profileBean.aboutMyself}</c:if>
						<c:if test="${empty profileBean.aboutMyself}">Not Specified</c:if>
					</p></div>
				</div>
				
			</div></div>
			<div class="clearfix"></div>
	<br>
		<div class="panel panel-success">
			<div class="panel-body table-responsive">
			<div class="col-md-12">	<strong class="font">Basic Details </strong>
				<div id="basic_details_view" class="all_visible_divs">
					<table class="col-md-6 table-responsive">
						<%-- <tr><td>Name</td>
							<td>:</td>
							<td class="name_val">${profileBean.firstName}&nbsp; ${profileBean.lastName}</td>
							
						</tr> --%>
						<tr>
							<td>Age</td><td>:</td>
							<td id="age_val">
								<c:if test="${not empty profileBean.age}">${profileBean.age} yrs</c:if>
								<c:if test="${empty profileBean.age}">Not specified</c:if>
							</td>
							
						</tr>
						<tr>
							<td>Height</td><td>:</td>
							<td id="height_val">
								<c:if test="${not empty profileBean.heightInches}">${profileBean.heightInches}</c:if>
								<c:if test="${empty profileBean.heightInches}">Not specified</c:if>
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
							
						</tr>
						<tr>
							<td>Marital Status</td><td>:</td>
							<td id="maritalStatus_val">
								<c:if test="${not empty profileBean.maritalStatus}">${profileBean.maritalStatus}</c:if>
								<c:if test="${empty profileBean.maritalStatus}">Not specified</c:if>
							</td>
							
						</tr>
					</table>
					<table class="col-md-6 table-responsive">
					<tr>
					<td>Complexion</td><td>:</td>
							<td id="complexion_val">
								<c:if test="${not empty profileBean.complexionName}">${profileBean.complexionName}</c:if>
								<c:if test="${empty profileBean.complexionName}">Not specified</c:if>
							</td>
							</tr>
							<tr>
							<td>Physical Status</td><td>:</td>
							<td id="disability_val">
								<c:if test="${not empty profileBean.disability}">${profileBean.disability}</c:if>
								<c:if test="${empty profileBean.disability}">Not specified</c:if>
							</td>
							</tr>
							<tr>
							<td>Body Type</td><td>:</td>
							<td id="bodyType_val">
								<c:if test="${not empty profileBean.bodyTypeName}">${profileBean.bodyTypeName}</c:if>
								<c:if test="${empty profileBean.bodyTypeName}">Not specified
								</c:if>
							</td>
							</tr>
							<tr>
							<td>Drinking Habits</td><td>:</td>
							<td id="drinking_val">
								<c:if test="${not empty profileBean.drinking}">${profileBean.drinking}</c:if>
								<c:if test="${empty profileBean.drinking}">Not specified</c:if>
							</td>
							</tr>
							<tr>
							<td>Smoking Habits</td><td>:</td>
							<td id="smoking_val">
								<c:if test="${not empty profileBean.smoking}">${profileBean.smoking}</c:if>
								<c:if test="${empty profileBean.smoking}">Not specified</c:if>
							</td>
							</tr>
					</table>
			</div>
			</div></div>
		</div>
		<div class="clearfix"></div>
		<br>
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
	<div class="panel panel-success">
			<div class="panel-body table-responsive">
		<div class="col-md-12">	
			<strong class="font">Religion Information</strong>
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
			
		</div>
		</div>
		</div>
		<div class="clearfix"></div>
<br>
	<div class="panel panel-success">
			<div class="panel-body table-responsive">
			<div class="col-md-12">	
			<strong class="font">
			<c:if test="${profileBean.gender == 'Female'}">Bride</c:if>
			<c:if test="${profileBean.gender == 'Male'}">Groom</c:if>
			's Location</strong> 
	
	<div id="location_view" class="all_visible_divs">
	<table class="col-md-6 table-responsive">
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
	
	</div>
	</div>
</div>
<div class="clearfix"></div>
<br>
	<div class="panel panel-success">
			<div class="panel-body table-responsive">	
			<div class="col-md-12">	<strong class="font">Professional Information</strong>
				
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
	
	</div>
	</div>
 </div>

<div class="clearfix"></div>
<br>
<div class="panel panel-success">
			<div class="panel-body table-responsive">
			<div class="col-md-12">	<strong class="font">Family Details</strong>
				
	<div id="family_details_view" class="all_visible_divs">
	<table class="col-md-6 table-responsive">
		<tr><td>Father's Name</td><td>:</td>
			<td id="fatherName_val">
				<c:if test="${not empty profileBean.fatherName}">${profileBean.fatherName}</c:if>
				<c:if test="${empty profileBean.fatherName}">Not Specified</c:if>
			</td>
			
		</tr>
		<tr><td>Father's Occupation</td><td>:</td>
			<td id="fOccupation_val">
				<c:if test="${not empty profileBean.fOccupation}">${profileBean.fOccupationName}</c:if>
				<c:if test="${empty profileBean.fOccupation}">Not Specified</c:if>
			</td>
			
		</tr>
		<tr><td>No. of Brothers</td><td>:</td>
			<td id="noOfBrothers_val">
				<c:if test="${not empty profileBean.noOfBrothers}">${profileBean.noOfBrothers}</c:if>
				<c:if test="${empty profileBean.noOfBrothers}">Not Specified</c:if>
			</td>
			
		</tr>
		<tr><td>No. of Sisters</td><td>:</td>
			<td id="noOfSisters_val">
				<c:if test="${not empty profileBean.noOfSisters}">${profileBean.noOfSisters}</c:if>
				<c:if test="${empty profileBean.noOfSisters}">Not Specified</c:if>
			</td>
			
		</tr>
	</table>
	<table class="col-md-6 table-responsive">
	<tr>
	<td>Mother's Name</td><td>:</td>
			<td id="motherName_val">
		<%-- 	<c:out value="${profileBean.motherName}"/> --%>
				<c:if test="${not empty profileBean.motherName}">${profileBean.motherName}</c:if>
				<c:if test="${empty profileBean.motherName}">Not Specified</c:if>
			</td>
	</tr>
	<tr>
	<td>Mother's Occupation</td><td>:</td>
			<td id="mOccupation_val">
				<c:if test="${not empty profileBean.mOccupation}">${profileBean.mOccupationName}</c:if>
				<c:if test="${empty profileBean.mOccupation}">Not Specified</c:if>
			</td>
	</tr>
	<tr>
	<td>Brothers Married</td><td>:</td>
			<td id="noOfBrothersMarried_val">
				<c:if test="${not empty profileBean.noOfBrothersMarried}">${profileBean.noOfBrothersMarried}</c:if>
				<c:if test="${empty profileBean.noOfBrothersMarried}">Not Specified</c:if>
			</td>
	</tr>
	<tr>
	<td>Sisters Married</td><td>:</td>
			<td id="noOfSistersMarried_val">
				<c:if test="${not empty profileBean.noOfSistersMarried}">${profileBean.noOfSistersMarried}</c:if>
				<c:if test="${empty profileBean.noOfSistersMarried}">Not Specified</c:if>
			</td>
	</tr>
	</table>
	</div>
	
	</div>
	</div>
</div>

<br>
		<h4   style="padding: 10px;"></h4><h3>Partner Preferences</h3><hr>
<div class="panel panel-success">

			<div class="panel-body table-responsive">
			
			<div class="col-md-12">	<strong class="font">Basic & Religion Preferences</strong>
				
	<div id="partner_basic_view" class="all_visible_divs">
	<table class="col-md-6 table-responsive">
		<tr><td>
				<c:if test="${profileBean.gender == 'Female'}">Groom</c:if>
				<c:if test="${profileBean.gender == 'Male'}">Bride</c:if>
				's Age
			</td><td>:</td>
			<td id="rAgeFrom_val">
				<c:if test="${not empty profileBean.rAgeFrom}">${profileBean.rAgeFrom} - ${profileBean.rAgeTo} Years</c:if>
				<c:if test="${empty profileBean.rAgeFrom}">Not Specified</c:if>
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
	<table class="col-md-6">
	<tr> 
	<td>Height</td><td>:</td>
			<td>
				<span id="rHeight_val"><c:if test="${not empty profileBean.rHeightInches}">${profileBean.rHeightInches} - </c:if></span> <span id="rHeightTo_val"><c:if test="${not empty profileBean.rHeightInches}">${profileBean.rHeightToInches}</c:if></span>
				<span id="rHeight_outer_val"><c:if test="${empty profileBean.rHeightInches}">Not Specified</c:if></span>
			</td></tr>
			<tr>
			<td>Eating Habits</td><td>:</td>
			<td id="rDiet_val">
				<c:if test="${not empty profileBean.rDietName}">${profileBean.rDietName}</c:if>
				<c:if test="${empty profileBean.rDietName}">Not Specified</c:if>
			</td>
			</tr>
			<tr>
			<td>Mothertongue</td><td>:</td>
			<td id="rMotherTongue_val">
				<c:if test="${not empty profileBean.rMotherTongueName}">${profileBean.rMotherTongueName}</c:if>
				<c:if test="${empty profileBean.rMotherTongueName}">Not Specified</c:if>
			</td>
			</tr>
	
	</table>
	
	
	</div>
	
	</div>
	</div>
</div>

<br>
<div class="panel panel-success">
			<div class="panel-body table-responsive">
			<div class="col-md-12">	<strong class="font">Professional Preferences</strong>
				
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
	
	</div>
</div>
</div>
<br>
<div class="panel panel-success" >
			<div class="panel-body table-responsive">
			<div class="col-md-12">	<strong class="font">Location Preferences</strong>
				
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
	
	</div>
	</div>
</div>
</div></div>
</div></div></div>
</form:form>
<div class="col-md-4 noPrint">
<div class="col-sm-3" style='width: 100%; margin: 46px 0px 0px 0px;'>
			<div class="col-md-11 products-grid-right">
			<div class="panel panel-success">
			<div class="panel-heading">Add Horoscope</div>
					<div class="panel-body table-responsive">
		            	<div class="col-md-3"">
					<img src="user/images/edit-add-horoscope.gif" width="40">
				</div><div class="col-md-9"><p>It is simple and absolutely FREE!</p></div>
	            	</div>
	            </div>
			<div class="panel panel-success">
			<div class="panel-heading">Add Photos Now</div>
					<div class="panel-body table-responsive">
		            	<div class="col-md-3">
					<img src="user/images/add-photo-edit-avatar.png" width="40">
				</div><div class="col-md-9"><p>Photos are the first
things members look for
in a profile. </p></div>
	            	</div>
	            </div><div class="clearfix"></div>
			
			
			
			<div class="col-md-3 products-grid-right">
			</div></div>
			</div>
</div>
</div>
</div>
<!-- Modal -->
  <div tabindex="-1" class="modal fade in" id="myModalFullProfile" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
    
      <div class="modal-content">
        
        <div class="modal-body">
       
         


<section class="welcome">
    <div class="container">

        <div class="row">
            
  <button style="float:right;" type="button" class="close" data-dismiss="modal">&times;</button>
                <div id="mySlider" class="raxus-slider" data-autoplay="3000" data-arrows="show"  data-dots="show" data-keypress="true" data-thumbnail="bottom">
                	<ul class="slider-relative" id="relative">
						<c:forEach items="${fullProfilePhotosList}" var="photo" >
					      	<li class="slide fix-width">
	                            <img src="${photo.image}" alt="" class="watermark_text">
	                        </li>
						</c:forEach>
                    </ul>
            </div>
        </div>
    </div>
</section>

        </div>
       
      </div>
      
    </div>
  </div>
<script type="text/javascript">
var slideIndex = 1;
//showSlides(slideIndex);
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
$(function(){
	 //add text water mark;	
 addWaterMark();
});
function addWaterMark(){
 $('.watermark_text').watermark({
	  text: 'aarnamatrimony.com',
	  textWidth: 700,
	  textSize: 76,
	  textColor: 'white',
	  gravity: 'w',
	   opacity: 0.8,
	   //margin: 0,
	   outputWidth: 'auto',
	   outputHeight: 'auto'
	 });
}
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
  
  function shortList_fullprofile(profileId){
		$("#id").val(profileId);
		//var profileObj = serviceUnitArray[profileId];
		var formData = new FormData();
		formData.append('profile_id',profileId);
		jQuery.fn.makeMultipartRequest('POST', 'shortList', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var msg = jsonobj.message;
	    		if(typeof msg != "undefined"){
	    			if(msg=="success"){
	    				alert("This profile has been shortlisted.");
	    			}else{
	    				alert("Some problem occured. Please try again.");
	    			}
	    		}
	    		
		});
}

  function PrintElem(elem)
  {
  	$(".noPrint").hide();
  	$(".printbtn").hide();
		 $("#printFooter").show();
	    Popup($(elem).html());
  }
  
  function Popup(data)
  {
  	var mywindow = window.open('','new div');

      var is_chrome = Boolean(mywindow.chrome);
      var isPrinting = false;
      mywindow.document.write('<html><head><link rel="stylesheet" type="text/css" href="user/css/printcss.css"> <link rel="stylesheet" type="text/css" href="user/css/bootstrap.css"></head><body>');
      mywindow.document.write(data);
//       alert(data);
      console.log(data);
     
      mywindow.document.write('</body></html>');
      mywindow.document.close(); // necessary for IE >= 10 and necessary before onload for chrome

  
  $(".noPrint").show();
      if (is_chrome) {
          mywindow.onload = function() { // wait until all resources loaded 
              mywindow.focus(); // necessary for IE >= 10
              mywindow.print();  // change window to mywindow
              mywindow.close();// change window to mywindow
          };
      
      
     } else {
          mywindow.document.close(); // necessary for IE >= 10
          mywindow.focus(); // necessary for IE >= 10

          mywindow.print();
          mywindow.close();
     }
    
      return true;
  } 
  
</script>

<%@ include file="userFooter.jsp"%>