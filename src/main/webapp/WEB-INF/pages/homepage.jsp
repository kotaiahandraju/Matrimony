<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
	String baseurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	session.setAttribute("baseurl", baseurl);
	String catalina_base = request.getScheme() + "://" + request.getServerName() + ":"
			+ request.getServerPort();
	session.setAttribute("catalina_base", catalina_base);
%>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<script
	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="">
<link href="${baseurl}/user/css/style.css" rel="stylesheet">
<link href="${baseurl}/user/css/custom.css" rel="stylesheet">
<link href="${baseurl}/css/datepicker1.css" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet" type="text/css"
	href="${baseurl}/user/css/component.css" />
<link
	href="${baseurl }/user/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${baseurl}/css/plugins/select2/select2.css">
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/ncss/bootstrap-glyphicons.css" rel="stylesheet"> -->
<link rel="shortcut icon" href="fav-icon.png" type="image/x-icon" />
<link rel="shortcut icon" href="fav-icon.png" type="image/x-icon">
<link rel="shortcut icon" href="fav-icon.png" type="image/x-icon">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<style>
/* #recent-profile .pro_img img {
    height: 230px;
    filter: grayscale(1);
    transition: all .3s ease-in-out;
    cursor: pointer;
}
#recent-profile:hover .pro_img:hover img {
    filter: grayscale(0);
    cursor: pointer;
} */
video {
	width: 350px;
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
body {
	background: #eee;
	font-family: 'Open Sans', sans-serif;
}

h3 {
	font-size: 30px;
	font-weight: 400;
	text-align: center;
	margin-top: 50px;
}

h3 i {
	color: #444;
}

.agileinfo ul {
	padding: 0;
}

td, th {
	padding: 0;
	font-size: 14px;
}

.select2-choices:hover .dropdown-content {
	display: block;
}

.alert {
	padding: 5px !important;
}

.dropdown-content a {
	padding: 0px 0px 0px 2px!imortant;
}

.select2-container-multi .select2-choices .select2-search-choice {
	padding: 3px 5px !important;
}

.select2-drop {
	z-index: 9999999999;
}

.select2-container {
	width: 100%;
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

.btn-warning {
	height: auto;
	background: #BE0000!imporatnt;
	width: auto;
	float: none;
	padding: 14px 40px;
	font-size: 18px;
	border: 0px;
	border-top-left-radius: 10px;
	border-bottom-right-radius: 10px;
}

.dropdown-content a:hover {
	background-color: #f1f1f1
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
	margin-inline-start: 44px;
}
 */
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
		font-size: 19px;
		text-align: left;
	}
}

@media only screen and (max-width: 1600px) and (min-width: 980px) {
	.navbar>.container-fluid .navbar-brand {
		margin-left: 39px;
		margin-top: 0px !important;
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
	.grid figcaption h3 {
		font-size: 18px;
	}
}

@media only screen and (max-width: 640px) and (min-width: 320px) {
	form {
		margin-bottom: 0em !important;
	}
	.search {
		font-size: 16px;
		width: 65%;
		margin: 0 auto;
	}
	.grid figcaption h3 {
		font-size: 13px;
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
	.bannerform {
		background: rgba(0, 0, 0, 0.3) !important;
		height: auto;
		padding: 10px 10px;
		border-radius: 5px;
		-webkit-box-shadow: 3px 4px 8px rgba(0, 0, 0, .21);
		-moz-box-shadow: 3px 4px 8px rgba(0, 0, 0, .21);
		box-shadow: 3px 4px 8px rgba(0, 0, 0, .21);
		border: solid 3px rgba(220, 220, 220, .37);
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
		background: #becfd8 url(user/images/slide1.jpg) no-repeat;
		width: 100%;
		background-size: contain !important;
		background-position: 60% 0px;
	}
	.bts-popup-container {
		margin-top: 80px;
	}
	label {
		color: #fff;
	}
	.bannerform {
		float: right;
		margin-top: 50% !important;
		width: 100%;
		margin-right: 0px !important;
	}
	.form-group .col-md-6 {
		padding-left: 0px !important;
		padding-right: 0px !important;
		margin-bottom: 5px;
	}
	.form-group .col-md-12 {
		padding-left: 0px !important;
		padding-right: 0px !important;
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

@media screen and only (max-width: 992px) {
	.navbar>.container-fluid .navbar-brand {
		margin-left: -19px!imporatant;
	}
	.ntag {
		margin-bottom: 5px;
		display: inline-flex;
		margin-top: !important;
		font-size: 12px !important;
		color: #000;
	}
}

@media ( min-width : 980px) {
	#strip .col-md-4 {
		text-align: center;
		width: 33%;
		float: left;
	}
	.ntag {
		margin-bottom: 5px;
		display: inline-flex;
		margin-top: px;
		font-size: 10px;
		color: #000;
	}
	.navbar>.container-fluid .navbar-brand {
		margin-left: -18px;
	}
	.firstnam {
		width: 120px;
		float: left;
	}
	.search-link {
		text-align: center;
		padding: 0px;
		display: inline-flex;
	}
	#welcome .navbar-right {
		padding: 31px 0 0px !important;
	}
	.navbar-header {
		width: 28%;
	}
	.navbar>.container-fluid .navbar-brand {
		margin-left: 39px;
		margin-top: 10px;
	}
	.header {
		margin-top: 0px;
	}
}

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
	padding: 30px 0 0px !important;
}

.navbar-brand {
	padding: 14px 15px !important;
}

.bannerform {
	background: #cc !important;
	height: auto;
	padding: 10px 10px;
	/*     border: 1px solid rgba(0,0,0,0.5); */
	/*    border-radius: 10px 10px 2px 2px; */
	background: rgba(0, 0, 0, 0.25);
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5), inset 0 1px
		rgba(255, 255, 255, 0.3), inset 0 0px rgba(255, 255, 255, 0.2), inset
		0 0px 20px rgba(255, 255, 255, 0.25), inset 0 -15px 30px
		rgba(0, 0, 0, 0.3);
	-o-box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5), inset 0 1px
		rgba(255, 255, 255, 0.3), inset 0 0px rgba(255, 255, 255, 0.2), inset
		0 0px 20px rgba(255, 255, 255, 0.25), inset 0 -15px 30px
		rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5), inset 0 1px
		rgba(255, 255, 255, 0.3), inset 0 0px rgba(255, 255, 255, 0.2), inset
		0 0px 20px rgba(255, 255, 255, 0.25), inset 0 -15px 30px
		rgba(0, 0, 0, 0.3);
	-moz-box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5), inset 0 1px
		rgba(255, 255, 255, 0.3), inset 0 0px rgba(255, 255, 255, 0.2), inset
		0 0px 20px rgba(255, 255, 255, 0.25), inset 0 -15px 30px
		rgba(0, 0, 0, 0.3);
	/*  border-radius: 5px;
    -webkit-box-shadow: 3px 4px 8px rgba(0,0,0,.21);
    -moz-box-shadow: 3px 4px 8px rgba(0,0,0,.21);
    box-shadow: 3px 4px 8px rgba(0,0,0,.21);
    border: solid 3px rgba(220,220,220,.37); */
	text-align: left;
	margin: 0 5px 0 5px;
	display: inline-block;
	/*     box-shadow: inset 0 0 0 300px rgba(255,255,255,0.3); */
	float: right;
}

form {
	margin-bottom: -1em;
}
/* .bannerform label {
    color:#fff;} */
#slider .form-control {
	border-radius: 0px;
	border: 1px solid #fff !important;
}

.header {
	margin-top: -13px;
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
	padding-left: 0px !important;
}

#slider .form-control {
	height: 32px !important;
	padding: 7px 6px !important;
}

.ntag {
	margin-bottom: 5px;
	display: inline-flex;
	margin-top: 15px;
	font-size: 10.5px;
	color: #3c3636;
	margin-left: 3px;
	font-weight: bold;
}
</style>
<title>Aarna Matrimony</title>
<link rel="shortcut icon" href="${baseurl }/img/aarna-fav.png" />

<!-- Styles -->
<link href="ncss/app.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="ncss/style.css" />
<link rel="stylesheet" type="text/css" href="ncss/responsive.css" />
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
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
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#welcome">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="HomePage"><img
					src="images/logo.png" style="display: block;" class=""
					alt="Aarna Matrimony"></a>

				<!-- 					<img style="margin-top:8px;" src="nimages/title-bar-png.png" class="img-responsive"> -->
				<p class="ntag">NO. 1 TELUGU MATRIMONIAL SERVICE</p>
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



					<form class="form-inline" action="loginAction" id="quote"
						name="quote" method="post" onsubmit="return loginSubmit()">
						<c:if test="${not empty msg}">
							<div class="form-group">
								<a class="msgcss  alert alert-danger" style="padding-top:10px !important;">${msg}</a>
							</div>
						</c:if>

						<input type="hidden" name="_token" value="">
						<%-- 						<div class="form-group">
							<div class="dropdown">
								<button class="dropbtn">Search</button>
								<div class="dropdown-content">

									<a>
										<h4>I'm looking for a</h4> <select id="country"
										onchange="change_country(this.value)" class="form-control">
											<option value="null">Bride</option>
											<option value="null">Groom</option>
									</select>

										<h4>Aged</h4> 
										<select id="rAgeFrom" name="rAgeFrom"	class="for-control">
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


									</select> <span>To </span> 
									<select id="rAgeTo" name="rAgeTo"  onchange="change_country(this.value)" class="formcontrol">
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

										<h4>Religion</h4>
                          <form:select path="religion" id="religionId"  onchange="getReliginCastAjax1()" class="multiselect" multiple="true">
											<form:options items="${religion}"></form:options>
											</form:select>
									<h4>Cast</h4>
									<form:select path="cast" id="castId" onchange="change_country(this.value)" class="multiselect" multiple="true">
								<form:option value="">of Caste.... &nbsp;&nbsp;</form:option>
							</form:select>
     <input value="Search" class="btn btn-success" style="margin-top: 8px;" type="submit" onclick="searchSubmit();">

									</a>
								</div>
							</div>
						</div> --%>
						<!-- Modal -->
						<div id="myModal" class="modal fade" role="dialog"
							style="margin-top: 55px;" tabindex='-1'>
							<div class="modal-dialog">

								<div class="modal-content">
									<div class="modal-header"
										style="background: #099cca; color: #fff;">
										<h3>Your Search Results</h3>
										<button type="button"
											style="color: #fff !important; margin-right: 10px; opacity: 1;"
											class="close" data-dismiss="modal">&times;</button>
									</div>
									<div class="modal-body">
										<div class="searchresults">
											<div id="searchResults"></div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<!-- <div class="form-group">
							<a class="regist" href="#register-info" data-toggle="modal">Register</a>
						</div> -->
						<div class="form-group">
							<!--                                 <input id="email" type="email" class="form-control" name="email" value="" required placeholder="Email Address"> -->
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" class="form-control notAllowFirstSpace"
									onkeydown="removeBorder(this.id)" name="userName" id="userName"
									placeholder="Email/Aarna Id/Mobile Num">
							</div>
						</div>
						<div class="form-group">
							<!--                                 <input id="password" type="password" class="form-control" name="password" required placeholder="Password"> -->
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" class="form-control"
									onkeydown="removeBorder(this.id)" name="password" id="password"
									placeholder="Password">
							</div>

						</div>





						<div class="form-group">

							<!--                                 <button type="submit" class="btn btn-primary"> -->
							<!--                                     Log In -->
							<!--                                 </button> -->
							<button name="submit" type="submit" id="userLoginButton"
								class="btn btn-primary">Login</button>
						</div>


						<div class="form-group">
							<a href="forgotPassword" style="text-decoration: none;">&nbsp;
								Forgot Password?</a>
							<!-- 						<a class="btn btn-link" href="#stayhere"> Forgot Password </a> -->

						</div>

					</form>

				</ul>
				<!--  <span class="header-phone">+91 9440585588</span> -->
			</div>
		</div>
	</nav>
	<div id="slider">

		<div class="col-md-12 container-fluid slider-container"
			style="background: #becfd8 url(user/images/slide1.jpg) no-repeat; width: 100%; background-size: cover; background-position: 60% 0px;">
			<div class="col-md-8"></div>
			<div class="col-md-3 bannerform"
				style="float: right; margin-right: 4%;">

				<form:form commandName="createProfile" action="#" id="registration"
					autocomplete="off" method="post" class="login-form">
					<div id="firstForm">
						<center>
							<h4 style="text-align: left;">Register</h4>
						</center>
						<div class="form-group">
							<label for="user_name">Your eMail Id :</label>
							<form:input path="email" onkeydown="removeBorder(this.id)"
								class="form-control notAllowFirstSpace" placeholder="eMail" />
							<span class="hasError" id="emailError" style="font-size: 13px;"></span>
						</div>
						<div class="form-group">
							<label for="user_password">Create Password :</label>
							<form:password path="regPassword" class="form-control"
								onkeydown="removeBorder(this.id)" maxlength="15"
								placeholder="Password" onkeyup="validatePassword();"
								autocomplete="new-password" />
							<span class="hasError" id="password_error_div"
								style="font-size: 13px; font-weight: 800;"></span>
						</div>
						<div class="form-group">
							<label for="user_ssword">Create Profile For :</label> <select
								id="createProfileFor" name="createProfileFor"
								onfocus="removeBorder(this.id)" class="form-control">
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
								<label class="radio-inline" for="radios-0"> <input
									name="gender" id="radios-0" value="Male" checked="checked"
									type="radio"> Male
								</label> <label class="radio-inline" for="radios-1"> <input
									name="gender" id="radios-1" value="Female" type="radio">
									Female
								</label>

							</div>
						</div>


						<div class="row">
							<div class="form-group">
								<label for="" class="col-md-12">Your Name</label>
								<div class="">
									<div class="col-md-6 firstnam">
										<input type="text" name="firstName"
											onkeydown="removeBorder(this.id)"
											class="form-control onlyCharacters notAllowFirstSpace"
											id="firstName" placeholder="First Name">
									</div>
									<div class="col-md-6 firstnam">
										<input type="text" name="lastName"
											onkeydown="removeBorder(this.id)"
											class="form-control onlyCharacters notAllowFirstSpace"
											id="lastName" placeholder="Last Name">
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>

						<div class="form-group">
							<div class="row">
								<label for="" class="col-md-12">Date of Birth</label>
								<div class="col-md-12">
									<input type="text" name="dob" onclick="removeBorder(this.id)"
										class="form-control" id="dob"
										placeholder="Select Date of Birth" readonly="readonly">
								</div>
							</div>
						</div>


						<div class="form-group">
							<label for="">Religion</label>
							<form:select path="religion" onfocus="removeBorder(this.id)"
								class="form-control">
								<form:option value="">-- Choose Religion --</form:option>
								<form:options items="${religion}"></form:options>
							</form:select>
						</div>

						<div class="form-group">
							<label for="">Mother Tongue</label>
							<form:select path="motherTongue" onfocus="removeBorder(this.id)"
								class="form-control">
								<form:option value="">-- Choose Mother Tongue --</form:option>
								<form:options items="${language}"></form:options>
							</form:select>
						</div>

						<div class="form-group">
							<label for="">Where Do You Live? </label>
							<form:select path="currentCountry"
								onfocus="removeBorder(this.id)" class="form-control">
								<form:option value="">-- Choose Country --</form:option>
								<form:options items="${countries}"></form:options>
							</form:select>
						</div>
						<div class="form-group">
							<input type="button" id="secondButton" value="Sign Up"
								class="btn btn-success btn-block">
							<!--                                                     <button type="button"  id ="secondButton" onclick="submit();" class="btn btn-info btn-block">SIGNUP...</button> -->
						</div>
					</div>
				</form:form>
			</div>
			<!-- <img src="nimages/ban1.jpg" alt="Aarna India"> -->

		</div>
	</div>
	</div>
	<div class="clearfix"></div>
	<div id="search">
		<div class="container">
			<div class="heading">
				<h3 style="padding-top: 0px;">Profile Search</h3>
			</div>
			<div class="row search-box">
				<div class="col-md-12 search search-link">
					<div class="col-md-2">
						<h4>I am looking for</h4>
						<form:form commandName="createProfile" class="form-horizontal"
							id="searchForm" name="searchForm" role="form" method="post">
							<%-- <form:hidden path="gender"/> --%>
							<form:select id="rPeople" path="gender"
								class="custom-select col-md-12 form-control">
								<option value="" selected>I am looking for &nbsp;&nbsp;</option>
								<option value="FeMale" id="id1">Bride</option>
								<option value="Male" id="id2">Groom</option>
							</form:select>
					</div>
					<div class="col-md-3">
						<h4>Age</h4>
						<!-- <span>From </span> -->
						<form:select path="rAgeFrom" id="rAgeFrom" name="rAgeFrom"
							class="for-control" style="width:60px;">
							<option value="" selected>From &nbsp;&nbsp;</option>
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
						</form:select>
						<!-- <span>To </span> -->
						<form:select path="rAgeTo" id="rAgeTo" name="rAgeTo"
							class="formcontrol" style="width:60px;">
							<option value="" selected>To &nbsp;&nbsp;</option>
						</form:select>
					</div>
					<div class="col-md-2">
						<h4>Religion</h4>
						<form:select path="religionId" onchange="getReliginCastAjax1();"
							class=" form-control">
							<form:option value="">Religion&nbsp;&nbsp;</form:option>
							<form:options items="${religion}"></form:options>
						</form:select>
					</div>
					<div class="col-md-2">
						<h4>Caste</h4>
						<form:select path="castId"
							class="custom-select col-md-12 form-control">
							<form:option value="">Caste &nbsp;&nbsp;</form:option>
							<%-- 								<form:options items="${cast}"></form:options> --%>
						</form:select>
					</div>

					<div class="col-md-2">
						<h4>&nbsp;</h4>
						<button type="submit" id="submit12" class="btn btn-primary"
							onclick="searchSubmit();">Search</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div id="strip">
		<div class="container">
			<h1>Welcome to Aarna Matrimony</h1>
			<p>Feel Free to Register, Easy to Use, Get Membership</p>

			<div class="row">
				<div class="col-md-4 privacy">
					<div class="strip-content">
						<img src="nimages/privacy-icon.png" alt="Aarna Matrimony">
						<h2>Privacy</h2>
						<p>We don't sell your data and take care of your privacy
							first.</p>
					</div>
				</div>
				<div class="col-md-4 quality">
					<div class="strip-content">
						<img src="nimages/quality-icon.png" alt="Aarna Matrimony">
						<h2>Quality</h2>
						<p>Quality is our motto. Our profiles are completely verified
							and 100% assured.</p>
					</div>
				</div>
				<div class="col-md-4 secure">
					<div class="strip-content">
						<img src="nimages/secure-icon.png" alt="Aarna Matrimony">
						<h2>Secure &amp; Safety</h2>
						<p>We never mark your details available publicly.</p>
					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<div id="recent-profile">
		<div class="container">
			<div class="row">

				<div class="heading">
					<h3>LATEST BRIDES & GROOMS</h3>
				</div>

				<c:forEach items="${latest_brides_grooms}" var="profile">
					<div class="col-md-2">
						<div class="pro_img">
							<a href="#"> <span class="hidden"> </span> <c:if
									test="${empty profile.profileImage}">
									<div class="image_privacy"></div>
									<image src="${baseurl}/img/default.png" width="250"></a>
							</c:if>
							<c:if test="${not empty profile.profileImage}">
								<div class="image_privacy"></div>
								<div class="homeimages">
									<image src="${catalina_base}/${profile.profileImage}">
									</image>
								</div>
								</a>
							</c:if>

						</div>
						<div class="pro_details">
							Aarna ID : ${profile.username} <br> <span>${profile.religionName}</span>
							<br> ${profile.currentCityName}<br> ${profile.currentStateName}
						</div>



					</div>
				</c:forEach>
				<!-- <div class="col-md-2">
					<div class="pro_img">
						<a href="#"> <span class="hidden"> </span>


							<div class="image_privacy"></div> <image src="nimages/p1.png"
								width="250"></a>
					</div>
					<div class="pro_details">
						Matri ID : 21022 <br> <span>Hindu</span> <br> Tenali,
						Andhra Pradesh
					</div>



				</div>
				<div class="col-md-2">
					<div class="pro_img">
						<a href="#"> <span class="hidden"> </span>


							<div class="image_privacy"></div> <image src="nimages/p2.png"
								width="250"></a>
					</div>
					<div class="pro_details">
						Matri ID : 21020 <br> <span>Hindu</span> <br> Tullur,
						Andhra Pradesh
					</div>



				</div>
				<div class="col-md-2">
					<div class="pro_img">
						<a href="#"> <span class="hidden"> </span>


							<div class="image_privacy"></div> <image src="nimages/p3.png"
								width="250"></a>
					</div>
					<div class="pro_details">
						Matri ID : 21013 <br> <span>Hindu</span> <br>
						Mangalagiri, Andhra Pradesh
					</div>



				</div>
				<div class="col-md-2">
					<div class="pro_img">
						<a href="#"> <span class="hidden"> </span>


							<div class="image_privacy"></div> <image src="nimages/p4.png"
								width="250"></a>
					</div>
					<div class="pro_details">
						Matri ID : 21010 <br> <span>Hindu</span> <br>
						Vijayawada, Andhra Pradesh
					</div>



				</div>
				<div class="col-md-2">
					<div class="pro_img">
						<a href="#"> <span class="hidden"> </span>


							<div class="image_privacy"></div> <image src="nimages/p5.png"
								width="250"></a>
					</div>
					<div class="pro_details">
						Matri ID : 21004 <br> <span>Hindu</span> <br>
						Rajamundry, Andhra Pradesh
					</div>



				</div>
				<div class="col-md-2">
					<div class="pro_img">
						<a href="#"> <span class="hidden"> </span>


							<div class="image_privacy"></div> <image src="nimages/p5.png"
								width="250"></a>
					</div>
					<div class="pro_details">
						Matri ID : 21003 <br> <span>Hindu</span> <br> Guntur,
						Andhra Pradesh
					</div>



				</div>
				<div class="col-md-2">
					<div class="pro_img">
						<a href="#"> <span class="hidden"> </span>


							<div class="image_privacy"></div> <image src="nimages/p6.png"
								width="250"></a>
					</div>
					<div class="pro_details">
						Matri ID : 20998 <br> <span>Christian</span> <br>
						Gudivada, Andhra Pradesh
					</div>



				</div>
				<div class="col-md-2">
					<div class="pro_img">
						<a href="#"> <span class="hidden"> </span>


							<div class="image_privacy"></div> <image src="nimages/p7.png"
								width="250"></a>
					</div>
					<div class="pro_details">
						Matri ID : 20993 <br> <span>Hindu</span> <br> Nellore,
						Andhra Pradesh
					</div>



				</div>
				<div class="col-md-2">
					<div class="pro_img">
						<a href="#"> <span class="hidden"> </span>


							<div class="image_privacy"></div> <image src="nimages/p8.png"
								width="250"></a>
					</div>
					<div class="pro_details">
						Matri ID : 20988 <br> <span>Hindu</span> <br> Krishna,
						Andhra Pradesh
					</div>



				</div>
				<div class="col-md-2">
					<div class="pro_img">
						<a href="#"> <span class="hidden"> </span>


							<div class="image_privacy"></div> <image src="nimages/p9.png"
								width="250"></a>
					</div>
					<div class="pro_details">
						Matri ID : 20982 <br> <span>Hindu</span> <br> Guntur,
						Andhra Pradesh
					</div>



				</div>-->
			</div>
		</div>
	</div>
	<script type="text/javascript">
	/* var religionList="${religionList}";
	
	var hindu='${religionList.Hindu}';
	var muslim='${religionList.Muslim}';
	var chiristian='${religionList.Christian}';
	var jain='${religionList.Jain}';
	
	var castList="${castList}";
	
	var reddy="${castList.Reddi}";
	var vaishya ="${castList.Vaishya}";
    var kamma ="${castList.Kamma}";
    var kapu ="${castList.Kapu}";
    var brahmin ="${castList.Brahmin}";
    var yadav ="${castList.Yadav}";
    var naidu ="${castList.Naidu}";
    var christian ="${castList.Christian}";
    var noorBasha = "${castList.NoorBasha}";
    var syed ="${castList.Syed}";
    var shaik ="${castList.Shaik}";
    var pathan ="${castList.Pathan}"; */
	
	</script>

	</div>
	<section class="about clearfix" id="about">
		<!-- Section id-->
		<div class="container">
			<div class="row">

				<div class="col-md-12 col-sm-12">
					<div class="section-title">
						<h1>SEARCH PROFILES BY</h1>
						<!-- 						<img src="user/images/line-02.jpg" alt=""> -->
					</div>
					<div class="row">
						<form:form id="linkSearchForm" name="linkSearchForm" action="#"
							commandName="createProfile" method="post">
							<form:hidden path="id" />
							<form:hidden path="dosamName" />
							<div class="about-content linkss">
								<c:set var="lineCounter" value="${1}" />
								<c:set var="itemsCounter" value="${1}" />
								<c:forEach items="${religionCasteList}" var="mapp">
									<c:if test="${itemsCounter<=16}">
										<c:if test="${lineCounter==1}">
											<div class="col-md-3">

												<table
													class="table table-bordered table-hover table-condensed">
													<tbody>
														</c:if>
														<tr>
															<td><a href="#"
																onclick="religionSearch(${mapp.id},'${mapp.list_type}');"><c:out
																		value="${mapp.name}" /><span><i
																		class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
														</tr>
														<!-- <tr>
											<td><a href="#" onclick="relig
											ionSearch(muslim,'religion')";>Muslim <span><i class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
										</tr>
										<tr>
											<td><a href="#" onclick="religionSearch(chiristian,'religion')";>Christian<span><i class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
										</tr>
										<tr>
											<td><a href="#" onclick="religionSearch(jain,'religion')";>Jains<span><i class="fa fa-arrow-right" aria-hidden="true"></i></span></a></td>
										</tr> -->

														<c:if test="${lineCounter==4}">
													</tbody>
												</table>
											</div>
										</c:if>




										<c:if test="${lineCounter<=4}">
											<c:set var="lineCounter" value="${lineCounter+1}" />
										</c:if>
										<c:if test="${lineCounter>4}">
											<c:set var="lineCounter" value="${1}" />
										</c:if>
									</c:if>
									<c:set var="itemsCounter" value="${itemsCounter+1}" />
									<%-- <p><c:out value="${mapp.id}" />:<c:out value="${mapp.name}" /></p> --%>
								</c:forEach>

							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</section>

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
											<span>June 9, 2018</span>
											<!-- <a href="successStory#01-thumbnail.jpg">read more...</a> -->
											<!-- <h3>Bride Name & Groom Name</h3>
											<span>June 9, 2017</span> -->
											<a href="successStory&divId=1">read more...</a>
										</figcaption>
									</figure>
								</li>
								<li>
									<figure>
										<img src="user/images/portfolio/02-thumbnail.jpg"
											class="img-responsive img-thumbnail" alt="">
										<figcaption>
											<h3>Sriram & Divya</h3>
											<span>April 28, 2018</span>
											<!-- <a href="successStory#02-thumbnail.jpg">read more...</a> -->
											<!-- <h3>Bride Name & Groom Name</h3>
											<span>June 9, 2017</span> -->
											<a href="successStory&divId=2">read more...</a>
										</figcaption>
									</figure>
								</li>
								<li>
									<figure>
										<img src="user/images/portfolio/03-thumbnail.jpg"
											class="img-responsive img-thumbnail" alt="">
										<figcaption>
											<h3>Raghuram & Swapna</h3>
											<span>May 2, 2017</span>
											<!-- <a href="successStory#03-thumbnail.jpg">read more...</a> -->
											<!-- <h3>Bride Name & Groom Name</h3>
											<span>June 9, 2017</span> -->
											<a href="successStory&divId=3">read more...</a>
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

	<div class="agile-assisted-service text-center">
		<h4>Assisted Service</h4>
		<p>Our Relationship Managers have helped thousands of members find
			their life partners.</p>
		<a href="">Know More</a>
	</div>


	<div class="container">

		<!-- <footer class="footer" id="footer">
			
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-3">
						<div class="logo-footer">
							<a href="HomePage"><img src="images/logo01.png" alt="" class="img-responsive" /></a>
						</div>
					</div>
					<div class="col-md-3 col-sm-3">
						<video poster="user/images/bgvideo.jpg" controls
							src="user/images/Aarna Matrimony for Best Mate ,Together Forever.mp4"
							type="video/mp4">
						</video>

					</div>
					<div class="col-md-6 col-sm-6">
						<div class="contact-info">
							<h5>Our Office</h5>
							<p class="fs-12 address">
								<i class="fa fa-map-marker"></i>Door No 58-2-3/1 Bagaiah Street,<br> Opposite Tanusri Hospital, <br>Pantakalava Road,<br>Benzcircle Vijayawada<br>
							</p>
							<p class="fs-12">
								<i class="fa fa-phone"></i>+91 8466999991
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
							<p class="


-add">
								<span>Email:</span> info@aarnamatrimony.com
							</p>
						</div>
					</div>
				</div> 
			</div>

		</footer> -->
	</div>
	<div class="clearfix"></div>
	<a href="javascript:" id="return-to-top"><i
		class="fa fa-chevron-up"></i></a>
	<div class="footer">
		<div class="container">
			<div class="footer-info w3-agileits-info">
				<div class="col-md-3 address-left agileinfo">
					<div class="footer-logo header-logo">
						<h6>Get In Touch</h6>
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
					<ul style="padding-inline-start: 0px;">
						<li><a href="termsConditionsHomepage">Terms and
								Conditions</a></li>
						<li><a href="privacyAndPolicyHomePage">Privacy Policy</a></li>
						<li><a href="helpHomePage">Help</a></li>
						<li><a href="aboutUsHomePage">About Us</a></li>
						<li><a href="HomePage">Register Free</a></li>
					</ul>
				</div>
				<!-- <div class="col-md-4 footer-grids">
					
						 <h3>Company</h3>
						<ul style="margin-inline-start: 34px;">
							
						</ul>
					</div> -->
				<div class="col-md-4 footer-grids">
					<a href="HomePage"><img src="images/logo01.png" alt=""
						class="img-responsive" /></a>
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
					<img style="margin-top: 70px; width: 200px;" class=""
						src="nimages/satisfaction.png" />
					<!-- 					<img class="img-responsive" src="nimages/secure11.gif"/>		 -->
				</div>
				<!-- 					</div> -->

				<div class="clearfix"></div>
				<br>

				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-8 footer-left" style="padding-top: 8px;">
					A product of Aarna Associates © 2018. All Rights Reserved | Design & Developed by Charvikent ITES Pvt
					Ltd.</div>
				<!-- <div class="col-md-4 footer-center">

</div> -->
				<div class="col-md-4 footer-right">
					<div class="row social-secure">

						Follow us on : <a href="#stayhere"><img src="nimages/fb.png"
							style="height: 30px;" alt="facebook"> </a><a href="#stayhere">
							<img src="nimages/twt.png" style="height: 30px;" alt="twitter">
						</a><a href="#stayhere"> <img src="nimages/linkdn.png"
							style="height: 30px;" alt="linkdn"></a>


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
	<script
		src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js'></script>
	<script src="${baseurl}/user/js/ie-emulation-modes-warning.js"></script>
	<script src="${baseurl}/user/vendor/jquery/jquery.min.js"></script>
	<script src="${baseurl}/user/js/ie10-viewport-bug-workaround.js"></script>
	<script src="${baseurl}/user/vendor/bootstrap/js/bootstrap.min.js"></script>
	<%-- 	<script src="${baseurl}/user/vendor/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script> --%>
	<script src="${baseurl}/user/vendor/scrollreveal/scrollreveal.min.js"></script>
	<%-- 	<script src="${baseurl}/user/js/theme.js"></script> --%>
	<script src="${baseurl}/user/js/custom.js"></script>
	<script src="${baseurl}/js/jquery.blockUI.min.js"></script>
	<script
		src="${baseurl}/user/vendor/woocommerce-FlexSlider/jquery.flexslider.js"></script>
	<script src="${baseurl}/user/js/modernizr.custom.js"></script>
	<script src="${baseurl}/user/js/toucheffects.js"></script>
	<script src="${baseurl}/js/custemValidation1.js"></script>
	<script src="${baseurl}/js/ajax.js"></script>
	<script src="${baseurl}/js/jquery-ui.min.js"></script>
	<script>
//   var ss =new Date().getFullYear()-18;
//   var max =new Date().getFullYear()-40;
  $("#dob").datepicker({
     dateFormat: "dd-MM-yy",
     changeDate : true,
 	changeMonth : true,
 	changeYear : true,
	minDate: "-50Y",
	maxDate: "-18Y",
	yearRange: "-65:+0"
//  	maxDate :0,
//  	 defaultDate: '01-01-1970'
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
    var expr = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|in|yahoo|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$/;
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
        	$('#emailError').text("Enter Valid eMail Id");
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
    			$('#emailError').text("eMail already in Use. Please Try Another.");
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




    $("#secondButton").click(function(event)
//     		function formSubmit()
    		{		
    	var email = $('#email').val();
    			if($('#email').val() ==  null || $('#email').val() == "" || $('#email').val()=="undefined" || $('#createProfileFor').val() ==  null || 
    			    $('#createProfileFor').val() == "" || $('#createProfileFor').val()=="undefined" || $('#regPassword').val() ==  null || $('#regPassword').val() == "" || $('#regPassword').val()=="undefined" || $('#firstName').val() ==  null || $('#firstName').val() == "" || $('#firstName').val()=="undefined" || 
    				$('#lastName').val() ==  null || $('#lastName').val() == "" || $('#lastName').val()=="undefined" ||
    				$('#dob').val() ==  null || $('#dob').val() == "" || $('#dob').val()=="undefined"  || 
    				$('#religion').val() ==  null || $('#religion').val() == "" || $('#religion').val()=="undefined" ||
    				$('#motherTongue').val() ==  null || $('#motherTongue').val() == "" || $('#motherTongue').val()=="undefined" ||
    				$('#currentCountry').val() ==  null || $('#currentCountry').val() == "" || $('#currentCountry').val()=="undefined" )
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
//    	     			$("#createProfileFor").attr("placeholder","Please Enter createProfileFor");
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
    			if(email != "" && !email.match(expr)){
//    	     		alert("Please Enter Valid Email");
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
    	    	var validPwd = validatePassword();
    	    	if(!validPwd){
    	    		return false;
    	    	}
    			
//     		 	$("#firstForm").css({'display':'none'})`	
//     			$('#secondForm').css({'display':'block'});
//    		 		$("#registration").submit();
    		 $('#registration').attr('action',"userRegistration");
    		 $("#secondButton").attr('value','Please wait..');
    		 $("#secondButton").attr('disabled',true);
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

	<%-- 	<script src="${baseurl}/js/plugins/select2/select2.min.js"></script> --%>

	<script>
    jQuery(document).ready(function($){
//    		 $("#religionId").select2({
//    			placeholder : "-- Choose Religion --"
//    		});
//    		$("#cast").select2({
//    			placeholder : "-- Choose Cast --"
//     		});
//    $("#religionId").val(1);
  // $('#religionId').trigger("chosen:updated"); 
  // getReliginCastAjax1(); 
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
  			profile_highlisht_str = '<div class="panel " style="background-color:skyblue">';
  		}
  		var image = orderObj.profileImage;
  		if(typeof image == "undefined" || image=="" || image==null){
  			image = "img/default.png";
  		}
  		var tblRow = profile_highlisht_str
  		+ '<div class="panel-heading">'
  		+ '<h5 class="panel-title" style="text-align:left;">'
  		+ '<div class="form-check">	<label class="form-check-label" style="color:#000;">  '+orderObj.firstName+'&nbsp;'+orderObj.lastName+'</label>	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span></div>'
  		+ '</h5>'
  		+ '</div>'
  		+ '<div class="panel-body">'
  		+ '<div class="col-md-2">' 
  		+ '<a href="#" onclick="regFunction()">  <img src="'+image+'" class="img img-responsive thumbnail " style="margin-bottom:0;height: auto;width: 100%;"></a>'
      	+ '</div>'
      	 + '<div class="col-md-4">'
       	 + '<h2 style="margin-top:10px;" class="pull-right"><a href="#" data-toggle="tooltip" data-placement="bottom" title="View Mobile Number" ><img style="margin-top:-10px;" src="images/Mobile_Icon.png"/></a></h2></span><div class="clearfix"></div><blockquote style="min-height:100px; max-height:120px; "><p>'+orderObj.About+'</p><br><a href="#" onclick="regFunction()"><p style="float:right;">...more</p></a></blockquote>'
       	+ '</div>' 
       	+  '<div class="col-md-1"></div>'
      	+ '<div class="col-md-5">'
  		+ '<table><tbody><tr><td width="150px">Age</td><td><span>: '+orderObj.age+' yrs</span></td></tr>'
  		+ '<tr><td>Religion</td><td><span>: '+orderObj.religionName+'</span></td></tr>'	
  		+ '<tr><td>Community</td><td><span>: '+orderObj.castName+'</span></td></tr>'
  		+ '<tr><td>Location</td><td><span>: '+orderObj.cityName+'</span></td></tr>'
  		+ '<tr><td>Education</td><td><span>: '+orderObj.Education+'</span></td></tr>'
  		+ '<tr><td>Profession</td><td><span>: '+orderObj.Proffession+'</span></td></tr></tbody></table>'
      	+ ' <a href="#" onclick="regFunction()"><button class="btn btn-warning">View Full Profile</button></a>'
      	+ '</div>'
      	+ '</div>' 
      	+ '</div>' 
      	+ '</div>'
      	+ '</div>';
  			$(tblRow).appendTo("#searchResults");
  	});
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
    		optionsForClass.append(new Option("Caste", ""));
    		$.each(alldata, function(i, tests) {
    			var id=tests.id;
    			var casteName=tests.name;
    			optionsForClass.append(new Option(casteName, id));
    		});
    		
    	});
    }
    
    function religionSearch(id,name){
    	$("#id").val(id);
    	$("#dosamName").val(name);
    	document.linkSearchForm.action = "homePageReligionAndCast"
    	document.linkSearchForm.submit();
    	/* 
    	var religion= id;
    	var name=name;
    		var formData = new FormData();
    		formData.append("religionId",religion);
    		formData.append("list_type",name);
    	$.fn.makeMultipartRequest('POST', 'homePageReligionAndCast', false,
    			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var alldata = jsonobj.searchListOrders;
    		$("#searchResults").html('');
    		displaydata(alldata);
    		$('#myModal').modal('show');
    	}); */
    		
    }
    
    function castSearch(id,name){
    	var castId= id;
    	var name=name;
    		var formData = new FormData();
    		formData.append("castId",castId);
		    formData.append("list_type",name);
    	$.fn.makeMultipartRequest('POST', 'homePageReligionAndCast', false,
    			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var alldata = jsonobj.searchListOrders;
    		$("#searchResults").html('');
    		displaydata(alldata);
    		$('#myModal').modal('show');
    	});
    		
    } 
    
    $("#submit12").click(function(e) {
  	  
    	var rPeople= $('#rPeople').val();
    	var rAgeFrom= $('#rAgeFrom').val();
    	var rAgeTo= $("#rAgeTo").val();
    	 if(rPeople == ""){
    			alert("You are looking for?");
    			e.preventDefault();
    			return false;
    			}
    	if(rAgeFrom > rAgeTo){
    		alert("Sorry, Invalid Age range");
    		e.preventDefault();
    		return false;
    	}else{
        	document.searchForm.action = "homePageSearchResults"
        		document.searchForm.submit();
        }
    	  
    	});
    
   
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
   
    	/* {
//     	var Female= $('#id1').val();
//     	var Male= $('#id2').val();
    	var people= $('#rPeople').val();
    	var rAgeFrom= $('#rAgeFrom').val();
    	var rAgeTo= $("#rAgeTo").val();
    	$("#gender").val(people); */
    	/* var gender="";
           	if(people != $('#id2').val() ){
           		gender="Female";
           		$("#gender").val("Female");
    	    }else
    	    {
    		   gender="Male";
    		   $("#gender").val("Male");
    	   } */
         
       
    		/* var formData = new FormData();
    		formData.append("gender",gender);
    		formData.append("rAgeFrom",rAgeFrom);
    		formData.append("rAgeTo",rAgeTo);
    		formData.append("religionId",religion);
    		formData.append("castId",castId);
    	$.fn.makeMultipartRequest('POST', 'homePageSearchResults', false,
    			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var alldata = jsonobj.searchListOrders;
    		 window.location.href="${baseurl}/homePageSearch";
//     		$("#searchResults").html('');
//     		displaydata(alldata);
    		 
//     		$('#myModal').modal('show');
    	});	 */
    	 $("#password_error_div").html('');		
    	
   
    
    /* $(".multiselect").click(function(){
    	$(".dropdown-content").css("display", 'block');
    }); */
    /* $(".navbar-toggle").click(function(e){
    	  $(this).toggleClass("open");
    	}); */
    
    </script>
	<script type="text/javascript">
    $(function () {
        $('.navbar-collapse ul li a:not(.dropdown-toggle)').bind('click touchstart', function () {
                $('.navbar-toggle:visible').click();
        });
});
    
   
    function validatePassword(){
    	
    	
  	   var str = $("#regPassword").val();
  	   var upper_text= new RegExp('[A-Z]');
  	   var lower_text= new RegExp('[a-z]');
  	   var number_check=new RegExp('[0-9]');
  	   var special_char= new RegExp('[!/\'^£$%&*()}{@#~?><>,|=_+¬-\]');
  	   
  	   var upper_text_flag = false;
  	   var lower_text_flag = false;
  	   var number_check_flag = false;
  	   var special_char_flag = false;
  	   var min_length_flag = false;
  	   if(str.match(upper_text) || str.match(lower_text)){
  		 upper_text_flag = true;
  		 $("#password_error_div").html('');
  		$("#password_error_div").attr("hidden",true);
  	   }else{
  		   $("#password_error_div").html('');
  		   $("#password_error_div").html('Enter atleast one alphabet letter');
  		   $("#password_error_div").removeAttr("hidden");
  		   return false;  
  	   }
  	 
  	   /* if(str.match(lower_text)){
  		   lower_text_flag = true;
	  		 $("#password_error_div").html('');
	   		$("#password_error_div").attr("hidden",true);
  	   }else{
  		   $("#password_error_div").html('');
  		   $("#password_error_div").html('Enter atleast one lowercase letter');
  		   $("#password_error_div").removeAttr("hidden");
  		   return false;  
  	   } */
  	   
  	   if(str.match(number_check)){
  		   number_check_flag = true;
  		 	$("#password_error_div").html('');
	   		$("#password_error_div").attr("hidden",true);
  	   }else{
  		   $("#password_error_div").html('');
  		   $("#password_error_div").html('Enter atleast one number');
  		   $("#password_error_div").removeAttr("hidden");
  		   return false;  
  	   }
  	   
  	   if(str.match(special_char)){
  		   special_char_flag = true;
  		 	$("#password_error_div").html('');
	   		$("#password_error_div").attr("hidden",true);
  	   }else{
  		   $("#password_error_div").html('');
  		   $("#password_error_div").html('Enter atleast one special character');
  		   $("#password_error_div").removeAttr("hidden");
  		   return false;  
  	   }
  	   
  	   if(str.trim().length>=8){
  		   min_length_flag = true;
  			 $("#password_error_div").html('');
	   		$("#password_error_div").attr("hidden",true);
  	   }else{
  		   $("#password_error_div").html('');
  		   $("#password_error_div").html('Should contain minimum 8 characters');
  		   $("#password_error_div").removeAttr("hidden");
  		   return false;  
  	   }
  	   //$("#regPassword").val(str);
  	   return true; 
     }
  	   
     $("#regPassword").on("keypress", function(e) {
    	 if (e.which == 32)
             return false;
    	});
</script>

</body>

</html>
