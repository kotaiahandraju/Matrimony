<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<%-- <%! String pages1= null; %> --%>
<c:set var = "activePage" scope = "session" value = ""/>
     
<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
	String catalina_base =  request.getScheme() + "://" + request.getServerName() +":" +request.getServerPort();
	session.setAttribute("catalina_base", catalina_base);
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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- jQuery -->
	<script src="${baseurl }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${baseurl }/js/ajax.js"></script>
	<script src="${baseurl}/js/custemValidation1.js"></script>
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
.notsp p, b  {
font-size:11px;
}

span.has-error,span.hasError
{
  font-weight:normal;
  border-color: #e73d4a;
  color:red;
  margin-top: -3px;
  display: block !important;
  position: absolute;
}
#navigation .main-nav > li > a {
    display: block;
    padding: 20px 5.5px;
    line-height: 21px;
    color: #f5f5f5;
}
@media (min-width:769px) and (max-width:1024px) { 
#navigation .main-nav > li > a {
    display: block;
    padding: 20px 5.5px;
    line-height: 21px;
    color: #e4d7d7;
    font-size:12px;
}
 }
.dt-buttons {
margin-top:10px;
display:inline-block;
}
::-webkit-scrollbar {
    width: 6px;
}
.main-nav {
margin-top:8px;
}
/* Track */
::-webkit-scrollbar-track {
    background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
    background: #888; 
}
.dropdown-menu {
	box-shadow: 0px 0px 2px 0px #363636;
	border-radius: 6px;
}

.dropdown-menu:after {
	content: '';
	position: absolute;
	bottom: 100%;
	left: 40px;
	margin-left: 0;
	width: 0;
	height: 0;
	border-bottom: 8px solid #ffffff;
	border-right: 8px solid transparent;
	border-left: 8px solid transparent;
	opacity: 1;
	-webkit-transform: translate3d(0, 0px, 0);
	transform: translate3d(0, 0px, 0);
	-webkit-transition: all .1s ease-in-out;
	transition: all .1s ease-in-out;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background: #555; 
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
#notification_li
			{
			position:relative
			}
			#notificationContainer 
			{
			background-color: #fff;
			border: 1px solid rgba(100, 100, 100, .4);
			-webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
			overflow: visible;
			position: absolute;
			top: 45px;
			
			width: 213px;
			z-index:999;
			display: none; // Enable this after jquery implementation 
			}
			// Popup Arrow
			#notificationContainer:before {
			content: '';
			display: block;
			position: absolute;
			width: 0;
			height: 0;
			color: transparent;
			border: 10px solid black;
			border-color: transparent transparent white;
			margin-top: -20px;
			margin-left: 188px;
			}
			#notificationTitle
			{
			font-weight: bold;
			padding: 8px;
			font-size: 13px;
			background-color: #f2f2f3;
			
			z-index: 1000;
			width: 248px;
			border-bottom: 1px solid #dddddd;
			}
			#notificationsBody
			{
			padding: 3px 0px 0px 0px !important;
			max-height:300px;	
    overflow-y: scroll;
			}
			#notificationFooter
			{
			background-color: #e9eaed;
			text-align: center;
			font-weight: bold;
			padding: 8px;
			font-size: 12px;
			border-top: 1px solid #dddddd;
			}
.matchcount {
	background-color: #FFECD9;
	color: #000;
	padding: 2px 4px;
	font-size: 11px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	vertical-align: top;
	margin: 2px 2px;
}
	.imgareaselect-outer {background:#fff;}		
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
<script>			$(document).ready(function()
		{
	$("#notificationLink").click(function()
	{
	$("#notificationContainer").fadeToggle(300);
	$("#notification_count").fadeOut("slow");
	return false;
	});

	//Document Click hiding the popup 
	$(document).click(function()
	{
	$("#notificationContainer").hide();
	});

	//Popup on click
	$("#notificationContainer").click(function()
	{
	return false;
	});
	
	var auto_refresh = setInterval(
		     function ()
		     {
		     	//$('#load_me').load('${baseurl}/sample.jsp').fadeIn("slow");
		     	var formData = new FormData();
		    	 jQuery.fn.makeMultipartRequest('POST', 'refreshhCounts', false,
							formData, false, 'text', function(data){
				    		var jsonobj = $.parseJSON(data);
				    		var all_counts = jsonobj.display_counts;
				    		$("#updated_cnt").html(all_counts.updated_count);
				    		$("#inactive_profiles_count").html(all_counts.inactive_count);
				    		$("#inactive_profiles_cnt").html(all_counts.inactive_count);
						});
	
		     }, 1000); // autorefresh the content of the div after
		                //every 1000 milliseconds(1sec)

	});</script>

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
	
						<c:set var="roleId1"  value="${cacheUserBean.roleId}"/>  
	<div id="navigation">
		<div class="container-fluid">
			<a href="dashboard" id="brand">
				<img  src="${baseurl}/images/logoo.jpg" class="img img-responsive"></a>
			
			<!-- <a href="#" class="toggle-nav" rel="tooltip" data-placement="bottom" title="Toggle navigation">
				<i class="fa fa-bars"></i>
			</a> -->
			<ul class='main-nav'>
				<li class="dashboard"><a href="dashboard"><span>Dashboard</span></a></li>
				<li class="catalog1">
				<c:if test="${roleId1 == 1}"> 
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Data List 1</span>
						<span class="caret"></span>
					</a>
				</c:if>
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
					<c:if test="${roleId1 == 1}"> 
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Data List 2</span>
						<span class="caret"></span>
					</a>
					</c:if>
					<ul class="dropdown-menu">
						<li class="languages"><a href="${baseurl }/admin/LanguagesHome">Languages</a></li>
						<li class="occupation"><a href="${baseurl }/admin/OccupationHome">Occupation</a></li>
						
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
							<c:if test="${roleId1 == 1}">  
				  		<li class="Salary"><a href="${baseurl }/admin/employeeCreation">Employee Creation</a></li>
			         	</c:if>
					</ul>
				</li>
				<li class="profiles">
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Profiles<c:if test="${roleId1 == 1}"><span class="matchcount inactive_cnt" id="inactive_profiles_cnt">${display_counts.inactive_count}</span></c:if></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<c:if test="${roleId1 == 1}"> 
						<li class="createProfile"><a href="${baseurl }/admin/CreateProfile">Create Profile</a></li>
						</c:if>
						<li class="allProfiles"><a href="${baseurl }/admin/AllProfilesHome">Active Profiles</a></li>
							<c:if test="${roleId1 == 1}"> 
						<li class="inactiveProfiles"><a href="${baseurl }/admin/InactiveProfilesHome">Inactive Profiles<span class="matchcount inactive_cnt" id="inactive_profiles_count">${display_counts.inactive_count}</span></a></li>
						<li class="deleteProfiles"><a href="${baseurl }/admin/DeleteProfilesHome">Delete Profiles</a></li>
						<li class="adminProfiles"><a href="${baseurl }/admin/AdminRegisterProfiles">Admin Register Profiles</a></li>
						<li class="freeProfiles"><a href="${baseurl }/admin/FreeRegisterProfile">Free Register Profiles</a></li>
						</c:if>
						<li class="classicProfiles"><a href="${baseurl }/admin/ClassicProfile">Classic Profiles</a></li>
						<li class="classicPlusProfiles"><a href="${baseurl }/admin/ClassicPlusProfile">Classic Plus Profiles</a></li>
						<li class="premiumProfiles"><a href="${baseurl }/admin/PremiumProfile">Premium Profiles</a></li>
						<li class="premiumPlusProfiles"><a href="${baseurl }/admin/PremiumPlusProfile">Premium Plus Profiles</a></li>
						<li class="aarnaPremiumProfiles"><a href="${baseurl }/admin/AarnaPremiumProfile">Aarna Premium Profiles</a></li>
						<c:if test="${roleId1 == 1}"> 
						<li class="hiddenProfiles"><a href="${baseurl }/admin/HiddenProfilesHome">Hidden Profiles</a></li>
						 </c:if>
					</ul>
				</li>
					<c:if test="${roleId1 == 1}"> 
 				<li class="updatedProfiles"><a href="${baseurl }/admin/updatedProfiles"><span>Updated Profiles<span class="matchcount" id="updated_cnt">${display_counts.updated_count}</span></span></a></li>
 				</c:if>
 				<li class="">
 					<c:if test="${roleId1 == 1}"> 
					<a href="#" data-toggle="dropdown" class='dropdown-toggle'>
						<span>Reports</span>
						<span class="caret"></span>
					</a>
					</c:if>
					<ul class="dropdown-menu">
						<li class="reports"><a href="${baseurl }/admin/reportsHome"><span>Report</span></a></li> 
						<li class="paymentreport"><a href="${baseurl }/admin/paymentreport">Payment Report</a></li>
					</ul>
				</li>
					<c:if test="${roleId1 == 1}"> 
 				<li class="bulksmsmail"><a href="${baseurl }/admin/bulksmsmail"><span>Bulk SMS&Mail</span></a></li> 
 				<li class="loginProfiles"><a href="${baseurl }/admin/loginProfiles"><span>Today Login Profiles</span></a></li>
 				</c:if>
 				<%-- <li class="paymentNotifications"><a href="${baseurl }/admin/paymentNotifications"><span>Payment Notifications</span></a></li> --%>
 				<li class="dropdown notifications" id="notification_li">
 					<c:if test="${roleId1 == 1}"> 
					<a href="#" id="notificationLink"> <span class="fa fa-bell"></span>Notifications</a>
					</c:if>
					<div id="notificationContainer" class="dropdown-menu">
						<c:if test="${not empty paymentNotificationsList}">
								<div id="notificationsBody" class="notifications">
									<c:forEach var="notification" items="${paymentNotificationsList}">
										<div class="col-md-3 col-xs-3"  style="height:70px; overflow:hidden;padding-right:0px; padding-left:0px;" >
											<c:if test="${not empty notification.profileImage}">
												<img src="${catalina_base}/${notification.profileImage}" style="width: 100%;padding: 5px;">
											</c:if>
											<c:if test="${empty notification.profileImage}">
												<img src="${baseurl }/img/default.png" style="width: 100%;padding: 5px;">
											</c:if>
										</div>
										<div class="col-md-7 notsp" style="padding-right:0px; padding-left:0px;" >
											<p>
												<a href="fullProfile?id=${notification.profile_id}&nid=${notification.id}&rfrm=notifications" target="_blank" >
													<b><c:out value="${notification.fullName}" /> (<c:out value="${notification.username}" />)</b> 
													paid an amount of ${notification.amount}
												</a>
												<br>
												<c:out value="${notification.created_on}" />
											.</p>
										</div>
										<div class="col-md-2"><span class="fa fa-trash pull-right" style="margin-top:5px;"></span></div>
										<div class="clearfix"></div><hr style="margin-top:0px;margin-bottom:0px;">
									</c:forEach>
								</div>
								<form:form commandName="allNotificationsInAdmin"  class="form-horizontal" id="allNotificationsForm" name="allNotificationsForm" role="form"   method="post">
									<div id="notificationFooter"><a href="#" onclick="getAllNotifications();">See All</a></div>
								</form:form>
						</c:if>
						<c:if test="${empty paymentNotificationsList}">
							<p>Currently, there are no payment notifications.</p>
						</c:if>
					</div>	
				</li>
 				
 				
			</ul>
		
			<a href="#" class="toggle-mobile"><i class="fa fa-bars"></i></a>
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
				<div class="dropdown"  style="margin-top:5px;">
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
	
	 <script>
	
	
	function getAllNotifications(){
		document.allNotificationsForm.action = "allNotificationsInAdmin"
	    document.allNotificationsForm.target = "_blank";    // Open in a new window
	    document.allNotificationsForm.submit();             // Submit the page
	    return true;
	}
</script> 

