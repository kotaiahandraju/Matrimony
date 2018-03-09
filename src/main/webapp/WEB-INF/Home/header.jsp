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

	<title>Aarna Matrimony</title>
	<link rel="shortcut icon" href="${baseurl }/img/aarna-fav.png"/>
	
	<!-- 	animate zoom -->
	<link rel="stylesheet" href="${baseurl }/css/w3animate.css">
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
<%-- 	<link rel="stylesheet" href="${baseurl }/css/plugins/datatable/TableTools.css"> --%>
	<link rel="stylesheet" href="${baseurl }/css/chosen.css">
<!-- 	<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css"> -->
	
	<!-- jQuery -->
	<script src="${baseurl }/js/jquery.min.js"></script>
<%-- 	<script src="${baseurl }/js/jquery.watermark.js"></script> --%>
	<!--[if lte IE 9]>
		<script src="${baseurl }/js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
	<![endif]-->
	
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
<style type="text/css">
span.has-error,span.hasError
{
  font-weight:normal;
  border-color: #e73d4a;
  color:red;
  margin-top: -3px;
  display: block !important;
  position: absolute;
}

.error{color: red; font-weight: bold;}

.edit, .delete, .activate, .deactivate {cursor: pointer;}
.edit i {color: green;}
.delete i {color: red;}

.alert-success, .alert-info, .alert-warning, .alert-danger{color: white !important;}
.alert-success{background-color: #4CAF50 !important;}
.alert-info{background-color: #b33c00 !important;}
.alert-warning{background-color: #ff6600 !important;}
.alert-danger{background-color: #d43f3a !important;}
/* #368ee0 */
.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}

.form-horizontal .control-label{text-align: right;}
span.impColor{color: red;}

.msgcss
{	
	position: fixed;
    top: 4.5em;
    left: 0;
    right: 0;
    z-index: 1002;
}
.breadcrumbs{margin-bottom: 10px;}
.multiSelect{
	width: 187px;
}
</style>

<script type="text/javascript">
var isCheck = "No";
function timeOut(){
	window.setTimeout(function() {
	    $(".msgcss").fadeTo(500, 0).slideUp(500, function(){
	        $(".servermsg").remove('');
	        $(this).hide();
	        $(this).css('opacity','unset');
	    });
	}, 3000);
}
timeOut();
function getDeleteMsg(msgAlert,msg)
{
	$(".msgcss").show();
	$("#deleteMsg").addClass(msgAlert);
	$("#deleteMsg").text(msg);
	timeOut();
}
$(document).ready(function(){
	$('.edit').attr('data-toggle','tooltip');
	$('.edit').attr('data-original-title','Edit');
	$('.activate').attr('data-toggle','tooltip');
	$('.activate').attr('data-original-title','Activate');
	$('.deactivate').attr('data-toggle','tooltip');
	$('.deactivate').attr('data-original-title','Deactivate');
	$('.delete').attr('data-toggle','tooltip');
	$('.delete').attr('data-original-title','Delete');
	$('.reset').attr('data-toggle','tooltip');
	$('.reset').attr('data-original-title','Reset Password');
	$('[data-toggle="tooltip"]').tooltip();
});
var role_id = ${cacheUserBean.roleId};
</script>
</head>

<body>
	<c:if test="${not empty msg}">
		<div class="msgcss servermsg">
			<div class="col-sm-offset-8 col-sm-4">
				<div class="form-group w3-animate-right">
					<div class="alert alert-${cssMsg}">${msg}</div>
				</div>
			</div>
		</div>
	</c:if>
	<div class="msgcss" id="hideMeFirst" style="display: none;">
		<div class="col-sm-offset-8 col-sm-4">
			<div class="form-group w3-animate-right">
				<div id="deleteMsg" class="alert"></div>
			</div>
		</div>
	</div>
	
	<div id="navigation">
		<div class="container-fluid">
			<a href="#" id="brand">&nbsp;AARNA</a>
			<!-- <a href="#" class="toggle-nav" rel="tooltip" data-placement="bottom" title="Toggle navigation">
				<i class="fa fa-bars"></i>
			</a> -->
			<ul class='main-nav'>
				<li class="dashboard"><a href="dashboard"><span>Dashboard</span></a></li>
				<li class="catalog1">
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Data List 1</span>
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
						<span>Data List 2</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li class="languages"><a href="${baseurl }/admin/LanguagesHome">Languages</a></li>
						<li class="occupation"><a href="${baseurl }/admin/OccupationHome">Occupation</a></li>
						
						<c:set var="roleId1"  value="${cacheUserBean.roleId}"/>  
							<c:if test="${roleId1 != 3}">  
						<li class="membership"><a href="${baseurl }/admin/MembershipHome">Membership</a></li>
						</c:if> 
						<li class="raasi"><a href="${baseurl }/admin/RaasiHome">Raasi</a></li>
						<li class="religion"><a href="${baseurl }/admin/ReligionHome">Religion</a></li>
						<li class="star"><a href="${baseurl }/admin/StarHome">Star</a></li>
						<li class="state"><a href="${baseurl }/admin/StateHome">State</a></li>
						<li class="city"><a href="${baseurl }/admin/CityHome">City</a></li>
						<li class="dosham"><a href="${baseurl }/admin/DoshamHome">Dosham</a></li>
						<li class="Salary"><a href="${baseurl }/admin/SalaryHome">Salary</a></li>
					</ul>
				</li>
				<li class="profiles">
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Profiles</span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li class="createProfile"><a href="${baseurl }/admin/CreateProfile">Create Profile</a></li>
						<li class="allProfiles"><a href="${baseurl }/admin/AllProfilesHome">Active Profiles</a></li>
						<li class="inactiveProfiles"><a href="${baseurl }/admin/InactiveProfilesHome">Inactive Profiles</a></li>
						<li class="deleteProfiles"><a href="${baseurl }/admin/DeleteProfilesHome">Delete Profiles</a></li>
						<li class="adminProfiles"><a href="${baseurl }/admin/AdminRegisterProfiles">Admin Register Profiles</a></li>
						<li class="freeProfiles"><a href="${baseurl }/admin/FreeRegisterProfile">Free Register Profiles</a></li>
						<li class="classicProfiles"><a href="${baseurl }/admin/ClassicProfile">Classic Profiles</a></li>
						<li class="classicPlusProfiles"><a href="${baseurl }/admin/ClassicPlusProfile">Classic Plus Profiles</a></li>
						<li class="premiumProfiles"><a href="${baseurl }/admin/PremiumProfile">Premium Profiles</a></li>
						<li class="premiumPlusProfiles"><a href="${baseurl }/admin/PremiumPlusProfile">Premium Plus Profiles</a></li>
						<li class="aarnaPremiumProfiles"><a href="${baseurl }/admin/AarnaPremiumProfile">Aarna Premium Profiles</a></li>
						<li class="hiddenProfiles"><a href="${baseurl }/admin/HiddenProfilesHome">Hidden Profiles</a></li>
						 
					</ul>
				</li>
				<li class="interestRequests"><a href="${baseurl }/admin/interestRequests"><span>Interest Requests</span></a></li>
 				<li class="updatedProfiles"><a href="${baseurl }/admin/updatedProfiles"><span>Updated Profiles</span></a></li>
 				<li class="reports"><a href="${baseurl }/admin/reportsHome"><span>Reports</span></a></li> 
 				<li class="bulksmsmail"><a href="${baseurl }/admin/bulksmsmail"><span>Bulk SMS&Mail</span></a></li> 
 				
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
				<div class="dropdown" style="">
					<a href="#" class='dropdown-toggle' data-toggle="dropdown">Admin
					<i class="fa fa-2x fa-user"></i>
<%-- 						<img src="${baseurl }/img/demo/user-avatar.jpg" alt=""> --%>
					</a>
					<ul class="dropdown-menu pull-right">
						<!-- <li><a href="#">Edit profile</a></li>
						<li><a href="#">Account settings</a></li> -->
						<li><a href="changePassword">Change Password</a></li>
						<li><a href="${baseurl }/logoutHome">Sign out</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
