<%@ include file="userStepsHeader.jsp"%>
<%@ include file="homeMenu.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<div class="clearfix"></div>
<style>
.newimg {
float: right;
    margin-right: 20%;
}
@media  (min-width: 320px) and (max-width:640px) {
.newimg {
float: right;
    margin-right: 0% !important;
    margin-top:15px
}
}

.form-control {
font-size:12px;
}
body {
    font-size: 13px;
}
.panel {
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
}

.cha {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
}
</style>
<img src="nimages/help.jpg" class="img-responsive" />
<div class="container" style="background: white; padding-top: 25px;">
	<div class="container-fluid">
	<div class="col-md-8">
		<div class="panel ">
			<div class="panel-heading"><h4>Help</h4></div>
			<div class="panel-body" style="min-height: 295px;">

				<p align="justify">Aarna Matrimony is eager to help you find your partner at the
				earliest. Our Customer Service team will be pleased to assist you
				anytime you have a query. You can contact our Customer Service team
				in one of the following ways.</p></br>
				
				<div class="col-md-6">
				
				<b>Our Office :</b><br>Door No 58-2-3/1,<br>
Bagaiah Street,<br>
Opposite Tanusri Hospital,<br> 
Pantakalava Road,<Br>
Benzcircle Vijayawada.<br> +91 8466999991 <br>Email:
				<a href="" style="color:blue;">info@aarnamatrimony.com</a>
</div>


<br>
	<div class="col-md-6">
<img  src="nimages/secure.png" class="img-responsive newimg"/></div>

</div></div></div>
<div class="col-md-4 cha"><h4>Leave Message</h4>
         <form:form commandName="createProfile" action="#" method="post" class="login-form">
			<div class="clearfix" style="padding-bottom: 8px;"></div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user"></i></span> <form:input
						type="text" class="form-control validate onlyCharacters notAllowFirstSpace"
						path="leaveMsgUserName" placeholder="Name"></form:input>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span> <form:input
						type="email" class="form-control validate" 
						path="leaveMsgMail" placeholder="eMail"></form:input> 
				</div>
						 <span class="hasError" id="emailError1" style="color: red;"></span>

						</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span> <form:input
						type="text" class="form-control validate numbersOnly"
						 path="leaveMsgMobile" maxlength="10" placeholder="Mobile"></form:input>
				</div>

						</div>

			<div class="form-group">
				<form:textarea path="leaveMsgText" 
					placeholder="Enter few words about you"
					class="form-control validate onlyCharacters notAllowFirstSpace" rows="2"></form:textarea>
				<span id="errorMsg" style="color: red"></span>
				<div></div>
				<div class="clearfix" style="padding-bottom: 8px;"></div>

				<div class="form-group">
					<button  type="submit" id="submit2"
						class="btn btn-primary pull-right" >Submit</button>
				</div>
				<div class="clearfix" style="padding-bottom: 3px;"></div>
					</form:form>

<div class="clearfix" style="padding-bottom:3px;"></div>
		

			
		</div>
</div></div>
<script src="${baseurl}/js/ajax.js"></script>
<<script type="text/javascript">
var leaveMsgMail = $('#leaveMsgMail').val();
	var expr = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|in|yahoo|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$/;
 $('#leaveMsgMail').blur(function() {
var leaveMsgMaill = $('#leaveMsgMail').val();
if(leaveMsgMaill == "" || !leaveMsgMaill.match(expr)){
//	alert("Please Enter Valid Email");
	$("#leaveMsgMail").css("border-color","#e73d4a");
	$("#leaveMsgMail").attr("title","Email-ID");
	$('#leaveMsgMail').css('color','red');
	$('#emailError1').html("Enter Valid eMail Id");
//	$('#email').focus();
	return false;
event.preventDefault();
}
else{
	$('#emailError1').html("");
}
 });
var idArray = $.makeArray($('.validate').map(function() {
	return this.id;
}));
$('#submit2').click(function(event) {
	validation = true;
	$.each(idArray, function(i, val) {
		var value = $("#" + idArray[i]).val();
		var placeholder = $("#" + idArray[i]).attr('placeholder');
		if (value == null || value == "" || value == "undefined") {
			
			 $("#" + idArray[i] ).attr("placeholder", placeholder);
			 $("#" + idArray[i] ).css('border-color','#e73d4a');
			    $("#" + idArray[i] ).css('color','#e73d4a');
			    $("#" + idArray[i] ).addClass('your-class');
//			$("#" + idArray[i] + "Error").text("Please " + placeholder);
			validation = false;
		}
	});
		if(validation){
			LeaveMsgSubmit();
			$("#submit2").attr("disabled",true);
		}else {
			event.preventDefault();
			return false;
		}
		
});

$('.validate').keydown(function() {
	var id = $(this).attr('id');
	removeBorder(id);
});
//remove borders
function removeBorder(el){	
	  $("#"+el).css("border", "");
	  $("#"+el).css('color','black');
	  $('#'+el).addClass('default-class');
	  if ($("#" + el+"_chosen").length)
		{
			$("#" +el+"_chosen").children('a').css('border-color','black');
		}
}
$('.numbersOnly').keyup(function() {
	this.value = this.value.replace(/[^0-9]/g, '');
});

$(".numbersOnly").keydown(function(e) {
	// Allow: backspace, delete, tab, escape, enter and .
	if ($.inArray(e.keyCode, [ 46, 8, 9, 27, 13, 110 ]) !== -1 ||
	// Allow: Ctrl+A, Command+A
	(e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
	// Allow: home, end, left, right, down, up
	(e.keyCode >= 35 && e.keyCode <= 40)) {
		// let it happen, don't do anything
		return;
	}
	if (e.keyCode===190 || ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
			&& (e.keyCode < 96 || e.keyCode > 105))) {
		e.preventDefault();
	}
});
$(".onlyCharacters").on("keypress",	function(event) {
	var englishAlphabetAndWhiteSpace = /[A-Za-z. ]/g;
	var key = String.fromCharCode(event.which);
	if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37
			|| event.keyCode == 39
			|| englishAlphabetAndWhiteSpace.test(key)) {
		return true;
	}
	return false;
});


$('.notAllowFirstSpace').on('keydown', function(e) {
if (e.which === 32 &&  e.target.selectionStart === 0) {
return false;
}  
});
function LeaveMsgSubmit(){
 var expr = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|in|yahoo|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$/;
	var leaveMsgUserName = $("#leaveMsgUserName").val();
	var leaveMsgMail = $("#leaveMsgMail").val();
	var leaveMsgMobile = $("#leaveMsgMobile").val();
	var leaveMsgText = $("#leaveMsgText").val();
	if(leaveMsgMail == "" || !leaveMsgMail.match(expr)){
//		alert("Please Enter Valid Email");
   	$("#leaveMsgMail").css("border-color","#e73d4a");
   	$("#leaveMsgMail").attr("title","Email-ID");
   	$('#leaveMsgMail').css('color','red');
   	$('#emailError1').html("Enter Valid eMail Id");
//    	$('#email').focus();
   	return false;
	event.preventDefault();
	}
	else{
		$('#emailError1').html("");
	}
	
	var formData = new FormData();
	formData.append("leaveMsgUserName",leaveMsgUserName);
	formData.append("leaveMsgMail",leaveMsgMail);
	formData.append("leaveMsgMobile",leaveMsgMobile);
	formData.append("leaveMsgText",leaveMsgText);
	
	$.fn.makeMultipartRequest('POST', 'LeaveMsgSubmit', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
			alert("successfully Sent Message");
			$('#leaveMsgUserName').val("");
			$('#leaveMsgMail').val("");
			$('#leaveMsgMobile').val("");
			$('#leaveMsgText').val("");
			$("#submit2").attr("disabled",false);
		
	});
}
</script>



				<%@ include file="homeFooter.jsp"%> 