<%@ include file="userHeader.jsp"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<<<<<<< HEAD
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<%@page import="com.aurospaces.neighbourhood.bean.UsersBean"%>
<%
	UsersBean userBean = null;
	if(session.getAttribute("cacheGuest") != null){
		userBean= (UsersBean)session.getAttribute("cacheGuest");
	}
%>
<html>
<head>
	<title>My Home</title>
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
	<link rel="stylesheet" href="css/animate.min.css" />
	
	<script src="user/js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="user/js/move-top.js"></script>
	<script type="text/javascript" src="user/js/easing.js"></script>
	
	<!-- <script type="text/javascript" src="user/js/megamenu.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){$(".megamenu").megamenu();});
	</script>
	
	<script src="user/js/menu_jquery.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
	
	<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
	<script type="text/javascript" id="sourcecode">
		$(function(){$('.scroll-pane').jScrollPane();});
	</script> -->
<style type="text/css">
.fixed-topnavbg-green{ background:#1ba261;height: 58px;width:100%;box-shadow: 1px 4px 5px #ccc;font-family:robotoregular, arial;margin-bottom: 30px;z-index:9999;}
.animated.infinite{animation-iteration-count:infinite}
.upgrade {
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
<body>
<div class="header_top">
	<div class="container">
    	<div class=" col-md-3">
			<div class="logo">
				<img src="user/images/logo1.jpg" class="img img-responsive">
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="col-md-4">
			<div class=" box_1 midfont">
				<p><a href="#">Matches</a>  <span class="badge badge-notify">30</span>&nbsp;&nbsp;&nbsp;
        		<a href="#">Search</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       			<a href="#">Inbox</a>  <span class="badge badge-notify">30</span></p>
			</div>      
		</div>
		<div class="col-md-5">
			<div class="cart box_1">
				<p>Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %> | &nbsp;&nbsp;<a class="upgrade animated flash infinite" href="memberShipPage" style="color: red;">Upgrade</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="#" >Help</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="logoutHome" >Signout</a></p>
				<div class="clearfix"> </div>
			</div>				 
		</div>
	</div>
</div>

	<div class="mega_nav">
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
					<%-- <li><a class="color1" href="#">Help</a></li>
					<li><a class="color1" href="#">Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %></a></li>
					<li><a class="color1" href="logoutHome">Logout</a></li> --%>
				</ul> 
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
<!-- products -->
	<div class="products">
		<div class="container">
			<div class="mid-grids">
            <div class="col-md-12">
            <h4>Hello <%= userBean.getFirstName() %>. <%= userBean.getLastName() %><span>(<%= userBean.getUsername() %>)</span></h4>
            </div>   
            
				<div class="col-md-3 products-grid-right">
					<div class="well">
                    <div class="row">
					<div class="col-md-5 ">
						<c:if test="${not empty cacheGuest.profileImage}">
							<img src="${cacheGuest.profileImage}" class="img-responsive thumbnail" style="margin-bottom:0;height: 85px;">
						</c:if>
						<c:if test="${empty cacheGuest.profileImage}">
							<img src="img/default.png" class="img-responsive thumbnail" style="margin-bottom:0;">
						</c:if>
                      
                      </div>	
                      
                      <div class="col-md-7" style="padding-left:0;" >
                      <div class="profiletable">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="EditUserProfile">Edit Profile</a></td>
  </tr>
   <tr>
    <td><a href="#">Manage Profile</a></td>
  </tr>
  <tr>
    <td><a href="#">Edit Preferrences</a></td>
  </tr>
  <tr>
    <td><a href="#">Privacy Options</a></td>
  </tr>
</table>
						</div>
                      </div>
                      
                      
                      
                    <div class="clearfix"></div>
                    </div>
                    </div>
                    
                    
                  <div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Inbox
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="receivedRequests">Invitations</a></td>
    <td><div class="badge pull-right">${cacheGuest.receivedInterestCount}</div></td>
  </tr>
</table>

				</div>
				
			</div>  
            
            
            <div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Accepted
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="acceptedRequests">Members</a></td>
    <td><div class="badge pull-right">${cacheGuest.acceptedInterestCount}</div></td>
  </tr>
</table>

				</div>
				
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Rejected
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="acceptedRequests">Members</a></td>
    <td><div class="badge pull-right">${cacheGuest.rejectedInterestCount}</div></td>
  </tr>
</table>

				</div>
				
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Profile Views
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td><a href="profileViewedMembers">(${cacheGuest.profileViewedCount})members viewed my profile</a></td>
					  </tr>
					</table>
					
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td><a href="profileViewedMembers">(${cacheGuest.profilesViewedByMeCount})profiles viewed by me</a></td>
					  </tr>
					</table>

				</div>
				
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Mobile No. Views
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td><a href="profileViewedMembers">(${cacheGuest.mobileNumViewedCount})members viewed my mobile No.</a></td>
					  </tr>
					</table>
					
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td><a href="profileViewedMembers">(${cacheGuest.mobileNumViewedByMeCount})mobile no.s viewed by me</a></td>
					  </tr>
					</table>

				</div>
				
			</div>
                    
                    
             <div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Sent
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="sentRequests">Requests</a></td>
    <%-- <td><div class="badge pull-right">${cacheGuest.sentInterestCount}</div></td> --%>
    <td><div class="badge pull-right">${cacheGuest.sentInterestCount}</div></td>
  </tr>
</table>

=======
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> --%>


			
			<div class="col-md-6 products-grid-left">
				<div class="panel panel-default">
					<div class="panel-body">
						Complete the remaining Profile
						<div class="progress">
							<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${profile_filled_status}%;">
								<%= session.getAttribute("profile_filled_status") %>% Complete 
							</div>
						</div>
						<p><span class="glyphicon glyphicon-envelope"></span> Verify your Email <a href="#"><u>Verify Email Address</u></a></p>
					</div>
>>>>>>> e4476360267c874a840c5d228270923640584d8a
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">Preferred Profiles </div>
		            <form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
	             		<form:hidden path="id" />
						<div class="panel-body" id="matches">
							
						</div>
					</form:form>
				</div>
				<div id="pagination_div" style="font-size: 12px;">
					<div id="altLists"></div>
					<div id="table_footer"></div>
				</div>
<<<<<<< HEAD
				
			</div>
            
            
            <div class="panel panel-success">
	            <div class="panel-heading">
	            	Suggested Matches. 
	            </div>
	            <form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
             		<form:hidden path="id" />
					<div class="panel-body" id="matches">
						
					</div>
				</form:form>
			</div>
			<div id="pagination_div">
				<div id="altLists"></div>
				<div id="table_footer"></div>
				
=======
>>>>>>> e4476360267c874a840c5d228270923640584d8a
			</div>

			<div class="col-md-3 products-grid-right">
				<%-- <div class="panel panel-warning">
					<div class="panel-heading">
						<h4 class="panel-title">Partner Search</h4>
					</div>
					<div class="panel-body">
						<form:form commandName="createProfile" action="searchProfiles" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="col-md-3 control-label" for="textinput">Age</label>  
								<div class="col-md-5">
									<input type="number" min="20" max="55" name="ageFrom" placeholder="from" class="form-control"/>
								</div>
								<div class="col-md-4">
									<input type="number" min="20" max="55" name="ageTo" placeholder="to" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="textinput">Education</label>  
								<div class="col-md-9">
									<form:select path="rEducation" class="form-control">
										<form:option value="">-- Education --</form:option>
										<form:options items="${education}"></form:options>
									</form:select>
								</div>
							</div>
							<div class="form-group">
							  <label class="col-md-3 control-label" for="textinput">Location</label>  
							  <div class="col-md-9">
							  	<form:select path="currentCity" class="form-control">
									<form:option value="">-- Location --</form:option>
									<form:options items="${citys}"></form:options>
								</form:select>
							    
							  </div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="singlebutton"></label>
								<div class="col-md-9">
									<button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">Search</button>
								</div>
							</div>
						</form:form>
					</div>
				</div> --%>
            </div>

	<!-- Modal Starts here-->
	<div class="modal" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content table-responsive">
				<table class="table table-responsive">
	    			<thead style="background: #4CAF50;color: white;">
	    				<tr>
	    					<th>Services</th><th>Duration<br>(Months)</th><th>Amount<br>(INR)</th><th>Messages</th><th>Profiles</th>
	    					<th>Highlight<br>Profile</th><th>Chat</th><th>Horoscope<br>View</th><th>Astrology<br>Match</th>
	    				</tr>
	    			</thead>
	    			<tbody>
	    				<tr>
	    					<th>Classic</th><td>3</td><td>1299</td><td><i style="color: red;" class="fa fa-times"></i></td><td>25</td>
	    					<td><i style="color: red;" class="fa fa-times"></i></td><td><i style="color: red;" class="fa fa-times"></i></td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    				</tr>
	    				<tr>
	    					<th>Classic Plus</th><td>6</td><td>2499</td><td><i style="color: red;" class="fa fa-times"></i></td><td>45</td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    				</tr>
	    				<tr>
	    					<th>Premium</th><td>6</td><td>5299</td><td>Unlimited</td><td>65</td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    				</tr>
	    				<tr>
	    					<th>Premium Plus</th><td>6</td><td>7499</td><td>Unlimited</td><td>85</td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    				</tr>
	    				<tr style="background: #ff8080;color: white;">
	    					<th>Aarna Premium</th><td>Till Marry</td><td>14999</td>
	    					<td>Premium Benefits</td><td>Meet Ups</td><td>High priority</td>
	    					<td colspan="3">Quick Response</td>
	    				</tr>
	    			</tbody>
	    			<tfoot>
	    				<tr>
	    					<th colspan="7" style="text-align: right;"><a href="memberShipPage" class="btn1 btn btn-info">Upgrade</a></th>
	    					<th colspan="2"><a href="myProfile" class="btn1 btn btn-info">My Account</a></th>
	    				</tr>
	    			</tfoot>
    			</table>
			</div>
		</div>
	</div>
<<<<<<< HEAD
	<div class="footer-copy">
		<p>a product by Aarna ASSOCIATES © 2017. All rights reserved.</p>
	</div>

<!-- //footer -->
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<script src="js/ajax.js"></script>
<script src="js/jquery-asPaginator.js"></script>

=======
	<!-- Modal Ends here-->


>>>>>>> e4476360267c874a840c5d228270923640584d8a
<script type="text/javascript">

/* $(window).load(function() {
	$('#myModal').modal();
}); */

var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = ${allowed_profiles_limit};
var listOrders1 = ${allOrders1};

if (listOrders1 != "") {
	displayMatches(listOrders1);
}

function displayMatches(listOrders) {
	$('#matches').html('');
	serviceUnitArray = {};
	if(listOrders == ""){
		var tblRow = '<div>No matches found.</div>';
		$(tblRow).appendTo("#matches");
		$("#pagination_div").prop("hidden",true);
	}
	$.each(listOrders,function(i, orderObj) 
	{
		paginationSetup(total_items_count);
		$("#altLists").asPaginator('enable');
		$("#pagination_div").removeAttr("hidden");
		displayTableFooter(1);
		serviceUnitArray[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		/* else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
			});
		} */
		
			var login_user_role_id = ${cacheGuest.roleId};
			var firstname = 'xxxxxx',lastname='xxxxxx'; 
			
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14)){ //means premium,premium_plus,aarna premium users
			
				firstname = orderObj.firstName;
				lastname = orderObj.lastName;
				//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				//more_details_str = '<tr><td><span><a href="#" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
			}
			var tblRow = '<div class="row container-fluid">'
				+ '<div class="col-md-2" style="margin-right:0; padding-right:0;">'
	            + 	"<img src="+image+" class='img-responsive thumbnail' style='margin-bottom: 0px;'>"
	            + '</div>'
	            + '<div class="col-md-6">'
	            + 	'<div class="profilesimilar">'
	            + 		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
	            + 			'<tr><td><h4>'+firstname+'&nbsp;'+lastname+'</h4>&nbsp;('+orderObj.username+')</td></tr>'
	            + 			'<tr><td><p>'+orderObj.dobString+', '+orderObj.religionName+', '+orderObj.casteName+',</p></td></tr>'
	            + 			'<tr><td><p>'+orderObj.age+'yrs&nbsp'+orderObj.occupationName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'.</p></td></tr>'
	            //+			mobile_no__str
	            //+ 			'<tr><td><span><a href="#" onclick="fullProfile('+orderObj.id+')">Full Profile</span> </td></tr>'
	            + 		'</table>'
	            + 	'</div>'
	            + '</div>'
	            + '<div class="col-md-3" style="margin-right:0; padding-right:0;">'
	            +  '<h4 style="margin-bottom:20px;">Like this Profile?</h4>'
	            + 	'<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button><br>'
	            //+ 	'<button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br>'
	            //+   '<button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
	            + '</div>'
	            + '<div class="row container-fluid">'
	            + 	'<div class="col-md-7" style="margin-right:0; padding-right:0;">'
	            +		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
	            + 			'<tr>'
	            //+				'<td><button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button></td>'
	            //+ 				'<td>&nbsp;</td><td><button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>'
	            +				'<td><a href="#" onclick="fullProfile('+orderObj.id+')">View Full Profile</a></td>'
	            + 				'<td><a href="#"  id="mobileBtn'+orderObj.id+'" type="button" class="btn" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</a></td></tr>'
	            + 		'</table>'
	            //+ 		'<button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
	            //+   	'<button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
	            + 	'</div>'
	            + '</div>'
	            + '<div class="clearfix"></div>'
	            + '<hr>'
	            + '</div>';
	        /* var login_user_role_id = ${cacheGuest.roleId};
	        if(login_user_role_id==4){ // means free user
	        	$("#mobileBtn"+orderObj.id).prop("disabled",true);
	        } */
			$(tblRow).appendTo("#matches"); 
		
	});
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

function displayMobileNum(profileId,listType){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profileId);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		}
		var profileObj = serviceUnitArray[profileId];
		var formData = new FormData();
		formData.append('profile_id',profileId);
		formData.append('list_type',listType);
		jQuery.fn.makeMultipartRequest('POST', 'viewedMobileNumber', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var limit = jsonobj.allowed_limit;
	    		var msg = jsonobj.message;
	    		if(typeof msg != "undefined"){
	    			if(msg=="success"){
	    				$("#row"+profileId).html('<td>'+profileObj.mobile+'</td>');
	    				allowed_limit = limit;
	    			}else{
	    				alert("Some problem occured. Please try again.");
	    			}
	    		}
	    		
		});
	}

	var profileObj = serviceUnitArray[profileId];
	var formData = new FormData();
	formData.append('profile_id',profileId);
	formData.append('list_type',listType);
	jQuery.fn.makeMultipartRequest('POST', 'viewedMobileNumber', false, formData, false, 'text', function(data){
   		var jsonobj = $.parseJSON(data);
   		var limit = jsonobj.allowed_limit;
   		var msg = jsonobj.message;
   		if(typeof msg != "undefined"){
   			if(msg == "success"){
   				$("#row"+profileId).html('<td>'+profileObj.mobile+'</td>');
   				allowed_limit = limit;
   			}else{
   				alert("Some problem occured. Please try again.");
   			}
   		}
	});
}

function fullProfile(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
	}else{
		document.searchForm2.action = "fullProfile"
	}
	//document.searchForm2.id = profile_id;
	
    document.searchForm2.target = "_blank";    // Open in a new window
    document.searchForm2.submit();             // Submit the page
    return true;
}

function displayTableFooter(page){
	var from_val = ((parseInt(page)-1)*page_size)+1;
	var to_val = parseInt(page)*page_size;
	if(to_val > total_items_count){
		to_val = total_items_count;
	}
	if(from_val>to_val){
		from_val = to_val;
	}
	$("#table_footer").html("Showing "+from_val+" to "+to_val+" of "+total_items_count+" records");
}

function paginationSetup(total_items_count) {
	$('#altLists').asPaginator(total_items_count, {
        currentPage: 1,
        visibleNum: {
          0: 5,
          480: 3,
          960: 5
        },
        tpl: function() {
          return '<ul>{{first}}{{prev}}{{altLists}}{{next}}{{last}}</ul>';
        },
        components: {
          first: true,
          prev: true,
          next: true,
          last: true,
          altLists: true
        },
        onChange: function(page) {
			var formData = new FormData();
	      	formData.append("page_no",page);
	      	formData.append("request_from","dashboard");
	  		$.fn.makeMultipartRequest('POST', 'displayPage', false,
	  				formData, false, 'text', function(data){
	  			var jsonobj = $.parseJSON(data);
	  			var results = jsonobj.results;
	  				if(results==""){
		    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
		    			$('#matches').html('');
		    			$(str).appendTo("#matches");
		    			$("#table_footer").prop("hidden",true);
		    			$("#altLists").prop("hidden",true);
		    		}else{
		    			paginationSetup(total_items_count);
		    			$("#altLists").asPaginator('enable');
		    			displayMatches(results);
		    			displayTableFooter(page);
		    		}
	  		});
        }
	});
}
function getNewMatches(){
	document.searchForm2.action = "newMatches";
    document.searchForm2.submit();            
    return true;
}

function expressInterest(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		}
		var formData = new FormData();
	
		formData.append('profile_id',profile_id);
		jQuery.fn.makeMultipartRequest('POST', 'expressInterestTo', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var limit = jsonobj.allowed_limit;
	    		var msg = jsonobj.message;
	    		var profiles = jsonobj.allProfiles;
	    		//if(typeof msg != "undefined" ){
	    			if("success"==msg){
	    				alert("Interest request has been sent successfully");
	    				$("#expInterest"+profile_id).html('Expressed Interest');
	    				$("#expInterest"+profile_id).prop("disabled",true);
	    				allowed_limit = limit;
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Interest request is not successful. Please try again.");
	    			}
	    		//}
	    		/* if(profiles==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(profiles.length);
	    			displayMatches(profiles);
	    		} */
	    		/* var filtered_list = jsonobj.filtered_profiles;
	    		$('#countId').html('');
	    		if(filtered_list==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(filtered_list.length);
	    			displayMatches(filtered_list);
	    		} */
				
			});
	}
}
$(".dashboard").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>