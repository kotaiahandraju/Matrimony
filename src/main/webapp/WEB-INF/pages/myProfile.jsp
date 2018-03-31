<%@ include file="userCommonHeader.jsp"%>
 <!-- for Raxus Slider -->
    <link rel="stylesheet" href="css/raxus.css" media="screen" type="text/css">
    <script type="text/javascript" src="js/raxus-slider.min.js"></script>
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
    </style>
<style>
            	
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

<div class="container" style="background:#FFF;">
<div class="row">
<div  class="mid-grids">
<div class="col-md-9">
<div>
<form:form commandName="editProfileForm" id="userProfile" method="post" action=""> 
    <form:hidden path="redirectPage" value="dashboard"></form:hidden>
    <form:hidden path="pageName"></form:hidden>
    <form:hidden path="id"></form:hidden>

<div>
<div>

        <div class="panel" style="background:#F7F6F7; padding:20px 15px;">
            <div class="col-md-3">
                <c:if test="${not empty cacheGuest.profileImage}">
                	<a href="#" id="fullProfilePicOuterTag" data-toggle="modal" data-target="#myModalNew"><img  src="${cacheGuest.profileImage}" class="hover-shadow cursor img img-responsive thumbnail watermark_text" style="margin-bottom:0;height:auto;width: 100%;" /></a>
<%--                     <a href="#no" id="fullProfilePicOuterTag"><div  style="width:100%; max-height:195px; overflow:hidden;"><img src="${cacheGuest.profileImage}"   onclick="openModal();currentSlide(1)" class="cursor watermark_text" style="width:100%; height:auto;"></div></a> --%>
                     <%-- <div id="gallery-wrapper">
                        <!-- thumbnail images -->
                          <div id="thumbs-wrapper">
                            <div id="gallery" style="margin:-10px 8px 8px;width:200%">
                                <c:set var="counter3" value="${0}" /> 
                                <c:forEach items="${photosList}" var="photo" >
                                    <c:set var="counter3" value="${counter3+1}" />
                                    <div class="thumbnail" style=""> 
                                        <img src="${photo.image}" class="watermark_text" style="width:100%"  onclick="currentSlide_inpage('${photo.image}')"/> 
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
                    </div> --%>
                </c:if>
                <c:if test="${empty cacheGuest.profileImage}">
                    <img src="img/default.png" class="img-responsive" style="margin-bottom:0;">
                </c:if>
                <div>
                    <a href="myPhotos" style="font-size:12px; padding:12px 0; text-align:center; font-weight:600;"> Add / Edit  Photos</a>
                </div>
             </div>
             <div class="col-md-6">
                 <h3><p class="name_val">${profileBean.firstName} ${profileBean.lastName}</h3><h4> (${cacheGuest.username})</p></h4>
                <p style=" color:#000;font-size: 13px; line-height:19px;">Profile created for <span id="createProfileFor_val">${cacheGuest.createProfileFor}</span><br>
                ${profileBean.age} Yrs, ${profileBean.heightInches}<Br>
                ${profileBean.religionName}, ${profileBean.casteName}<br>
                ${profileBean.currentCityName}, ${profileBean.currentStateName}, ${profileBean.currentCountryName}<br>
                ${profileBean.educationName}, ${profileBean.occupationName}</p>
                <div id="editMobileDiv" hidden="true">
                	<input type="text" placeholder="+91-${cacheGuest.mobile}" id="mobile" class="numbersOnly" onblur="validate(this.id,'Enter Mobile Number');" maxlength="10" />
                	<br><span class="hasError" id="mobileError" style="font-size: 13px;color:red"></span>
                </div> 
                <div id="mobileNoDiv"><span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px; font-weight:600;">&nbsp;<span id="mobileNoText">+91-${cacheGuest.mobile}</span>&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font>&nbsp;&nbsp;</span>&nbsp;</div>
                <a href="#no" id="editMobileAnchor" style="color:blue; font-size:12px; text-decoration:underline;"  onclick="displayEditMobilenumberDiv(${profileBean.id},'${cacheGuest.mobile}')">Edit Mobile No.</a>
                 <br>
                
                </div>
                <div class="col-md-3">
               
             <p style=" color:#000;font-size: 13px; text-align:center;">How your profile looks
                to others <a href="#no" onclick="fullProfile(${profileBean.id})" class="" style=" width:auto; border:1px solid #cccccc;padding:7px 10px 7px 40px;display:inline-block;border-radius:5px;background:url(user/images/eye.gif) no-repeat 10px 8px;margin-top:5px;text-decoration:none;">Profile Preview</a>
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
   <h3>Personal information</h3>
    <div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">			
        <strong class="font">About my ${cacheGuest.createProfileFor}
        <a href="#no" style="font-size:13px; color:#C00;" class="all_a pull-right" id="about_a" onclick="toggleDiv('about');"> <i class="fa fa-edit"></i> Edit</a>
        </strong>
        <div id="about_view" class="all_visible_divs">
            <p id="aboutMyself_val">
                <c:if test="${not empty profileBean.aboutMyself}">${profileBean.aboutMyself}</c:if>
                <c:if test="${empty profileBean.aboutMyself}">Not Specified</c:if>
            </p>
        </div>
       
        <div id="about_edit" class="all_hidden_divs" hidden="true">
            <form:textarea path="aboutMyself" cols="90" rows="6"/>
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

<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
<div>	
    <strong class="font">Religion Information
    <a href="#no" style="font-size:13px; color:#C00;" class="all_a pull-right" id="religion_info_a" onclick="toggleDiv('religion_info');"> <i class="fa fa-edit"></i> Edit</a>
    </strong>
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
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
    <div >	<strong class="font">
    <c:if test="${profileBean.gender == 'Female'}">Bride</c:if>
    <c:if test="${profileBean.gender == 'Male'}">Groom</c:if>
    's Location <a href="#no" style="font-size:13px; color:#C00;" class="all_a pull-right" id="location_a" onclick="toggleDiv('location');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
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
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">	
    <div>	<strong class="font">Professional Information
        <a href="#no" style="font-size:13px; color:#C00;"  class="all_a pull-right" id="professional_info_a" onclick="toggleDiv('professional_info');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
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
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
    <div >	<strong class="font">Family Details
        <a href="#no" style="font-size:13px; color:#C00;" class=" pull-right" id="family_details_a" onclick="toggleDiv('family_details');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
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

<br>
<h3>Partner Preferences</h3>
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
    <div>	<strong class="font">Basic & Religion Preferences
        <a href="#no" style="font-size:13px; color:#C00;"  class="all_a pull-right" id="partner_basic_a" onclick="toggleDiv('partner_basic');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
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
<div class="panel panel-default" style="background:#FDFDFD;">
    <div class="panel-body table-responsive">
    <div >	<strong class="font">Professional Preferences
        <a href="#no"  style="font-size:13px; color:#C00;" class="all_a pull-right" id="partner_professional_a" onclick="toggleDiv('partner_professional');"> <i class="fa fa-edit"></i> Edit</a>
</strong>
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
    <form:select path="rCountry" class="multiSelect" multiple="true" onchange="getFilteredStatesMultiSelect(this.id)">
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
</div></div>

</form:form> 
</div>
</div>





<div class="col-md-3" >
<div class="products-grid-right">

	<div class="panel panel-success" style="width: 250px;">
<div class="panel-heading">Add Horoscope</div>
        <div class="panel-body table-responsive">
            <div class="col-md-3" style='width: 232px; display: -webkit-box;'>
        <img src="user/images/edit-add-horoscope.gif" width="40" style='margin: 0px 0px 0px -25px;'>
    <p style="margin-left: 29px;">It is simple and absolutely FREE!</p></div>
        </div>
    </div>
    
<div class="panel panel-default" style="width: 250px;">
<div class="panel-heading">Add Photos Now</div>
        <div class="panel-body table-responsive">
            <div class="col-md-3" style='width: 232px; display: -webkit-box;'>
        <img src="user/images/add-photo-edit-avatar.png" width="40" style='margin: 0px 0px 0px -25px;'>
    <p style="margin-left: 29px;">Photos are the first things members look for in a profile.</p></div>
        </div>
    </div><div class="clearfix"></div>
</div>
</div>
 
 </div>           
</div>           
</div>
<script src="js/jquery-ui.min.js"></script>
<link href="css/datepicker1.css" rel="stylesheet" type="text/css" />
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
    	    placeholder: "-- Choose Country --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rCountry").val(selected_values.split(","));
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
	
	$('.multiSelect').trigger('change.select2');
	
});
function displayMobileNum(profileId,listType){
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
	
}

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
	$(".all_a").html("<i class='fa fa-edit'></i>Edit");
	if(isHidden){
		$("#"+divElem+"_view").attr("hidden",true);
		$("#"+divElem+"_edit").removeAttr("hidden");
		$("#"+divElem+"_a").html("<i class='fa fa-close'></i>Close");
	}else{
		$("#"+divElem+"_edit").attr("hidden",true);
		$("#"+divElem+"_view").removeAttr("hidden");
		$("#"+divElem+"_a").html("<i class='fa fa-edit'></i>Edit");
	}
	
}
  function saveChanges(data_type){
	$("#pageName").val(data_type);
	
	
	  
	 var formData = new FormData();
   	formData.append("pageName",data_type);
   	formData.append("aboutMyself",$("#aboutMyself").val());
   	formData.append("createProfileFor",$("#createProfileFor").val());
   	formData.append("gender",$("#gender").val());
   	formData.append("firstName",$("#firstName").val().trim());
   	formData.append("lastName",$("#lastName").val().trim());
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
   	formData.append("gotram",$("#gotram").val().trim());
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
   	formData.append("fatherName",$("#fatherName").val().trim());
   	formData.append("motherName",$("#motherName").val().trim());
   	formData.append("fOccupation",$("#fOccupation").val());
   	formData.append("mOccupation",$("#mOccupation").val());
   	formData.append("noOfBrothers",$("#noOfBrothers").val());
   	formData.append("noOfBrothersMarried",$("#noOfBrothersMarried").val());
   	formData.append("noOfSisters",$("#noOfSisters").val());
   	formData.append("noOfSistersMarried",$("#noOfSistersMarried").val());
   	//partner preferences
   	formData.append("rAgeFrom",$("#rAgeFrom").val().trim());
   	formData.append("rAgeTo",$("#rAgeTo").val().trim());
   	formData.append("rHeight",$("#rHeight").val());
   	formData.append("rHeightTo",$("#rHeightTo").val());
   	formData.append("rMaritalStatus",$("#rMaritalStatus").val());
   	formData.append("rReligion",$("#rReligion").val());
   	formData.append("rCaste",$("#rCaste").val());
   	formData.append("rMotherTongue",$("#rMotherTongue").val());
   	formData.append("rCountry",$("#rCountry").val());
   	formData.append("rState",$("#rState").val());
   	formData.append("rEducation",$("#rEducation").val());
   	formData.append("rWorkingWith",$("#rWorkingWith").val());
   	formData.append("rOccupation",$("#rOccupation").val());
   	formData.append("rAnnualIncome",$("#rAnnualIncome").val());
   	formData.append("rDiet",$("#rDiet").val());
	$.fn.makeMultipartRequest('POST', 'editProfile', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		if(msg != "undefined"){
			if(msg == "success"){
				alert("Updates are saved.");
				updateViewValues(data_type);
				
				if(data_type=="partner_basic"){
					updateMultiDropDownValues("rMaritalStatus");
					updateMultiDropDownValues("rReligion");
					updateMultiDropDownValues("rCaste");
					updateMultiDropDownValues("rMotherTongue");
					updateMultiDropDownValues("rDiet");
				}
				if(data_type=="partner_professional"){
					updateMultiDropDownValues("rEducation");
					updateMultiDropDownValues("rWorkingWith");
					updateMultiDropDownValues("rOccupation");
				}
				if(data_type=="partner_location"){
					updateMultiDropDownValues("rCountry");
					updateMultiDropDownValues("rState");
				}
					/* var updated_values = jsonobj.partner_updated_values;
					$("#rMaritalStatus_val").html(updated_values.maritalStatus);
					$("#rReligion_val").html(updated_values.religion);
					$("#rCaste_val").html(updated_values.caste);
					$("#rMotherTongue_val").html(updated_values.motherTongue);
					$("#rCountry_val").html(updated_values.country);
					$("#rState_val").html(updated_values.state);
					$("#rEducation_val").html(updated_values.education);
					$("#rWorkingWith_val").html(updated_values.workingWith);
					$("#rOccupation_val").html(updated_values.occupation);
					$("#rDiet_val").html(updated_values.diet); */
		
				$(".all_hidden_divs").attr("hidden",true);
				$(".all_visible_divs").removeAttr("hidden");
				$(".all_a").html("<i class='fa fa-edit'></i>Edit");
			}else{
				alert("Problem occured while saving the updates. Please try again");
			}
		}
	});
} 
 
  function fullProfile(profile_id){
		
		$("#id").val(profile_id);
		//document.editProfileForm.action = "fullProfile"
	    //document.editProfileForm.target = "_blank";    // Open in a new window
	    //document.editProfileForm.submit();             // Submit the page
	    $('#userProfile').attr('target',"_blank");
	    $('#userProfile').attr('action',"fullProfile");
		$("#userProfile").submit();
	    return true;
		
	}
  
  function updateViewValues(data_type){
	  // all drop down values are updated seperately...so here only update other field values
	  $("#aboutMyself_val").html($("#aboutMyself").val());
	  //$("#createProfileFor_val").html($("#createProfileFor").val());
	 // $("#gender_val").html($("#gender").val());
	  $(".name_val").html($("#firstName").val()+" "+$("#lastName").val());
	  //$("#lastName_val").html($("#lastName").val());
	  $("#dob_val").html($("#dob").val());
	  //$("#height_val").html($("#height").label);
	 // $("#maritalStatus_val").html($("#maritalStatus").val());
	  /* $("#bodyType_val").html($('#bodyType option:selected').text());
	  $("#complexion_val").html($("#complexion option:selected").text());
	  $("#disability_val").html($("#disability option:selected").text());
	  $("#motherTongue_val").html($('#motherTongue option:selected').text());
	  $("#diet_val").html($("#diet option:selected").text());
	  $("#smoking_val").html($("#smoking option:selected").text());
	  $("#drinking_val").html($("#drinking option:selected").text());
	   	// religion info
	   	$("#religion_val").html($("#religion option:selected").text());
	   	$("#caste_val").html($("#caste option:selected").text()); */
	   	//$("#gotram_val").html($("#gotram").val());
	   	/* $("#star_val").html($("#star option:selected").text());
	   	$("#dosam_val").html($("#dosam option:selected").text());
	   	//formData.append("drinking",$("#drinking").val());
	   	// location info
	   	$("#currentCountry_val").html($("#currentCountry option:selected").text());
	   	$("#currentState_val").html($("#currentState option:selected").text());
	   	$("#currentCity_val").html($("#currentCity option:selected").text());
	   	// professional info
	   	$("#education_val").html($("#education option:selected").text());
	   	$("#workingWith_val").html($("#workingWith option:selected").text());
	   	$("#occupation_val").html($("#occupation option:selected").text()); */
	   	// family details
	   	//$("#fatherName_val").html($("#fatherName").val());
	   	//$("#motherName_val").html($("#motherName").val());
	   	/* $("#fOccupation_val").html($("#fOccupation option:selected").text());
	   	$("#mOccupation_val").html($("#mOccupation option:selected").text());
	   	$("#noOfBrothers_val").html($("#noOfBrothers option:selected").text());
	   	var temp = $("#noOfBrothersMarried option:selected").text();
	   	if ((temp.toLowerCase().indexOf("-- select --") >= 0) || (temp.toLowerCase().indexOf("-- choose --") >= 0)){
	   		$("#noOfBrothersMarried_val").html("Not Specified");
	   	}else{
	   		$("#noOfBrothersMarried_val").html(temp);
	   	}
	   	
	   	$("#noOfSisters_val").html($("#noOfSisters option:selected").text());
	   	$("#noOfSistersMarried_val").html($("#noOfSistersMarried option:selected").text()); */
	    //partner preferences
	   	
	   	//$("#rAgeTo_val").html($("#rAgeTo").val());
	   	/* $("#rHeight_val").html($("#rHeight option:selected").text());
	   	$("#rHeightTo_val").html($("#rHeightTo option:selected").text());
	   	$("#rMaritalStatus_val").html($("#rMaritalStatus option:selected").text());
	   	$("#rReligion_val").html($("#rReligion option:selected").text());
	   	$("#rCaste_val").html($("#rCaste option:selected").text());
	   	$("#rMotherTongue_val").html($("#rMotherTongue option:selected").text());
	   	$("#rCountry_val").html($("#rCountry option:selected").text());
	   	$("#rState_val").html($("#rState option:selected").text());
	   	$("#rEducation_val").html($("#rEducation option:selected").text());
	   	$("#rWorkingWith_val").html($("#rWorkingWith option:selected").text());
	   	$("#rOccupation_val").html($("#rOccupation option:selected").text());
	   	$("#rAnnualIncome_val").html($("#rAnnualIncome option:selected").text());
	   	$("#rDiet_val").html($("#rDiet option:selected").text()); */
	   	if(data_type=="partner_basic"){
	   		$("#rHeight_outer_val").html("");
		   	$("#rHeight_val").html("");
		   	$("#rHeightTo_val").html("");	
	   	}
	   	
	   	updateDropDownValues(data_type);
	   	updateTextFieldValues(data_type);
	   	$("#rAgeFrom_val").html($("#rAgeFrom").val()+" - "+$("#rAgeTo").val());
	   	var dob = $("#dob").val();
	   	var current_date = new Date();
	   	var date1 = dob.split("-");
	    var dob_year = date1[2];
	    var current_year = current_date.getFullYear();
	    var age = current_year-dob_year;
	    $("#age_val").html(age+" yrs");
	    ////partner preferences
	    //updateMultiDropDownValues(data_type);
  }
  /* $("select").change(function(event){
	  var elemId = this.id;
	  var val = $("#"+elemId+" option:selected").text();
	  
	   	if ((val.toLowerCase().indexOf("--") >= 0) || (val.toLowerCase().indexOf("-- choose --") >= 0)){
	   		
	   		$("#"+elemId+"_val").html("Not Specified");
	   	}else{
	   		if(elemId == "rHeight" || elemId == "rHeightTo"){
	  		  $("#rHeight_val").html($("rHeight").val()+" - "+$("rHeightTo").val());
	  	  	}else{
	  	  		$("#"+elemId+"_val").html(val);
	  	  	}
	   		
	   	}
  }); */
  function updateDropDownValues(data_type){
	  $("#"+data_type+"_edit :selected").each(function () {
		  //var elemId = this.id;
		  var elemId = this.parentElement.id;
		  var val = $(this).text();
		  
		   	if ((val.toLowerCase().indexOf("--") >= 0) || (val.toLowerCase().indexOf("-- choose --") >= 0)){
		   		if(elemId == "rHeight" || elemId == "rHeightTo"){
			  		  
			  		$("#rHeight_outer_val").html("Not Specified");
			  	}else{
			  		$("#"+elemId+"_val").html("Not Specified");
			  	}
		   		
		   	}else{
		   		if(elemId == "rHeight" || elemId == "rHeightTo"){
		   			$("#rHeight_outer_val").html("");
		   		}
		   		
		  	  	if(elemId == "rHeight"){
		  	  		$("#"+elemId+"_val").html(val+" - ");
		  	  	}else{
		  	  		$("#"+elemId+"_val").html(val);
		  	  	}
		  	  	
		   		
		   	}
	        
	  });
	  
  }
  
  function updateTextFieldValues(data_type){
	  $("#"+data_type+"_edit input[type=text]").each(function () {
		  //var elemId = this.id;
		  var elemId = this.id;
		  var val = $(this).val().trim();
		  if(val==""){
			  $("#"+elemId+"_val").html("Not Specified");
		  }else{
			  $("#"+elemId+"_val").html(val);
		  }
		   	
	  });
	  
  }
  
  function updateMultiDropDownValues(elementId){
	  
		  var val = "";
		  var test = $("#"+elementId);
		  var dataList = $(test).select2('data');
		  $.each(dataList,function(i,data){
			  if(i==0)
				  val = data.text;
			  else
				  val += ","+data.text; 
		  });
		  if ((val.toLowerCase().indexOf("--") >= 0) || val.trim()=="" || val.trim()=="null"){
		   		
		   		$("#"+elementId+"_val").html("Not Specified");
		   	}else{
		   		
		  	  		$("#"+elementId+"_val").html(val);
		  	  	
		   		
		   	}
  }
  
  function displayEditMobilenumberDiv(user_id,old_mobile_no){
	  $("#mobileNoDiv").attr("hidden",true);
	  $("#editMobileDiv").removeAttr("hidden");
	  $("#editMobileAnchor").html("Update");
	  $("#mobile").val(old_mobile_no);
	  $("#editMobileAnchor").attr("onclick","editMobileNumber("+user_id+","+old_mobile_no+")");
	  return false;
  }
  
  /* $(".multiSelect").change(function(event){
	  var elemId = this.id;
	  var seletced_opts = this.selectedOptions;
	  var val = "";
	  $.each(seletced_opts,function(i,selOption){
		  if(i==0)
			  val = selOption.innerHTML; 
		  else
			  val += ","+selOption.innerHTML;
	  });
	  
	  
	   	if ((val.toLowerCase().indexOf("--") >= 0) || (val.toLowerCase().indexOf("-- choose --") >= 0)){
	   		
	   		$("#"+elemId+"_val").html("Not Specified");
	   	}else{
	   		if(elemId == "rHeight" || elemId == "rHeightTo"){
	  		  $("#rHeight_val").html($("rHeight").val()+" - "+$("rHeightTo").val());
	  	  	}else{
	  	  		$("#"+elemId+"_val").html(val);
	  	  	}
	   		
	   	}
  }); */
  
   var ss =new Date().getFullYear()-16;
  $("#dob").datepicker({
	     dateFormat: "dd-MM-yy",
	     changeDate : true,
	 	changeMonth : true,
	 	changeYear : true,
//	  	maxDate :0,
	 	yearRange: '1950:' + ss
	 });  
  
</script>

<%@ include file="userFooter.jsp"%>