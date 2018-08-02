<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%>
<%-- <html>
   <head>
   
   </head>

   <body>
      <c:redirect url = "/HomePage"/>
      <jsp:forward page="LoginHome"/> 
   </body>
</html> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Aarna Matrimony">
<meta name="author" content="Aarna Matrimony">

<title>Aarna Matrimony</title>
<link rel="shortcut icon" href="img/aarna-fav.png"/>

<!-- Bootstrap core CSS -->
<link href="${baseurl}/user/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">

<script src="${baseurl}/user/js/ie-emulation-modes-warning.js"></script>
<link href="${baseurl}/user/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="${baseurl}/user/vendor/woocommerce-FlexSlider/flexslider.css"
	type="text/css" media="screen" />
<link href="${baseurl}/user/css/style.css" rel="stylesheet">
<link href="${baseurl}/user/css/custom.css" rel="stylesheet">
 <link href="${baseurl}/css/datepicker1.css" rel="stylesheet" type="text/css" />
 
<link rel="stylesheet" type="text/css" href="${baseurl}/user/css/component.css" />

<style>
.modal {
    background: rgba(0,0,0,0.6);
}
.modal-header .close {
    margin-top: -40px !important;
}
.section-title {
margin-bottom:0px;}
.getquote .right-side { 
padding-top:2px;
}
 @media only screen and (max-width: 1280px) {
section.getquote {
    margin-top: 45px;
}} 
/* #myModal {
padding-top: 97px !important;
    display: block;
    padding-right: 16px;
    margin-top:0px !important;
} */
/* #myModal {
padding-top: 85px !important;
    display: block;
    padding-left: 66px !important;
    margin-top:0px !important;
} */
@media only screen and (max-width: 640px) and (min-width: 320px) {
   video {
    width: 100% !important;
    height: auto !important ;
     margin-top:0px !important;
}
.bannerposter {
display:block !important;
    padding-top: 51px;
}
.bannerposter1 {
display:none !important;
}
.slider-banner {
    margin-top: 0px; 
}
}
 video {
    width:450px ;
    height: 245px ;
    margin-top:-15px;
    
}


.regist {
    color: #fff !important;
    background: #05aada;
    padding: 10px 15px !important;
    border-radius: 10px;
    margin-top: 10px;
    margin-right: 15px;
}
.modal {
background:rgba(0,0,0,0.4);
}
.panel-heading {
    padding: 6px 15px;
    border-bottom: 1px solid transparent;
    border-top-right-radius: 3px;
    border-top-left-radius: 3px;
}
.about {
    position: relative;
    z-index: 0;
    clear: both;
    background-color: #f7f7f7;
}
#newmodal .modal-header .close {
    margin-top: -2px;
    margin: 10px;
    color: #fff;
    opacity: 1;
}
.newbody {
background:#2da3de;
color:#fff;
border-bottom-left-radius: 33px;
    border-bottom-right-radius: 33px;
}
.btn-danger {
width: 135px;
    padding: 8px;}
.modal-header h3 {
    color: #fff;
    font-size: 20px;
    font-weight: 400;
    padding: 10px 15px;
    text-transform: capitalize;
   margin-bottom:0px;
    line-height: 29px;
    border: none!important;
    width: 80%;
    margin-top: 0px;
    text-align: left;
}
.modal-header .close {
    margin-top: -31px;
}
.modal-backdrop {
    position: relative !important;
    }
    .modal-backdrop.in {
    opacity: 0;
    filter: alpha(opacity=50);
}
   td, th {
    padding: 0;
    text-align: left;
}
.modal-dialog {
	position: relative;
	width: auto;
	max-width: 60%;
	margin: 10px;
}

.modal-sm {
	max-width: 350px;
}

.modal-lg {
	max-width: 900px;
}



@media ( min-width : 768px) {
	.modal-dialog {
		margin: 30px auto;
	}
}

@media ( min-width : 320px) {
	.modal-sm {
		margin-right: auto;
		margin-left: auto;
	}
}

@media ( min-width : 620px) {
	.modal-dialog {
		margin-right: auto;
		margin-left: auto;
	}
	.modal-lg {
		margin-right: 10px;
		margin-left: 10px;
	}
}

@media ( min-width : 920px) {
	.modal-lg {
		margin-right: auto;
		margin-left: auto;
	}
}

.alert-success, .alert-warning, .alert-danger{color: white !important;}
.alert-success{background-color: #4CAF50 !important;}
.alert-warning{background-color: #ff6600 !important;}
.alert-danger{background-color: #d43f3a !important;}

.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}

.impColor{color:red;}

.edit, .delete, .active, .deactive {cursor: pointer;}

span.has-error,span.hasError
{
  font-weight: normal;
  border-color: #e73d4a;
  color:red;
  margin-top: -3px;
  display: block !important;
  position: absolute;
}
.dispnone
{
	display: none !important;
}
.dispblock
{
	display: block !important;
}



</style>
<script type="text/javascript">
window.setTimeout(function() {
    $(".msgcss").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
}, 5000);

 
</script>
</head>

<body id="page-top">

	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>

				<!-- Logo Here -->
				<a class="navbar-brand page-scroll" href="#page-top"><img
					src="images/logo01.png" style="width: auto;" alt="" class="img-responsive" /></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a  class="regist"   href="#register-info" data-toggle="modal" >Register</a>
					</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div id="register-info" class="modal modal fade" data-backdrop="static"
		data-keyboard="false">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">Set up your Account</h3>
					<button data-dismiss="modal"
						class="btn btn-sm btn-default close-btn">&times;</button>
				</div>
				<div class="modal-body">

					<form:form commandName="createProfile" action="#"  id="registration"  method="post" class="login-form">

						<div id="firstForm">

							<div class="form-group">
								<label for="user_name">Your Email-Id :</label> 
								<form:input	path="email" onkeydown="removeBorder(this.id)" class="form-control" placeholder="Email"/>
								<span class="hasError" id="emailError" style="font-size: 13px;"></span>
							</div>
							<div class="form-group">
								<label for="user_password">Create Password :</label> 
								<form:password path="password" class="form-control" onkeydown="removeBorder(this.id)"  placeholder="Password"/>
							</div>
							<div class="form-group">
								<label for="user_ssword">Create Profile for :</label> 
								<select	id="createProfileFor" name="createProfileFor" onfocus="removeBorder(this.id)" class="form-control">
									<option value="">Select</option>
									<option value="Self">Self</option>
									<option value="Son">Son</option>
									<option value="Daughter">Daughter</option>
									<option value="Brother">Brother</option>
									<option value="Sister">Sister</option>
									<option value="Friend">Friend</option>
									<option value="Relative">Relative</option>
								</select>
							</div>

							<div class="form-group">
								<div>
									<label class="radio-inline" for="radios-0">
									 <input	name="gender" id="radios-0" value="Male" checked="checked" type="radio"> Male
									</label>
									<label class="radio-inline" for="radios-1"> 
									 <input name="gender" id="radios-1" value="Female" type="radio"> Female
									</label>

								</div>
							</div>

							<div class="form-group">
								<button type="submit" id="submit11" class="btn btn-info btn-block">CONTINUE...</button>
							</div>
						</div>
						
						 <!--second step form-->
                                                
                                                <div style="display:none" id="secondForm">
                                                <h4 style="margin-bottom:20px;">Great, Now some basic details </h4>
                                                 <div class="row">
                                                 <div class="form-group">
                                                    <label for="" class="col-md-12" >Your Name</label>
                           <div class="col-md-6"><input type="text" name="firstName" onkeydown="removeBorder(this.id)" class="form-control onlyCharacters" id="firstName" placeholder="First Name"></div>
                           <div class="col-md-6"><input type="text" name="lastName" onkeydown="removeBorder(this.id)" class="form-control onlyCharacters" id="lastName" placeholder="Last Name"></div>
                           <div class="clearfix"></div>
                                                </div>
                                                </div>
                                                
                                               <div class="form-group">
                                               <div  class="row">
                                                    <label for="" class="col-md-12" >Date of Birth</label>
                           <div class="col-md-12"><input type="text" name="dob" onclick="removeBorder(this.id)" class="form-control" id="dob" placeholder="Select Date of Birth" readonly="readonly"></div>
                                                </div> 
                                                </div>
                                                
                                                
                                               <div class="form-group">
                                                    <label for="">Religion</label>
                          				<form:select path="religion" onfocus="removeBorder(this.id)" onchange="getReliginCastAjax()" class="form-control" >
														<form:option value="">-- Choose Religion --</form:option>
														<form:options items="${religion}"></form:options>
										</form:select>
                                                </div>
                                                
                                                 <div class="form-group">
                                                    <label for="">Mother Tongue</label>
                        				 <form:select path="motherTongue" onfocus="removeBorder(this.id)"  class="form-control" >
														<form:option value="">-- Choose Mother Tongue --</form:option>
														<form:options items="${language}"></form:options>
										</form:select>
                                                </div> 
                                                
                                                <div class="form-group">
                                                    <label for="">Where do you live? </label>
                          				 <form:select path="currentCountry" onfocus="removeBorder(this.id)"  class="form-control" >
														<form:option value="">-- Choose Country --</form:option>
														<form:options items="${countries}"></form:options>
										</form:select>
                                                </div> 
                                                 <div class="form-group">
                                                 <input type="button" id ="secondButton" value="SIGNUP..." class="btn btn-info btn-block" />
<!--                                                     <button type="button"  id ="secondButton" onclick="submit();" class="btn btn-info btn-block">SIGNUP...</button> -->
                                                </div>
                                                
                                                </div>
                                                <!--second form end here-->
						
					</form:form>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>



<div class="clearfix"></div><!-- <div class="bannerposter" style="display:none;"><img class="img-responsive" src="img/bannerposter1.jpg" style="width:100%;"  /></div> -->
	<!-- Slider -->

	<section class="slider-banner">
		<div class="container-fluid">
			<div class="row">
				<!-- Place somewhere in the <body> of your page -->
				<div class="flexslider">
					<ul class="slides">
						<li><img src="user/images/banner1.jpg" alt="Slider Picture 1" /></li>
						<li><img src="user/images/banner2.jpg" alt="Slider Picture 2" /></li>
						<!-- <li><img src="user/images/banner3.jpg" alt="Slider Picture 3" /></li> -->
						<li><img src="user/images/banner4.jpg" alt="Slider Picture 4" /></li>
						<li><img src="user/images/banner5.jpg" alt="Slider Picture 5" /></li>
					</ul>
				</div>
			</div>
		</div>
	</section>
<div class="clearfix"></div><!-- <div class="bannerposter1"><img class="img-responsive" src="img/bannerposter1.jpg" style="width:100%;"  /></div> -->
	<section class="darkSection">
		<div class="container">
			<div class="searchbg">
				<form role="form" class="form-inline">
					<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<select id="rPeople" class="custom-select col-md-12 form-control">
								<option value="" selected>I am Looking for... &nbsp;&nbsp;</option>
								<option value="FeMale" id="id1">Bride</option>
								<option value="Male" id="id2">Groom</option>
							</select>
						</div>
						<div class="form-group">
							<select id="rAgeFrom" name="rAgeFrom" class="custom-select col-md-12 form-control">
								<option value="" selected>Age from... &nbsp;&nbsp;</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
									<option value="32">32</option>
									<option value="33">33</option>
									<option value="34">34</option>
									<option value="35">35</option>
									<option value="36">36</option>
									<option value="37">37</option>
									<option value="38">38</option>
									<option value="39">39</option>
									<option value="40">40</option>
									<option value="41">41</option>
									<option value="42">42</option>
									<option value="43">43</option>
									<option value="44">44</option>
									<option value="45">45</option>
									<option value="46">46</option>
									<option value="47">47</option>
									<option value="48">48</option>
									<option value="49">49</option>
									<option value="50">50</option>
							</select>
						</div>
						<div class="form-group">&nbsp;&nbsp; to &nbsp;&nbsp;</div>
						<div class="form-group">
							<select id="rAgeTo" name="rAgeTo" class="custom-select col-md-12 form-control">
								<option value="" selected>Age upto... &nbsp;&nbsp;</option>
							</select>
						</div>
						<div class="form-group">
							<!-- <select class="custom-select col-md-12 form-control">
								<option selected>of Religion.... &nbsp;&nbsp;</option>
								<option value="1">Hindu</option>
								<option value="2">Muslim</option>
								<option value="3">Christian</option>
							</select> -->
							<form:select path="religion" id="religionId" onchange="getReliginCastAjax1();" class="custom-select col-md-12 form-control">
								<form:option value="">of Religion.... &nbsp;&nbsp;</form:option>
								<form:options items="${religion}"></form:options>
							</form:select>
						</div>
						<div class="form-group">
							<!-- <select class="custom-select col-md-12 form-control">
								<option selected>of Caste.... &nbsp;&nbsp;</option>
								<option value="1">Kamma</option>
								<option value="2">Kapu</option>
								<option value="3">Brahmin</option>
							</select> -->
							<form:select path="cast" id="castId" class="custom-select col-md-12 form-control">
								<form:option value="">of Caste.... &nbsp;&nbsp;</form:option>
<%-- 								<form:options items="${cast}"></form:options> --%>
							</form:select>
						</div>
						<div class="form-group">
							<button type="button" id="submit12" class="btn btn-danger" onclick="searchSubmit();">Search</button>
						</div>
					</div>
					</div>
				</form>
			</div>
		</div>
	</section>


	<!-- Get a quote Section -->

	<section class="getquote" id="getquote">
		<!-- Section id-->
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-5 col-md-push-8 col-sm-push-7">
					<div class="right-side dispnone">
						<div class="section-title white-section">
							<h1>Login</h1>
							<img src="user/images/line-01.jpg" alt="" />
						</div>
						
						

<!-- Modal -->
 <!-- <div id="myModal" class="modal fade" role="dialog" style="  margin-top:55px;">
  <div class="modal-dialog">
    <div class="modal-content">		
      <div class="modal-header" style="background:#099cca; color:#fff;">
        <button type="button" style="color:#fff !important; margin-right:10px; opacity:1;" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body" style="padding:0px !important;">
      	<img src="img/bannerposter.jpg" class="img-responsive"/> 
      </div>
    </div>

  </div>
</div>		 	 -->

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" style="  margin-top:55px;">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">		
      <div class="modal-header" style="background:#099cca; color:#fff;"> <h3>Your Search Results</h3>
        <button type="button" style="color:#fff !important; margin-right:10px; opacity:1;" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
      	<div class="searchresults">
								   
								    
									<div id="searchResults">

									</div>
								</div>    
      </div>
    </div>

  </div>
</div>	
						
<script>

function searchSubmit(){
	var rPeople= $('#rPeople').val();
	var rAgeFrom= $('#rAgeFrom').val();
	var rAgeTo= $("#rAgeTo").val();
	if(rAgeFrom > rAgeTo){
		alert("Sorry, Invalid Age range");
		return false;
	}
    if(rPeople == ""){
	alert("Are You Looking For...");
	return false;
	}
    else
	{
// 	var Female= $('#id1').val();
// 	var Male= $('#id2').val();
	var people= $('#rPeople').val();
	var rAgeFrom= $('#rAgeFrom').val();
	var rAgeTo= $("#rAgeTo").val();
	var religion= $('#religionId').val();
	var castId= $('#castId').val();
	var gender="";
       	if(people != $('#id2').val() ){
       		gender="Female";
	    }else
	    {
		   gender="Male";
	   }
	
		var formData = new FormData();
		formData.append("gender",gender);
		formData.append("rAgeFrom",rAgeFrom);
		formData.append("rAgeTo",rAgeTo);
		formData.append("religionId",religion);
		formData.append("castId",castId);
	$.fn.makeMultipartRequest('POST', 'homePageSearchResults', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.searchListOrders;
		displaydata(alldata);
		$('#myModal').modal('show');
	});
		
}
} 


function displaydata(data) {
	
      if(data == ""){
         $('#searchResults').empty();	  
              var tblHistory='<td colspan="7" style="text-align:center;">No History Found<span></span></td>';
              $(tblHistory).appendTo("#searchResults");
          	
 
      }

	$.each(data,function(i, orderObj) {
		var profile_highlisht_str = '<div class="panel panel-default">';
		var highlight_option = orderObj.profile_highlighter;
		if(typeof highlight_option != "undefined" && highlight_option=='1'){
			profile_highlisht_str = '<div class="panel panel-default" style="background-color:skyblue">';
		}
		var tblRow = profile_highlisht_str
		+ '<div class="panel-heading">'
		+ '<h5 class="panel-title" style="text-align:left;">'
		+ '<div class="form-check">	<label class="form-check-label"> <input type="checkbox" class="form-check-input" placeholder=""> '+orderObj.firstName+'&nbsp;'+orderObj.lastName+'</label>	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span></div>'
		+ '</h5>'
		+ '</div>'
		+ '<div class="panel-body">'
		+ '<div class="col-md-2">' 
		+ '<a href="#" onclick="regFunction()">  <img src="img/default.png" class="img img-responsive thumbnail " style="margin-bottom:0;height: auto;width: 100%;"></a>'
    	+ '</div>'
    	 + '<div class="col-md-4">'
     	 + '<h2 style="margin-top:10px;" class="pull-right"><a href="#" data-toggle="tooltip" data-placement="bottom" title="View Mobile Number" ><img style="margin-top:-10px;" > &nbsp;</a></h2></span><div class="clearfix"></div><blockquote style="min-height:100px; max-height:120px; "><p>'+orderObj.About+'</p><br><a href="#" onclick="regFunction()"><p style="float:right;">...more</p></a></blockquote>'
     	+ '</div>' 
     	+  '<div class="col-md-1"></div>'
    	+ '<div class="col-md-5">'
		+ '<table><tbody><tr><td width="150px">Age</td><td><span>: '+orderObj.age+'yrs</span></td></tr>'
		+ '<tr><td>Religion</td><td><span>: '+orderObj.religionName+'</span></td></tr>'	
		+ '<tr><td>Community</td><td><span>: '+orderObj.castName+'</span></td></tr>'
		+ '<tr><td>Location</td><td><span>: '+orderObj.cityName+'</span></td></tr>'
		+ '<tr><td>Education</td><td><span>: '+orderObj.Education+'</span></td></tr>'
		+ '<tr><td>Profession</td><td><span>: '+orderObj.Profession+'</span></td></tr></tbody></table>'
    	+ ' <a href="#" onclick="regFunction()"><button class="btn btn-warning">View Full Profile</button></a>'
    	+ '</div>'
    	+ '</div>' 
    	+ '</div>' 
    	+ '</div>'
    	+ '</div>';
			$(tblRow).appendTo("#searchResults");
    	 

		
		
		
		
	});
}



function regFunction(){
	$('#myModal').modal('hide');
	$('#register-info').modal('show');
// 	$('#register-info').show();
	
	
}
function getReliginCastAjax1() {
	var religionId = $("#religionId").val();
		var formData = new FormData();
		formData.append("religionId",religionId);
	$.fn.makeMultipartRequest('POST', 'castesBasedOnReligion', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		/* if(alldata == "" ){
		$("#rCaste").select2('val','');
	} */
		var optionsForClass = "";
		optionsForClass = $("#castId").empty();
		optionsForClass.append(new Option("of Caste....", ""));
		$.each(alldata, function(i, tests) {
			var id=tests.id;
			var casteName=tests.name;
			optionsForClass.append(new Option(casteName, id));
		});
		
	});
}

</script>
						<div class="quote-form row">
							<!-- contact form -->
							<form class="" action="loginAction" id="quote" name="quote" method="post" onsubmit="return loginSubmit()">
								<c:if test="${not empty msg}">
									<div class="form-group col-md-12" style="margin-bottom: 0px;">
										<div class="msgcss fadeIn animated alert alert-danger">${msg}</div>
									</div>
								</c:if>
								<div class="form-group col-md-12">
									<input type="text" class="form-control" onkeydown="removeBorder(this.id)" name="userName" id="userName" placeholder="Username">
								</div>

								<div class="form-group col-md-12">
									<input type="password" class="form-control"  onkeydown="removeBorder(this.id)" name="password" id="password" placeholder="Password" >
								</div>

								<div class="form-group col-md-12">
									<button name="submit" type="submit" id="userLoginButton" class="btn btn-default">Login</button>
								</div>
								<div class="form-group col-md-12">
									<a href="forgotPassword" style="color:white">Forgot Password</a>
								</div>
							</form>
						</div>
					</div>
				</div>

			
			</div>
		</div>
	</section>




	<!-- Services Section -->

	<section class="services" id="services">
		<!-- Section id-->
		<div class="container">

			<div class="row">

				<div class="col-md-3 col-sm-6">
					<div class="ser-block">
						<p class="ser-icon">
							<i class="flaticon-consulting-message"></i>
						</p>
						<h4>CREATE ACCOUNT</h4>
						<hr>
						<p class="content">Register for free & put up your Profile.</p>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="ser-block">
						<p class="ser-icon">
							<i class="flaticon-shopping-support-online"></i>
						</p>
						<h4>SEARCH PROFILES</h4>
						<hr>
						<p class="content">Select & Connect with Matches you like.</p>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="ser-block">
						<p class="ser-icon">
							<i class="flaticon-group-meeting"></i>
						</p>
						<h4>SEND INTEREST</h4>
						<hr>
						<p class="content">Become a Premium Member & Start a
							Conversation.</p>
					</div>
				</div>

				<div class="col-md-3 col-sm-6">
					<div class="ser-block">
						<p class="ser-icon">
							<i class="flaticon-people"></i>
						</p>
						<h4>GET MARRIED</h4>
						<hr>
						<p class="content">Become a Premium Member & Start a
							Conversation.</p>
					</div>
				</div>

			</div>
		</div>
	</section>



	<!-- About Section -->

	<section class="about clearfix" id="about">
		<!-- Section id-->
		<div class="container">
			<div class="row">

				<div class="col-md-12 col-sm-12">
					<div class="section-title">
						<h1>SEARCH PROFILES BY</h1>
						<img src="user/images/line-02.jpg" alt="" />
					</div>
					<div class="row">
						<div class="about-content linkss">

							<div class="col-md-3">

								<table class="table table-bordered table-hover table-condensed">
									<tr>
										<td><a href="#">Hindu<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Muslim <span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Christian<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Jains<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
								</table>

							</div>
							<div class="col-md-3">
								<table class="table table-bordered table-hover table-condensed">
									<tr>
										<td><a href="#">Brahmin<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Vasya <span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Kamma<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Kaapu<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
								</table>

							</div>
							<div class="col-md-3">
								<table class="table table-bordered table-hover table-condensed">
									<tr>
										<td><a href="#">Hindu<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Muslim <span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Christian<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Jains<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
								</table>

							</div>
							<div class="col-md-3">
								<table class="table table-bordered table-hover table-condensed">
									<tr>
										<td><a href="#">Hindu<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Muslim <span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Christian<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
									<tr>
										<td><a href="#">Jains<span><i
													class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
									</tr>
								</table>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- Testimonials Section -->

	<section class="testimonials" id="testimonials">
		<!-- Section id-->
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="section-title white-section center-text">
						<h1>RECENT SUCCESS STORIES</h1>
						<img src="user/images/line-01.jpg" alt="" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div>
						<!---->
						<!-- Carousel items -->
						<div class="container">
							<ul class="grid cs-style-5">
								<li>
									<figure>
										<img src="user/images/portfolio/01-thumbnail.jpg"
											class="img-responsive img-thumbnail" alt="">
										<figcaption>
											<h3>Krishna& Gopika</h3>
											<span>June 9, 2017</span> <a href="successStory#01-thumbnail.jpg">read more...</a>
											<h3>Bride Name & Groom Name</h3>
											<span>June 9, 2017</span> <a href="successStory&divId=1">read more...</a>
										</figcaption>
									</figure>
								</li>
								<li>
									<figure>
										<img src="user/images/portfolio/02-thumbnail.jpg"
											class="img-responsive img-thumbnail" alt="">
										<figcaption>
											<h3>Kishore & Vijaya</h3>
											<span>April 28, 2017</span> <a href="successStory#02-thumbnail.jpg">read more...</a>
											<h3>Bride Name & Groom Name</h3>
											<span>June 9, 2017</span> <a href="successStory&divId=2">read more...</a>
										</figcaption>
									</figure>
								</li>
								<li>
									<figure>
										<img src="user/images/portfolio/03-thumbnail.jpg"
											class="img-responsive img-thumbnail" alt="">
										<figcaption>
											<h3>Srinivas&Lavanya</h3>
											<span>May 2, 2017</span> <a href="successStory#03-thumbnail.jpg">read more...</a>
											<h3>Bride Name & Groom Name</h3>
											<span>June 9, 2017</span> <a href="successStory&divId=3">read more...</a>
										</figcaption>
									</figure>
								</li>
							</ul>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	
	


	<footer class="footer" id="footer">
		<!-- Section id-->
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-3">
					<div class="logo-footer">
						<img src="images/logo01.png" alt="" class="img-responsive" />
					</div>
				</div>
				<div class="col-md-3 col-sm-3">
				<video poster="user/images/bgvideo.jpg"  controls src="user/images/Aarna Matrimony for Best Mate ,Together Forever.mp4" type="video/mp4">
</video>
				
				</div>
				<div class="col-md-6 col-sm-6">
					<div class="contact-info">
						<h5>Our Office</h5>
						<p class="fs-12 address">
							<i class="fa fa-map-marker"></i>D.No.35, Church Complex,<br>
							                                Nirmala Convent Road,
							                                Benz Circle, VIJAYAWADA.
						</p>
						<p class="fs-12">
							<i class="fa fa-phone"></i>+91 9440585588
						</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6">
					<div class="social">
						<ul class="list-inline">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 col-sm-6">
					<div class="contact-info">
						<p class="email-add">
							<span>Email:</span> info@aarnamatrimony.com
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright clearfix">
			<div class="">
				<p class="copy">Copyright 2017 | All Rights Reserved</p>
			</div>
		</div>
	</footer>
<div id="newmodal" class="modal fade">
    		<div class="modal-dialog">
        <div class="modal-content" style="margin-top:50px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title grademember">Upgrade Membership</h2>
            </div>
            <div class="modal-body newbody col-md-12">
				<div class="col-md-5"><img src="${baseurl}/images/up.png" class="img-responsive"/></div>
				<div class="col-md-7">
				<p style="color:#b7f528;">Start Contracting Matches</p>
				<p><i class="fa fa-phone"></i> View Phone Numbers </p>
				<p> <i class="fa fa-comment"></i> Chat Instantly</p>
				 <div class="clearfix"></div>
				 <p><i  class="fa fa-envelope"></i> Send Personalized Images</p>
				 <p> &nbsp; &nbsp; &nbsp; Upto <span class="fa fa-inr"></span> 2000 off</p>
				 <p> &nbsp; &nbsp; &nbsp; On Classic Packages</p><br>
				 <span class="btn btn-warning" align="center" h><a href="memberShipPage" >Upgrade Now </a><i class="fa fa-chevron-right"></i></span>
				 </div>
            </div>
        </div>
    		</div>
				</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>


<script>

function loginSubmit(){
	 var userName = $('#userName').val().trim();
	 var password1 = $('#quote input[name="password"]').val().trim();
	 if(userName==""){
		$("#userName").attr("required", "true");	
		return false;
	} else if(password1==""){
		$('#quote input[name="password"]').attr("required", "true");	
		return false;
	}
	 else {
		$("#userLoginButton").attr("disabled",true);
		$("#userLoginButton").html("Please wait...");		
		return true;
	}

}
/* $(window).load(function(){        
	   $('#myModal').modal();
	    });
	     */
	    </script>

	<script src="${baseurl}/user/vendor/jquery/jquery.min.js"></script>
	<script src="${baseurl}/user/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${baseurl}/user/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${baseurl}/user/vendor/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="${baseurl}/user/vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="${baseurl}/user/js/theme.js"></script>
	<script src="${baseurl}/user/js/custom.js"></script>
	 <script src="${baseurl}/js/jquery.blockUI.min.js"></script>
	<script src="${baseurl}/user/vendor/woocommerce-FlexSlider/jquery.flexslider.js"></script>
	<script src="${baseurl}/user/js/modernizr.custom.js"></script>
	<script src="${baseurl}/user/js/toucheffects.js"></script>
<script src="${baseurl}/js/custemValidation1.js"></script>
<script src="${baseurl}/js/ajax.js"></script>
<script src="${baseurl}/js/jquery-ui.min.js"></script>
<script type="text/javascript">
/* $( document ).ready(function() {
	$("#dob").datepicker({
	    yearRange:"-100:-18",
	    //changeDate : true,
		changeMonth : true,
		changeYear : true,
	 	maxDate :new Date(),
	 	defaultDate: new Date()
//		yearRange: '1950:' + ss
	});
}); */
var ss =new Date().getFullYear()-18;
 $("#dob").datepicker({
    dateFormat: "dd-MM-yy",
    changeDate : true,
	changeMonth : true,
	changeYear : true,
// 	maxDate :0,
	yearRange: '1964:' + ss,
	 defaultDate: '01-January-1964'
}); 

  



$(function(){
	$(".right-side").removeClass("dispnone");
});

var emailExist = false;
// var validEmail = false;
var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
$('#email').blur(function() {
	var email = $('#email').val();
	if(email == "" || email == null || email == "undefined")
	{
		$("#email").css("border-color","#e73d4a");
    	$("#email").attr("placeholder","Email");
    	$('#email').css('color','red');
	}
	if(email != "" && !email.match(expr)){
// 		alert("Please Enter Valid Email");
    	$("#email").css("border-color","#e73d4a");
    	$("#email").attr("title","Email-ID");
    	$('#email').css('color','red');
    	$('#emailError').text("Enter Valid Email-ID.");
//     	$('#email').focus();
		return false;
	}
	else{
		$('#emailError').text("");
	}
	if(email !=null && email != "" && email !="undefined"){
	var formData = new FormData();
    formData.append('email', email);
	$.fn.makeMultipartRequest('POST', 'emailChecking', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		if(jsonobj.msg =="exist"){
			//error message write
			$('#emailError').text("Email already in Use. Please Try Another.");
			emailExist = true;
		}else{
			$('#emailError').text("");
			emailExist = false;
		}
	});
	}
});
$('#createProfileFor').blur(function() {
	var createProfileFor = $('#createProfileFor').val();
	if(createProfileFor == "" || createProfileFor.length == 0 || createProfileFor =="undefined"){
// 		alert("enter createdby");
    $("#createProfileFor").css("border-color","#e73d4a");
    $('#createProfileFor').css('color','red');
		return false;
	}
});
$('#password').blur(function() {
	var password = $('#password').val();
	if(password == "" || password.length == 0 || password =="undefined"){
// 		alert("enter password");
    $("#password").css("border-color","#e73d4a");
    $('#password').css('color','red');
		return false;
	}
});




$("#submit11").click(function(event){		
	var email = $('#email').val();
	if($('#email').val() ==  null || $('#email').val() == "" || $('#email').val()=="undefined" || 
		$('#createProfileFor').val() ==  null || $('#createProfileFor').val() == "" || $('#createProfileFor').val()=="undefined" ||
		$('#password').val() ==  null || $('#password').val() == "" || $('#password').val()=="undefined")
	{
		if($('#email').val() ==  null || $('#email').val() == "" || $('#email').val()=="undefined") 
		{
			$("#email").css("border-color","#e73d4a");
			$("#email").attr("placeholder","Email");
			$('#email').addClass('your-class');
			$('#email').css('color','red');
		}
		if($('#createProfileFor').val() ==  null || $('#createProfileFor').val() == "" || $('#createProfileFor').val()=="undefined" ) 
		{
			$("#createProfileFor").css("border-color","#e73d4a");
// 			$("#createProfileFor").attr("placeholder","Please Enter createProfileFor");
			$('#createProfileFor').addClass('your-class');
			$('#createProfileFor').css('color','red');
		}
		if($('#password').val() ==  null || $('#password').val() == "" || $('#password').val()=="undefined" ) 
		{
			$("#password").css("border-color","#e73d4a");
			$("#password").attr("placeholder","Password");
			$('#password').addClass('your-class');
			$('#password').css('color','red');
		}		
		return false;
	}
	if(email != "" && !email.match(expr)){
// 		alert("Please Enter Valid Email");
    	$("#email").css("border-color","#e73d4a");
    	$("#email").attr("title","Email-ID");
    	$('#email').css('color','red');
    	$('#email').focus();
		return false;
	}
	if(emailExist){
		//alert("exist");
		return false;
	}
 	$("#firstForm").hide();
	$('#secondForm').css({'display':'block'});
// 		$("#registration").submit();
 
	event.preventDefault();
});
$("#secondButton").click(function(event)
// 		function formSubmit()
		{		
			if($('#firstName').val() ==  null || $('#firstName').val() == "" || $('#firstName').val()=="undefined" || 
				$('#lastName').val() ==  null || $('#lastName').val() == "" || $('#lastName').val()=="undefined" ||
				$('#dob').val() ==  null || $('#dob').val() == "" || $('#dob').val()=="undefined"  || 
				$('#religion').val() ==  null || $('#religion').val() == "" || $('#religion').val()=="undefined" ||
				$('#motherTongue').val() ==  null || $('#motherTongue').val() == "" || $('#motherTongue').val()=="undefined" ||
				$('#currentCountry').val() ==  null || $('#currentCountry').val() == "" || $('#currentCountry').val()=="undefined" )
			{
				if($('#firstName').val() ==  null || $('#firstName').val() == "" || $('#firstName').val()=="undefined") 
				{
					$("#firstName").css("border-color","#e73d4a");
					$("#firstName").attr("placeholder","First Name");
					$('#firstName').addClass('your-class');
					$('#firstName').css('color','red');
				}
				if($('#lastName').val() ==  null || $('#lastName').val() == "" || $('#lastName').val()=="undefined" ) 
				{
					$("#lastName").css("border-color","#e73d4a");
					$("#lastName").attr("placeholder","Last Name");
					$('#lastName').addClass('your-class');
					$('#lastName').css('color','red');
				}
				if($('#dob').val() ==  null || $('#dob').val() == "" || $('#dob').val()=="undefined" ) 
				{
					$("#dob").css("border-color","#e73d4a");
					$("#dob").attr("placeholder","Select Date Of Birth");
					$('#dob').addClass('your-class');
					$('#dob').css('color','red');
				}
				if($('#religion').val() ==  null || $('#religion').val() == "" || $('#religion').val()=="undefined" ) 
				{
					$("#religion").css("border-color","#e73d4a");
					$("#religion").attr("placeholder","Enter Password");
					$('#religion').addClass('your-class');
					$('#religion').css('color','red');
				}
				if($('#motherTongue').val() ==  null || $('#motherTongue').val() == "" || $('#motherTongue').val()=="undefined" ) 
				{
					$("#motherTongue").css("border-color","#e73d4a");
					$("#motherTongue").attr("placeholder","Enter Password");
					$('#motherTongue').addClass('your-class');
					$('#motherTongue').css('color','red');
				}
				if($('#currentCountry').val() ==  null || $('#currentCountry').val() == "" || $('#currentCountry').val()=="undefined" ) 
				{
					$("#currentCountry").css("border-color","#e73d4a");
					$("#currentCountry").attr("placeholder","Enter Password");
					$('#currentCountry').addClass('your-class');
					$('#currentCountry').css('color','red');
				}
				return false;
			}
			
// 		 	$("#firstForm").css({'display':'none'})
// 			$('#secondForm').css({'display':'block'});
//		 		$("#registration").submit();
		 $('#registration').attr('action',"userRegistration");
			$("#registration").submit();											
			event.preventDefault();	
		}
		);


		function removeBorder(el){	
			  $("#"+el).css("border", ""); 	
			  $("#"+el).css('color','black');
			  $('#'+el).addClass('default-class');
		}
		$('#rAgeFrom').change(function() {
			$('#rAgeFromTo').val('');
			var val = $(this).val();
			$('#rAgeTo').find('option').not(':first').remove();
			if(val!=''){
			val=(val-0)+1;
			for (var i = val; i <= 50; i++) {
				$("#rAgeTo").append('<option>' + i + '</option>');
			}
			}
		});
		
		
// 		$( document ).ready(function() {
// 		    $("img").on("contextmenu",function(){
// 		       return false;
// 		    }); 
// 		});
</script>
</body>
</html>
