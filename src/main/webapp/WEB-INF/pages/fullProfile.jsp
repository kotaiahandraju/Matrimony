<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="userCommonHeader.jsp"%>
 <!-- for Raxus Slider -->
   <!--  <link rel="stylesheet" href="css/raxus.css" media="screen" type="text/css">
    <script type="text/javascript" src="js/raxus-slider.min.js"></script> -->
    <!-- for Raxus Slider #end -->

    <!-- for documentation: you don't need them -->
    <link rel="stylesheet" href="${baseurl}/documentation/css/documentation.css" media="screen" type="text/css">
    <link rel="stylesheet" href="http://yandex.st/highlightjs/8.0/styles/default.min.css" media="screen" type="text/css">
    <script type="text/javascript" src="${baseurl}/documentation/js/document.js"></script>
    <script src="${baseurl}/documentation/js/highlight.pack.js"></script>
     
    <script>hljs.initHighlightingOnLoad();</script>
    <!-- for documentation #end: you don't need them -->
    <!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="${baseurl}/engine1/style.css" />
<%-- <script type="text/javascript" src="${baseurl}/engine1/jquery.js"></script> --%>
<!-- End WOWSlider.com HEAD section -->
<style>
.cha {
min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    }
    .modal{
    background: rgba(0, 0, 0, 0.3) !important;
		height: auto;
		padding: 10px 10px;
		border-radius: 5px;
		-webkit-box-shadow: 3px 4px 8px rgba(0, 0, 0, .21);
		-moz-box-shadow: 3px 4px 8px rgba(0, 0, 0, .21);
		box-shadow: 3px 4px 8px rgba(0, 0, 0, .21);
		border: solid 3px rgba(220, 220, 220, .37);}
</style>
<noscript>
			<style>
				.es-carousel ul{
					display:block;
				}
				
			</style>
		</noscript>
		<script id="img-wrapper-tmpl" type="text/x-jquery-tmpl">	
			<div class="rg-image-wrapper">
				{{if itemsCount > 1}}
					<div class="rg-image-nav">
						<a href="#" class="rg-image-nav-prev">Previous Image</a>
						<a href="#" class="rg-image-nav-next">Next Image</a>
					</div>
				{{/if}}
				<div class="rg-image"></div>
				<div class="rg-loading"></div>
				<div class="rg-caption-wrapper">
					<div class="rg-caption" style="display:none;">
						<p></p>
					</div>
				</div>
			</div>
		</script>
    <style>
   @media only screen and (max-width: 640px) {
   .pull-profile {
    min-height:400px !important;
    } 
    }
    
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
 
}      /* for tablet */
        @media screen and (max-width: 980px) {
            #mySlider {
                width: 100%;
                height: 450px;
            }
            /*  .fullprofile {  
    min-height:400px !important;
    } */
        }
         td:first-child{ width: 150px; }
         td:nth-child(2) {width:10px !important;}
        td:fourth-child{ width: 150px; } 
        /* for mobile */
        
         @media screen and (max-width: px) {
            #mySlider {
                width: 570px;
                height: 450px;
            }
            .fullprofile {  
    min-height:400px !important;
    }
        }
        @media screen and (max-width: 640px) {
            #mySlider {
                width: 570px;
                height: 450px;
            }
           /*  .fullprofile {  
    min-height:400px !important;
    } */
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
.profileskip .dropdown-menu:after {
left:10px !important;
}
</style>

<script src="${baseurl}/js/plugins/jquery.ImageGallery.js"></script> 
<script src="${baseurl}/js/plugins/jquery.imagesloaded.min.js"></script> 

<div class="container " id="printDiv" style=' padding-left: 0px;'>
<div class="row">
<div class="col-sm-8">
<div class="products">
	<div class="container" style="background: #FFF;">
	
		<div class="mid-grids">
		<form:form commandName="createProfile" id="userProfile"  name="searchForm2"  method="post" action="">
			<form:hidden path="redirectPage" value="dashboard"></form:hidden>
			<form:hidden path="pageName"/>
			<form:hidden path="id"/>
			<form:hidden path="gender"/>
			<form:hidden path="religion"/>
			<form:hidden path="caste"/>
			
		<div class="col-md-8 products-grid-left" id="printProfile">
		
            	<div class="panel panel-success">
            	
					<div class="col-md-5 col-sm-5"> <h4></h4>
						<c:if test="${empty fullProfilePhotosList}">
							<img id="img_inpage" src="../img/default.png" class="img-responsive" style="margin-bottom:0;">
						</c:if>
						<c:if test="${not empty fullProfilePhotosList}">
						<div class="fullprofile" style="">	
							<a href="#" id="fullProfilePicOuterTag" data-toggle="modal" data-target="#myModalFullProfile"><img  src="${catalina_base}/${fullProfilePhotosList[0].image}" class="hover-shadow cursor img img-responsive thumbnail watermark_text" style="margin-bottom:0;height:auto;width: 100%;"  /></a>
							<%-- <a href="#" id="fullProfilePicOuterTag"><img src="${photosList[0].image}" style="width:100%; height:auto;" onclick="openModal();currentSlide(1)" class="hover-shadow cursor watermark_text"></a> --%>
						</div>	
							<div id="gallery-wrapper" class="noPrint">
								<!-- thumbnail images -->
								  <div id="thumbs-wrapper">
								     <div id="gallery" style="margin:-10px 8px 8px;width:100%;width: 100%;
    overflow: hidden;
    height: 81px;
    display: block;">
                       
								    	<c:set var="counter2" value="${0}" /> 
								    	<c:forEach items="${fullProfilePhotosList}" var="photo" >
								    		<c:set var="counter2" value="${counter2+1}" />
									      	<div class="profilethumbnail" style="float: left;width: 69px;height: 69px;padding: 0px;margin: 5px; "> 
										        <img src="${catalina_base}/${photo.image}" class="watermark_text" style="width:100%; height:auto;"  onclick="currentSlide_inpage('${photo.image}')"/> 
										    </div>
										</c:forEach>
								    </div> 
								  </div>
								  
								  <!-- thumbnail navigation -->
								  <div id="thumbs-nav"> 
								    <a id="gallery-next" style="margin-right:0px; margin-top:-92px;" href="#">next</a>
								    <a id="gallery-prev" style="margin-left:0px; margin-top:-92px;" href="#">previous</a>
								    <p id="gallery-pos" hidden="true">page 1 of 2</p>
								  </div>
							</div>
							
						</c:if>
						
                     </div>
                     <div class="col-md-7 col-sm-7 newc"><h4></h4>
						 <h3>
<%-- 						 <c:out value="${cacheGuest }"></c:out> --%>
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
								<p><span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-${profileBean.mobile}&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span></p>
							</c:when>
							<c:otherwise>
								<p id="mobileTD${profileBean.id}">
							 		<a href="#" type="button" class="btn1 btn btn-info noPrint"  id="mobileBtn" onclick="displayMobileNum(${profileBean.id})">View Mobile Number</a>
							 	</p>
							</c:otherwise>
						</c:choose></div>
						<p style="line-height:2; color:#000;font-size: 14px;">MATCH SCORE : <span id="match_score_div"></span></p>
					 	<div class="col-md-12 likeprofile noPrint">
					 	<c:if test="${profileBean.gender == 'Female'}">
					 		<p>Like this profile? Take the next step by sending her a mail.</p>
					 	</c:if>
					 	<c:if test="${profileBean.gender == 'Male'}">
					 		<p>Like this profile? Take the next step by sending him a mail.</p>
					 	</c:if>
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
      <li id="sortlistdivId"><a href="#" onclick="shortList_fullprofile(${profileBean.id})">Shortlist</a></li>
      <li><a href="#" class="noPrint" onclick="PrintElem('#printDiv');">Print</a></li>
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
			<div class="col-md-11">	<strong class="font"><img style="margin-left:-25px; padding-right:8px;" src="../nimages/self.png"/>About My ${profileBean.createProfileFor}</strong>
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
			<div class="col-md-12">	<strong class="font"><img style="margin-left:-25px; padding-right:8px;" src="../nimages/deta.png"/>Basic Details </strong>
				<div id="basic_details_view" class="all_visible_divs">
					<table class="col-md-6 col-sm-6 table-responsive">
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
					<table class="col-md-6 col-sm-6 table-responsive">
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
			<strong class="font"><img style="margin-left:-25px; padding-right:8px;" src="../nimages/reli.png"/>Religion Information</strong>
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
			<strong class="font"><img style="margin-left:-25px; padding-right:8px;" src="../nimages/loca.png"/>
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
			<div class="col-md-12">	<strong class="font"><img style="margin-left:-25px; padding-right:8px;" src="../nimages/prof.png"/>Professional Information</strong>
				
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
		<tr><td>Annual Income</td><td>:</td>
			<td id="annualIncome_val">
				<c:if test="${not empty profileBean.annualIncome}">${profileBean.annualIncome}</c:if>
				<c:if test="${empty profileBean.annualIncome}">Not Specified</c:if>
			</td>
		</tr>
	</table>
	</div>
	
	</div>
	</div>
 </div>

<div class="clearfix"></div>
<br>
<c:if test="${cacheGuest.roleId != 4 || cacheGuest.id == profileBean.id}">
<div class="panel panel-success">
			<div class="panel-body table-responsive">
			<div class="col-md-12">	<strong class="font"><img style="margin-left:-25px; padding-right:8px;" src="../nimages/family.png"/>Family Details</strong>
				
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
	<c:if test="${not empty profileBean.noOfBrothersMarried}">
	<tr>
	<td>Brothers Married</td><td>:</td>
			<td id="noOfBrothersMarried_val">
				<c:if test="${not empty profileBean.noOfBrothersMarried}">${profileBean.noOfBrothersMarried}</c:if>
				<c:if test="${empty profileBean.noOfBrothersMarried}">Not Specified</c:if>
			</td>
	</tr></c:if>
	<c:if test="${not empty profileBean.noOfSistersMarried}">
	<tr>
	<td>Sisters Married</td><td>:</td>
			<td id="noOfSistersMarried_val">
				<c:if test="${not empty profileBean.noOfSistersMarried}">${profileBean.noOfSistersMarried}</c:if>
				<c:if test="${empty profileBean.noOfSistersMarried}">Not Specified</c:if>
			</td>
	</tr></c:if>
	</table>
	</div>
	
	</div>
	</div>
</div>
</c:if>
<br>
<c:if test="${cacheGuest.id == profileBean.id}">
<!-- partner pref static -->

		<h4   style="padding: 10px;"></h4><h3>Partner Preferences</h3><hr>
<div class="panel " style="border:none;">

			<div class="panel-body table-responsive">
			
			<div class="col-md-12">	
			<strong class="font">Basic & Religion Preferences</strong>
				
	<div id="partner_basic_view" class="all_visible_divs">
	<table class="col-md-6 col-sm-6 table-responsive">
		<tr><td>
				<c:if test="${profileBean.gender == 'Female'}">Groom</c:if>
				<c:if test="${profileBean.gender == 'Male'}">Bride</c:if>
				's Age
			</td><td>:</td>
			<td id="rAgeFrom_val">
				<c:if test="${not empty profileBean.rAgeFrom}">${profileBean.rAgeFrom} - ${profileBean.rAgeTo} Years</c:if>
				<c:if test="${empty profileBean.rAgeFrom}">Not Specified</c:if>
			</td>
			<td></td>
		</tr>
		<tr><td>Marital Status</td><td>:</td>
			<td id="rMaritalStatus_val">
				<c:if test="${not empty profileBean.rMaritalStatusName}">${profileBean.rMaritalStatusName}</c:if>
				<c:if test="${empty profileBean.rMaritalStatusName}">Not Specified </c:if>
			</td>
			<%-- <td>Physical Status</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.casteName}">${profileBean.casteName}</c:if>
				<c:if test="${empty profileBean.casteName}">Not Specified</c:if>
			</td> --%>
			<td></td>
			
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
			<td></td>
			
		</tr>
		<tr>
			<td>Caste</td><td>:</td>
			<td id="rCaste_val">
				<c:if test="${not empty profileBean.rCasteName}">${profileBean.rCasteName}</c:if>
				<c:if test="${empty profileBean.rCasteName}">Not Specified</c:if>
			</td>
			<td></td>
			
		</tr>
		<%-- <tr>
			<td>Star</td><td>:</td>
			 <td>
				<c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
				<c:if test="${empty profileBean.currentStateName}">Not Specified</c:if>
			</td> 
			
		</tr> --%>
	</table>
	<table class="col-md-6 col-sm-6">
	<tr> 
	<td>Height</td><td>:</td>
			<td>
				<span id="rHeight_val"><c:if test="${not empty profileBean.rHeightInches}">${profileBean.rHeightInches} - </c:if></span> <span id="rHeightTo_val"><c:if test="${not empty profileBean.rHeightInches}">${profileBean.rHeightToInches}</c:if></span>
				<span id="rHeight_outer_val"><c:if test="${empty profileBean.rHeightInches}">Not Specified</c:if></span>
			</td>
			<td></td>
			</tr>
			<tr>
			<td>Eating Habits</td><td>:</td>
			<td id="rDiet_val">
				<c:if test="${not empty profileBean.rDietName}">${profileBean.rDietName}</c:if>
				<c:if test="${empty profileBean.rDietName}">Not Specified</c:if>
			</td>
			<td></td>
			
			</tr>
			<tr>
			<td>Mothertongue</td><td>:</td>
			<td id="rMotherTongue_val">
				<c:if test="${not empty profileBean.rMotherTongueName}">${profileBean.rMotherTongueName}</c:if>
				<c:if test="${empty profileBean.rMotherTongueName}">Not Specified</c:if>
			</td>
			<td></td>
			
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
	<table class="col-md-12 col-sm-12 table-responsive">
		<tr><td>Education</td><td>:</td>
			<td id="rEducation_val">
				<c:if test="${not empty profileBean.rEducationName}">${profileBean.rEducationName}</c:if>
				<c:if test="${empty profileBean.rEducationName}">Not Specified</c:if>
			</td>
			<td></td>
		</tr>
		<tr><td>Working With</td><td>:</td>
			<td id="rWorkingWith_val">
				<c:if test="${not empty profileBean.rWorkingWith}">${profileBean.rWorkingWith}</c:if>
				<c:if test="${empty profileBean.rWorkingWith}">Not Specified</c:if>
			</td>
			<td></td>
		</tr>
		<tr><td>Occupation</td><td>:</td>
			<td id="rOccupation_val">
				<c:if test="${not empty profileBean.rOccupationName}">${profileBean.rOccupationName}</c:if>
				<c:if test="${empty profileBean.rOccupationName}">Not Specified</c:if>
			</td>
			<td></td>
		</tr>
		<tr><td>Annual Income</td><td>:</td>
			<td id="rAnnualIncome_val">
				<c:if test="${not empty profileBean.rAnnualIncome}">${profileBean.rAnnualIncome}</c:if>
				<c:if test="${empty profileBean.rAnnualIncome}">Not Specified</c:if>
			</td>
			<td></td>
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
	<table class="col-md-12 col-sm-12 table-responsive">
		<tr><td>Country</td><td>:</td>
			<td id="rCountry_val">
				<c:if test="${not empty profileBean.rCountryName}">${profileBean.rCountryName}</c:if>
				<c:if test="${empty profileBean.rCountryName}">Not Specified</c:if>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>Residing State</td><td>:</td>
			<td id="rState_val">
				<c:if test="${not empty profileBean.rStateName}">${profileBean.rStateName}</c:if>
				<c:if test="${empty profileBean.rStateName}">Not Specified</c:if>
			</td>
			<td></td>
			<!-- <td>City</td><td>:</td> -->
			
		</tr>
		<tr>
   <td>Residing City</td><td>:</td>
   
    <td id="rCity_val">
        <c:if test="${not empty profileBean.rCityName}">${profileBean.rCityName}</c:if>
        <c:if test="${empty profileBean.rCityName}">Not Specified</c:if>
    </td>
    
    
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
<!-- partner pref static -->
</c:if>

<c:if test="${cacheGuest.id != profileBean.id}">
		<h4   style="padding: 10px;"></h4><h3>Partner Preferences</h3><hr>
<div class="panel " style="border:none;">

			<div class="panel-body table-responsive">
			
			<div class="col-md-12 col-sm-12">	
			<div style="width:700px; margin:0px auto 25px auto;">
			<div class="col-md-2 col-sm-2">
				<div class="txt-center mediumtxt1">You</div>
				<div class="fleft" style="border-radius:50%; border:1px solid #d6d6d6; width:98px; height:98px;"><img src="${catalina_base}/${cacheGuest.profileImage}"  width="98" height="98" border="0" alt="" style="border-radius:50%;"></div>
			</div>
			<div class="col-md-4 col-sm-4" style="width:390px; margin:55px 20px 0px 20px;">
				
				<div class="fleft"><div class="hdtxt paddl5 paddr5 txt-center" style="width:382px;">Your profile matches <span id=noOfProfileMatch></span>  / 14 of <c:if test="${cacheGuest.roleId == 4}"><img src="${baseurl}/images/blurr.png"/></c:if><c:if test="${cacheGuest.roleId != 4}">${profileBean.firstName}</c:if> preferences</div></div>
				
			</div>
			<div class="col-md-2 col-sm-2">
				<div class="txt-center mediumtxt1"><c:if test="${profileBean.gender == 'Female'}">Her</c:if>
				<c:if test="${profileBean.gender == 'Male'}">He</c:if></div>
				
				<div style="border-radius:50%; border:1px solid #d6d6d6; width:98px; height:98px;" id="imgsroundpp"><img src="${catalina_base}/${profileBean.profileImage}" width="98" height="98" border="0" alt="" style="border-radius:50%;"></div>
			</div>
			
			<div class="clearfix"><!--  --></div>
		</div><strong class="font"><img style="margin-left:-25px; padding-right:8px;" src="../nimages/reli.png">Basic & Religion Preferences</strong>
				
	<div id="partner_basic_view" class="all_visible_divs">
	<table class="col-md-12 col-sm-12 table-responsive">
		<tr><td>
				<c:if test="${profileBean.gender == 'Female'}">Groom</c:if>
				<c:if test="${profileBean.gender == 'Male'}">Bride</c:if>
				's Age
			</td><td>:</td>
			<td id="rAgeFrom_val">
				<c:if test="${not empty profileBean.rAgeFrom}">${profileBean.rAgeFrom} - ${profileBean.rAgeTo} Years</c:if>
				<c:if test="${empty profileBean.rAgeFrom}">Not Specified</c:if>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="rAgeFrom_img">---- <img src=""/> ----</td>
		</tr>
		<tr><td>Marital Status</td><td>:</td>
			<td id="rMaritalStatus_val">
				<c:if test="${not empty profileBean.rMaritalStatusName}">${profileBean.rMaritalStatusName}</c:if>
				<c:if test="${empty profileBean.rMaritalStatusName}">Not Specified </c:if>
			</td>
			<%-- <td>Physical Status</td><td>:</td>
			<td>
				<c:if test="${not empty profileBean.casteName}">${profileBean.casteName}</c:if>
				<c:if test="${empty profileBean.casteName}">Not Specified</c:if>
			</td> --%>
			<td></td>
			<td align="right" style="padding-right:20px"  id="Marital_img">---- <img src=""/> ----</td>
			
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
			<td></td>
			<td align="right" style="padding-right:20px" id="religion_img">---- <img src=""/> ----</td>
			
		</tr>
		<tr>
			<td>Caste</td><td>:</td>
			<td id="rCaste_val">
				<c:if test="${not empty profileBean.rCasteName}">${profileBean.rCasteName}</c:if>
				<c:if test="${empty profileBean.rCasteName}">Not Specified</c:if>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="cast_img">---- <img src=""/> ----</td>
			
		</tr>
		<%-- <tr>
			<td>Star</td><td>:</td>
			 <td>
				<c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
				<c:if test="${empty profileBean.currentStateName}">Not Specified</c:if>
			</td> 
			
		</tr> --%>
	</table>
	<table class="col-md-12 col-sm-12">
	<tr> 
	<td>Height</td><td>:</td>
			<td>
				<span id="rHeight_val"><c:if test="${not empty profileBean.rHeightInches}">${profileBean.rHeightInches} - </c:if></span> <span id="rHeightTo_val"><c:if test="${not empty profileBean.rHeightInches}">${profileBean.rHeightToInches}</c:if></span>
				<span id="rHeight_outer_val"><c:if test="${empty profileBean.rHeightInches}">Not Specified</c:if></span>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="heightTo_img">---- <img src=""/> ----</td>
			</tr>
			<tr>
			<td>Eating Habits</td><td>:</td>
			<td id="rDiet_val">
				<c:if test="${not empty profileBean.rDietName}">${profileBean.rDietName}</c:if>
				<c:if test="${empty profileBean.rDietName}">Not Specified</c:if>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="Eating_img">---- <img src=""/> ----</td>
			
			</tr>
			<tr>
			<td>Mothertongue</td><td>:</td>
			<td id="rMotherTongue_val">
				<c:if test="${not empty profileBean.rMotherTongueName}">${profileBean.rMotherTongueName}</c:if>
				<c:if test="${empty profileBean.rMotherTongueName}">Not Specified</c:if>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="Mothertongue_img">---- <img src=""/> ----</td>
			
			</tr>
	
	</table>
	
	
	</div>
	
	</div>
	</div>
</div>

<br>
<div class="panel panel-success">
			<div class="panel-body table-responsive">
			<div class="col-md-12">	<strong class="font"><img style="margin-left:-25px; padding-right:8px;" src="../nimages/prof.png">Professional Preferences</strong>
				
	<div id="partner_professional_view" class="all_visible_divs">
	<table class="col-md-12 col-sm-12 table-responsive">
		<tr><td>Education</td><td>:</td>
			<td id="rEducation_val">
				<c:if test="${not empty profileBean.rEducationName}">${profileBean.rEducationName}</c:if>
				<c:if test="${empty profileBean.rEducationName}">Not Specified</c:if>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="Education_img">---- <img src=""/> ----</td>
		</tr>
		<tr><td>Working With</td><td>:</td>
			<td id="rWorkingWith_val">
				<c:if test="${not empty profileBean.rWorkingWith}">${profileBean.rWorkingWith}</c:if>
				<c:if test="${empty profileBean.rWorkingWith}">Not Specified</c:if>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="Working_img">---- <img src=""/> ----</td>
		</tr>
		<tr><td>Occupation</td><td>:</td>
			<td id="rOccupation_val">
				<c:if test="${not empty profileBean.rOccupationName}">${profileBean.rOccupationName}</c:if>
				<c:if test="${empty profileBean.rOccupationName}">Not Specified</c:if>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="Occupation_img">---- <img src=""/> ----</td>
		</tr>
		<tr><td>Annual Income</td><td>:</td>
			<td id="rAnnualIncome_val">
				<c:if test="${not empty profileBean.rAnnualIncome}">${profileBean.rAnnualIncome}</c:if>
				<c:if test="${empty profileBean.rAnnualIncome}">Not Specified</c:if>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="AnnualIncome_img">---- <img src=""/> ----</td>
		</tr>
	</table>
	</div>
	
	</div>
</div>
</div>
<br>
<div class="panel panel-success" >
			<div class="panel-body table-responsive">
			<div class="col-md-12">	<strong class="font"><img style="margin-left:-25px; padding-right:8px;" src="../nimages/loca.png">Location Preferences</strong>
				
	<div id="partner_location_view" class="all_visible_divs">
	<table class="col-md-12 col-sm-12 table-responsive">
		<tr><td>Country</td><td>:</td>
			<td id="rCountry_val">
				<c:if test="${not empty profileBean.rCountryName}">${profileBean.rCountryName}</c:if>
				<c:if test="${empty profileBean.rCountryName}">Not Specified</c:if>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="Country_img">---- <img src=""/> ----</td>
		</tr>
		<tr>
			<td>Residing State</td><td>:</td>
			<td id="rState_val">
				<c:if test="${not empty profileBean.rStateName}">${profileBean.rStateName}</c:if>
				<c:if test="${empty profileBean.rStateName}">Not Specified</c:if>
			</td>
			<td></td>
			<td align="right" style="padding-right:20px" id="ResidingState_img">---- <img src=""/> ----</td>
			<!-- <td>City</td><td>:</td> -->
			
		</tr>
			<tr>
		<td>Residing City</td><td>:</td>
   
    <td id="rCity_val">
        <c:if test="${not empty profileBean.rCityName}">${profileBean.rCityName}</c:if>
        <c:if test="${empty profileBean.rCityName}">Not Specified</c:if>
    </td>
    <td></td>
			<td align="right" style="padding-right:20px" id="ResidingCity_img">---- <img src=""/> ----</td>
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
</div></c:if>
</div></div>
</div></div></div>
</form:form>
<div class="col-md-4 noPrint">
<div class="col-sm-3" style='width: 100%; margin: 46px 0px 0px 0px; padding-top:70px'>
			<div class="col-md-11 products-grid-right">
			<%-- <div class="panel panel-success">
			<div class="panel-heading">Add Horoscope</div>
					<div class="panel-body table-responsive">
		            	<div class="col-md-3"">
					<img src="${baseurl}/user/images/edit-add-horoscope.gif" width="40">
				</div><div class="col-md-9"><p>It is simple and absolutely FREE!</p></div>
	            	</div>
	            </div> --%>
	        <c:if test="${empty cacheGuest.profileImage}">
				<div class="panel ">
				<div class="panel-heading"><b> Add Photos Now</b></div>
						<div class="panel-body table-responsive">
			            	<div class="col-md-3">
						<img src="${baseurl}/user/images/add-photo-edit-avatar.png" width="40">
					</div><div class="col-md-9"><p>Photos are the first
	things members look for
	in a profile. </p></div>
		            	</div>
		            </div>
		     </c:if>
		     <c:if test="${cacheGuest.id != profileBean.id}">
	            <div class="">
					 <jsp:include page="sideGridForMatches.jsp" /></div></c:if>
	            <div class="clearfix"></div>
			
			
			
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
         <div class="modal-header" style="background:none;padding:15px;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top:-8px;">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
        <div class="modal-body">
       <div style="padding:0px; margin:0px; background-color:#fff;font-family:arial,helvetica,sans-serif,verdana,'Open Sans'">

    <!-- #region Jssor Slider Begin -->
    <!-- Generator: Jssor Slider Maker -->
    <!-- Source: https://www.jssor.com -->
    <script src="${baseurl}/js/jssor.slider-27.5.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        jssor_1_slider_init = function() {

            var jssor_1_SlideshowTransitions = [
              {$Duration:800,x:0.3,$During:{$Left:[0.3,0.7]},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:-0.3,$SlideOut:true,$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:-0.3,$During:{$Left:[0.3,0.7]},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:0.3,$SlideOut:true,$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,y:0.3,$During:{$Top:[0.3,0.7]},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,y:-0.3,$SlideOut:true,$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,y:-0.3,$During:{$Top:[0.3,0.7]},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,y:0.3,$SlideOut:true,$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:0.3,$Cols:2,$During:{$Left:[0.3,0.7]},$ChessMode:{$Column:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:0.3,$Cols:2,$SlideOut:true,$ChessMode:{$Column:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,y:0.3,$Rows:2,$During:{$Top:[0.3,0.7]},$ChessMode:{$Row:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,y:0.3,$Rows:2,$SlideOut:true,$ChessMode:{$Row:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,y:0.3,$Cols:2,$During:{$Top:[0.3,0.7]},$ChessMode:{$Column:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,y:-0.3,$Cols:2,$SlideOut:true,$ChessMode:{$Column:12},$Easing:{$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:0.3,$Rows:2,$During:{$Left:[0.3,0.7]},$ChessMode:{$Row:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:-0.3,$Rows:2,$SlideOut:true,$ChessMode:{$Row:3},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:0.3,y:0.3,$Cols:2,$Rows:2,$During:{$Left:[0.3,0.7],$Top:[0.3,0.7]},$ChessMode:{$Column:3,$Row:12},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:0.3,y:0.3,$Cols:2,$Rows:2,$During:{$Left:[0.3,0.7],$Top:[0.3,0.7]},$SlideOut:true,$ChessMode:{$Column:3,$Row:12},$Easing:{$Left:$Jease$.$InCubic,$Top:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,$Delay:20,$Clip:3,$Assembly:260,$Easing:{$Clip:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,$Delay:20,$Clip:3,$SlideOut:true,$Assembly:260,$Easing:{$Clip:$Jease$.$OutCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,$Delay:20,$Clip:12,$Assembly:260,$Easing:{$Clip:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,$Delay:20,$Clip:12,$SlideOut:true,$Assembly:260,$Easing:{$Clip:$Jease$.$OutCubic,$Opacity:$Jease$.$Linear},$Opacity:2}
            ];

            var jssor_1_options = {
              $AutoPlay: 1,
              $SlideshowOptions: {
                $Class: $JssorSlideshowRunner$,
                $Transitions: jssor_1_SlideshowTransitions,
                $TransitionsOrder: 1
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$
              }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*#region responsive code begin*/

            var MAX_WIDTH = 626;

            function ScaleSlider() {
                var containerElement = jssor_1_slider.$Elmt.parentNode;
                var containerWidth = containerElement.clientWidth;

                if (containerWidth) {

                    var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                    jssor_1_slider.$ScaleWidth(expectedWidth);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }

            ScaleSlider();

            $Jssor$.$AddEvent(window, "load", ScaleSlider);
            $Jssor$.$AddEvent(window, "resize", ScaleSlider);
            $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
            /*#endregion responsive code end*/
        };
    </script>
    <style>
        /*jssor slider loading skin spin css*/
        .jssorl-009-spin img {
            animation-name: jssorl-009-spin;
            animation-duration: 1.6s;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
        }

        @keyframes jssorl-009-spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /*jssor slider arrow skin 051 css*/
        .jssora051 {display:block;position:absolute;cursor:pointer;}
        .jssora051 .a {fill:none;stroke:#fff;stroke-width:360;stroke-miterlimit:10;}
        .jssora051:hover {opacity:.8;}
        .jssora051.jssora051dn {opacity:.5;}
        .jssora051.jssora051ds {opacity:.3;pointer-events:none;}

        /*jssor slider thumbnail skin 111 css*/
        .jssort111 .p {position:absolute;top:0;left:0;width:100px;height:70px;background-color:#000;margin:2px;}
        .jssort111 .p img {position:absolute;top:0;left:0;width:100%;height:100%;}
        .jssort111 .t {position:absolute;top:0;left:0;width:100%;height:100%;border:none;opacity:.45;}
        .jssort111 .p:hover .t{opacity:.8;}
        .jssort111 .pav .t, .jssort111 .pdn .t, .jssort111 .p:hover.pdn .t{opacity:1;}
        .jssort111 .ti {position:absolute;bottom:0px;left:0px;width:100%;height:28px;line-height:28px;text-align:center;font-size:12px;color:#fff;background-color:rgba(0,0,0,.3)}
        .jssort111 .pav .ti, .jssort111 .pdn .ti, .jssort111 .p:hover.pdn .ti{color:#000;background-color:rgba(255,255,255,.6);}
    </style>
    <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:626px;height:600px;max-height:600px;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="img/spin.svg" />
        </div>
        <div data-u="slides" style="cursor:default;top:0px;left:0px;width:600px;max-width:600px;height:500px;max-height:500px; text-align:center;">
          <c:forEach items="${fullProfilePhotosList}" var="photo" >
			<div><img  style="width:auto; max-width:600px; min-width:300px; height:100%; max-height:500px;"  class=""  src="${catalina_base}/${photo.folder_name}/full-images/${photo.image_name}" alt="${photo.image_name}" title="" id=""/>
			 <div class="watermarkcontent7_profilepic">
										<span>aarnamatrimony.com</span>
									</div>
			<div class="clearfix"></div><div data-u="thumb">
                    <img data-u="thumb" style="width:100%;height:auto;" class="" src="${catalina_base}/${photo.folder_name}/${photo.image_name}" alt="${photo.image_name}" />
                 <div class="watermarkcontent_profilepic">
										<span>aarnamatrimony.com</span>
									</div>
                </div>
			</div>
		  </c:forEach>
          
           <!--  <div>
                <img data-u="image" src="img/022.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/022-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/023.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/023-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/024.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/024-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/025.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/025-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/026.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/026-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/027.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/027-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/021.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/021-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/028.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/028-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/029.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/029-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/030.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/030-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/031.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/031-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div>
            <div>
                <img data-u="image" src="img/032.jpg" />
                <div data-u="thumb">
                    <img data-u="thumb" src="img/032-s200x100.jpg" />
                    <div class="ti">Slide Description</div>
                </div>
            </div> -->
        </div>
        <!-- Thumbnail Navigator -->
        <div data-u="thumbnavigator" class="jssort111" style="position:absolute;left:0px;bottom:0px;width:624px;height:100px;cursor:default;" data-autocenter="1" data-scale-bottom="0.75">
            <div data-u="slides">
                <div data-u="prototype" class="p">
                    <div data-u="thumbnailtemplate" class="t"></div>
                </div>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora051" style="width:35px;height:35px;top:162px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora051" style="width:35px;height:35px;top:162px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
        </div>
    </div>
    <script type="text/javascript">jssor_1_slider_init();</script>
    <!-- #endregion Jssor Slider End -->
         <%-- <div id="wowslider-container1">
<div class="ws_images"><ul>
		<c:forEach items="${fullProfilePhotosList}" var="photo" >
			<li><img src="${catalina_base}/${photo.folder_name}/${photo.image_name}" alt="${photo.image_name}" title="package" id="wows1_0"/></li>
		</c:forEach>
		<li><img src="${baseurl}/data1/images/package.jpg" alt="package" title="package" id="wows1_0"/></li>
		<li><img src="${baseurl}/data1/images/aadhar_card_copy.jpg" alt="aadhar card copy" title="aadhar card copy" id="wows1_1"/></li>
		<li><img src="${baseurl}/data1/images/blue_strip.jpg" alt="blue strip" title="blue strip" id="wows1_2"/></li>
		<li><img src="${baseurl}/data1/images/tenali_m.jpg" alt="tenali m" title="tenali m" id="wows1_3"/></li>
		<li><img src="${baseurl}/data1/images/tenali_m1.jpg" alt="tenali m1" title="tenali m1" id="wows1_4"/></li>
		<li><a href="#"><img src="${baseurl}/data1/images/tenali.jpg" alt="css image gallery" title="TENALI" id="wows1_5"/></a></li>
		<li><img src="${baseurl}/data1/images/pan_card.jpg" alt="pan card" title="pan card" id="wows1_6"/></li>
	</ul></div>
	<div class="ws_thumbs">
<div>
		<c:forEach items="${fullProfilePhotosList}" var="photo" >
			<a href="#" title="package"><img src="${catalina_base}/${photo.folder_name}/${photo.image_name}" alt="${photo.image_name}" /></a>
		</c:forEach>
		<a href="#" title="package"><img src="${baseurl}/data1/tooltips/package.jpg" alt="" /></a>
		<a href="#" title="aadhar card copy"><img src="${baseurl}/data1/tooltips/aadhar_card_copy.jpg" alt="" /></a>
		<a href="#" title="blue strip"><img src="${baseurl}/data1/tooltips/blue_strip.jpg" alt="" /></a>
		<a href="#" title="tenali m"><img src="${baseurl}/data1/tooltips/tenali_m.jpg" alt="" /></a>
		<a href="#" title="tenali m1"><img src="${baseurl}/data1/tooltips/tenali_m1.jpg" alt="" /></a>
		<a href="#" title="TENALI"><img src="${baseurl}/data1/tooltips/tenali.jpg" alt="" /></a>
		<a href="#" title="pan card"><img src="${baseurl}/data1/tooltips/pan_card.jpg" alt="" /></a>
	</div>
</div>
<div class="ws_script" style="position:absolute;left:-99%"><a href=""></a></div>
<div class="ws_shadow"></div>
</div> --%>


<%-- <section class="welcome">
    <div class="container">

        <div class="row">
            
  <button style="float:right;" type="button" class="close" data-dismiss="modal">&times;</button>
                <div id="mySlider" class="raxus-slider" data-autoplay="3000" data-arrows="show"  data-dots="show" data-keypress="true" data-thumbnail="bottom">
                	<ul class="slider-relative" id="relative">
						<c:forEach items="${fullProfilePhotosList}" var="photo" >
					      	<li class="slide fix-width">
	                            <img src="${catalina_base}/${photo.folder_name}/full-images/${photo.image_name}" alt="" class="">
	                            <div class="watermarkcontent_fullpic">
									<span>aarnamatrimony.com</span>
								</div>
	                        </li>
						</c:forEach>
                    </ul>
            </div>
        </div>
    </div>
</section> --%>

        </div>
       
      </div>
      
    </div>
  </div>
 <%--  <div class="clearfix"></div>
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#pop">Open Modal</button>
 <div class="modal fade" id="pop" role="dialog"> 
    <div class="modal-dialog">
    <div class="modal-content" style="padding:10px;border:none;">
        <div class="modal-header" style="background:none;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div> 
        <div class="modal-body">
  <div class="content">
				<div id="rg-gallery" class="rg-gallery">
					
						<div class="es-carousel-wrapper"><div class="rg-thumbs">
							<div class="es-nav">
								<span class="es-nav-prev">Previous</span>
								<span class="es-nav-next">Next</span>
							</div>
							<div class="es-carousel">
								<ul>
									<li><a href="#"><img src="${baseurl}/images1/thumbs/1.jpg" data-large="${baseurl}/images1/1.jpg" alt="image01" /></a></li>
									<li><a href="#"><img src="${baseurl}/images1/thumbs/2.jpg" data-large="${baseurl}/images1/2.jpg" alt="image02"  /></a></li>
									<li><a href="#"><img src="${baseurl}/images1/thumbs/3.jpg" data-large="${baseurl}/images1/3.jpg" alt="image03"  /></a></li>
									<li><a href="#"><img src="${baseurl}/images1/thumbs/4.jpg" data-large="${baseurl}/images1/4.jpg" alt="image04" /></a></li>
									<li><a href="#"><img src="${baseurl}/images1/thumbs/5.jpg" data-large="${baseurl}/images1/5.jpg" alt="image05" /></a></li>
									<li><a href="#"><img src="${baseurl}/images1/thumbs/6.jpg" data-large="${baseurl}/images1/6.jpg" alt="image06" /></a></li>
									<li><a href="#"><img src="${baseurl}/images1/thumbs/7.jpg" data-large="${baseurl}/images1/7.jpg" alt="image07"  /></a></li>
									<li><a href="#"><img src="${baseurl}/images1/thumbs/8.jpg" data-large="${baseurl}/images1/8.jpg" alt="image08" /></a></li>
									</ul>
							</div>
						</div>
					</div>
				</div>
			</div></div></div></div></div><div class="clearfix"></div>  --%>
			<div class="clearfix"></div>
<%-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#pop">Open Modal</button>
<div class="modal fade" id="pop" role="dialog">
    <div class="modal-dialog">
    <div class="modal-content" style="padding:10px;border:none;">
        <div class="modal-header" style="background:none;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div> 
        <div class="modal-body">
<div id="wowslider-container1">
<div class="ws_images"><ul>
		<c:forEach items="${fullProfilePhotosList}" var="photo" >
			<li><img src="${catalina_base}/${photo.folder_name}/${photo.image_name}" alt="${photo.image_name}" title="package" id="wows1_0"/></li>
		</c:forEach> --%>
		<%-- <li><img src="${baseurl}/data1/images/package.jpg" alt="package" title="package" id="wows1_0"/></li>
		<li><img src="${baseurl}/data1/images/aadhar_card_copy.jpg" alt="aadhar card copy" title="aadhar card copy" id="wows1_1"/></li>
		<li><img src="${baseurl}/data1/images/blue_strip.jpg" alt="blue strip" title="blue strip" id="wows1_2"/></li>
		<li><img src="${baseurl}/data1/images/tenali_m.jpg" alt="tenali m" title="tenali m" id="wows1_3"/></li>
		<li><img src="${baseurl}/data1/images/tenali_m1.jpg" alt="tenali m1" title="tenali m1" id="wows1_4"/></li>
		<li><a href="#"><img src="${baseurl}/data1/images/tenali.jpg" alt="css image gallery" title="TENALI" id="wows1_5"/></a></li>
		<li><img src="${baseurl}/data1/images/pan_card.jpg" alt="pan card" title="pan card" id="wows1_6"/></li> --%>
	<%-- </ul></div>
	<div class="ws_thumbs">
<div>
		<c:forEach items="${fullProfilePhotosList}" var="photo" >
			<a href="#" title="package"><img src="${catalina_base}/${photo.folder_name}/${photo.image_name}" alt="${photo.image_name}" /></a>
		</c:forEach> --%>
		<%-- <a href="#" title="package"><img src="${baseurl}/data1/tooltips/package.jpg" alt="" /></a>
		<a href="#" title="aadhar card copy"><img src="${baseurl}/data1/tooltips/aadhar_card_copy.jpg" alt="" /></a>
		<a href="#" title="blue strip"><img src="${baseurl}/data1/tooltips/blue_strip.jpg" alt="" /></a>
		<a href="#" title="tenali m"><img src="${baseurl}/data1/tooltips/tenali_m.jpg" alt="" /></a>
		<a href="#" title="tenali m1"><img src="${baseurl}/data1/tooltips/tenali_m1.jpg" alt="" /></a>
		<a href="#" title="TENALI"><img src="${baseurl}/data1/tooltips/tenali.jpg" alt="" /></a>
		<a href="#" title="pan card"><img src="${baseurl}/data1/tooltips/pan_card.jpg" alt="" /></a> --%>
	<!-- </div>
</div>
<div class="ws_script" style="position:absolute;left:-99%"><a href="">html5 slideshow</a></div>
<div class="ws_shadow"></div>
</div>	</div></div> -->
</div></div>

<script type="text/javascript">
/* var listOrders1 = ${shortlistedList};
shortListData(listOrders1);
function shortListData(list){
	$.each(list,function(i, orderObj){
// 		sortlistdivId
var ee =${profileBean.id};
		if(orderObj.id == ee){
			alert('');
			
			$("#sortlistdivId").attr("shortlisted");
		}	else{
			$("#sortlistdivId").attr('');
		}
});
} */


var slideIndex = 1;
var short_listed =  ${profileBean.shortlisted};
//alert("short_listed:"+short_listed);
if(short_listed>0){
	//alert("###");
$("#sortlistdivId").html("");
$("#sortlistdivId").append(' <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Shortlisted</li>');
}
//showSlides(slideIndex);
var allowed_limit = "${allowed_profiles_limit}";
if(allowed_limit=="unlimited"){
	allowed_limit = "1";
	allowed_limit = parseInt(allowed_limit);
}
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
	
	//alert("short_listed:"+short_listed);	
	//var listOrders1 = ${shortlistedList};
	//shortListData(listOrders1);

	
	
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
	    				var mobStr = '<span style="background:url(${baseurl}/user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-${profileBean.mobile}&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
	    				$("#mobileTD"+profileId).html(mobStr);
	    				if(typeof limit != "undefined"){
	    					if(limit=="unlimited"){
	    						allowed_limit = "1";
	    						allowed_limit = parseInt(allowed_limit);
	    					}else{
	    						allowed_limit = limit;
	    					}
	    				}
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
/* $(function(){
	 //add text water mark;	
 addWaterMark();
});
function addWaterMark(){
 $('.watermark_text').watermark({
	  text: 'aarnamatrimony.com',
	  textWidth: 700,
	  textSize: v1+v2,
	  textColor: 'white',
	  gravity: 'n',
	   opacity: 0.8,
	   //margin: 0,
	   outputWidth: 'auto',
	   outputHeight: 'auto'
	 });
} */
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
	    				$("#sortlistdivId").html("");
	    				$("#sortlistdivId").append(' <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Shortlisted</li>');
	    				//if($("#id").val(profileId)!=null&&$("#id").val(profileId)!="")
	    					
	    				
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
      mywindow.document.write('<html><head><link rel="stylesheet" type="text/css" href="${baseurl }/user/css/printcss.css"> <link rel="stylesheet" type="text/css" href="user/css/bootstrap.css"></head><body>');
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
<script type="text/javascript"> 
 
//profile Bean
var ageFrom="${profileBean.rAgeFrom}";
var ageTo="${profileBean.rAgeTo}";
var heightFrom="${profileBean.rHeight}";
var heightTo="${profileBean.rHeightTo}";
var rMarrege="${profileBean.rMaritalStatus}";
var rbodyType="${profileBean.bodyType}";
var rMotherTongue="${profileBean.rMotherTongue}";
var rdiet="${profileBean.rDiet}";
var rsmoking="${profileBean.smoking}";
var rdrinking="${profileBean.drinking}";
var rReligion="${profileBean.rReligion}";
var rCaste="${profileBean.rCaste}";
var rgotram="${profileBean.gotram}";
var rstar="${profileBean.star}";
var rdosam="${profileBean.dosam}";
var rEducation="${profileBean.rEducation}";
var rOccupation="${profileBean.rOccupation}";
var rAnnualIncome="${profileBean.rAnnualIncome}";
var rWorkingWith="${profileBean.rWorkingWith}";
var rCountry="${profileBean.rCountry}";
var rState="${profileBean.rState}";
var rCity="${profileBean.rCity}"; 

//Session Bean
var age="${sessionBeanList.age}";
var height="${sessionBeanList.height}";
var marrege="${sessionBeanList.maritalStatus}";
var bodyType="${sessionBeanList.bodyType}";
var motherTongue="${sessionBeanList.motherTongue}";
var diet="${sessionBeanList.diet}";
var smoking="${sessionBeanList.smoking}";
var drinking="${sessionBeanList.drinking}";
var religion="${sessionBeanList.religion}";
var caste="${sessionBeanList.caste}";
var gotram="${sessionBeanList.gotram}";
var star="${sessionBeanList.star}";
var dosam="${sessionBeanList.dosam}";
var education="${sessionBeanList.education}";
var occupation="${sessionBeanList.occupation}";
var annualIncome="${sessionBeanList.annualIncome}";
var workingWith="${sessionBeanList.workingWith}";
var country="${sessionBeanList.currentCountry}";
var state="${sessionBeanList.currentState}";
var city="${sessionBeanList.currentCity}"; 

var match_score = 0;
var no_of_match=0;
if((ageFrom!=null && ageFrom!='') && (ageTo!=null && ageTo!='' )){
	if((age >= ageFrom)&&(age<=ageTo)){
		$("#rAgeFrom_img img").attr("src","../nimages/Yes.png");
		match_score += 8;
		no_of_match +=1;
		 }else
		{
			 $("#rAgeFrom_img img").attr("src","../nimages/No.png");	 
		 } 
}else{
	$("#rAgeFrom_img img").attr("src","../nimages/Yes.png");
	match_score += 8;
	no_of_match +=1;
}
if(heightFrom!=null && heightFrom!="" && heightTo!=null && heightTo!=""){
if((height >= heightFrom) && (height <= heightTo)){
	$("#heightTo_img img").attr("src","../nimages/Yes.png");
	match_score += 8;
	no_of_match +=1;
	 }else
	{
		 $("#heightTo_img img").attr("src","../nimages/No.png");	 
	 } 
}else{
	
	$("#heightTo_img img").attr("src","../nimages/Yes.png");
	match_score += 8;
	no_of_match +=1;
}
if(rMarrege!=null && rMarrege!='' && rMarrege!="any" ){
 if(rMarrege == marrege){
	 $("#Marital_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
 }else
{
	 $("#Marital_img img").attr("src","../nimages/No.png");	 
 } }
else{
	
	 $("#Marital_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
}
/*  if(rbodyType == bodyType){
	 alert("sucess body Type");
 }else{
	 alert("no sucess body Type");
 } */
 var motherToungArry=rMotherTongue.split(",");
 if(rMotherTongue!=null && rMotherTongue!='' && rMotherTongue!='any'){
 for (var i=0;i<motherToungArry.length; i++){
 if(parseInt(motherToungArry[i]) == motherTongue){
	 $("#Mothertongue_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
	 break;
 }else
{
	 $("#Mothertongue_img img").attr("src","../nimages/No.png");	 
 } 
 }}else{
	 $("#Mothertongue_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1; 
	 
 }
 var  dietArry=rdiet.split(",");
 if(rdiet!=null && rdiet!='' && rdiet!='any'){
 for (var i=0;i<dietArry.length; i++){
 if(dietArry[i] == diet){
	 $("#Eating_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
	 break;
 }else
{
	 $("#Eating_img img").attr("src","../nimages/No.png");	 
 } }}else{
	 $("#Eating_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
 }
/*  if(rsmoking == smoking){
	 alert("sucess smoking");
 }else{
	 alert("no sucess smoking");
 }
 if(rdrinking == drinking){
	 alert("sucess drinking");
 }else{
	 alert("no sucess drinking");
 } */
 var  regArry=rReligion.split(",");
 if(rReligion!=null && rReligion!='' && rReligion!='any'){
 for (var i=0;i<regArry.length; i++){
 if(parseInt(regArry[i]) == religion){
	 $("#religion_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
	 break;
 }else
{
	 $("#religion_img img").attr("src","../nimages/No.png");	 
 } 
 }}
 else{
	 $("#religion_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1; 
 }
 var  castArray=rCaste.split(",");
 if(rCaste!=null && rCaste!='' && rCaste!="any"){
 for (var i=0;i<castArray.length; i++){
 if(parseInt(castArray[i]) == caste){
	 $("#cast_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
	 break;
 }else
{
	 $("#cast_img img").attr("src","../nimages/No.png");	 
 } }}else{
	 $("#cast_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
	 
 }
/*  if(rgotram == gotram){
	 alert("sucess gotram");
 }else{
	 alert("no sucess gotram");
 }
 if(rstar == star){
	 alert("sucess star");
 }else{
	 alert("no sucess star");
 }
 if(rdosam == dosam){
	 alert("sucess dosam");
 }else{
	 alert("no sucess dosam");
 } */
//  var educationarry = {};
var  educationarry=rEducation.split(",");
if(rEducation!=null && rEducation!='' && rEducation!='any'){
for (var i=0;i<educationarry.length; i++){
 if(parseInt(educationarry[i]) == education){
	 $("#Education_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
	 break;
 }else
 {
 	 $("#Education_img img").attr("src","../nimages/No.png");	 
  } }
}else{
	
	$("#Education_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
}
var Occupationarry=rOccupation.split(",");
if(rOccupation!=null && rOccupation!='' && rOccupation!='any'){
for (var i=0;i<Occupationarry.length; i++){
 if(parseInt(Occupationarry[i]) == occupation){
	 $("#Occupation_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
	 break;
 }else
 {
 	 $("#Occupation_img img").attr("src","../nimages/No.png");	 
  } }}
else{
	$("#Occupation_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
}
if(rAnnualIncome!=null && rAnnualIncome!='' && rAnnualIncome!='any'){
 if(rAnnualIncome == annualIncome){
	 $("#AnnualIncome_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
 }else
 {
 	 $("#AnnualIncome_img img").attr("src","../nimages/No.png");	 
  }}
else{
	 $("#AnnualIncome_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
}
 var  workingWithArry=rWorkingWith.split(",");
 if(rWorkingWith!=null && rWorkingWith!='' && rWorkingWith!='any'){
 for (var i=0;i<workingWithArry.length; i++){
 if(workingWithArry[i] == workingWith){
	 $("#Working_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
	 break;
 }else
 {
 	 $("#Working_img img").attr("src","../nimages/No.png");	 
  } }}else{
	  $("#Working_img img").attr("src","../nimages/Yes.png");
		 match_score += 7;
		 no_of_match +=1; 
  }
 var  rCountryArry=rCountry.split(",");
 if(rCountry!=null && rCountry!='' && rCountry!='any'){
 for (var i=0;i<rCountryArry.length; i++){
 if(parseInt(rCountryArry[i]) == country){
	 $("#Country_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
	 break;
 }else
 {
 	 $("#Country_img img").attr("src","../nimages/No.png");	 
  } }
 }else{
	 $("#Country_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
 }
 var  rStateArry=rState.split(",");
 if(rState!=null && rState!='' && rState!='any'){
 for (var i=0;i<rStateArry.length; i++){
 if(parseInt(rStateArry[i]) == state){
	 $("#ResidingState_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;
	 break;
 }else
 {
 	 $("#ResidingState_img img").attr("src","../nimages/No.png");	 
  } }}
 else{
	 $("#ResidingState_img img").attr("src","../nimages/Yes.png");
	 match_score += 7;
	 no_of_match +=1;	 
 }
 var  rCityArry=rCity.split(",");
 if(rCity!=null && rCity!='' && rCity!='any'){
 for (var i=0;i<rCityArry.length; i++){
 if(parseInt(rCityArry[i]) == city){
	  $("#ResidingCity_img img").attr("src","../nimages/Yes.png");
	  match_score += 7;
	  no_of_match +=1;
	  break;
 }else
 {
 	 $("#ResidingCity_img img").attr("src","../nimages/No.png");	 
  } }}
 else{
	 $("#ResidingCity_img img").attr("src","../nimages/Yes.png");
	  match_score += 7;
	  no_of_match +=1;
 }
 //$(no_of_match).appendTo("#noOfProfileMatch");
 $("#noOfProfileMatch").html(no_of_match);
 //$(match_score).appendTo("#match_score_div");
 $("#match_score_div").html(match_score);
 
</script> 


</script>
<script type="text/javascript" src="${baseurl}/engine1/wowslider.js"></script>
<script type="text/javascript" src="${baseurl}/engine1/script.js"></script>
<!-- End WOWSlider.com BODY section -->
<%@ include file="userFooter.jsp"%>

