<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<!-- Apple devices fullscreen -->
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<!-- Apple devices fullscreen -->
	<meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />

	<title>Matrimony - Login</title>
	<link rel="shortcut icon" href="img/aarna1.jpg"/>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<!-- icheck -->
	<link rel="stylesheet" href="css/plugins/icheck/all.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Color CSS -->
	<link rel="stylesheet" href="css/themes.css">
	<!-- Animate CSS -->
	<link rel="stylesheet" href="css/animate.css">


	<!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	

	<!--[if lte IE 9]>
		<script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
		<script>
			$(document).ready(function() {
				$('input, textarea').placeholder();
			});
		</script>
	<![endif]-->


	<!-- Favicon -->
<!-- 	<link rel="shortcut icon" href="img/favicon.html" /> -->
	<!-- Apple devices Homescreen icon -->
	<link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-precomposed.png" />
<style>
.alert-success, .alert-warning, .alert-danger{color: white !important;}
.alert-success{background-color: #4CAF50 !important;}
.alert-warning{background-color: #ff6600 !important;}
.alert-danger{background-color: #d43f3a !important;}

.error {color: red; font-weight: normal;}
span.has-error,span.hasError
{
  font-weight: normal;
  border-color: #e73d4a;
  color:red;
  margin-top: -3px;
  display: block !important;
  position: absolute;
}
</style>
</head>

<body class='login'>
	<div class="wrapper">
		<h1>
			<a href="#"><img src="img/aarna.jpg" alt="" class='retina-ready' width="59" height="49">AARNA</a>
		</h1>
		<div class="login-body" style="padding: 40px 30px 20px;">
<!-- 			<h3 style="padding-left: 30px;margin-top: auto;">SIGN IN</h3> -->
			<form:form commandName="loginForm" action="loginAction" method='post' class='form-validate' id="loginform">
				<c:if test="${not empty msg}">
					<div class="msgcss controls fadeOut animated alert alert-danger" style="animation-delay: 5s;">
						${msg}
					</div>
				</c:if>
				<div class="form-group">
					<div class="email controls">
						<form:input path="userName" placeholder="Enter Username" autocomplete="off" class='form-control validate'/>
						<span class="hasError" id="userNameError"></span>
						<span><form:errors path="userName" cssClass="error" /></span>
					</div>
				</div>
				<div class="form-group">
					<div class="pw controls">
						<form:password path="password" placeholder="Enter Password" autocomplete="off" class='form-control validate'/>
						<span class="hasError" id="passwordError"></span>
						<span><form:errors path="password" cssClass="error" /></span>	
					</div>
				</div>
				<div class="form-group">
					<!-- <div class="remember">
						<input type="checkbox" name="remember" class='icheck-me' data-skin="square" data-color="blue" id="remember">
						<label for="remember">Remember me</label>
					</div> -->
					<input type="submit" value="Log in" id="submit1" class='btn btn-primary'>
					<input type="button" value="Reset" id="cancel" class='btn btn-danger'>
				</div>
			</form:form>
			<!-- <div class="forget">
				<a href="#"><span>Forgot password?</span></a>
			</div> -->
		</div>
	</div>
	
<script src="js/custemValidation.js"></script>
<script type="text/javascript">

	function validate(id, errorMessage)
	{
		var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
		if($('#'+id).val() ==  null || $('#'+id).val() == ""  || $('#'+id).val()=="undefined" ) {
			$('style').append(styleBlock);
			$('#'+id).css('border-color','#cc0000');
			$('#'+id).attr('placeholder',errorMessage);
			$('#'+id).addClass('placeholder-style');
// 			$('#'+id).css('color','#cc0000');
// 			$('#'+id+'Error').text(errorMessage);
		}else{
			$('#'+id).css('border-color','');
			$('#'+id).removeClass('placeholder-style');
// 			$('#'+id).css('color','');
// 			$('#'+id+'Error').text("");
		}
	}

	$("#submit11").click(function()
	{
		if($('#userName').val() ==  null || $('#userName').val() == "" || $('#userName').val()=="undefined" || 
			$('#password').val() ==  null || $('#password').val() == ""  || $('#password').val()=="undefined")
		{
			$('style').append(styleBlock);
			if($('#userName').val() ==  null || $('#userName').val() == ""  || $('#userName').val()=="undefined" ) 
			{
				$('#userName').css('color','#cc0000');
				$('#userName').css('border-color','#cc0000');
				$('#userName').attr('placeholder','Please Enter Username');
				$('#userName').addClass('placeholder-style');
			}
			else
			{
				$('#userName').css('border-color','');
				$('#userName').removeClass('placeholder-style');
			}
			if($('#password').val() ==  null || $('#password').val() == ""  || $('#password').val()=="undefined" ) 
			{
				$('#password').css('color','#cc0000');
				$('#password').css('border-color','#cc0000');
				$('#password').attr('placeholder','Please Enter Password');
				$('#password').addClass('placeholder-style');
			}
			else
			{
				$('#password').css('border-color','');
				$('#password').removeClass('placeholder-style');
			}
			return false;
		}
		else{
			$("#submit1").attr("disabled",true);
            $("#submit1").val("Please wait...");
		}
		$("#loginform").submit();
	});
	
	$("#cancel").click(function()
	{
		$("#loginform")[0].reset();
		$('#userName').css('border-color','');
		$('#userName').removeClass('placeholder-style');
		$('#password').css('border-color','');
		$('#password').removeClass('placeholder-style');
	});

	window.setTimeout(function() {
	    $(".msgcss").fadeTo(500, 0).slideUp(500, function(){
	        $(this).remove(); 
	    });
	}, 5000);
</script>

</body>
</html>