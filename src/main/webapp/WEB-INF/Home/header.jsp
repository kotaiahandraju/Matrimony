<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%-- <%! String pages1= null; %> --%>
<c:set var = "activePage" scope = "session" value = ""/>
     
     <%
     
     
String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
session.setAttribute("baseurl", baseurl);
%>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Apple devices fullscreen -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- Apple devices fullscreen -->
	<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />

	<title>Matrimony</title>
	<link rel="shortcut icon" href="img/aarna.png"/>
	
	<!-- 	animate zoom -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" href="${baseurl }/css/bootstrap.min.css">
	<!-- jQuery UI -->
	<link rel="stylesheet" href="${baseurl }/css/plugins/jquery-ui/jquery-ui.min.css">
	<!-- PageGuide -->
	<link rel="stylesheet" href="${baseurl }/css/plugins/pageguide/pageguide.css">
	<!-- Fullcalendar -->
	<link rel="stylesheet" href="${baseurl }/css/plugins/fullcalendar/fullcalendar.css">
	<link rel="stylesheet" href="${baseurl }/css/plugins/fullcalendar/fullcalendar.print.css" media="print">
	<!-- chosen -->
	<link rel="stylesheet" href="${baseurl }/css/plugins/chosen/chosen.css">
	<!-- select2 -->
	<link rel="stylesheet" href="${baseurl }/css/plugins/select2/select2.css">
	<!-- icheck -->
	<link rel="stylesheet" href="${baseurl }/css/plugins/icheck/all.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="${baseurl }/css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="${baseurl }/css/themes.css">
	<link rel="stylesheet" href="${baseurl }/css/plugins/datatable/TableTools.css">
	<!-- jQuery -->
	<script src="${baseurl }/js/jquery.min.js"></script>



	<!--[if lte IE 9]>
		<script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
		<![endif]-->

	<!-- Favicon -->
<!-- 	<link rel="shortcut icon" href="img/favicon.html" /> -->
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
</head>

<body>
	<div id="navigation">
		<div class="container-fluid">
			<a href="#" id="brand">&nbsp;AARNA</a>
			<!-- <a href="#" class="toggle-nav" rel="tooltip" data-placement="bottom" title="Toggle navigation">
				<i class="fa fa-bars"></i>
			</a> -->
			<ul class='main-nav'>
				<li><a href=""><span>Dashboard</span></a></li>
				<li class="catalog1">
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Catalog 1</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li class="bodyType"><a href="${baseurl }/admin/BodyTypeHome">Body Type</a></li>
						<li class="branch"><a href="${baseurl }/admin/BranchHome">Branch</a></li>
						<li class="caste"><a href="${baseurl }/admin/CasteHome">Caste</a></li>
						<li class="complexion"><a href="${baseurl }/admin/ComplexionHome">Complexion</a></li>
						<li class="countries"><a href="${baseurl }/admin/CountriesHome">Countries</a></li>
						<li class="education"><a href="${baseurl }/admin/EducationHome">Education</a></li>
						<li class="height"><a href="${baseurl }/admin/HeightHome">Height</a></li>
					</ul>
				</li>
				<li class="catalog2">
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Catalog 2</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li class="languages"><a href="${baseurl }/admin/LanguagesHome">Languages</a></li>
						<li class="occupation"><a href="${baseurl }/admin/OccupationHome">Occupation</a></li>
						<li class="membership"><a href="${baseurl }/admin/MembershipHome">Membership</a></li>
						<li class="raasi"><a href="${baseurl }/admin/RaasiHome">Raasi</a></li>
						<li class="religion"><a href="${baseurl }/admin/ReligionHome">Religion</a></li>
						<li class="star"><a href="${baseurl }/admin/StarHome">Star</a></li>
					</ul>
				</li>

				<li class="profiles">
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Profiles</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li class="createProfile"><a href="${baseurl }/admin/CreateProfile">Create Profile</a></li>
						<li class="allProfiles"><a href="${baseurl }/admin/AllProfilesHome">All Profiles</a></li>
					</ul>
				</li>
				
			</ul>
			<div class="user">
				<ul class="icon-nav">
					<%-- <li class='dropdown'>
						<a href="#" class='dropdown-toggle' data-toggle="dropdown">
							<i class="fa fa-envelope"></i>
							<span class="label label-lightred">4</span>
						</a>
						<ul class="dropdown-menu pull-right message-ul">
							<li>
								<a href="#">
									<img src="${baseurl }/img/demo/user-1.jpg" alt="">
									<div class="details">
										<div class="name">Jane Doe</div>
										<div class="message">
											Lorem ipsum Commodo quis nisi ...
										</div>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="${baseurl }/img/demo/user-2.jpg" alt="">
									<div class="details">
										<div class="name">John Doedoe</div>
										<div class="message">
											Ut ad laboris est anim ut ...
										</div>
									</div>
									<div class="count">
										<i class="fa fa-comment"></i>
										<span>3</span>
									</div>
								</a>
							</li>
							<li>
								<a href="#">
									<img src="${baseurl }/img/demo/user-3.jpg" alt="">
									<div class="details">
										<div class="name">Bob Doe</div>
										<div class="message">
											Excepteur Duis magna dolor!
										</div>
									</div>
								</a>
							</li>
							<li>
								<a href="components-messages.html" class='more-messages'>Go to Message center
									<i class="fa fa-arrow-right"></i>
								</a>
							</li>
						</ul>
					</li> --%>
				</ul>
				<div class="dropdown" style="top: 5px;">
					<a href="#" class='dropdown-toggle' data-toggle="dropdown">Admin
						<img src="${baseurl }/img/demo/user-avatar.jpg" alt="">
					</a>
					<ul class="dropdown-menu pull-right">
						<li><a href="#">Edit profile</a></li>
						<li><a href="#">Account settings</a></li>
						<li><a href="${baseurl }/logoutHome">Sign out</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
		