<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>

<html>
<head>
	<title>Aarna Matrimony</title>
	<link rel="shortcut icon" href="img/aarna-fav.png"/>
	<!-- for-mobile-apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript">
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); }
	</script>
	<!-- //for-mobile-apps -->
	<link href="user/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="user/css/style-profile.css" rel="stylesheet" type="text/css" media="all" />
	<link href="user/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" type="text/css" href="css/asPaginator.css">
	<link href="user/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/animate.min.css" />
	<link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
	
	<script src="user/js/jquery-1.11.1.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$(".dropdown").hover(            
				function() {
					$('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
					$(this).toggleClass('open');
				},
				function() {
					$('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
					$(this).toggleClass('open');
			});
		});
	</script>
	
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/jquery-asPaginator.js"></script>
	<script src="js/jquery.watermark.js"></script>
<style type="text/css">

.animated.infinite{animation-iteration-count:infinite}
.upgradeOption {
    color: #f35626;
    background-image: -webkit-linear-gradient(2deg, #f35626, red);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    -webkit-animation: hue 2s infinite linear;
}
@-webkit-keyframes hue {
  from {
    -webkit-filter: hue-rotate(0deg);
  }

  to {
    -webkit-filter: hue-rotate(-360deg);
  }
}
@keyframes flash{0%,50%,to{opacity:1}25%,75%{opacity:0}}.flash{animation-name:flash}

</style>
</head>
<body style="background: #F1F1F2;">
<%@ page import="com.aurospaces.neighbourhood.bean.UsersBean"%>
<%
	UsersBean userBean = null;
	if(session.getAttribute("cacheGuest") != null){
		userBean= (UsersBean)session.getAttribute("cacheGuest");
	}
%>
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<div class="header_top">
	<div class="container" style="background: #FFF;">
    	<div class="col-md-3">
			<div class="logo">
				<img src="user/images/logo1.jpg" class="img img-responsive">
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="col-md-4">
			<!-- <ul class="nav navbar-nav">
				<li><a href="#">Matches<span class="badge badge-notify">30</span></a></li>
				<li><a href="#">Search</a></li>
				<li><a href="#">Inbox<span class="badge badge-notify">30</span></a></li>
			</ul> -->
			<div class="box_1 midfont">
				<p><a href="#">Matches</a><span class="badge badge-notify">0</span>&nbsp;&nbsp;&nbsp;
        		<a href="searchProfiles">Search</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       			<a href="#">Inbox</a><span class="badge badge-notify">0</span></p>
			</div>
		</div>
		<div class="col-md-5">
			<div class="cart box_1">
				<p>Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %> | &nbsp;&nbsp;<a class="upgradeOption animated flash infinite" href="memberShipPage" style="color: red;">Upgrade</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="#" >Help</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="logoutHome" >Signout</a></p>
				<div class="clearfix"> </div>
			</div>				 
		</div>
	</div>

	<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="container-fluid">
	        		<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="dropdown dashboard">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Home</a>
								<ul class="dropdown-menu">
									<li><a href="dashboard">My Home</a></li>
									<li><a href="myProfile">My Profile</a></li>
									<li><a href="myPhotos">My Photos</a></li>
									<li><a href="#">who view my profile</a></li>
									<li><a href="#">who short listed</a></li>
									<li><a href="#">mobile no view by me</a></li>
									<li><a href="#">who viewed my mobile number</a></li>
									<li><a href="#">Ignored profile</a></li>
								</ul>
							</li>
							<li class="dropdown searchPage">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Search</a>
								<ul class="dropdown-menu">
									<li><a href="searchProfiles">Regular search</a></li>
									<li><a href="searchById">Search by ID </a></li>
									<li><a href="#">Recently view profiles</a></li>
								</ul>
							</li>
							<li class="dropdown matches">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Matches</a>
								<ul class="dropdown-menu">
									<li><a href="newMatches">New Matches</a></li>
									<li><a href="#">Still remaining to view </a></li>
									<li><a href="#">Short list matches</a></li>
									<li><a href="#">Premium members</a></li>
									<li><a href="#">Short list matches</a></li>
									<li><a href="#">Short list matches</a></li>
								</ul>
							</li>
							<li class="dropdown messages">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Messages</a>
								<ul class="dropdown-menu">
									<li><a href="#">Inbox - pending </a></li>
									<li><a href="#">Inbox - Accepted </a></li>
									<li><a href="#">Sent All</a></li>
									<li><a href="#">SMS received/sent</a></li>
								</ul>
							</li>
							<li class="dropdown upgrade">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Upgrade</a>
								<ul class="dropdown-menu">
									<li><a href="memberShipPage">Payment Options</a></li>
									<li><a href="#">Profile Highliter </a></li>
								</ul>
							</li>
							<li class="notifications"><a href="#">Notifications</a></li>
						</ul>
	        		</div>
	        		<!-- /.navbar-collapse -->
	      		</div>
	      		<!-- /.container-fluid -->
	    	</nav>
		</div>
	</div>

<!---->
<!-- products -->
	<div class="products">
		<div class="container">
			<div class="col-md-12 products-grid-left">
					
	            <div class="panel panel-default">
	            
		            <div class="panel-body">
		            	<%-- <div class="row" style="margin-bottom: 0.4em;">
					      	<c:forEach items="${photosList}" var="photo" >
					      		<div class="col-md-2">
					      			<img src="${photo.image}" class="img-responsive thumbnail" style="margin-bottom:0;">
					      		</div>
							</c:forEach>
					    	
					    </div> --%>
						<div class="col-md-3">
							 <c:if test="${not empty profileBean.profileImage}">
								<img id="profImage" src="${profileBean.profileImage}" class="img-responsive thumbnail watermark_text" style="margin-bottom:0;">
							</c:if>
							<c:if test="${empty profileBean.profileImage}">
								<img src="img/default.png" class="img-responsive thumbnail" style="margin-bottom:0;">
							</c:if> 
							<c:forEach items="${photosList}" var="photo" >
					      		
					      			<a href="#" onclick="displayImage('${photo.image}')"><b>O</b></a>
					      		
							</c:forEach><br>
							<label><b>${profileBean.username}</b></label><br>
							<label><b>Last login:${profileBean.last_login_time}</b></label>
		            	</div>
		            	<div class="col-md-9 well">
			            	<table>
			            		<c:if test="${profileBean.roleId == 4}">
			            			<tr><th>Name</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>xxxxx</span></td></tr>
			            			<tr><th>SurName</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>xxxxx</span></td></tr>
			            		</c:if>
			            		<c:if test="${profileBean.roleId != 4}">
			            			<tr><th>Name</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.firstName}</span></td></tr>
			            			<tr><th>SurName</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.lastName} </span></td></tr>
			            		</c:if>
			            		
			            		<tr><th>Gender</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.gender} </span></td></tr>
			            		<tr><th>Date of Birth</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.dob} </span></td></tr>
			            		<tr><th>Caste</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.casteName} </span></td></tr>
			            		<tr><th>Religion</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.religionName}</span></td></tr>
			            		<tr><th>Marital Status</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.maritalStatus}</span></td></tr>
			            		<tr><th>Education</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.educationName} </span></td></tr>
			            		<tr><th>Profession</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.occupationName}</span></td></tr>
			            		<tr><th>Working with</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.workingWith}</span></td></tr>
			            		<tr><th>Annual Income</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.annualIncome}</span></td></tr>
			            		<tr><th>City</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.currentCityName} </span></td></tr>
			            		<tr><th>State</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.currentStateName} </span></td></tr>
			            		<tr><th>Country</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.currentCountryName} </span></td></tr>
			            		
			            		
			            		<tr><th>Mothertongue</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.motherTongueName} </span></td></tr>
			            		<tr><th>E-mail</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.email} </span></td></tr>
			            		<tr><th>Gotram</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.gotram} </span></td></tr>
			            		<tr><th>Nakshatram</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.starName} </span></td></tr>
			            		<tr><th>Dosham</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.dosam} </span></td></tr>
			            		<tr><th>Dosham Name</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.dosamName} </span></td></tr>
			            		<tr><th>Diet</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.diet} </span></td></tr>
			            		<tr><th>Smoking</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.smoking} </span></td></tr>
			            		<tr><th>Drinking</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.drinking} </span></td></tr>
			            		<tr><th>Height</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.heightInches} </span></td></tr>
			            		<tr><th>Body Type</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.bodyTypeName} </span></td></tr>
			            		<tr><th>Complexion</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.complexionName} </span></td></tr>
			            		<tr><th>Disability</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.disability} </span></td></tr>
			            	</table>
		            	</div>
		         	</div>
	            </div>
				</div>
		</div>
				<div class="clearfix"></div>
	</div>
<!-- //products -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 footer-grid">
				<h6>About us</h6>
				<p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel tincidunt elementum, nunc urna tristique nisi, in interdum libero magna .</p>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>Search</h6>
				<ul>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Terms &amp; Conditions</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>My Account</h6>
				<ul>
					<li><a href="#">My Account</a></li>
					<li><a href="#">My Profile</a></li>
					<li><a href="#">My Interest</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>Extras</h6>
				<ul>
					<li><a href="#">Login</a></li>
					<li><a href="#">Register</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="footer-copy">
		<p>© 2017. All rights reserved.</p>
	</div>

<!-- //footer -->
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<script src="js/ajax.js"></script>
<script type="text/javascript">

$(function(){
	 //add text water mark;	
	 $('.watermark_text').watermark({
	  text: 'aarnamatrimony.com',
	  textWidth: 500,
	  textSize: 50,
	  textColor: 'white',
	  gravity: 'w',
	   opacity: 0.7,
	   margin: 5,
	   outputWidth: 'auto',
	   outputHeight: 'auto'
	 });
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

function displayImage(imageName){
	$("#profImage").prop("src",imageName);
}

</script>

</body>
</html>