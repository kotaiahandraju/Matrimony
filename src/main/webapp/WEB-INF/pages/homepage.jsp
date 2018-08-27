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
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="keywords" content="">
<link href="${baseurl}/user/css/style.css" rel="stylesheet">
<link href="${baseurl}/user/css/custom.css" rel="stylesheet">
 <link href="${baseurl}/css/datepicker1.css" rel="stylesheet" type="text/css" />
 
<link rel="stylesheet" type="text/css" href="${baseurl}/user/css/component.css" />

<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/ncss/bootstrap-glyphicons.css" rel="stylesheet"> -->
<link rel="shortcut icon" href="fav-icon.png" type="image/x-icon"/>
<link rel="shortcut icon" href="fav-icon.png" type="image/x-icon">
<link rel="icon" href="fav-icon.png" type="image/x-icon">
 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<style>
.img-replace {
  /* replace text with an image */
  display: inline-block;
  overflow: hidden;
  text-indent: 100%; 
  color: transparent;
  white-space: nowrap;
}
.bts-popup {
  position: fixed;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  opacity: 0;
  visibility: hidden;
  -webkit-transition: opacity 0.3s 0s, visibility 0s 0.3s;
  -moz-transition: opacity 0.3s 0s, visibility 0s 0.3s;
  transition: opacity 0.3s 0s, visibility 0s 0.3s;
}
.bts-popup.is-visible {
  opacity: 1;
  visibility: visible;
  -webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
  -moz-transition: opacity 0.3s 0s, visibility 0s 0s;
  transition: opacity 0.3s 0s, visibility 0s 0s;
    z-index:999;
}

.bts-popup-container {
  position: relative;
  width: 80%;
  margin: 4em auto;
/*   background: rgba(255,255,255,0.7) !important; */
  border-radius: none; 
  text-align: center;
/*   box-shadow: 0 0 2px rgba(0, 0, 0, 0.2); */
  -webkit-transform: translateY(-40px);
  -moz-transform: translateY(-40px);
  -ms-transform: translateY(-40px);
  -o-transform: translateY(-40px);
  transform: translateY(-40px);
  /* Force Hardware Acceleration in WebKit */
  -webkit-backface-visibility: hidden;
  -webkit-transition-property: -webkit-transform;
  -moz-transition-property: -moz-transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  -moz-transition-duration: 0.3s;
  transition-duration: 0.3s;
}
.bts-popup-container img {
  padding: 0px 0 0 0;
}
.bts-popup-container p {
	color: white;
  padding: 10px 40px;
}
.bts-popup-container .bts-popup-button {
  padding: 5px 25px;
  border: 2px solid white;
	display: inline-block;
  margin-bottom: 10px;
}

.bts-popup-container a {
  color: white;
  text-decoration: none;
  text-transform: uppercase;
}






.bts-popup-container .bts-popup-close {
  position: absolute;
 top: -25px;
    right: 83px;
  width: 30px;
  height: 30px;
}
.bts-popup-container .bts-popup-close::before, .bts-popup-container .bts-popup-close::after {
  content: '';
  position: absolute;
  top: 12px;
  width: 16px;
  height: 3px;
  background-color: white;
}
.bts-popup-container .bts-popup-close::before {
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -o-transform: rotate(45deg);
  transform: rotate(45deg);
  left: 8px;
}
.bts-popup-container .bts-popup-close::after {
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -ms-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  transform: rotate(-45deg);
  right: 6px;
  top: 13px;
}
.is-visible .bts-popup-container {
  -webkit-transform: translateY(0);
  -moz-transform: translateY(0);
  -ms-transform: translateY(0);
  -o-transform: translateY(0);
  transform: translateY(0);
}
@media only screen and (min-width: 1170px) {
  .bts-popup-container {
    margin: 8em auto;
  }
}
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
.bts-popup-container { 
margin-top:80px;
}
.bts-popup-container .bts-popup-close {
    position: absolute;
    top: -25px;
    right: 29px;
    width: 30px;
    height: 30px;
}
.flexslider {
margin-top:51px;}
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
    <title>Aarna Matrimony</title>

    <!-- Styles -->
    <link href="ncss/app.css" rel="stylesheet">
	  
	    <link rel="stylesheet" type="text/css" href="ncss/style.css"/>   
<link rel="stylesheet" type="text/css" href="ncss/responsive.css"/>  		
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <!-- Scripts -->


<!-- <script src="../code.jquery.com/jquery-1.11.3.min.js"></script> -->

<script>

$('img').bind('contextmenu', function(e) {
    return false;
}); 
</script>
  

<!--Start of Zendesk Chat Script-->
<script type="text/javascript">
window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute("charset","utf-8");
$.src="";z.t=+new Date;$.
type="text/javascript";e.parentNode.insertBefore($,e)})(document,"script");
</script>
<!--End of Zendesk Chat Script-->
	
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid welcome header">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#welcome">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#stayhere"><img src="nimages/logo (1).png" alt="Aarna Matrimony"></a>
    </div>
	
	
    <div class="collapse navbar-collapse" id="welcome">
	
     
      <ul class="nav navbar-nav navbar-right">
       
       
       <!-- 	<form class="" action="loginAction" id="quote" name="quote" method="post" onsubmit="return loginSubmit()">
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
 -->



					<form class="form-inline" action="loginAction" id="quote" name="quote" method="post" onsubmit="return loginSubmit()">
						<c:if test="${not empty msg}">
							<div class="form-group col-md-12" style="margin-bottom: 0px;">
								<div class="msgcss fadeIn animated alert alert-danger">${msg}</div>
							</div>
						</c:if>

						<input type="hidden" name="_token" value="">

						<div class="form-group">
<a  class="regist"   href="#register-info" data-toggle="modal" >Register</a></div>
	<div class="form-group">
							<!--                                 <input id="email" type="email" class="form-control" name="email" value="" required placeholder="Email Address"> -->
							<input type="text" class="form-control" onkeydown="removeBorder(this.id)" name="userName" id="userName" placeholder="Username">
						</div>
						<div class="form-group">
							<!--                                 <input id="password" type="password" class="form-control" name="password" required placeholder="Password"> -->
							<input type="password" class="form-control" onkeydown="removeBorder(this.id)" name="password" id="password" placeholder="Password">
						
						
						</div>





						<div class="form-group">

							<!--                                 <button type="submit" class="btn btn-primary"> -->
							<!--                                     Log In -->
							<!--                                 </button> -->
							<button name="submit" type="submit" id="userLoginButton"
								class="btn btn-primary">Login</button>
						</div>


						<div class="form-group">
						<a href="forgotPassword" style="">Forgot Password</a>
<!-- 						<a class="btn btn-link" href="#stayhere"> Forgot Password </a> -->
						
						</div>

					</form>

				</ul>
	 <!--  <span class="header-phone">+91 9440585588</span> -->
    </div>
  </div>
</nav>
    <div id="slider">

<div class="container-fluid slider-container">
<img src="nimages/ban1.jpg" alt="Aarna India">

</div>
 </div>
</div>

<div id="search">
<div class="container">
<div class="heading">
<h3>Profile Search</h3>
</div>
<div class="row search-box">
<div class="col-md-12 search search-link">
<a href="#stayhere" class="btn btn-primary">SEARCH</a>
</div>
</div>
</div>
</div>

<div id="recent-profile">
<div class="container">
<div class="row">

<div class="heading">
<h3> LASTEST BRIDES & GROOMS</h3>
</div>


 <div class="col-md-2"> 
<div class="pro_img">
<a href="LoginHomeNew">

	
	<span class="hidden"> </span>

    
 	<div class="image_privacy">  </div>
<image src="nimages/p1.png" width="250">
	
     
	
   


</a></div>
<div class="pro_details">
Matri ID : 21022 <br>
<span>Hindu</span>
<br>
Tenali, Andhra Pradesh
</div>
 
						
						
</div>
 <div class="col-md-2"> 
<div class="pro_img">
<a href="LoginHomeNew">

	
	<span class="hidden"> </span>

    
 	<div class="image_privacy">  </div>
<image src="nimages/p2.png" width="250">
	
     
	
   


</a></div>
<div class="pro_details">
Matri ID : 21020 <br>
<span>Hindu</span>
<br>
Tullur, Andhra Pradesh
</div>
 
						
						
</div>
 <div class="col-md-2"> 
<div class="pro_img">
<a href="LoginHomeNew">

	
	<span class="hidden"> </span>

    
 	<div class="image_privacy">  </div>
<image src="nimages/p3.png" width="250">
	
     
	
   


</a></div>
<div class="pro_details">
Matri ID : 21013 <br>
<span>Hindu</span>
<br>
Mangalagiri, Andhra Pradesh
</div>
 
						
						
</div>
 <div class="col-md-2"> 
<div class="pro_img">
<a href="LoginHomeNew">

	
	<span class="hidden"> </span>

    
 	<div class="image_privacy">  </div>
<image src="nimages/p4.png" width="250">
     
	
   


</a></div>
<div class="pro_details">
Matri ID : 21010 <br>
<span>Hindu</span>
<br>
Vijayawada, Andhra Pradesh
</div>
 
						
						
</div>
 <div class="col-md-2"> 
<div class="pro_img">
<a href="LoginHomeNew">

	
	<span class="hidden"> </span>

    
 	<div class="image_privacy">  </div>
<image src="nimages/p5.png" width="250">	
     
	
   


</a></div>
<div class="pro_details">
Matri ID : 21004 <br>
<span>Hindu</span>
<br>
Rajamundry, Andhra Pradesh
</div>
 
						
						
</div>
 <div class="col-md-2"> 
<div class="pro_img">
<a href="LoginHomeNew">

	
	<span class="hidden"> </span>

    
 	<div class="image_privacy">  </div>
<image src="nimages/p5.png" width="250">	
     
	
   


</a></div>
<div class="pro_details">
Matri ID : 21003 <br>
<span>Hindu</span>
<br>
Guntur, Andhra Pradesh
</div>
 
						
						
</div>
 <div class="col-md-2"> 
<div class="pro_img">
<a href="LoginHomeNew">

	
	<span class="hidden"> </span>

    
 	<div class="image_privacy">  </div>
<image src="nimages/p6.png" width="250">
	
     
	
   


</a></div>
<div class="pro_details">
Matri ID : 20998 <br>
<span>Christian</span>
<br>
Gudivada, Andhra Pradesh
</div>
 
						
						
</div>
 <div class="col-md-2"> 
<div class="pro_img">
<a href="LoginHomeNew">

	
	<span class="hidden"> </span>

    
 	<div class="image_privacy">  </div>
<image src="nimages/p7.png" width="250">	
     
	
   


</a></div>
<div class="pro_details">
Matri ID : 20993 <br>
<span>Hindu</span>
<br>
Nellore, Andhra Pradesh
</div>
 
						
						
</div>
 <div class="col-md-2"> 
<div class="pro_img">
<a href="LoginHomeNew">

	
	<span class="hidden"> </span>

    
 	<div class="image_privacy">  </div>
<image src="nimages/p8.png" width="250">	
     
	
   


</a></div>
<div class="pro_details">
Matri ID : 20988 <br>
<span>Hindu</span>
<br>
Krishna, Andhra Pradesh
</div>
 
						
						
</div>
 <div class="col-md-2"> 
<div class="pro_img">
<a href="LoginHomeNew">

	
	<span class="hidden"> </span>

    
 	<div class="image_privacy">  </div>
<image src="nimages/p9.png" width="250">
	
     
	
   


</a></div>
<div class="pro_details">
Matri ID : 20982 <br>
<span>Hindu</span>
<br>
Guntur, Andhra Pradesh
</div>
 
						
						
</div>
 </div>
</div>
</div>
</div>

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
											<h3>Vamsi Chowdary & Apoorva</h3>
											<span>June 9, 2018</span> <!-- <a href="successStory#01-thumbnail.jpg">read more...</a> -->
											<!-- <h3>Bride Name & Groom Name</h3>
											<span>June 9, 2017</span> --> <a href="successStory&divId=1">read more...</a> 
										</figcaption>
									</figure>
								</li>
								<li>
									<figure>
										<img src="user/images/portfolio/02-thumbnail.jpg"
											class="img-responsive img-thumbnail" alt="">
										<figcaption>
											<h3>Sriram & Divya</h3>
											<span>April 28, 2018</span> <!-- <a href="successStory#02-thumbnail.jpg">read more...</a> -->
											<!-- <h3>Bride Name & Groom Name</h3>
											<span>June 9, 2017</span> --> <a href="successStory&divId=2">read more...</a>
										</figcaption>
									</figure>
								</li>
								<li>
									<figure>
										<img src="user/images/portfolio/03-thumbnail.jpg"
											class="img-responsive img-thumbnail" alt="">
										<figcaption>
											<h3>Raghuram & Swapna</h3>
											<span>May 2, 2017</span> <!-- <a href="successStory#03-thumbnail.jpg">read more...</a> -->
											<!-- <h3>Bride Name & Groom Name</h3>
											<span>June 9, 2017</span> --> <a href="successStory&divId=3">read more...</a>
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

	
	
	
<div class="container">
	
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
		
	</footer>
	</div>
	<div class="clearfix"></div>
<div id="bottom">
<div class="container">
<div class="row info">
<div class="col-md-3">
<h4>INFORMATION :</h4>
</div>
<div class="col-md-9">
<a href="#stayhere">Register Free</a><a href="#stayhere">Partner Search</a><a href="#stayhere">Member login1</a><a href="#stayhere">About Us</a><a href="#stayhere">Payment Options</a><a href="#stayhere">Terms & Conditions</a><a href="#stayhere">Privacy Policy</a><a href="#stayhere">Contact</a>

</div>
</div>
<div class="row social-secure">
<div class="col-md-6">
Follow us on : 	<a href="#stayhere"><img src="nimages/fb.png" alt="facebook"> </a><a href="#stayhere"> <img src="nimages/twt.png" alt="twitter"> </a><a href="#stayhere">  <img src="nimages/linkdn.png" alt="linkdn"></a>
</div>
<div class="col-md-4">

</div>
</div>
</div>
</div>
<footer>
<div class="container">
<div class="row">
<div class="col-md-4 footer-left">
All Rights Reserved
</div>
<div class="col-md-4 footer-center">

</div>
<div class="col-md-4 footer-right">

</div>
</div>
</div>
</footer>
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
								<form:password path="regPassword" class="form-control" onkeydown="removeBorder(this.id)"  placeholder="Password"/>
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



<div class="clearfix"></div>
  <%-- <div class="modal fade" id="contact_us" role="dialog">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
      <div class="modal-header"> 
<h3 class=" no-margin">Please fill this form to reach out you</h3>
<button type="button" class="close" data-dismiss="modal" title="Close"><span class="glyphicon glyphicon-remove"></span>
</button> 
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
				</div>
     
      </div>
    </div>
  </div> --%>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
  <script src="${baseurl}/user/js/ie-emulation-modes-warning.js"></script>
<script src="${baseurl}/user/vendor/jquery/jquery.min.js"></script>
	<script src="${baseurl}/user/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${baseurl}/user/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${baseurl}/user/vendor/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="${baseurl}/user/vendor/scrollreveal/scrollreveal.min.js"></script>
<%-- 	<script src="${baseurl}/user/js/theme.js"></script> --%>
	<script src="${baseurl}/user/js/custom.js"></script>
	 <script src="${baseurl}/js/jquery.blockUI.min.js"></script>
	<script src="${baseurl}/user/vendor/woocommerce-FlexSlider/jquery.flexslider.js"></script>
	<script src="${baseurl}/user/js/modernizr.custom.js"></script>
	<script src="${baseurl}/user/js/toucheffects.js"></script>
<script src="${baseurl}/js/custemValidation1.js"></script>
<%-- <script src="${baseurl}/js/datepicker.js"></script> --%>
<script src="${baseurl}/js/ajax.js"></script>
<script src="${baseurl}/js/jquery-ui.min.js"></script>
  <script>
  var ss =new Date().getFullYear()-18;
  $("#dob").datepicker({
     dateFormat: "dd-MM-yy",
     changeDate : true,
 	changeMonth : true,
 	changeYear : true,
//  	maxDate :0,
 	yearRange: '1964:' + ss,
 	 defaultDate: '01-January-1964'
 }); 
  window.setTimeout(function() {
	    $(".msgcss").fadeTo(500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 5000);
  
  function loginSubmit(){
		 var userName = $('#userName').val().trim();
		 var password1 = $('#quote input[name="password"]').val().trim();
		 if(userName==""){
			$("#userName").attr("required", "true");
// 			 $("#userName").attr("placeholder", placeholder);
// 			 $("#userName").css('border-color','#e73d4a');
// 			    $("#userName" ).css('color','#e73d4a');
// 			    $("#userName").addClass('your-class');
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
  
  function CheckForm(obj1) { 

if (!($('#accept').is(":checked"))){
  alert ("You must check the box to confirm you have read and accept the Terms And Conditions.");
return false;
} 
return true;
}
  
  </script>
  

<script type="text/javascript">
$(document).on('change','.checkbox',function(){
   var url = "";
   $.ajax({
     type: "POST",
     url: url,    
     data: $("#search_form").serialize(),
     success: function(data)
     {                  
        $('#searchresults').html(data).fadein("1000");

     }               
   });
  return false;
});
</script>







    <!-- Scripts -->
    <script src="njs/app.js"></script>
	    <script src="njs/customjs.js"></script>
<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();
});
</script>


<script>


$('#uncheck').click(function(){
$('#check:checked').removeAttr('checked');
})



</script>

<!--
<script>

$('img').bind('contextmenu', function(e) {
    return false;
}); 
</script>

-->


<script type="text/javascript">
    $(window).on('load',function(){
        $('#contact_us').modal('show');
    });
    
    function regFunction(){
    	$('#myModal').modal('hide');
    	$('#register-info').modal('show');
//     	$('#register-info').show();
    	
    	
    }

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
//     		alert("Please Enter Valid Email");
        	$("#email").css("border-color","#e73d4a");
        	$("#email").attr("title","Email-ID");
        	$('#email').css('color','red');
        	$('#emailError').text("Enter Valid Email-ID.");
//         	$('#email').focus();
    		return false;
    	}
    	else{
    		$('#emailError').text("");
    	}
    	if(email !=null && email != "" && email !="undefined"){
    	var formData = new FormData();
        formData.append('email', email);
    	$.fn.makeMultipartRequest('POST', 'emailChecking', false, formData, false, 'text', function(data){
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
//     		alert("enter createdby");
        $("#createProfileFor").css("border-color","#e73d4a");
        $('#createProfileFor').css('color','red');
    		return false;
    	}
    });
    $('#password').blur(function() {
    	var password = $('#password').val();
    	if(password == "" || password.length == 0 || password =="undefined"){
//     		alert("enter password");
        $("#password").css("border-color","#e73d4a");
        $('#password').css('color','red');
    		return false;
    	}
    });




    $("#submit11").click(function(event){
//     	alert("###"+$("#regPassword").val());
    	var email = $('#email').val();
    	if($('#email').val() ==  null || $('#email').val() == "" || $('#email').val()=="undefined" || 
    		$('#createProfileFor').val() ==  null || $('#createProfileFor').val() == "" || $('#createProfileFor').val()=="undefined" ||
    		$('#regPassword').val() ==  null || $('#regPassword').val() == "" || $('#regPassword').val()=="undefined")
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
//     			$("#createProfileFor").attr("placeholder","Please Enter createProfileFor");
    			$('#createProfileFor').addClass('your-class');
    			$('#createProfileFor').css('color','red');
    		}
    		if($('#regPassword').val() ==  null || $('#regPassword').val() == "" || $('#regPassword').val()=="undefined" ) 
    		{
    			$("#regPassword").css("border-color","#e73d4a");
    			$("#regPassword").attr("placeholder","Password");
    			$('#regPassword').addClass('your-class');
    			$('#regPassword').css('color','red');
    		}		
    		return false;
    	}
    	if(email != "" && !email.match(expr)){
//     		alert("Please Enter Valid Email");
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
//     		$("#registration").submit();
     
    	event.preventDefault();
    });
    $("#secondButton").click(function(event)
//     		function formSubmit()
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
    			
//     		 	$("#firstForm").css({'display':'none'})
//     			$('#secondForm').css({'display':'block'});
//    		 		$("#registration").submit();
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
    		
    		
//     		$( document ).ready(function() {
//     		    $("img").on("contextmenu",function(){
//     		       return false;
//     		    }); 
//     		});
    </script>


    <script>
    jQuery(document).ready(function($){
    	  
    	  window.onload = function (){
    	    $(".bts-popup").delay(1000).addClass('is-visible');
    		}
    	  
    		//open popup
    		$('.bts-popup-trigger').on('click', function(event){
    			event.preventDefault();
    			$('.bts-popup').addClass('is-visible');
    		});
    		
    		//close popup
    		$('.bts-popup').on('click', function(event){
    			if( $(event.target).is('.bts-popup-close') || $(event.target).is('.bts-popup') ) {
    				event.preventDefault();
    				$(this).removeClass('is-visible');
    			}
    		});
    		//close popup when clicking the esc keyboard button
    		$(document).keyup(function(event){
    	    	if(event.which=='27'){
    	    		$('.bts-popup').removeClass('is-visible');
    		    }
    	    });
    	});
    </script>
</body>

</html>
