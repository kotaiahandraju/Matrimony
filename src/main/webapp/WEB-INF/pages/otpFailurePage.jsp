<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Aarna Matrimony">
    <meta name="author" content="Aarna Matrimony">

    <title>Aarna Matrimony</title>

    <!-- Bootstrap core CSS -->
    <link href="${baseurl}/user/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
           
    <script src="${baseurl}/user/js/ie-emulation-modes-warning.js"></script>
    <link href="${baseurl}/user/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${baseurl}/user/vendor/woocommerce-FlexSlider/flexslider.css" type="text/css" media="screen" />
    <link href="${baseurl}/user/css/style.css" rel="stylesheet">
    <link href="${baseurl}/user/css/custom.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${baseurl}/user/css/component.css" />
    <script src="${baseurl}/user/js/modernizr.custom.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
.dispnone
{
	display: none !important;
}
.hiddencss
{
	visibility: hidden;
}
body {
	background:#F1F1F2;
}
.container { background:#FFF;}
.ilogo { padding:15px 0; border-bottom:12px solid #F1F1F2 }
.control-label { text-align:left;}
.midcontnet { border-bottom:12px solid #F1F1F2; padding-bottom:40px; }
.manditory{color: red;}

.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}





/* body{margin:40px;} */

.stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
</style>

  </head>

  <body>
  
  
  
  
        <div class="container">
            <div class="row">
            <div class="ilogo">
            <div class="col-md-7 col-sm-7">
              <img src="user/images/logo.jpg" class="img-responsive">
            </div>
            <div class="col-md-5 col-sm-12">
            	<!-- <div class="stepwizard">
				    <div class="stepwizard-row">
				        <div class="stepwizard-step">
				            <button type="button" id="step1" class="btn btn-default btn-circle">1</button>
				            <p>Cart</p>
				        </div>
				        <div class="stepwizard-step">
				            <button type="button" id="step2" class="btn btn-default btn-circle">2</button>
				            <p>Shipping</p>
				        </div>
				        <div class="stepwizard-step">
				            <button type="button" id="step3" class="btn btn-default btn-circle">3</button>
				            <p>Shipping</p>
				        </div>
				        <div class="stepwizard-step">
				            <button type="button"  id="step4" class="btn btn-default btn-circle" >4</button>
				            <p>Payment</p>
				        </div> 
				    </div>
				</div> -->
            </div>
            <div  class="clearfix"></div>    
    		</div>
     </div>
     
   <div class="row">
   <div class="midcontnet">
   <div class="col-sm-12">
		<div class="errorMessage" id="Create Profile_invalid_em_" >
		
			<c:if test="${not empty message}">
				<div class="alert alert-success fadeIn animated">${message}</div>
				<a href="profile.htm?page=3" class="btn4 btn btn-info">Edit Mobile No.</a>
			</c:if>
			<c:if test="${not empty msg}">
				<div class="alert alert-success fadeIn animated">${msg}</div>
				<a href="HomePage" class="btn4 btn btn-info">Go To HomePage</a>
			</c:if>
		</div>
		
	</div>
   
 <script type="text/javascript">
function checkOTP(){
	var receivedOTP = $("#otp1").val();
		if(receivedOTP==""){
			alert("Enter OTP");
			return false;
		}
    	var formData = new FormData();
    	var mobileNum = ${profileToBeCreated.mobile};
    	
    	formData.append('mobileNo', mobileNum);
    	formData.append('otp1', receivedOTP);
		$.fn.makeMultipartRequest('POST', 'checkOtp', false,
				formData, false, 'text', function(data){
			if(data=="fail"){
				alert("OTP mismatched!!");
				$("#homepageBtn").removeAttr("hidden");
			}
		
	}); 
}
</script>  
  <%@ include file="homeFooter2.jsp"%>
