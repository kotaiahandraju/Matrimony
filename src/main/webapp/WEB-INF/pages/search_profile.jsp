<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<%@page import="com.aurospaces.neighbourhood.bean.UsersBean"%>
<html>
<head>
<title>Search Profiles</title>
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
<!-- <script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script src="js/menu_jquery.js"></script>
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

    <style>
.midcontnet { border-bottom:12px solid #F1F1F2; padding-bottom:40px; }
.profilepage { margin-top:30px; text-align:right;}
.accordion-option {
  width: 100%;
  float: left;
  clear: both;
  margin: 5px 0;
}

.accordion-option .title {
  font-size: 10px;
  font-weight: bold;
  float: left;
  padding: 0;
  margin: 0;
}

.accordion-option .toggle-accordion {
  float: right;
  font-size: 12px;
  color: #6a6c6f;
}

.accordion-option .toggle-accordion:before {
  content: "";
}

.accordion-option .toggle-accordion.active:before {
  content: "";
}
.controls {
  margin-bottom: 10px;
}

.collapse-group {
  padding: 10px;
  border: 1px solid darkgrey;
  margin-bottom: 10px;
}

.panel-title .trigger:before {
  content: '\e082';
  font-family: 'Glyphicons Halflings';
  vertical-align: text-bottom;
}

.panel-title .trigger.collapsed:before {
  content: '\e081';
}
.panel-group .panel {
    margin-bottom: 0;
    border-radius: 0;
}
.refinesearch{ font-size:11px; font-family:verdana, Helvetica, sans-serif;}
.searchresults p{ font-size:12px;}
.searchresults h4{ font-size:20px;}
.searchresults tr td{ font-size:12px;}
.searchresults tr td span{ color:#000;}
.searchresults a { color:#C00;}

@media (max-width:480px) {
	.profilepage { margin-top:-25px; text-align: right;}
	.ilogo img{ width:20%; text-align:center; }
}
</style>

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
				<p><a href="#">Matches</a>  <span class="badge badge-notify">30</span>&nbsp;&nbsp;&nbsp;
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
	            <li><a class="color1" href="searchProfiles">Search</a></li>
	            <li><a class="color1" href="#">More</a></li>
			</ul>
			<div class="clearfix"></div>
		</div>
	</div>
</div>

<!-- products -->
	<div class="products">
		<div class="container">
			<form:form commandName="createProfile" class="form-horizontal" id="searchForm" role="form"   method="post">
			<div class="mid-grids">
				<div class="col-md-3 products-grid-right">
					<div class="w_sidebar">
						<section  class="sky-form">
							<h4>Caste</h4>
							<div class="row1 scroll-pane">
								<div class="col col-4">
<%-- 								<c:out value="${castList}"></c:out> --%>
									<div id="castdiv">
										<c:forEach items="${castList}" var="castBean" >
											<label class="checkbox"><input type="checkbox" name="caste" value="${castBean.id}"><i></i><c:out value = "${castBean.name}"/></label>
										</c:forEach>
										<%-- <form:checkboxes items="${castList}" path="caste" itemValue="id" itemLabel="name" style="display: block;"/> --%>
									</div>
								</div>
								<!-- <div class="col col-4">
									<label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>Kamma</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kapu</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Balija</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Brahmin</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Padmasali</label>
									<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Velama</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Yadava</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Vysya</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Muslim</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Christian</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Arya Vysya</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kapu</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Balija</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Brahmin</label>
								</div> -->
							</div>
						</section>
						<section  class="sky-form">
							<h4>Religion</h4>
							<div class="row1 scroll-pane">
								<div class="col col-4">
									<div id="religiondiv">
										<c:forEach items="${religionList}" var="religionBean" >
											<label class="checkbox"><input type="checkbox" name="religion" value="${religionBean.id}"><i></i><c:out value = "${religionBean.name}"/></label>
										</c:forEach>
										<%-- <form:checkboxes items="${religionList}" path="religion" itemValue="id" itemLabel="name" /> --%>
									</div>
									<!-- <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>assumenda est</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kapu</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Balija</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Brahmin</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Padmasali</label>
									<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Velama</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Yadava</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Vysya</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Muslim</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Christian</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Arya Vysya</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kapu</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Balija</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Brahmin</label> -->
								</div>
								
							</div>
						</section>
                        <section  class="sky-form">
							<h4>Education</h4>
							<div class="row1 scroll-pane">
								<div class="col col-4">
									<div id="educationdiv">
										<c:forEach items="${educationList}" var="educationBean" >
											<label class="checkbox"><input type="checkbox" name="education" value="${educationBean.id}"><i></i><c:out value = "${educationBean.name}"/></label>
										</c:forEach>
										<%-- <form:checkboxes items="${educationList}" path="education" itemValue="id" itemLabel="name" /> --%>
									</div>
									<!-- <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i></i>assumenda est</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kapu</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Balija</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Brahmin</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Padmasali</label>
									<label class="checkbox"><input type="checkbox" name="checkbox" ><i></i>Velama</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Yadava</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Vysya</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Muslim</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Christian</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Arya Vysya</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Kapu</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Balija</label>
									<label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Brahmin</label> -->
								</div>
							</div>
						</section>
					</div>
				</div>
             
             
             
             <div class="col-md-9">
<div id="searchresultsDiv">             
<div class="searchresults">
    <h3>Your Search Results</h3>
    <p><span id="countId">${count}</span> Profiles found <a href="searchProfiles">Modify Search</a></p>
	<div id="searchResults">
		
	</div>
</div>            
   <div class="clearfix"></div>
</div>
    <div class="clearfix"></div>
   </div>
                
                
                
                
                
                
                
                
              
				<div class="clearfix"></div>
			</div>
			</form:form>
		</div>
	</div>
<!-- //products -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 footer-grid">
				<h6>About us</h6>
				<p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel tincidunt elementum, nunc urna tristique nisi, in interdum libero magna tristique ante. adipiscing varius. Vestibulum dolor lorem.</p>
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
<script src="js/ajax.js"></script>
<script type="text/javascript">
var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	$('#countId').html('');
	$('#countId').html(listOrders1.length);
	displayMatches(listOrders1);
}
function displayMatches(listOrders) {
	$('#searchResults').html('');
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
			var insert_str = '';
			var mobile_no__str = '';
			var more_details_str = '';
			var expressed = orderObj.expressedInterest;
			if(expressed==0){
				insert_str = '<button class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button>';
			}else if(expressed>0){
				insert_str = '<button class="btn btn-primary btn-block">Expressed Interest</button>';
			}
			if(login_user_role_id == 6){ //means premium user
				//more_details_str = '<tr><td><span><a href="#" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
			}
			var tblRow = '<div class="panel panel-default">'
				+ '<div class="panel-heading">'
				+ '<h5 class="panel-title">'
				+ '<div class="form-check">'
				+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+orderObj.firstName+' '+orderObj.lastName+'</label>'
				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'
				+ '</div>'
				+ '</h5>'
				+ '</div>'
				+ '<div class="panel-body">'
				+ '<div class="col-md-3">'
				+ '<a href="#"> <img src='+image+' class="img-responsive thumbnail"></a>'
            	+ '</div>'
            	+ '<div class="col-md-6">'
            	+ '<table>'
            	+ '	<tr><td>Age/Height</td><td><span>: '+orderObj.age+', '+orderObj.inches+'</span></td></tr>'
            	+ '	<tr><td>Religion</td><td><span>: '+orderObj.religionName+'</span></td></tr>'
            	+ '	<tr><td>Mother Tongue</td><td><span>: '+orderObj.motherTongueName+'</span></td></tr>'
            	+ '	<tr><td>Community</td><td><span>: '+orderObj.casteName+'</span></td></tr>'
            	+ '	<tr><td>Location</td><td><span>: '+orderObj.currentCityName+'</span></td></tr>'
            	+ '	<tr><td>Education</td><td><span>: '+orderObj.educationName+'</span></td></tr>'
            	+ '	<tr><td>Profession</td><td><span>: '+orderObj.occupationName+'</span></td></tr>'
            	//+ '	<tr><td>Age</td><td><span>: '+orderObj.age+'</span></td></tr>'
            	//+ '	<tr><td colspan="2">'+orderObj.aboutMyself+'... <a href="#" onclick="showMore('+orderObj.id+')"> read more..</a> </td></tr>'
            	+  more_details_str
            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#" > read more..</a> </td></tr>'
            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#" > more detailssss</a> </td></tr>'
            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#" > more detailssss</a> </td></tr>'
            	+ '</table>'
            	+ '</div>'
            	/* + '<div id="hideMe'+orderObj.id+'" class="form-group hideMe">'
            	+ '    <label class="col-md-4 control-label" for="textinput"></label>'  
            	+ '    <div class="col-md-6 text-center">'
            	+ '    	<span class="more" style="color: #0087AF;cursor: pointer;"><a href="#" >read more </a></span><i style="cursor: pointer;" class="fa fa-angle-down"></i>'
            	+ '    </div>'
            	+ '</div>' */
            	+ '<div class="col-md-3">'
            	+ '<h4 style="margin-bottom:20px;">Like this Profile?</h4>'
            	+ '<c:if test="${(cacheGuest.roleId == 6)}">'
            	+ insert_str
				+ '</c:if>	 '
				+ '<button class="btn btn-danger btn-block">View Full Profile</button>'
            	+ '<div class="clearfix"></div>'
            	+ '</div>'
            	+ '</div>'
            	+ '</div>';
			$(tblRow).appendTo("#searchResults");
		}
	});
}
/* function updateList(){
	var allVals = [];
    $("#castdiv :checked").each(function () {
        allVals.push($(this).val());
    });
    if(allVals!=""){
    	//alert(allVals);
    	var formData = new FormData();

    	formData.append('selected_casts',allVals);
    	jQuery.fn.makeMultipartRequest('POST', 'updateProfilesList', false,
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
    			
    		});
    }
	
}
$(function () {
    $("#castdiv input[name='caste']").click(updateList);
    updateList();
}); */
function updateProfilesList(){
	var castVals = [];
	var religionVals = [];
	var educationVals = [];
    $("#castdiv :checked").each(function () {
    	castVals.push($(this).val());
    });
    $("#religiondiv :checked").each(function () {
    	religionVals.push($(this).val());
    });
    $("#educationdiv :checked").each(function () {
    	educationVals.push($(this).val());
    });
   // if(allVals!=""){
    	//alert(allVals);
    	var formData = new FormData();

    	formData.append('selected_casts',castVals);
    	formData.append('selected_religions',religionVals);
    	formData.append('selected_educations',educationVals);
    	jQuery.fn.makeMultipartRequest('POST', 'updateProfilesList', false,
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
    			
    		});
}
   
$("#castdiv input[name='caste']").click(updateProfilesList);   
$("#religiondiv input[name='religion']").click(updateProfilesList);
$("#educationdiv input[name='education']").click(updateProfilesList);
   
/* $("#castdiv input[name='caste']").click(function(){
	var allVals = [];
    $("#castdiv :checked").each(function () {
        allVals.push($(this).val());
    });
   // if(allVals!=""){
    	//alert(allVals);
    	var formData = new FormData();

    	formData.append('selected_casts',allVals);
    	jQuery.fn.makeMultipartRequest('POST', 'updateProfilesList', false,
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
    			
    		});
   // }
}); */

function expressInterest(profile_id){
	var formData = new FormData();

	formData.append('profile_id',profile_id);
	jQuery.fn.makeMultipartRequest('POST', 'expressInterestTo', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var msg = jsonobj.message;
    		var profiles = jsonobj.allProfiles;
    		if(typeof msg != "undefined" ){
    			if("success"==msg){
    				alert("Interest request has been sent successfully");
    			}else if("failed"==msg || "exception"==msg){
    				alert("Interest request is not successful. Please try again.");
    			}
    		}
    		if(profiles==""){
    			$('#countId').html('0');
    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
    			$('#searchResults').html('');
    			$(str).appendTo("#searchResults");
    		}else{
    			$('#countId').html(profiles.length);
    			displayMatches(profiles);
    		}
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

/* $(".more").click(function(){
	$(".hideMe").hide();
	$(".ifMore").show();
}); */

function showMoreDetails(thisObj){
	//$("#hideMe"+id).prop("hidden",true);
	var isHidden = $(".showMore").prop("hidden");
	if(isHidden){
		$(".showMore").removeAttr("hidden");
		thisObj.innerHTML="hide...";
	}else{
		$(".showMore").prop("hidden",true);
		thisObj.innerHTML="read more...";
	}
	
	
}

function viewMobileNumber(profile_id){
	var formData = new FormData();
	formData.append('profile_id',profile_id);
	jQuery.fn.makeMultipartRequest('POST', 'viewMobileNumber', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		
    		
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

</script>
</body>
</html>