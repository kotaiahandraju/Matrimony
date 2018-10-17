<style>
video {
	width: 350px ;
	height: 245px;
	margin-top: -5px;
}
/* .grid figcaption h3 {
    margin: 0;
    padding: 0;
    color: #fff;
    font-size: 18px;
    text-align: left;
} */
#return-to-top {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background: rgb(0, 0, 0);
    background: rgba(0, 0, 0, 0.7);
    width: 50px;
    height: 50px;
    display: block;
    text-decoration: none;
    -webkit-border-radius: 35px;
    -moz-border-radius: 35px;
    border-radius: 35px;
    display: none;
    -webkit-transition: all 0.3s linear;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
#return-to-top i {
    color: #fff;
    margin: 0;
    position: relative;
    left: 16px;
    top: 5px;
    font-size: 19px;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    transition: all 0.3s ease;
}
#return-to-top:hover {
    background: rgba(0, 0, 0, 0.9);
}
#return-to-top:hover i {
    color: #fff;
    top: 5px;
}


/* Extra Things */
body{background: #eee ;font-family: 'Open Sans', sans-serif;}h3{font-size: 30px; font-weight: 400;text-align: center;}h3 i{color: #444;}
.agileinfo ul {
padding:0;
}
td, th {
    padding: 0;
    font-size: 14px;
}
.select2-choices:hover .dropdown-content {
	display: block;
}
.alert {
padding:5px !important;
}
.dropdown-content a
{
padding: 0px 0px 0px 2px !imortant;
}
.select2-container-multi .select2-choices .select2-search-choice
{
padding: 3px 5px !important;
}
.select2-drop
{
z-index: 9999999999;
}
.select2-container
{
width:100%;
}
h4 {
	text-decoration: none;
	list-style: none;
}

a h4:hover {
	text-decoration: none;
	list-style: none;
}

.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 7px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}
.address-left {
    background: #c1f0f5;
    padding: 1em;
    z-index: 9;
    margin-bottom: 10px;
    
}
.footer h3 {
    font-size: 18px;
    color: #c01314;
    letter-spacing: 1px;
    margin-bottom: 25px;
    text-transform: uppercase;
}
.footer-grids ul li {
    display: block;
    font-size: 13px;
    margin: 15px 0 0;
    color: #000000;
}
.footer-grids ul li a {
    color: #656565;
    -webkit-transition: .5s all;
    -moz-transition: .5s all;
    -o-transition: .5s all;
    -ms-transition: .5s all;
    transition: .5s all;
}

.social .fb {
    background: #6788ce;
}
.social .tw {
    background: #00ACEE;
}
.social .gp {
    background: #DD4B39;
}
.social ul li a i {
    color: #fff;
    
}
.footer-logo.header-logo {
    float: none;
    text-align: left;
}
.footer-logo.header-logo h6 {
    text-transform: capitalize;
    font-size: 20px;
    letter-spacing: 1px;
    color: #ec3434;
}
.address-left ul li {
    display: block;
    margin: 10px 0;
    font-size: 14px;
    color: #4c4c4c;
    border-top: 1px solid #ffffff;
    padding-top: 20px;
    text-align: left;
}
label {
    display: inline-block;
    margin-bottom: 5px;
    color: #fff;
}
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}
#firstForm .btn-warning {
    height: auto;
    background: #BE0000;
    width: auto;
    float: none;
    padding: 2px 12px;
    font-size: 18px;
    border: 0px;
    border-top-left-radius: 10px;
    border-bottom-right-radius: 10px;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

.fa {
	padding-top: 5px;
}

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
	z-index: 999;
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
.social {
    margin-top: -30px;
}
/* .footer-grids ul {
    margin-inline-start: 65px;
} */
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

.bts-popup-container .bts-popup-close::before, .bts-popup-container .bts-popup-close::after
	{
	content: '';
	position: absolute;
	top: 12px;
	width: 16px;
	height: 3px;
	background-color: white;
}
.agile-assisted-service {
    background: url(nimages/servicebg.jpg) no-repeat 0px 0px;
    background-size: cover;
    min-height: 400px;
    background-attachment: fixed;
    padding-top: 65px;
}
.agile-assisted-service h4 {
    font-size: 35px;
    color: #fff;
    margin-bottom: 35px;
    letter-spacing: 1px;
}
.agile-assisted-service p {
    font-size: 20px;
    color: #fff;
    letter-spacing: 1px;
    font-weight: 300;
    margin: 0 auto 50px;
    width: 45%;
    line-height: 40px;
}
.agile-assisted-service a {
    font-size: 14px;
    color: #e0e0e0;
    text-transform: uppercase;
    letter-spacing: 1px;
    text-decoration: none;
    background: rgba(236, 52, 52, 0.81);
    padding: 10px 25px;
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
	background: rgba(0, 0, 0, 0.6);
}

.modal-header .close {
	margin-top: -40px !important;
}

.section-title {
	margin-bottom: 0px;
}

.getquote .right-side {
	padding-top: 2px;
}

@media only screen and (max-width: 1280px) {
	section.getquote {
		margin-top: 45px;
	}
}
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
@media only screen and (max-width: 1600px) and (min-width: 1024px) {

.grid figcaption h3 {
    margin: 0;
    padding: 0;
    color: #fff;
    font-size: 19px ;
    text-align: left;
}
}
@media only screen and (max-width: 1600px) and (min-width: 980px) {
.navbar>.container-fluid .navbar-brand {
   margin-left: 39px; 
   margin-top:0px !important;
}
.grid figcaption h3 {
    margin: 0;
    padding: 0;
    color: #fff;
    font-size: 13px;
    text-align: left;
}
}
@media only screen and (max-width: 1900px) and (min-width: 1024px) {
.grid figcaption h3{
font-size:18px;
}}
@media only screen and (max-width: 640px) and (min-width: 320px) {
.search {
    font-size: 16px;
    width: 65%;
    margin: 0 auto;
}
.grid figcaption h3{
font-size:13px;
}
.grid figcaption {
    position: absolute;
    top: 0;
    left: 0;
    padding: 7px;
    background: #2c3f52;
    color: #ed4e6e;
}

.cs-style-5 figure a {
    position: absolute;
    bottom: 8px;
    right: 20px;
}
.footer-grids ul {
    margin-inline-start: -14px !important;
}
video {
    width: 297px !important;
    height: 245px;
    margin-top: -5px;
}
.agile-assisted-service p {
    font-size: 13px;
    color: #fff;
    letter-spacing: 1px;
    font-weight: 300;
    margin: 0 auto 50px;
    width: 70%;
    line-height: 31px;
}
.agile-assisted-service h4 {
    font-size: 35px;
    color: #fff;
    margin-bottom: 10px;
    letter-spacing: 1px;
}
.bannerform{
 background:  rgba(0, 0, 0, 0.3) !important;
    height: auto;
    padding: 10px 10px;
    border-radius: 5px;
    -webkit-box-shadow: 3px 4px 8px rgba(0,0,0,.21);
    -moz-box-shadow: 3px 4px 8px rgba(0,0,0,.21);
    box-shadow: 3px 4px 8px rgba(0,0,0,.21);
    border: solid 3px rgba(220,220,220,.37);
    text-align: left;
    margin: 0 5px 0 5px;
    display: inline-block;
   
    float: right;
    }
#strip .privacy {
    background: url(../nimages/privacy-bg.png) no-repeat center;
    min-height: 266px;
    margin-bottom: 37px;
}
#strip .quality {
    margin-bottom: 37px;
}
#strip .secure {
    margin-bottom: 37px;
}
.slider-container {
    background: #becfd8 url(nimages/ban1.jpg) no-repeat;
    width: 100%;
    background-size: contain !important;
    background-position: 60% 0px;}
	.bts-popup-container {
		margin-top: 80px;
	}
	label {
	color:#fff;}
	.bannerform {
	    float: right;
    margin-top: 40% !important;
    width: 100%;
    margin-right: 0px !important;
	}
	.form-group .col-md-6 {
padding-left:0px !important;
padding-right:0px !important;
margin-bottom:5px;
}
.form-group .col-md-12 {
padding-left:0px !important;
padding-right:0px !important;
}
	
	.bts-popup-container .bts-popup-close {
		position: absolute;
		top: -25px;
		right: 29px;
		width: 30px;
		height: 30px;
	}
	.flexslider {
		margin-top: 51px;
	}
	video {
		
		height: auto !important;
		margin-top: 0px !important;
	}
	.bannerposter {
		display: block !important;
		padding-top: 51px;
	}
	.bannerposter1 {
		display: none !important;
	}
	.slider-banner {
		margin-top: 0px;
	}
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
	background: rgba(0, 0, 0, 0.4);
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
	background: #2da3de;
	color: #fff;
	border-bottom-left-radius: 33px;
	border-bottom-right-radius: 33px;
}

.btn-danger {
	width: 135px;
	padding: 8px;
}

.modal-header h3 {
	color: #fff;
	font-size: 20px;
	font-weight: 400;
	padding: 10px 15px;
	text-transform: capitalize;
	margin-bottom: 0px;
	line-height: 29px;
	border: none !important;
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
	filter: alpha(opacity = 50);
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
@media ( min-width : 980px) {
#strip .col-md-4 {
    text-align: center;
    width: 33%;
    float: left;
}

.firstnam {
width:120px;
float:left;}
.search-link {
    text-align: center;
    padding: 0px;
    display: inline-flex;
}
#welcome .navbar-right {
    padding: 10px 0 0px !important;
}
.navbar-header {
    width: 28% !important;
}
.navbar>.container-fluid .navbar-brand {
   margin-left: 39px; 
   margin-top:10px;
}
.header {
   margin-top: 0px; 
}}
@media ( min-width : 920px) {
	.modal-lg {
		margin-right: auto;
		margin-left: auto;
	}
}

.alert-success, .alert-warning, .alert-danger {
	color: white !important;
}

.alert-success {
	background-color: #4CAF50 !important;
}

.alert-warning {
	background-color: #ff6600 !important;
}

.alert-danger {
	background-color: #d43f3a !important;
}

.your-class::-webkit-input-placeholder {
	color: #e73d4a !important;
}

.your-class::-moz-placeholder {
	color: #e73d4a !important;
}

.default-class::-webkit-input-placeholder {
	color: #e73d4a !important;
}

.default-class::-moz-placeholder {
	color: #e73d4a !important;
}

.impColor {
	color: red;
}

.edit, .delete, .active, .deactive {
	cursor: pointer;
}

span.has-error, span.hasError {
	font-weight: normal;
	border-color: #e73d4a;
	color: red;
	margin-top: -3px;
	display: block !important;
	position: absolute;
}

.dispnone {
	display: none !important;
}

.dispblock {
	display: block !important;
}
#welcome .navbar-right {
    padding: 27px 0 0px !important;
}
.navbar-brand {
padding:14px 15px !important;}
.bannerform{
 background: #cc !important;
    height: auto;
    padding: 10px 10px;
    border-radius: 5px;
    -webkit-box-shadow: 3px 4px 8px rgba(0,0,0,.21);
    -moz-box-shadow: 3px 4px 8px rgba(0,0,0,.21);
    box-shadow: 3px 4px 8px rgba(0,0,0,.21);
    border: solid 3px rgba(220,220,220,.37);
    text-align: left;
    margin: 0 5px 0 5px;
    display: inline-block;
    box-shadow: inset 0 0 0 300px rgba(255,255,255,0.3);
    float: right;
    }
    form {
    margin-bottom: -1em !important;
}
    /* .bannerform label {
    color:#fff;} */
    #slider .form-control {
    border-radius: 0px;
    border: 1px solid #fff !important;
}
.header {
margin-top:-13px;
}
#search select {
    height: 31px !important;
}
.search-link .btn-primary {
    height: auto;
    background: #BE0000;
    width: auto;
    float: none;
    padding: 5px 40px !important;
    font-size: 18px;
    border: 0px;
    border-top-left-radius: 10px;
    border-bottom-right-radius: 10px;
    margin-top: -3px !important;
}
.modal {
padding-left:0px !important;}
#slider .form-control {
    height: 32px !important;
    padding: 7px 6px !important;
}

</style>
<style>
footer {
    background: #090909;
    padding: 10px;
    font-size: 15px;
    color: #fff;
}
footer {
    font-size: 14px;
}
</style>

</div>
<div class="clearfix"></div><a href="javascript:" id="return-to-top"><i class="fa fa-chevron-up"></i></a>
	<div class="footer">
		<div class="container"  style="background:#fff;">
			<div class="footer-info w3-agileits-info">
				<div class="col-md-3 address-left agileinfo">
					<div class="footer-logo header-logo">
						<h6>Get in Touch</h6>
					</div>
					<ul>
						<li><i class="fa fa-map-marker"></i> Door No 58-2-3/1,<br>Bagaiah
							Street,<br> Opposite Tanusri Hospital, <br> Pantakalava
							Road,<br> Benzcircle Vijayawada.</li>
						<!-- 						<li><i class="fa fa-mobile"></i> 333 222 3333 </li> -->
						<li><i class="fa fa-phone"></i> +91 8466999991</li>
						<li><i class="fa fa-envelope-o"></i> <a href="#stayhere">
								info@aarnamatrimony.com</a></li>
					</ul> 
				</div>
<!-- 				<div class="col-md-4 address-right"> -->
				<div class="col-md-3 footer-grids" style="padding-inline-start: 82px;">
						<h3 style="text-align:left;text-transform:capitalize;">Quick links</h3>
						<ul  style="padding-inline-start: 0px;">
							<li><a href="termsConditionsHomepage">Terms and Conditions</a></li>
							<li><a href="privacyAndPolicyHomePage">Privacy Policy</a></li>
							<li><a href="helpHomePage">Help</a></li>
							<li><a href="aboutUsHomePage">About Us</a></li>
							<li><a href="HomePage">Register Free</a></li>
						</ul> 					</div>
					<!-- <div class="col-md-4 footer-grids">
					
						 <h3>Company</h3>
						<ul style="margin-inline-start: 34px;">
							
						</ul>
					</div> -->
					<div class="col-md-4 footer-grids">
					<a href="HomePage"><img src="images/logo01.png" alt="" class="img-responsive" /></a>
						<video poster="user/images/bgvideo.jpg" controls
							src="user/images/Aarna Matrimony for Best Mate ,Together Forever.mp4"
							type="video/mp4">
						</video>
						<!-- <h3>Follow Us on</h3>
						<section class="social">
                        <ul>
							<li><a class="icon fb" href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a class="icon tw" href="#"><i class="fa fa-twitter"></i></a></li>	
							<li><a class="icon gp" href="#"><i class="fa fa-google-plus"></i></a></li>
						</ul>
						</section> -->
					</div>
					<div class="col-md-2 footer-grids">
					
					<img style="margin-top:5px; width:200px;" class="" src="nimages/satisfaction.png"/>
<!-- 					<img class="img-responsive" src="nimages/secure11.gif"/>		 -->
<img  src="nimages/secure.png" class=" "/>
								</div>
<!-- 					</div> -->
					
					<div class="clearfix"></div><br>
				
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
<footer>
<div class="container" style="background:#090909;">
<div class="row">
<div class="col-md-8 footer-left" style="padding-top:8px;">
A product of Aarna Associates © 2018. All Rights Reserved | Design & Develop by Charvikent Ites Pvt Ltd.
</div>
<!-- <div class="col-md-4 footer-center">

</div> -->
<div class="col-md-4 footer-right">
<div class="row social-secure">

Follow us on : 	<a href="#stayhere"><img src="nimages/fb.png" style="height:30px;" alt="facebook"> </a><a href="#stayhere"> <img src="nimages/twt.png" style="height:30px;" alt="twitter"> </a><a href="#stayhere">  <img src="nimages/linkdn.png" style="height:30px;" alt="linkdn"></a>


</div>
</div>
</div>
</div>
</footer>
	<script>
	// ===== Scroll to Top ==== 
	$(window).scroll(function() {
	    if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
	        $('#return-to-top').fadeIn(200);    // Fade in the arrow
	    } else {
	        $('#return-to-top').fadeOut(200);   // Else fade out the arrow
	    }
	});
	$('#return-to-top').click(function() {      // When arrow is clicked
	    $('body,html').animate({
	        scrollTop : 0                       // Scroll to top of body
	    }, 500);
	});
	</script>