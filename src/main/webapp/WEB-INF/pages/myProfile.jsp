<%@ include file="userCommonHeader.jsp"%>
 <!-- for Raxus Slider -->
   <!--  <link rel="stylesheet" href="css/raxus.css" media="screen" type="text/css">
    <script type="text/javascript" src="js/raxus-slider.min.js"></script> -->
    <!-- for Raxus Slider #end -->

    <!-- for documentation: you don't need them -->
    <link rel="stylesheet" href="${baseurl }/documentation/css/documentation.css" media="screen" type="text/css">
    <link rel="stylesheet" href="http://yandex.st/highlightjs/8.0/styles/default.min.css" media="screen" type="text/css">
    <script type="text/javascript" src="${baseurl }/documentation/js/document.js"></script>
    <script src="${baseurl }/documentation/js/highlight.pack.js"></script>
     
    <script>hljs.initHighlightingOnLoad();</script>
    <!-- for documentation #end: you don't need them -->

<script src="${baseurl}/js/plugins/jquery.ImageGallery.js"></script> 
<script src="${baseurl}/js/plugins/jquery.imagesloaded.min.js"></script>
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
    #mobileNoText {
    font-size:13px;
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
       td:first-child{ width: 150px; }
       td:nth-child(2) {width:10px !important;}
        td:fourth-child{ width: 150px; } 
       /*  .modal-header .close {
    margin-top: -12px;
} */
/* @media (min-width: 768px) {
.modal-dialog {
   width: px !important;
    margin: 30px 250px !important;
}
} */
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
        }
          @media screen and (max-width: 320px) {
            #mySlider {
                width: 280px;
                height: 250px;
            }
        }
        @media  (min-width: 320px) and (max-width:640px) {
        .anin {
        width:100%;}
        .navbar-custom .dropdown:hover .dropdown-menu {
    display: block;
  }
        }
        
    </style>
<style>
       .anin{
       border-radius:0px;
       width : 187px;
       }     	
       
.img-replace {
  
  display: inline-block;
  overflow: hidden;
  text-indent: 100%;
  color: transparent;
  white-space: nowrap;
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
.mobileNoDiv {
margin-bottom:5px;
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
<script type="text/javascript">
$(".onlyCharacters").on("keypress",	function(event) {

	// Disallow anything not matching the regex pattern (A to Z
	// uppercase, a to z lowercase and white space)
	var englishAlphabetAndWhiteSpace = /[A-Za-z. ]/g;

	// Retrieving the key from the char code passed in event.which
	var key = String.fromCharCode(event.which);

	// alert(event.keyCode);

	if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37
			|| event.keyCode == 39
			|| englishAlphabetAndWhiteSpace.test(key)) {
		return true;
	}

	// If we got this far, just return false because a disallowed key
	// was typed.
	return false;
});
</script>

<div class="container products" style="background:#FFF;">
<div class="row">
<div  class="mid-grids">
<div class="col-md-9">
<div>
<form:form commandName="editProfileForm" id="userProfile" method="post" action=""> 
    <form:hidden path="redirectPage" value="dashboard"></form:hidden>
    <form:hidden path="pageName"></form:hidden>
    <form:hidden path="id"></form:hidden>
	<input type="hidden" id="req_from" value="user" >
<div>
<div>

        <div class="panel" style="background:#F7F6F7; padding:20px 15px;">
            <div class="col-md-5">
                <c:if test="${not empty cacheGuest.profileImage}">
                	<div class="fullprofile" style="height:220px; overflow:hidden;"">
                		<a href="#" id="fullProfilePicOuterTag" data-toggle="modal" data-target="#myModalNew"><img  src="${catalina_base}/${cacheGuest.profileImage}" class="hover-shadow cursor img img-responsive thumbnail watermark_text" style="margin-bottom:0;height:auto;width: 100%;" /></a>
                	</div>
                	<div align="center">
	                    <a href="myPhotos" style="font-size:12px; padding:12px 0; text-align:center; font-weight:600; color:#006699;"> Add / Edit  Photos</a>
	                </div>
<%--                     <a href="#no" id="fullProfilePicOuterTag"><div  style="width:100%; max-height:195px; overflow:hidden;"><img src="${cacheGuest.profileImage}"   onclick="openModal();currentSlide(1)" class="cursor watermark_text" style="width:100%; height:auto;"></div></a> --%>
                      <div id="gallery-wrapper">
                        <!-- thumbnail images -->
                          <div id="thumbs-wrapper">
                            <div id="gallery" style="margin:-10px 8px 8px;width:100%;width: 100%;
    overflow: hidden;
    height: 81px;
    display: block;">
                                <c:set var="counter3" value="${0}" /> 
                                <c:forEach items="${photosList}" var="photo" >
                                    <c:set var="counter3" value="${counter3+1}" />
                                    <div class="profilethumbnail" style="float: left;width: 69px; height: 69px;padding: 0px;margin: 5px; "> 
                                        <img src="${catalina_base}/${photo.image}" class="watermark_text" style="width:100%;"  onclick="currentSlide_inpage('${photo.image}',event)"/> 
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
                <c:if test="${empty cacheGuest.profileImage}">
                    <img src="../img/default.png" class="img-responsive" style="margin-bottom:0;">
                    <div align="center">
	                    <a href="myPhotos" style="font-size:12px; padding:12px 0; text-align:center; font-weight:600; color:#006699;"> Add / Edit  Photos</a>
	                </div>
                </c:if>
                
             </div>
             <div class="col-md-4">
                 <h3><p class="name_val">${profileBean.firstName} ${profileBean.lastName}</h3><h4> (${cacheGuest.username})</p></h4>
                <p style=" color:#000;font-size: 13px; line-height:19px;">Profile created for <span id="createProfileFor_val">${cacheGuest.createProfileFor}</span><br>
                <span class="all_age_val">${profileBean.age}</span> Yrs, <span class="all_height_val">${profileBean.heightInches}</span><Br>
                <span class="all_religion_val">${profileBean.religionName}</span>, <span class="all_caste_val">${profileBean.casteName}</span><br>
                <span class="all_currentCity_val">${profileBean.currentCityName}</span>, <span class="all_currentState_val">${profileBean.currentStateName}</span>, <span class="all_currentCountry_val">${profileBean.currentCountryName}</span><br>
                <span class="all_education_val">${profileBean.educationName}</span>, <span class="all_occupation_val">${profileBean.occupationName}</span></p>
                <div id="editMobileDiv" hidden="true">
                	<input type="text" placeholder="+91-${cacheGuest.mobile}" id="mobile" class="numbersOnly" onblur="validate(this.id,'Enter Mobile Number');" maxlength="10" />
                	<br><span class="hasError" id="mobileError111" style="font-size: 13px;color:red"></span>
                </div> 
                <div id="mobileNoDiv"><span style="background:url(${baseurl}/user/images/mobile.gif) no-repeat left top;padding-left:13px; font-weight:600;">&nbsp;<span id="mobileNoText">+91-${cacheGuest.mobile}</span>&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font>&nbsp;&nbsp;</span>&nbsp;</div>
                <a href="#no" id="editMobileAnchor" style="color:blue; font-size:12px; text-decoration:none;"  onclick="displayEditMobilenumberDiv(${profileBean.id},'${cacheGuest.mobile}')">Edit Mobile No.</a>
                 <br>
                
                </div>
                <div class="col-md-3">
               
             <p style=" color:#000;font-size: 13px; text-align:center;">How your profile looks
                to others <br><a href="#no" onclick="fullProfile(${profileBean.id})" class="" style=" width:auto; border:1px solid #cccccc;padding:7px 40px 7px 40px;display:inline-block;border-radius:5px;background:url(${baseurl}/user/images/eye.gif) no-repeat 10px 8px;margin-top:5px;text-decoration:none;">Profile Preview</a>
                </p></div>

<div class="clearfix"></div>
        

<div class="cd-popup" role="alert">
<div class="cd-popup-container">
<h4 >Privacy Settings</h4>
<p>Your privacy settings have been saved successfully.</p>

<a href="#0" class="cd-popup-close img-replace">Close</a>
</div> <!-- cd-popup-container -->
</div> <!-- cd-popup -->
            
    </div><br>
   <h3>Personal Information</h3>
    <div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">			
        <strong class="font">About My ${cacheGuest.createProfileFor}
        <a href="#no" style="font-size:13px; color:#C00;" class="all_a pull-right" id="about_a" onclick="toggleDiv('about');"> <i class="fa fa-edit"></i> Edit</a>
        </strong>
        <div id="about_view" class="all_visible_divs">
            <p id="aboutMyself_val">
                <c:if test="${not empty profileBean.aboutMyself}">${profileBean.aboutMyself}</c:if>
                <c:if test="${empty profileBean.aboutMyself}">Not Specified</c:if>
            </p>
        </div>
       
        <div id="about_edit" class="all_hidden_divs " hidden="true">
            <form:textarea path="aboutMyself" onfocus="colorChange()" onkeyup="checkLen()" cols="90" rows="6"/><br>
      		<span id="errorMsg" style="color:red"></span>  
      					 <div class="row">
                <div class="col-md-4" style="float:right;">
                    <div class="form-group">
                            <input class="btn btn btn-success" type="button" id="about_submit" name="yt0" value="Save" onclick="saveChanges('about');">
                            <input class="btn btn btn-danger"type="button" id="about_cancel" name="yt1" value="Cancel" onclick="toggleDiv('about');">
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
<br>
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
    <div >	<strong class="font">Basic Details <a href="#no" style="font-size:13px; color:#C00;" class="all_a pull-right" id="basic_details_a" onclick="toggleDiv('basic_details');"> <i class="fa fa-edit"></i> Edit</a></strong>
        <div id="basic_details_view" class="all_visible_divs">
            <table class="col-md-6 table-responsive">
                <tr><td>Name</td>
                    <td>:</td>
                    <td class="name_val">${profileBean.firstName}&nbsp; ${profileBean.lastName}</td>
                   
                </tr>
                <tr>
                    <td>Age</td><td>:</td>
                    <td id="age_val" class="all_age_val">
                        <c:if test="${not empty profileBean.age}">${profileBean.age} yrs</c:if>
                        <c:if test="${empty profileBean.age}">Not specified</c:if>
                    </td>
                   
                </tr>
                <tr>
                    <td>Height</td><td>:</td>
                    <td id="height_val" class="all_height_val">
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
          <tr>  <td>Body Type</td><td>:</td>
                    <td id="bodyType_val">
                        <c:if test="${not empty profileBean.bodyTypeName}">${profileBean.bodyTypeName}</c:if>
                        <c:if test="${empty profileBean.bodyTypeName}">Not specified
                        </c:if>
                    </td></tr>
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
    <div id="basic_details_edit" class="all_hidden_divs" hidden="true">
        <jsp:include page="basic_details.jsp" />
    </div></div></div>
</div><br><div class="clearfix"></div>
<!-- <div class="col-md-1"><img src="${baseurl}/user/images/media.png"></div>
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

<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
<div>	
    <strong class="font">Religion Information
    <a href="#no" style="font-size:13px; color:#C00;" class="all_a pull-right" id="religion_info_a" onclick="toggleDiv('religion_info');"> <i class="fa fa-edit"></i> Edit</a>
    </strong>
    <div id="religion_info_view" class="all_visible_divs">
        <table class="col-md-6 table-responsive">
        <tr><td>Religion</td><td>:</td>
            <td id="religion_val" class="all_religion_val">
                <c:if test="${not empty profileBean.religionName}">${profileBean.religionName}</c:if>
                <c:if test="${empty profileBean.religionName}">Not specified</c:if>
            </td>
        </tr>
        <tr><td>Caste / Sub Caste</td><td>:</td>
            <td id="caste_val" class="all_caste_val">
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
        
        </table><table class="col-md-6 table-responsive"></table>
    </div>
    <div id="religion_info_edit" class="all_hidden_divs" hidden="true">
        <jsp:include page="religion_info.jsp"></jsp:include>
        
    </div>
</div>
</div>
</div>
<div class="clearfix"></div><br>
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
    <div >	
    <strong class="font">
    <c:if test="${profileBean.gender == 'Female'}">Bride</c:if>
    <c:if test="${profileBean.gender == 'Male'}">Groom</c:if>
    's Location <a href="#no" style="font-size:13px; color:#C00;" class="all_a pull-right" id="location_a" onclick="toggleDiv('location');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
<div id="location_view" class="all_visible_divs">
<table  class="col-md-6 table-responsive" cellspacing="10">
<tr><td >Country &#160;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>:</td>
    <td id="currentCountry_val" class="all_currentCountry_val">
        <c:if test="${not empty profileBean.currentCountryName}">${profileBean.currentCountryName}</c:if>
        <c:if test="${empty profileBean.currentCountryName}">Not Specified</c:if>
    </td>
</tr>
<tr>
    <td>City</td><td>:</td>
    <td id="currentCity_val" class="all_currentCity_val">
        <c:if test="${not empty profileBean.currentCityName}">${profileBean.currentCityName}</c:if>
        <c:if test="${empty profileBean.currentCityName}">Not Specified</c:if>
    </td>
</tr>
<tr><td>State</td><td>:</td>
    <td id="currentState_val" class="all_currentState_val">
        <c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
        <c:if test="${empty profileBean.currentStateName}">Not Specified</c:if>
    </td>
    
</tr>
</table><table class="col-md-6 table-responsive"></table>
</div><div class="clearfix"></div>
<div id="location_edit" class="all_hidden_divs" hidden="true">
<jsp:include page="location.jsp" />
</div>
</div>
</div>
</div>

<br><div class="clearfix"></div>
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">	
    <div>	<strong class="font">Professional Information
        <a href="#no" style="font-size:13px; color:#C00;"  class="all_a pull-right" id="professional_info_a" onclick="toggleDiv('professional_info');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
<div id="professional_info_view" class="all_visible_divs">
<table class="col-md-9 table-responsive">
<tr><td>Education</td><td>:</td>
    <td id="education_val" class="all_education_val">
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
    <td id="occupation_val" class="all_occupation_val">
        <c:if test="${not empty profileBean.occupationName}">${profileBean.occupationName}</c:if>
        <c:if test="${empty profileBean.occupationName}">Not Specified</c:if>
    </td>
</tr>
<tr><td>AnnualIncome</td><td>:</td>
    <td id="annualIncome_val" class="all_annualIncome_val">
        <c:if test="${not empty profileBean.annualIncome}">${profileBean.annualIncome}</c:if>
        <c:if test="${empty profileBean.annualIncome}">Not Specified</c:if>
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
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
    <div >	<strong class="font">Family Details
        <a href="#no" style="font-size:13px; color:#C00;" class="all_a pull-right" id="family_details_a" onclick="toggleDiv('family_details');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
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
    <%-- <c:out value="${profileBean.motherName}"/> --%>
        <c:if test="${not empty profileBean.motherName}">${profileBean.motherName}</c:if>
        <c:if test="${empty profileBean.motherName}">Not Specified</c:if>
    </td></tr>
    <tr>
    <td>Mother's Occupation</td><td>:</td>
    <td id="mOccupation_val">
        <c:if test="${not empty profileBean.mOccupation}">${profileBean.mOccupationName}</c:if>
        <c:if test="${empty profileBean.mOccupation}">Not Specified</c:if>
    </td></tr>
    <tr id="noOfBrotherMarri">
    <td>Brothers Married</td><td>:</td>
    <td id="noOfBrothersMarried_val">
        <c:if test="${not empty profileBean.noOfBrothersMarried}">${profileBean.noOfBrothersMarried}</c:if>
        <c:if test="${empty profileBean.noOfBrothersMarried}">Not Specified</c:if>
    </td></tr>
    <tr id="noOfSisterMarri">
<td>Sisters Married</td><td>:</td>
    <td id="noOfSistersMarried_val">
        <c:if test="${not empty profileBean.noOfSistersMarried}">${profileBean.noOfSistersMarried}</c:if>
        <c:if test="${empty profileBean.noOfSistersMarried}">Not Specified</c:if>
    </td></tr>
    <tr>
</table>
</div>
<div id="family_details_edit" class="all_hidden_divs" hidden="true">
<jsp:include page="family_details.jsp" />
</div>
</div>
</div>
</div>

<br>
<div id="partnerPreferences">
<h3>Partner Preferences</h3>
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
    <div>	<strong class="font">Basic & Religion Preferences
        <a href="#no" style="font-size:13px; color:#C00;"  class="all_a pull-right" id="partner_basic_a" onclick="toggleDiv('partner_basic');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
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
    </td></tr>
   
<tr><td>Marital Status</td><td>:</td>
    <td id="rMaritalStatus_val">
        <c:if test="${not empty profileBean.rMaritalStatusName}">${profileBean.rMaritalStatusName}</c:if>
        <c:if test="${empty profileBean.rMaritalStatusName}">Not Specified</c:if>
    </td></tr>
   
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
    </td></tr>
   
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
<table class="col-md-6 table-responsive">
 <tr>
    <td>Height</td><td>:</td>
    <td>
        <span id="rHeight_val"><c:if test="${not empty profileBean.rHeightInches}">${profileBean.rHeightInches} - </c:if></span> <span id="rHeightTo_val"><c:if test="${not empty profileBean.rHeightInches}">${profileBean.rHeightToInches}</c:if></span>
        <span id="rHeight_outer_val"><c:if test="${empty profileBean.rHeightInches}">Not Specified</c:if></span>
    </td>
</tr>
 <tr>
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
    <td>Mother Tongue</td><td>:</td>
    <td id="rMotherTongue_val">
        <c:if test="${not empty profileBean.rMotherTongueName}">${profileBean.rMotherTongueName}</c:if>
        <c:if test="${empty profileBean.rMotherTongueName}">Not Specified</c:if>
    </td>
</tr>
</table>
</div>
<div id="partner_basic_edit" class="all_hidden_divs" hidden="true">
<jsp:include page="partner_basics.jsp" />
</div>
</div>
</div>
</div>

<br>
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
    <div >	<strong class="font">Professional Preferences
        <a href="#no"  style="font-size:13px; color:#C00;" class="all_a pull-right" id="partner_professional_a" onclick="toggleDiv('partner_professional');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
<div id="partner_professional_view" class="all_visible_divs">
<table class="col-md-6 table-responsive">
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
  <label class="col-md-4 control-label" for="textinput">Occupation</label>  
  <div class="col-md-7">
    <form:select path="rOccupation" class="multiSelect" multiple="true">
    	<form:option value="any">Doesn't Matter</form:option>
        <form:options items="${occupation}"></form:options>
    </form:select>
  </div>
</div>
</div>
<div class="row">
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Annual Income</label>  
  <div class="col-md-3">
        <form:select path="rAnnualIncome" class="form-control u1 anin">
            <form:option value="">-- Annual Income --</form:option>
            <form:option value="Doesn't Matter">Doesn't Matter</form:option>
            <form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
            <form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
            <form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
			<form:option value="INR 8 Lakh to 10 Lakh">INR 8 Lakh to 10 Lakh</form:option>
			<form:option value="INR 11 Lakh to 15 Lakh">INR 11 Lakh to 15 Lakh</form:option>
			<form:option value="INR 16 Lakh to 20 Lakh">INR 16 Lakh to 20 Lakh</form:option>
			<form:option value="INR 21 Lakh to 25 Lakh">INR 21 Lakh to 25 Lakh</form:option>
			<form:option value="Above INR 25 Lakh">Above INR 25 Lakh</form:option>        </form:select>
      </div>
</div>
</div>
<%-- <div class="row">
    <div class="form-group incomeBlock">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-7">
        <form:select path="rAnnualIncome" class="form-control u1">
            <form:option value="">-- Annual Income --</form:option>
            <form:option value="Doesn't Matter">Doesn't Matter</form:option>
            <form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
            <form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
            <form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
            <form:option value="Above INR 7 Lakh">Above INR 7 Lakh</form:option>
        </form:select>
      </div>
    </div>
</div> --%>
<br>
<div class="row">
    <div class="col-md-4 pull-right" style="float:right;">
        <div class="form-group">
                <input class="btn btn btn-success"  type="button" id="partner_professional_submit" name="yt0" value="Save" onclick="saveChanges('partner_professional');">
                <input class="btn btn btn-danger"  type="button" id="partner_professional_cancel" name="yt1" value="Cancel" onclick="toggleDiv('partner_professional');">
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
<br>
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
    <div >	<strong class="font">Location Preferences
        <a href="#no" style="font-size:13px; color:#C00;" class="all_a pull-right" id="partner_location_a" onclick="toggleDiv('partner_location');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
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

<tr>
   <td>Residing City</td><td>:</td>
   
    <td id="rCity_val">
        <c:if test="${not empty profileBean.rCityName}">${profileBean.rCityName}</c:if>
        <c:if test="${empty profileBean.rCityName}">Not Specified</c:if>
    </td>
    
    
</tr>
<%-- <tr><td>Citizenship</td><td>:</td>
    <td>
         <c:if test="${not empty profileBean.currentStateName}">${profileBean.currentStateName}</c:if>
        <c:if test="${empty profileBean.currentStateName}"><a>Add State</a></c:if> 
    </td>
    
</tr>  --%>
</table>
</div>
<div id="partner_location_edit" class="all_hidden_divs" hidden="true">
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Country living in</label>  
  <div class="col-md-7">
    <form:select path="rCountry" class="multiSelect" multiple="true" onchange="getFilteredStatesMultiSelect(this.id)">
        <form:options items="${countries}"></form:options>
        
    </form:select>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">State living in</label>  
  <div class="col-md-7">
    <form:select path="rState" class="multiSelect" multiple="true" onchange="getFilteredCitiesMultiSelect(this.id)">
        <%-- <form:options items="${filtered_states }"></form:options> --%>
    </form:select>
  </div>
</div>

<div class="form-group">
					<label class="col-md-4 control-label" for="textinput">City living in</label>
											<div class="col-md-7">
												<form:select path="rCity"  class="multiSelect" multiple="true">
													<%-- <form:option value="">-- Choose State --</form:option> --%>
													<form:options items="${filtered_cities }"></form:options> 
												</form:select>
												<div><form:errors path="rState" cssClass="error" /></div>
											</div>
									  	</div>

<br>
<div class="row">
    <div class="col-md-4 pull-right" style="float:right;">
        <div class="form-group">
                <input class="btn btn btn-success" type="button" id="partner_location_submit" name="yt0" value="Save" onclick="saveChanges('partner_location');">
                <input class="btn btn btn-danger"  type="button" id="partner_location_cancel" name="yt1" value="Cancel" onclick="toggleDiv('partner_location');">
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
</div>
</div></div>



</form:form> 
</div>
</div>





<div class="col-md-3" >
<div class="products-grid-right">

	<%-- <div class="panel panel-success" style="width: 250px;">
<div class="panel-heading">Add Horoscope</div>
        <div class="panel-body table-responsive">
            <div class="col-md-3" style='width: 232px; display: -webkit-box;'>
        <img src="${baseurl}/user/images/edit-add-horoscope.gif" width="40" style='margin: 0px 0px 0px -25px;'>
    <p style="margin-left: 29px;">It is simple and absolutely FREE!</p></div>
        </div>
    </div> --%>
 <c:if test="${empty cacheGuest.profileImage}">  
<div class="panel " style="width: 250px;">
<div class="panel-heading"><b> Add Photos Now</b></div>
        <div class="panel-body table-responsive">
            <div class="col-md-3" style='width: 232px; display: -webkit-box;'>
        <img src="${baseurl}/user/images/add-photo-edit-avatar.png" width="40" style='margin: 0px 0px 0px -25px;'>
    <p style="margin-left: 29px;">Photos are the first things members look for in a profile.</p></div>
        </div>
    </div>
    </c:if>
    <div class="clearfix"></div>
</div>
</div>
 
 </div>           
</div>           
</div>
<script src="${baseurl}/js/jquery-ui.min.js"></script>
<script src="${baseurl}/js/my-profile.js"></script>
<link href="${baseurl}/css/datepicker1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(function(){
	
	
	$('.multiSelect').select2();
	
	/* $("#rReligion").select2({
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
	}); */
	//selected_values="";
	
	var selected_values = "";
	selected_values = "${profileBean.rMaritalStatus}";
    if(selected_values == "" || selected_values==null){
    	$("#rMaritalStatus").select2({
    	    placeholder: "-- Choose MaritalStatus --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rMaritalStatus").val(selected_values.split(","));
    } 
    
    selected_values="";
    selected_values = "${profileBean.rCaste}";
    if(selected_values == "" || selected_values==null){
    	$("#rCaste").select2({
    	    placeholder: "-- Choose Community --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rCaste").val(selected_values.split(","));
    }
    
    selected_values="";
	selected_values = "${profileBean.rReligion}";
    if(selected_values == "" || selected_values==null){
    	$("#rReligion").select2({
    	    placeholder: "-- Choose Religion --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rReligion").val(selected_values.split(","));
    }
    
    selected_values="";
	selected_values = "${profileBean.rMotherTongue}";
	if(selected_values == "" || selected_values==null){
    	$("#rMotherTongue").select2({
    	    placeholder: "-- Choose Mother Tongue --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rMotherTongue").val(selected_values.split(","));
    }
	
	selected_values = "";
	selected_values = "${profileBean.rDiet}";
    if(selected_values == "" || selected_values==null){
    	$("#rDiet").select2({
    	    placeholder: "-- Choose Eating Habits --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rDiet").val(selected_values.split(","));
    }
	 /* var selected_values = "${profileBean.rMaritalStatus}";
	 if(selected_values!="")
	$("#rMaritalStatus").select2('val',selected_values.split(","));
	
	selected_values = "${createProfile.rReligion}";
	if(selected_values!="")
	$("#rReligion").select2('val',selected_values.split(","));
	
	selected_values = "${createProfile.rCaste}";
	if(selected_values!="")
	$("#rCaste").select2('val',selected_values.split(",")); */
	
	/* selected_values="";
	selected_values = "${createProfile.rState}";
	if(selected_values!="")
	$("#rState").select2('val',selected_values.split(",")); */
	
	selected_values = "";
	selected_values = "${profileBean.rState}";
    if(selected_values == "" || selected_values==null){
    	$("#rState").select2({
    	    placeholder: "-- Choose State --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rState").val(selected_values.split(","));
    }
	
	/* selected_values="";
	selected_values = "${createProfile.rEducation}";
	if(selected_values!="")
	$("#rEducation").select2('val',selected_values.split(",")); */
	
	selected_values = "";
	selected_values = "${profileBean.rEducation}";
    if(selected_values == "" || selected_values==null){
    	 $("#rEducation").select2({
    	    placeholder: "-- Select Education --"
    	}); 
    }else{
    	var tt = selected_values.split(",");
        $("#rEducation").val(selected_values.split(","));
    }
	
	
	/* selected_values="";
	selected_values = "${createProfile.rMotherTongue}";
	if(selected_values!="")
		$("#rMotherTongue").select2('val',selected_values.split(",")); */
	
	/* selected_values="";
	selected_values = "${createProfile.rCountry}";
	if(selected_values!="")
	$("#rCountry").select2('val',selected_values.split(",")); */
	
	selected_values = "";
	selected_values = "${profileBean.rCountry}";
    if(selected_values == "" || selected_values==null){
    	$("#rCountry").select2({
/*     	    placeholder: "-- Choose Country --"
 */    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rCountry").val(selected_values.split(","));
    }
    selected_values = "";
	selected_values = "${profileBean.rCity}";
    if(selected_values == "" || selected_values==null){
    	$("#rCity").select2({
    	    placeholder: "-- Choose City --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rCity").val(selected_values.split(","));
    }
	/* selected_values="";
	selected_values = "${createProfile.rWorkingWith}";
	if(selected_values!="")
	$("#rWorkingWith").select2('val',selected_values.split(",")); */
	
	selected_values = "";
	selected_values = "${profileBean.rWorkingWith}";
    if(selected_values == "" || selected_values==null){
    	$("#rWorkingWith").select2({
    	    placeholder: "-- Select --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rWorkingWith").val(selected_values.split(","));
    }
	
	/* selected_values="";
	selected_values = "${createProfile.rOccupation}";
	if(selected_values!="")
	$("#rOccupation").select2('val',selected_values.split(",")); */
	
	selected_values = "";
	selected_values = "${profileBean.rOccupation}";
    if(selected_values == "" || selected_values==null){
    	$("#rOccupation").select2({
    	    placeholder: "-- Select --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rOccupation").val(selected_values.split(","));
    }
	
	 var genderVal = "${profileBean.gender}";
	$('input[name=gender][value='+genderVal+']').prop("checked",true); 
	
	$("#rAgeFrom").val("${profileBean.rAgeFrom}");
	$("#rAgeFrom").trigger("chosen:updated");
	// set rAgeTo also
	$('#rAgeFrom').trigger("change");
	$("#rAgeTo").val("${profileBean.rAgeTo}");
	$("#rAgeTo").trigger("chosen:updated");
	
	$("#rHeight").val("${profileBean.rHeight}");
	$("#rHeight").trigger("chosen:updated");
	// set height to also
	$('#rHeight').trigger("change");
	$("#rHeightTo").val("${profileBean.rHeightTo}");
	$("#rHeightTo").trigger("chosen:updated");
	
	$('.multiSelect').trigger('change.select2');
	
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
	
	
	
});

</script>
<div tabindex="-1" class="modal fade in" id="myModalNew" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
    
      <div class="modal-content">
         <div class="modal-header" style="background:none;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"  style="padding-right:10px;">
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
    <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:626px;height:505px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="img/spin.svg" />
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:626px;height:417px;overflow:hidden;">
          <c:forEach items="${logged_in_user_photosList}" var="photo" >
			<div><img data-u="image"  src="${catalina_base}/${photo.folder_name}/${photo.image_name}" alt="${photo.image_name}" title="" id=""/>
			<div class="clearfix"></div><div data-u="thumb">
                    <img data-u="thumb" src="${catalina_base}/${photo.folder_name}/${photo.image_name}" alt="${photo.image_name}" />
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
         <%-- <div id="wowslider-container1">
<div class="ws_images"><ul>
		<c:forEach items="${logged_in_user_photosList}" var="photo" >
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
		<c:forEach items="${logged_in_user_photosList}" var="photo" >
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
  <script type="text/javascript" src="${baseurl}/engine1/wowslider.js"></script>
<script type="text/javascript" src="${baseurl}/engine1/script.js"></script>
<!-- End WOWSlider.com BODY section -->
<%@ include file="userFooter.jsp"%>