
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
				<p>Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %> | &nbsp;&nbsp;<a href="memberShipPage" >Upgrade</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="#" >Help</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="logoutHome" >Signout</a></p>
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
				<li><a class="color1" href="dashboard">Dashboard</a></li>
				<li><a class="color1" href="myProfile">My Profile</a></li>
	            <li><a class="color1" href="myPhotos">My Photos</a></li>
	            <li class="active" ><a class="color1" href="searchProfiles">Search</a></li>
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
				<%-- <form:hidden path="id" /> --%>
				<input type="hidden" id="id"/>
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

<%@ include file="userHeader.jsp"%>

			<div class="col-md-6 products-grid-left">
            	<div class="panel panel-success">
					<div class="panel-heading">Search Profiles</div>
					<div class="panel-body table-responsive">
						<form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form" method="post">
             			<div class="col-md-12">
							<div id="searchresultsDiv" style="font-size: 12px;">
								<div class="searchresults">
								    <h3>Your Search Results</h3>
								    <p><span id="countId">${count}</span> Profiles found <a href="searchProfiles">Modify Search</a></p>
									<div id="searchResults">
										

									</div>
								</div>           
							    <div id="table_footer"></div>
								<div id="altLists"></div>
							</div>
							<div class="clearfix"></div>
							
							<div id="search_criteria">
								<div class="form-group">
									<label class="col-md-4 control-label" for="textinput">Age</label>  
									<div class="col-md-3">
										<form:input path="rAgeFrom" class="form-control  numericOnly u1" placeholder="From" />
									</div>
									<div class="col-md-3">
										<form:input path="rAgeTo" class="form-control numericOnly u1" placeholder="To" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-4 control-label" for="textinput">Height From</label>
									<div class="col-md-3">
										<form:select path="rHeight" class="form-control u1">
											<form:option value="">From</form:option>
											<form:options items="${height}"></form:options>
										</form:select>
									</div>
									<div class="col-md-3">
										<form:select path="rHeightTo" class="form-control u1">
											<form:option value="">To</form:option>
											<form:options items="${height}"></form:options>
										</form:select>
									</div>
								</div>

							</div>
						</section>
					</div>
				</div></div>
             </form:form>
             <form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
             <%-- <form:hidden path="id" /> --%>
             <input type="hidden" id="id"/>
             <div class="col-md-9">
				<div id="searchresultsDiv">
					<div class="searchresults">
					    <h3>Your Search Results</h3>
					    <p><span id="countId">${count}</span> Profiles found <a href="searchProfiles">Modify Search</a></p>
						<div id="searchResults">
							
						</div>
					</div>           
				    <div id="table_footer"></div>
					<div id="altLists"></div>
				</div>


			    <div class="clearfix"></div>
			   <div id="search_criteria">
			    <div class="form-group">
			      <label class="col-md-4 control-label" for="textinput">Age From</label>  
			      <div class="col-md-6">
			      <form:input path="rAgeFrom" class="form-control  numericOnly u1" placeholder="Enter Age From" />
			<!--       	<input type="text" name="age" class="form-control u1" placeholder="Enter Age" maxlength="255"/> -->
			      </div>
			    </div>
			    <div class="form-group">
			      <label class="col-md-4 control-label" for="textinput">Age To</label>  
			      <div class="col-md-6">
			      <form:input path="rAgeTo" class="form-control numericOnly u1" placeholder="Enter Age To" />
			<!--       	<input type="text" name="age" class="form-control u1" placeholder="Enter Age" maxlength="255"/> -->
			      </div>
			    </div>
    <%-- <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Height</label>  
      <div class="col-md-6">
       <form:input path="rHeight" placeholder="Enter Height"/>
       	<input type="text" name="height" class="form-control u1" placeholder="Enter Height" maxlength="255"/> -->
      </div>
    </div> --%>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Height From</label>  
      <div class="col-md-6">
      	<form:select path="rHeight" class="form-control u1">
			<form:option value="">-- Choose Height --</form:option>
			<form:options items="${height}"></form:options>
		</form:select>
      </div>
    </div>
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Height To</label>  
      <div class="col-md-6">
      	<form:select path="rHeightTo" class="form-control u1">
			<form:option value="">-- Choose Height --</form:option>
			<form:options items="${height}"></form:options>
		</form:select>
      </div>
    </div>



    <div class="form-group" >
      <label class="col-md-4 control-label" for="textinput">Marital Status</label>  
      <div class="col-md-6">
      	<form:select path="rMaritalStatus" class="form-control u1" onchange="hideChildren();" multiple="true" >
			<form:option value="">Doesn't Matter</form:option>
			<form:option value="Married">Married</form:option>
			<form:option value="Unmarried">Unmarried</form:option>
			<form:option value="Widow/Divorced">Widow/Divorced</form:option>
		</form:select>
      </div>
    </div>

    <div class="form-group" id="haveChildrenId" style="display: none">
      <label class="col-md-4 control-label" for="textinput" >Have Children</label>  
      <div class="col-md-6">
      	<form:select path="rhaveChildren" class="form-control u1">
			<form:option value="">Doesn't Matter</form:option>
			<form:option value="1">1</form:option>
			<form:option value="2">2</form:option>
			<form:option value="No Children">No Children</form:option>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Religion</label>  
      <div class="col-md-6">
      	<form:select path="rReligion" class="form-control u1">
			<form:option value="">-- Choose Religion --</form:option>
			<form:options items="${religion}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Community</label>  
      <div class="col-md-6">
      	<form:select path="rCaste" class="form-control u1" multiple="true">
			<form:option value="">-- Choose Community --</form:option>
			<form:options items="${cast}"></form:options>
		</form:select>
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Mother Tongue</label>  
      <div class="col-md-6">
      	<form:select path="rMotherTongue" class="form-control u1">
			<form:option value="">-- Choose Mother Tongue --</form:option>
			<form:options items="${language}"></form:options>
		</form:select>
      </div>
    </div>
 <script>
$(document).ready(function(){
	$(".ifMore").hide();
	$(".incomeBlock").hide();
	
    $(".more").click(function(){
    	$(".hideMe").hide();
    	$(".ifMore").show();
    });
    
    $(".incomeRange").click(function(){
    	$(".incomeBlock").show();
    });
    $(".incomeMatter").click(function(){
    	$(".incomeBlock").hide();
    });
    /* $(".more").click(function(){
        $(".ifMore").collapse('toggle');
    });
    $(".more").click(function(){
        $(".ifMore").collapse('hide');
    }); */
    
});
</script>   
    <!-- <div class="form-group hideMe">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6 text-center">
      	<span class="more" style="color: #0087AF;cursor: pointer;">MORE </span><i style="cursor: pointer;" class="fa fa-angle-down"></i>
      </div>
    </div> -->
    
<div class="ifMore" id="ifMore">
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>
      <div class="col-md-6">Location Details</div>
    </div>
   
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Country living in</label>  
      <div class="col-md-6">
      	<form:select path="rCountry" class="form-control u">
			<form:option value="">-- Choose Country --</form:option>
			<form:options items="${countries}"></form:options>
			
		</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">State living in</label>  
      <div class="col-md-6">
      	<form:select path="rState" class="form-control u" multiple="true">
			<form:option value="">-- Choose State --</form:option>
			<form:option value="AP">AP</form:option>
			<form:option value="Telangana">Telangana</form:option>
		</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>
      <div class="col-md-6">Education & Profession Details</div>
    </div>
<!--      rCountry,rState,rEducation,rWorkingWith,rOccupation,rAnnualIncome,rCreateProfileFor,rDiet -->
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Education</label>  
      <div class="col-md-6">
      	<form:select path="rEducation" class="form-control u" multiple="true">
			<form:option value="">Doesn't Matter</form:option>
			<form:options items="${education}"></form:options>
		</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Working with</label>  
      <div class="col-md-6">
      	<form:select path="rWorkingWith" class="form-control u1">
			<form:option value="">Doesn't Matter</form:option>
			<form:option value="Private Company">Private Company</form:option>
			<form:option value="Government/Public Sector">Government/Public Sector</form:option>
			<form:option value="Defense/Civil Services">Defense/Civil Services</form:option>
			<form:option value="Not Working">Not Working</form:option>
		</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Profession area</label>  
      <div class="col-md-6">
      	<form:select path="rOccupation" class="form-control u">
			<form:option value="">Doesn't Matter</form:option>
			<form:options items="${occupation}"></form:options>
		</form:select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Annual Income</label>  
      <div class="col-md-8">
      	<input type="radio" name="annualIncome" class="incomeMatter" id="ai1" value=""> <label for="ai1">Doesn't Matter</label>
      	<input type="radio" name="annualIncome" class="incomeRange" id="ai2" value="Specify an income range"> <label for="ai2">Specify an income range</label>
      	<%-- <form:select path="education" class="form-control u">
			<form:option value="">Doesn't Matter</form:option>
			<form:option value="Specify an income range">Specify an income range</form:option>
		</form:select> --%>
      </div>
    </div>
    
    <div class="form-group incomeBlock">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
      	<form:select path="rAnnualIncome" class="form-control u1">
			<form:option value="">-- Annual Income --</form:option>
			<form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
			<form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
			<form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
			<form:option value="Above INR 7 Lakh">Above INR 7 Lakh</form:option>
		</form:select>
      </div>
    </div>
    
    <div class="form-group incomeBlock">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-8">
      	<!-- <input type="checkbox" name="includeProfiles" id="includeProfiles"> -->
      	<%-- <form:checkbox path="specifiedIncome" value="specifiedIncome" placeholder="Enter Height"/>
      	Include Profiles who have not specified their income --%>
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>
      <div class="col-md-6">Other Details</div>
    </div>
    
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Diet</label>  
      <div class="col-md-6">
      	<form:select path="rDiet" class="form-control u" >
			<form:option value="">-- Select Diet--</form:option>
			<form:option value="Veg">Veg</form:option>
			<form:option value="Non-Veg">Non-Veg</form:option>
			<form:option value="Occasionally Non-Veg">Occasionally Non-Veg</form:option>
			<form:option value="Eggetarian">Eggetarian</form:option>
			<form:option value="Jain">Jain</form:option>
			<form:option value="Vegan">Vegan</form:option>
		</form:select>
      </div>
    </div>
   </div>
   <div class="form-group">
      <label class="col-md-4 control-label" for="textinput"></label>  
      <div class="col-md-6">
     	<button type="button" id="searchBtn" class="btn1 btn btn-info" onclick="submitSearch()">Search</button> 
      <!-- 	<a href="savePartnerProfile" class="btn1 btn btn-info">Save & Continue</a> -->
      </div>
    </div>
   </div>
							</div>               
   						</form:form>             
					</div>
				</div>
			</div>
			
			<div class="col-md-3 products-grid-right">
				<form:form commandName="createProfile" class="form-horizontal" id="searchForm" role="form" method="post">
               	<div class="w_sidebar">
					<section class="sky-form">
						<h4>Caste</h4>
						<div class="row1 scroll-pane">
							<div class="col col-4">
								<div id="castdiv">
									<c:forEach items="${castList}" var="castBean" >
										<label class="checkbox"><input type="checkbox" name="caste" value="${castBean.id}"><i></i><c:out value = "${castBean.name}"/></label>
									</c:forEach>
								</div>
							</div>
						</div>
					</section>
					<section class="sky-form">
						<h4>Religion</h4>
						<div class="row1 scroll-pane">
							<div class="col col-4">
								<div id="religiondiv">
									<c:forEach items="${religionList}" var="religionBean" >
										<label class="checkbox"><input type="checkbox" name="religion" value="${religionBean.id}"><i></i><c:out value = "${religionBean.name}"/></label>
									</c:forEach>
								</div>
							</div>
						</div>
					</section>
 					<section class="sky-form">
						<h4>Education</h4>
						<div class="row1 scroll-pane">
							<div class="col col-4">
								<div id="educationdiv">
									<c:forEach items="${educationList}" var="educationBean" >
										<label class="checkbox"><input type="checkbox" name="education" value="${educationBean.id}"><i></i><c:out value = "${educationBean.name}"/></label>
									</c:forEach>
								</div>
							</div>
						</div>
					</section>
				</div>
				</form:form>
				<br>
			</div>

<script type="text/javascript">

var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = ${allowed_profiles_limit};
 var listOrders1 = ${allOrders1};
 
if (listOrders1 != "" && listOrders1 != null) {
	$('#countId').html('');
	$('#countId').html(total_items_count);
	paginationSetup(total_items_count);
	$("#altLists").asPaginator('enable');
	displayMatches(listOrders1);
	displayTableFooter(1);
}else if (listOrders1 == null) {
	$('#search_criteria').removeAttr("hidden");
	$('#searchResults').html('');
	$("#searchresultsDiv").prop("hidden",true);
}else{
	$('#countId').html('0');
	var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
	$('#searchResults').html('');
	$(str).appendTo("#searchResults");
	$('#search_criteria').prop("hidden",true);
	$("#searchresultsDiv").removeAttr("hidden");
}

function displayMatches(listOrders) {
	$('#searchResults').html('');
	$("#search_criteria").prop("hidden",true);
	$('#searchresultsDiv').removeAttr("hidden");
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) 
	{
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
			var insert_str = '';
			var mobile_no__str = '';
			var more_details_str = '';
			var expressed = orderObj.expressedInterest;
			var firstname = 'xxxxxx',lastname='xxxxxx';
			/* if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 14)){ //means premium user
				mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				//more_details_str = '<tr><td><span><a href="#" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
				if(expressed==0){
					insert_str = '<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button>';
				}else if(expressed>0){
					insert_str = '<button class="btn btn-primary btn-block">Expressed Interest</button>';
				}
			} */
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14)){ //means premium,premium_plus,aarna premium users
			
				firstname = orderObj.firstName;
				lastname = orderObj.lastName;
			}
			var tblRow = '<div class="panel panel-default">'
				+ '<div class="panel-heading">'
				+ '<h5 class="panel-title">'
				+ '<div class="form-check">'

				+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+firstname+' '+lastname+'&nbsp;('+orderObj.username+')</label>'
				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'
				+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+orderObj.firstName+' '+orderObj.lastName+'</label>'
// 				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'

				+ '</div>'
				+ '</h5>'
				+ '</div>'
				+ '<div class="panel-body">'
				+ '<div class="col-md-2">'
				+ '<a href="#"> <img src='+image+' class="img img-responsive thumbnail" style="margin-bottom:0;height: 60px;width: 60px;"></a>'
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
            	+ mobile_no__str
            	
            	//+ '	<tr><td>Age</td><td><span>: '+orderObj.age+'</span></td></tr>'
            	//+ '	<tr><td colspan="2">'+orderObj.aboutMyself+'... <a href="#" onclick="showMore('+orderObj.id+')"> read more..</a> </td></tr>'
            	//+  more_details_str
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
            	+ '<div class="col-md-4">'
            	+ '<h4 style="margin-bottom:20px;">Like this Profile?</h4>'
            	//+ '<c:if test="${(cacheGuest.roleId == 6)}">'
            	+ insert_str
				//+ '</c:if>	 '
				+ '<button class="btn btn-danger btn-block btn-md" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
            	+ '<div class="clearfix"></div>'
            	+ '</div>'
            	+ '</div>'
            	+ '</div>';
			$(tblRow).appendTo("#searchResults");
		
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
	    			var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
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
	    		var filtered_profiles = jsonobj.filtered_profiles;
	    		var total_count = jsonobj.total_records;
	    		$('#countId').html('');
	    		$("#search_criteria").prop("hidden",true);
	    		$('#searchresultsDiv').removeAttr("hidden");
	    		if(filtered_profiles==""){
	    			$('#countId').html('0');
	    			var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    			$("#table_footer").prop("hidden",true);
	    			$("#altLists").prop("hidden",true);
	    		}else{
	    			$('#countId').html(total_count);
	    			total_items_count = total_count;
	    			paginationSetup(total_items_count);
	    			$("#altLists").asPaginator('enable');
	    			displayMatches(filtered_profiles);
	    			displayTableFooter(1);
	    			$("#table_footer").removeAttr("hidden");
	    			$("#altLists").removeAttr("hidden");
	    		}
    			
    		});
}
   
$("#castdiv input[name='caste']").click(updateProfilesList);   
$("#religiondiv input[name='religion']").click(updateProfilesList);
$("#educationdiv input[name='education']").click(updateProfilesList);


function submitSearch(){
	document.searchForm2.action = "SearchResults"
    document.searchForm2.submit();            
    return true;
}
	//$("#searchForm2").submit();
	
//}

   
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
	    			var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
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
    			var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
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
    			var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
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

/* function viewMobileNumber(profile_id){
	var formData = new FormData();
	formData.append('profile_id',profile_id);
	jQuery.fn.makeMultipartRequest('POST', 'viewMobileNumber', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		
    		
	});
} */

function displayMobileNum(profileId,listType){
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

function fullProfile(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
	}else{
		document.searchForm2.id = profile_id;
		document.searchForm2.action = "fullProfile";
	}
	//document.searchForm2.id = profile_id;
	
    document.searchForm2.target = "_blank";    // Open in a new window
    document.searchForm2.submit();             // Submit the page
    return true;
}


function paginationSetup(total_items_count) {
	  $('#altLists').asPaginator(total_items_count, {
          currentPage: 1,
          visibleNum: {
            0: 10,
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
             //$("#page_no").val(page);
             //var search_form = $("#searchForm2");
        	 //var formData = $("#searchForm2 :input").serialize();
        	 //var t = $("#rAgeFrom").val();
        	 //var formData = $("#searchForm2").serialize();
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
        	 var formData = new FormData();
        	 formData.append('selected_casts',castVals);
         	formData.append('selected_religions',religionVals);
         	formData.append('selected_educations',educationVals);
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeTo",$("#rAgeTo").val());
        	 formData.append("rHeight",$("#rHeight").val());
        	 formData.append("rHeightTo",$("#rHeightTo").val());
        	 var t1 = $("#rMaritalStatus").val();
        	 var t2 = $("#rCaste").val();
        	 var t3 = $("#rReligion").val();
        	 formData.append("rMaritalStatus",$("#rMaritalStatus").val());
        	 formData.append("rReligion",$("#rReligion").val());
        	 formData.append("rCaste",$("#rCaste").val());
        	 formData.append("rMotherTongue",$("#rMotherTongue").val());
        	 /* formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val()); */
        	 formData.append("page_no",page);
        	 //var tempData = $("#searchForm2").serialize();
    		$.fn.makeMultipartRequest('POST', 'displayPage', false,
    				formData, false, 'text', function(data){
    			var jsonobj = $.parseJSON(data);
    			var results = jsonobj.results;
    			//$('#countId').html('');
	    		$("#search_criteria").prop("hidden",true);
	    		$('#searchresultsDiv').removeAttr("hidden");
	    		if(results==""){
	    			$('#countId').html('');
	    			$('#countId').html('0');
	    			var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    			$("#table_footer").prop("hidden",true);
	    			$("#altLists").prop("hidden",true);
	    		}else{
	    			paginationSetup(total_items_count);
	    			$("#altLists").asPaginator('enable');
	    			displayMatches(results);
	    			$("#table_footer").removeAttr("hidden");
	    			$("#altLists").removeAttr("hidden");
	    			displayTableFooter(page);
	    		}
    			
    		});
            
          }
        });
}
//displayPagination();
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

function hideChildren() {
	 var maritalStatus=$("#rMaritalStatus").val();
	 if(maritalStatus == "Unmarried"){
		 $("#haveChildrenId").hide();
		 $("#haveChildren").val();
	 }else{
		 $("#haveChildrenId").show();
	 }
	}
$(document).ready(function(){
	var selected_values = "${createProfile.rMaritalStatus}";
    $("#rMaritalStatus").val(selected_values.split(","));
    
    selected_values="";
    selected_values = "${createProfile.rCaste}";
    $("#rCaste").val(selected_values.split(","));
    
    selected_values="";
    selected_values = "${createProfile.rState}";
    $("#rState").val(selected_values.split(","));
    
    selected_values="";
    selected_values = "${createProfile.rEducation}";
    $("#rEducation").val(selected_values.split(","));
    
    selected_values="";
	selected_values = "${createProfile.rReligion}";
	$("#rReligion").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rMotherTongue}";
	$("#rMotherTongue").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rCountry}";
	$("#rCountry").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rWorkingWith}";
	$("#rWorkingWith").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rOccupation}";
	$("#rOccupation").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rDiet}";
	$("#rDiet").val(selected_values.split(","));
});

$(".searchPage").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>