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
									<li><a href="#">New Matches</a></li>
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
</div>

	<%-- <div class="mega_nav">
		<div class="container">
			<div class="menu_sec">
				<!-- start header menu -->
				<ul class="megamenu skyblue">
					<!-- <li><a class="color1" href="" style="padding: 0px 15px;"><img src="img/aarna-fav.png" class="img img-responsive"></a></li> -->
					<li class="active" ><a class="color1" href="dashboard">My Home</a></li>
					<li><a class="color1" href="myProfile">My Profile</a></li>
					<li><a class="color1" href="myPhotos">My Photos</a></li>
					<li><a class="color1" href="searchProfiles">Search</a></li>
					<li><a class="color1" href="#">Matches</a></li>
					<li><a class="color1" href="memberShipPage">Upgrade</a></li>
					<li><a class="color1" href="#">Help</a></li>
					<li><a class="color1" href="#">Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %></a></li>
					<li><a class="color1" href="logoutHome">Logout</a></li>
				</ul> 
				<div class="clearfix"></div>
			</div>
		</div>
	</div> --%>

<!-- body starts here-->
<div class="products">
	<div class="container" style="background: #FFF;">
		<div class="mid-grids">
			<div class="col-md-12">
				<h4>Hello <%= userBean.getFirstName() %>. <%= userBean.getLastName() %><span>(<%= userBean.getUsername() %>)</span></h4>
			</div>   
			<div class="col-md-3 products-grid-right">
				<div class="well">
					<div class="row">
						<div class="col-md-5">
							<c:if test="${not empty cacheGuest.profileImage}">
								<img src="${cacheGuest.profileImage}" class="img img-responsive thumbnail" style="margin-bottom:0;height: 60px;width: 60px;">
							</c:if>
							<c:if test="${empty cacheGuest.profileImage}">
								<img src="img/default.png" class="img-responsive thumbnail" style="margin-bottom:0;">
							</c:if>
						</div>	
						<div class="col-md-7" style="padding-left:0;" >
							<div class="profiletable">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr><td><a href="EditUserProfile">Edit Profile</a></td></tr>
									<tr><td><a href="#">Manage Profile</a></td></tr>
									<tr><td><a href="#">Edit Preferences</a></td></tr>
									<tr><td><a href="#">Privacy Options</a></td></tr>
								</table>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				
				<div class="panel panel-success">
					<div class="panel-body">
						<h4><strong>Messages</strong></h4>
						<div class="tabbable" id="tabs-343694">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#inbox" data-toggle="tab"><strong>INBOX</strong></a></li>
								<li><a href="#sent" data-toggle="tab"><strong>SENT</strong></a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="inbox">
									<table width="100%">
										<tr>
											<td height="30"><a href="receivedRequests">Invitations</a></td>
											<td><span class="badge pull-right">${cacheGuest.receivedInterestCount}</span></td>
										</tr>
										<tr>
											<td height="30"><a href="#">Members</a></td>
											<td><span class="badge pull-right">${cacheGuest.acceptedInterestCount}</span></td>
										</tr>
										<tr>
											<td height="30"><a href="profileViewedMembers">Profile Viewed</a></td>
											<td><span class="badge pull-right">${cacheGuest.profileViewedCount}</span></td>
										</tr>
									</table>
								</div>
								<div class="tab-pane" id="sent">
									<table width="100%">
										<tr>
											<td height="30"><a href="sentRequests">Invitations</a></td>
											<td><span class="badge pull-right">${cacheGuest.sentInterestCount}</span></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>