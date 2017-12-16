<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<%@page import="com.aurospaces.neighbourhood.bean.UsersBean"%>
<html>
<head>
<title>View Profiles</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script> -->
<!-- //for-mobile-apps -->
<link href="user/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="user/css/style-profile.css" rel="stylesheet" type="text/css" media="all" />
<link href="user/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script src="user/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling -->
<!-- <script type="text/javascript" src="user/js/move-top.js"></script>
<script type="text/javascript" src="user/js/easing.js"></script>
<script type="text/javascript" src="user/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script src="user/js/menu_jquery.js"></script>
<link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'> -->
<!-- the jScrollPane script -->
<!-- <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script> -->
<!-- //the jScrollPane script -->
</head>
	
<body>
<%
UsersBean userBean = null;
if(session.getAttribute("cacheGuest") != null){
	userBean= (UsersBean)session.getAttribute("cacheGuest");
}
%>
<!-- top-header -->

<!-- top-header -->
<!-- logo-cart -->
<div class="header_top">
	<div class="container">
    <div class=" col-md-3">
		<div class="logo">
		 	<img src="user/images/logo1.jpg" class="img-responsive" >
	  </div>
      <div class="clearfix"></div>
      </div>
      
      <div class="col-md-4 ">
      <div class=" box_1 midfont">
		<p> <a href="#">Matches</a>  <span class="badge badge-notify">30</span>&nbsp;&nbsp;&nbsp;
        <a href="#">Search</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <a href="#">Inbox</a>  <span class="badge badge-notify">30</span></p>
        
        </div>      
      </div>
      
		<div class="col-md-5">
			<div class="cart box_1">
				<p>Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %> | &nbsp;&nbsp;<a href="paymentDetails" >Upgrade</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="#" >Help</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="logoutHome" >Signout</a></p>
				<div class="clearfix"> </div>
			</div>				 
		</div>
        
        
        
	</div>
</div>
<!-- //logo-cart -->
<!------>
<div class="top_bg">
	
</div>
<div class="mega_nav">
	 <div class="container">
		 <div class="menu_sec">
		 <!-- start header menu -->
		<ul class="megamenu skyblue">
			<li class="active" ><a class="color1" href="dashboard">Dashboard</a></li>
			<li><a class="color1" href="myProfile">My Profile</a></li>
            <li><a class="color1" href="myPhotos">My Photos</a></li>
            <li><a class="color1" href="searchPage">Search</a></li>
             <li><a class="color1" href="#">More</a></li>
		</ul> 
			<div class="clearfix"></div>
		 </div>
	  </div>
</div>
<!---->
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
							<img src="${cacheGuest.profileImage}" class="img-responsive thumbnail" style="margin-bottom:0;">
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
    <td><a href="#">Invitations</a></td>
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
    <td><a href="#">Members</a></td>
    <td><div class="badge pull-right">${cacheGuest.acceptedInterestCount}</div></td>
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
    <td><a href="#">Invitations</a></td>
    <td><div class="badge pull-right">${cacheGuest.sentInterestCount}</div></td>
  </tr>
</table>

				</div>
				
			</div>       
				</div>
             
                
                
                <div class="col-md-6 products-grid-left">
					<div class="panel panel-default">
				<div class="panel-body">
					Complete the remaining Profile
               <div class="progress">
  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
  aria-valuemin="0" aria-valuemax="100" style="width:${profile_filled_status}%">
    <%= session.getAttribute("profile_filled_status") %>% Complete 
  </div>
</div>
				<p>
                <span class="glyphicon glyphicon-envelope"></span> Verify your Email <a href="#"><u>Verify Email Address</u></a>
                </p>
				</div>
				
			</div>
            
            
            <div class="panel panel-default">
	            <div class="panel-heading">
	            	New Matches (150) <span class="pull-right"> <a href="#">View All</a></span>
	            </div>
				<div class="panel-body" id="matches">
					
				</div>
			</div>
				</div>
                
                
                
                
                
              <div class="col-md-3 products-grid-right">
					
                    
                    
                  <!-- <div class="panel panel-default">
				
				<div class="panel-body"> -->
					
<%-- <form:form commandName="createProfile"  action="searchProfile" method="post" class="form-horizontal">
<fieldset>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Age</label>  
  <div class="col-md-4">
  	<select  id="rAgeFrom" class="form-control" style="padding: 0px;"></select>
<!--   	<input type="number" min="20" max="55" name="ageFrom" placeholder="from" class="form-control"/> -->
<!--    <input id="textinput" name="textinput" type="text" placeholder="Age" class="form-control input-md"> -->
  </div>
  <div class="col-md-4">
  	<select  id="rAgeTo" class="form-control" style="padding: 0px;"></select>
<!--   	<input type="number" min="20" max="55" name="ageTo" placeholder="to" class="form-control"/> -->
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Education</label>  
  <div class="col-md-8">
  	<form:select path="rEducation" class="form-control">
		<form:option value="">-- Education --</form:option>
		<form:options items="${education}"></form:options>
	</form:select>
<!--   <input id="textinput" name="textinput" type="text" placeholder="Education" class="form-control input-md"> -->
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Location</label>  
  <div class="col-md-8">
  	<form:select path="currentCity" class="form-control">
		<form:option value="">-- Location --</form:option>
		<form:options items="${citys}"></form:options>
	</form:select>
<!--   <input id="textinput" name="textinput" type="text" placeholder="Location" class="form-control input-md"> -->
    
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-8">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">Search</button>
  </div>
</div>

</fieldset>
</form:form> --%>
			<!-- 	</div>
			</div>  --> 
            <br>
            <img src="user/images/ad.jpg"  class="img-responsive"></div>
				<div class="clearfix"></div>
			</div>
		</div>
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
    $("#rAgeFrom").append('<option value="">From</option>');
    $("#rAgeTo").append('<option value="">To</option>');
    for (var i=18;i<=55;i++){
        $("#rAgeFrom").append('<option value='+i+'>'+i+'</option>');
    }
    for (var i=18;i<=55;i++){
        $("#rAgeTo").append('<option value='+i+'>'+i+'</option>');
    }
});

var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayMatches(listOrders1);
}
function displayMatches(listOrders) {
	$('#matches').html('');
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) 
	{
		serviceUnitArray[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.image;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
			});
		}
		if(orderObj.firstName !=null)
		{
			var login_user_role_id = ${cacheGuest.roleId};
			var mobile_no__str = '';
			if((login_user_role_id == 6) || (login_user_role_id == 11)){ //means premium user
				mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				//more_details_str = '<tr><td><span><a href="#" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
			}
			var tblRow = '<div class="row container-fluid">'
				+ '<div class="col-md-2" style="margin-right:0; padding-right:0;">'
	            + 	"<img src="+image+" class='img-responsive thumbnail' style='margin-bottom: 0px;'>"
	            + '</div>'
	            + '<div class="col-md-9">'
	            + 	'<div class="profilesimilar">'
	            + 		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
	            + 			'<tr><td><h4>'+orderObj.firstName+'&nbsp;'+orderObj.lastName+'</h4></td></tr>'
	            + 			'<tr><td><p>'+orderObj.dob+', '+orderObj.religionName+', '+orderObj.casteName+',</p></td></tr>'
	            + 			'<tr><td><p>'+orderObj.age+'&nbsp'+orderObj.occupationName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'.</p></td></tr>'
	            +			mobile_no__str
	            + 			'<tr><td><span>Full Profile</span> >></td></tr>'
	            + 		'</table>'
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
		}
	});
}

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

/* function searchProfiles(){
	
	var ageFrom = $("#ageFrom").val();
	var ageTo = $("#ageTo").val();
	var edu = $("#education").val();
	var loc = $("#currentCity").val();
	var formData = new FormData();

	formData.append('ageFrom',ageFrom);
	formData.append('ageTo',ageTo);
	formData.append('education',edu);
	formData.append('currentCity',loc);
	jQuery.fn.makeMultipartRequest('POST', 'searchProfiles', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var filtered_list = jsonobj.filtered_profiles;
    		$('#countId').html('');
    		if(filtered_list==""){
    			$('#countId').html('0');
    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
    			$('#searchResults').html('');
    			$(str).appendTo("#searchResults");
    		}else{
    			$('#countId').html(filtered_list.length);
    			displayMatches(filtered_list);
    		}
    		var location = $("#loc").val();
    		window.location.href =location+"/searchProfile";
			
		});
}
 */
</script>

</body>
</html>