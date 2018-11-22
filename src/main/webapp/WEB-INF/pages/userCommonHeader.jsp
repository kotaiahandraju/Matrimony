<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
	String catalina_base =  request.getScheme() + "://" + request.getServerName() +":" +request.getServerPort();
	session.setAttribute("catalina_base", baseurl);
%>				

<html>
<head>
	<title>Aarna Matrimony</title>
	<link rel="shortcut icon" href="${baseurl }/img/aarna-fav.png"/>
	<!-- for-mobile-apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!-- For Google -->
<meta name="description" content="no1 telugu matrimonial service, best telugu matrimony website" />
<meta name="keywords" content="matrimonial, telugu matrimony, no1 matrimony in vijayawada" />

<meta name="author" content="Aarna Associates" />
<meta name="copyright" content="Aarna Matrimony" />
<meta name="application-name" content="aarnamatrimony.com" />

<!-- For Facebook -->
<meta property="og:title" content="Aarna Matrimony" />
<meta property="og:type" content="article" />
<meta property="og:image" content="${baseurl }/images/fac.jpg" />
<meta property="og:url" content="http://www.aarnamatrimony.com" />
<meta property="og:description" content="matrimonial, telugu matrimony, no1 matrimony in vijayawada" />

<!-- For Twitter -->
<meta name="twitter:card" content="summary" />
<meta name="twitter:title" content="Aarna Matrimony" />
<meta name="twitter:description" content="matrimonial, telugu matrimony, no1 matrimony in vijayawada" />
<meta name="twitter:image" content="${baseurl }/images/twi.jpg" />
	<script type="application/x-javascript">
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); }
	
	      var auto_refresh = setInterval(
							     function ()
							     {
							     	//$('#load_me').load('${baseurl}/sample.jsp').fadeIn("slow");
							     	var formData = new FormData();
							    	 $.fn.makeMultipartRequest('POST', 'refreshCounts', false,
												formData, false, 'text', function(data){
									    		var jsonobj = $.parseJSON(data);
									    		var all_counts = jsonobj.all_counts;
									    		$("#matches_count").html(all_counts.yetToBeViewedCount);
									    		$("#yet_to_count").html(all_counts.yetToBeViewedCount);
									    		$("#viewed_not_contacted_count").html(all_counts.viewedNotContactedCount);
									    		$("#messages_count").html(all_counts.pendingRequestsCount);
									    		$(".pend_req_count_class").html(all_counts.pendingRequestsCount);
									    		$("#notifications_count").html(all_counts.notificationsCount);
									    		//$("#inbox_count").html(all_counts.pendingRequestsCount);
											});
						
							     }, 1000);  // autorefresh the content of the div after
							                //every 1000 milliseconds(1sec)
    </script>
	<!-- //for-mobile-apps -->
	<link href="${baseurl }/user/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${baseurl }/user/css/style-profile.css" rel="stylesheet" type="text/css" media="all" />
	<link href="${baseurl }/user/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" type="text/css" href="${baseurl }/css/asPaginator.css">
	<link href="${baseurl }/user/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${baseurl }/css/animate.min.css" />
	<link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
	<link href="${baseurl }/css/thickbox.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${baseurl }/css/plugins/select2/select2.css">
	<link href="${baseurl }/user/css/style.css" rel="stylesheet" type="text/css">
	<link href="${baseurl }/user/css/style-profile.css" rel="stylesheet" type="text/css">
	<script src="${baseurl }/user/js/jquery-1.11.1.min.js"></script>
	<script src="${baseurl }/js/plugins/select2/select2.min.js"></script>
	<script src="${baseurl }/js/jquery.watermark.js"></script>
	<script src="${baseurl }/js/jquery.littlelightbox.js"></script>
	<link href="${baseurl }/css/jquery.littlelightbox.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


	<style type="text/css">
	input, button, select, textarea {
    font-family: 'Open Sans', sans-serif;}
	.newma  td:first-child { 
	font-weight:bold;}
	.products {
	margin-top:100px;}
	.products .container {
	background:#f1f1f1 !important;
	}
	b, strong {
    font-weight: 600 !important;
}
	.container {
	background:#f1f1f1 !important;
	}
	.btn-info {
    color: #0f7cc1;
    background-color: #e1f7e5;
    border-color: #46b8da;
}
.btn.disabled, .btn[disabled], fieldset[disabled] .btn {
    pointer-events: none;
    cursor: not-allowed;
    filter: alpha(opacity=65);
    -webkit-box-shadow: none;
    box-shadow: none;
    opacity: 1 !important;
}
	.btn-default {
    color: #ec1212;
    background-color: #fffbfb;
    border-color: #ccc;
    width: 78px !important;
}
.btn {
font-weight:bold;}
.form-check-label a {
font-weight:bold;
font-size:15px;}
	a {
	cursor:pointer;}
.note {
padding-right:0px;
padding-left:0px;
}
.notifications a{
color:#000;
}
.notifications a:hover{
color:#777;
}
.imgareaselect-outer {
position:fixed !important;}
#notification_li
			{
			position:relative
			}
			#notificationContainer 
			{
			background-color: #fff;
			border: 1px solid rgba(100, 100, 100, .4);
			-webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
			overflow: visible;
			position: absolute;
			top: 35px;
			
			width: 250px;
			z-index:999;
			display: none; // Enable this after jquery implementation 
			}
			// Popup Arrow
			#notificationContainer:before {
			content: '';
			display: block;
			position: absolute;
			width: 0;
			height: 0;
			color: transparent;
			border: 10px solid black;
			border-color: transparent transparent white;
			margin-top: -20px;
			margin-left: 188px;
			}
			#notificationTitle
			{
			font-weight: bold;
			padding: 8px;
			font-size: 13px;
			background-color: #f2f2f3;
			
			z-index: 1000;
			width: 248px;
			border-bottom: 1px solid #dddddd;
			}
			#notificationsBody
			{
			padding: 3px 0px 0px 0px !important;
			max-height:300px;	
    overflow-y: scroll;
			}
			#notificationFooter
			{
			background-color: #e9eaed;
			text-align: center;
			font-weight: bold;
			padding: 8px;
			font-size: 12px;
			border-top: 1px solid #dddddd;
			}

::-webkit-scrollbar {
    width: 6px;
}

/* Track */
::-webkit-scrollbar-track {
    background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
    background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background: #555; 
}
::-moz-scrollbar {
width: 3px;
}
::-moz-scrollbar-track {
-moz-box-shadow: inset 0 0 6px #fff);
background:#f1f1f1;
}
::-moz-scrollbar-thumb {
border-radius: 10px;
-moz-box-shadow: inset 0 0 6px #fff;
background:#888;
}*
scrollbar{
-moz-appearance: none !important;
		#notification_count 
		{
		padding: 3px 7px 3px 7px;
		background: #cc0000;
		color: #ffffff;
		font-weight: bold;
		margin-left: 77px;
		border-radius: 9px;
		-moz-border-radius: 9px; 
		-webkit-border-radius: 9px;
		position: absolute;
		margin-top: -11px;
		font-size: 11px;
		}
		</style>
	<style>
	::-webkit-input-placeholder {
color: #cfcfcf !important;

}
 
:-moz-placeholder { /* Firefox 18- */
color: #cfcfcf !important; 

}
 
::-moz-placeholder {  /* Firefox 19+ */
color: #cfcfcf !important;  

}
 
:-ms-input-placeholder {  
color: #cfcfcf !important;  
}
.closeic {
float:right;

}
tooltip:hover:after {
    display: inline-block;
    content: attr(data-tooltip);
    white-space: pre-wrap;
    color: Tomato;
    background-color: OldLace;
    padding: 1em;
}
	.smallSlides0 {
	height:200px;
	overflow:hidden;
	}
	.createdby {
	color:#000 !important;
	
	}
	.morecon {
	color:#006699 !important;
	}
	.pendinginbox td {
	line-height:2.5;
	}
	hr {
	margin-top:8px !important;
	margin-bottom:8px !important;
	}
	.scrollup{
			width:40px;
			height:40px;			
			text-indent:-9999px;
			
			position:fixed;
			bottom:50px;
			right:100px;
			display:none;			
			background: url('${baseurl }/images/icon_top.png') no-repeat;
		}
	
		
.watermarkcontent span{
opacity : 0.7;
}
.watermarkcontent_profilepic {
  position: absolute; /* Position the background text */
  top: -15px; /* At the bottom. Use top:0 to append it to the top */
  //background: rgb(0, 0, 0); /* Fallback color */
  //background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: white; /* Grey text */
  width: 100%; /* Full width */
  padding: 10px; /* Some padding */
  transform: rotate(90deg);
//transform-origin: left top 0;
width : 0;
}
.watermarkcontent_profilepic span{
opacity : 0.6;
font-size : 13px;
}

.watermarkcontent_fullpic {
  position: absolute; /* Position the background text */
  padding-top: 30%; /* At the bottom. Use top:0 to append it to the top */
  //background: rgb(0, 0, 0); /* Fallback color */
  //background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: white; /* Grey text */
  //width: 100%; /* Full width */
  padding-left: 10px; /* Some padding */
  transform: rotate(0deg);
//transform-origin: left top 0;
width : 600px;
}
.watermarkcontent_fullpic span{
opacity : 0.3;
font-size : 45px;
text-align:center;
}

		</style>
		
		<script type="text/javascript">
		/* $(function() {
		    var text_height = $('.watermarkcontent_profilepic span').width() + 14 ;
		    var image_height = $('.profileauto').height() ;
			while( $('.watermarkcontent_profilepic span').width() > $('.profileauto').height() ) {
		        $('.watermarkcontent_profilepic span').css('font-size', (parseInt($('.watermarkcontent_profilepic span').css('font-size')) - 1) + "px" );
		    }
		    while( $('.watermarkcontent_profilepic span').width() < $('.profileauto').height() ) {
		        $('.watermarkcontent_profilepic span').css('font-size', (parseInt($('.watermarkcontent_profilepic span').css('font-size')) + 1) + "px" );
		    }
		}); */
			$(document).ready(function(){ 
			
			$(window).scroll(function(){
				if ($(this).scrollTop() > 100) {
					$('.scrollup').fadeIn();
				} else {
					$('.scrollup').fadeOut();
				}
			}); 
			
			$('.scrollup').click(function(){
				$("html, body").animate({ scrollTop: 0 }, 600);
				return false;
			});
 
		});
		</script>
		
	<script type="text/javascript">
	$(function(){
		 //add text water mark;	
	  addWaterMark();
	  watermark_text_fullimg();
	 });
	var v1 = 23;var v2 = 23;
	 function addWaterMark(){
		  $('.watermark_text').watermark({
			  text: 'aarnamatrimony.com',
			  textWidth: 700,
			  textSize: v1+v2,
			  textColor: 'white',
			  gravity: 'w',
			   opacity: 0.8,
			   //margin: 0,
			   outputWidth: 'auto',
			   outputHeight: 'auto'
			 });
	 }
	 function watermark_text_fullimg(){
		  $('.watermark_text_fullimg').watermark({
			  text: 'aarnamatrimony.com',
			  textWidth: 900,
			  textSize: 60,
			  textColor: 'white',
			  gravity: 'n',
			   opacity: 0.8,
			   margin: 10
			   //outputWidth: 'auto',
			   //outputHeight: 'auto'
			 });
	 }
		$(function(){
			$(".dropdown").hover(            
				function() {
					if($(window).width() > 760){
						$('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
						$(this).toggleClass('open');
					}
				},
				function() {
					if($(window).width() > 760){
						$('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
						$(this).toggleClass('open');
					}
			});
		});
		
		$(function(){
			$(".dropdown1").hover(            
				function() {
					if($(window).width() < 760){
						$('.dropdown-menu1', this).stop( true, true ).fadeIn("fast");
						$(this).toggleClass('open');
					}
				},
				function() {
					if($(window).width() < 760){
						$('.dropdown-menu1', this).stop( true, true ).fadeOut("fast");
						$(this).toggleClass('open');
					}
			});
		});

		/* $(window).resize(function () {
		    if ($(window).width() < 768) {
		        var dropdown = $("body").find(".horizontal-menu");
		        dropdown.find(".nav li.dropdown .dropdown-toggle").each(function (e) {
		            $(this).removeAttr("data-hover");
		        });
		        $(".dropdown-menu").html(horizontalmenu.html());
		    } else {
		        $(".nav li.dropdown .dropdown-toggle").each(function (e) {
		            $(this).dropdownHover();
		        });
		    };
		}); */
		/* function zoomImage(image){
			$('#dial1').html('');
			if(image == "" || image == null || image == "undefined"){
				image = "img/default.png";
			}
			var tblRow = "<div>"
		 		+ 	"<div >"
		 		+		"<img src="+image+" width='600px' class='watermark_text1'/>"
		 		+ 	"</div></div>";
			$(tblRow).appendTo('#dial1');
			
			$('.watermark_text1').watermark({
				  text: 'aarnamatrimony.com',
				  textWidth: 700,
				  textSize:76,
				  textColor: 'white',
				  gravity: 'n',
				  opacity: 0.3,
				  //margin: 10,
				  outputWidth: 'auto',
				  outputHeight: 'auto'
				 });
			$('#dial1').dialog({
				width: 700, height: 2000, modal: true,
				buttons: {
		            "Enrol": function()
		            {
		                $(this).dialog('close');
		                choice(true);
		            },
		            "Cancel Enrol": function()
		            {
		                $(this).dialog('close');
		                choice(false);
		            }
		        }
				}).dialog('open');
		} */
		
		function shortList(profileId){
			$("#id").val(profileId);
			var profileObj = serviceUnitArray[profileId];
			$("#shortListModalName").html("");
			var expIntUserName=profileObj.firstName+" "+profileObj.lastName+""+"("+profileObj.username+")";
			$("#shortListModalName").html(expIntUserName);
			//var profileObj = serviceUnitArray[profileId];
			var formData = new FormData();
			formData.append('profile_id',profileId);
			jQuery.fn.makeMultipartRequest('POST', 'shortList', false,
					formData, false, 'text', function(data){
		    		var jsonobj = $.parseJSON(data);
		    		var msg = jsonobj.message;
		    		if(typeof msg != "undefined"){
		    			if(msg=="success"){
		    				$("#profile_id").val(profileId);
		    				$("#memberName").val(expIntUserName);
		    				$("#member_name_todisplay").html(" to "+profileObj.firstName+" "+profileObj.lastName);
		    				$("#shortlistTD"+profileId).html('');
		    				$("#shortlistTD"+profileId).html('<a type="button" class="btn btn-warning btn-sm" disabled="true"> Shortlisted</a>');
		    				$("#sendMailShortlistModal").attr("onclick","displayMailPopup("+profileId+",'"+expIntUserName+"')");
							$('#shortlistModal').show();
		    				$('#shortlistModal').modal();
		    				//$("#shortlistTD"+profileId).removeAttr("href");
		    				//$("#shortlistTD"+profileId).attr("disabled");
		    			}else{
		    				alert("Some problem occured. Please try again.");
		    			}
		    		}
		    		
			});
	}
		
		var profileObj = [];
		var shortlistTD=[];
		var profile_id=[];
		function requetAllExpressInterest() {
			var selected_boxes = $('.yet-to-send:checked');
			var selected_boxes_length = selected_boxes.length;
			if (selected_boxes_length == 0) {
				alert("Please select atleast one profile.");
				return false;
			}
			
			var roleId = ${cacheGuest.roleId};
			profileObj = [];  
			shortlistTD=[];
			
// 				$('.form-check-input[type="checkbox"]:checked').each(function(){
					$('.yet-to-send:checked').each(function(){
						
					var res = this.value;
					profile_id.push(res);
				    var expInterest= serviceUnitArray[res];
				    profileObj.push(expInterest);

			});
					
			/* $('span[name^=shortlistTD]').each(function(){
				if($.trim($(this).text()) != ""){
					console.log("222222222  :"+this.id);
					var str = this.id; 
					var res= str.replace("shortlistTD", "");
					shortlistTD.push(res);
				}
			}); */
		
			if(roleId==4){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
				var membershipStatus = ${cacheGuest.membership_status};
				if(membershipStatus!="1"){
					alert("Your membership validity period is over. Renew/Upgrade your membership plan and get more profiles");
					return false;
				}
				if(profileObj.mobileNumViewed==0 && profileObj.message_sent_status==0){
					if(allowed_limit<=0){
						alert("Exceeded allowed profiles limit.");
						return false;
					}
				}
				var formData = new FormData();
			console.log(profile_id);
				 formData.append('profile_id',profile_id);
				 jQuery.fn.makeMultipartRequest('POST', 'expressInterestAll', false,
						formData, false, 'text', function(data){
			    		var jsonobj = $.parseJSON(data);
			    		var limit = jsonobj.allowed_limit;
			    		var msg = jsonobj.message;
			    		var profiles = jsonobj.allProfiles;
			    		//if(typeof msg != "undefined" ){
			    			if("success"==msg){
			    				//$("#expInterest"+profile_id).html('<a type="button" class="btn btn-blue btn-sm" disabled="true">Expressed Interest</a>');
			    				alert("Interest requests have been sent successfully");
			    				
			    				$('.yet-to-send:checked').each(function(){
									
			    					$("#chkbox"+this.value).attr("disabled",true);
			    					$("#expInterest"+this.value).html('<a type="button" class="btn btn-blue btn-sm" disabled="true">Expressed Interest</a>');
			    					$(this).removeClass("yet-to-send");

			    				});
			    				if(typeof limit != "undefined"){
			    					if(limit=="unlimited"){
			    						allowed_limit = "1";
			    						allowed_limit = parseInt(allowed_limit);
			    					}else{
			    						allowed_limit = limit;
			    					}
			    				}
			    				$("#available_limit_span").html(allowed_limit);
			    			}else if("failed"==msg || "exception"==msg){
			    				alert("Interest request is not successful. Please try again.");
			    			}
			    		
						
					}); 
			}
		}

	
	
		function expressInterest(profile_id){
			var roleId = ${cacheGuest.roleId};
			$("#id").val(profile_id);
			var profileObj = serviceUnitArray[profile_id];
			$("#expressModalName").html("");
			var expIntUserName=profileObj.firstName+" "+profileObj.lastName+""+"("+profileObj.username+")";
			$("#expressModalName").html(expIntUserName);
			if(typeof profileObj == "undefined"){
				profileObj = serviceUnitArray2[profile_id];
			}
			if(roleId==4){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
				var membershipStatus = ${cacheGuest.membership_status};
				if(membershipStatus!="1"){
					alert("Your membership validity period is over. Renew/Upgrade your membership plan and get more profiles");
					return false;
				}
				if(profileObj.mobileNumViewed==0 && profileObj.message_sent_status==0){
					if(allowed_limit<=0){
						alert("Exceeded allowed profiles limit.");
						return false;
					}
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
			    				$("#profile_id").val(profile_id);
			    				$("#memberName").val(expIntUserName);
			    				$("#member_name_todisplay").html(" to "+profileObj.firstName+" "+profileObj.lastName);
// 			    				$("#shortlistTD"+profile_id).html('');
			    				$("#expInterest"+profile_id).html('<a type="button" class="btn btn-blue btn-sm" disabled="true">Expressed Interest</a>');
// 			    				alert("Interest request has been sent successfully");
								$("#sendMailexpressModal").attr("onclick","displayMailPopup("+profile_id+",'"+expIntUserName+"')");
								$('#expressModal').show();
			    				$('#expressModal').modal();
                           
			    				//$("#expInterest"+profile_id).html('You Expressed Interest');
			    				//$("#expInterest"+profile_id).attr("disabled",true);
			    				if(typeof limit != "undefined"){
			    					if(limit=="unlimited"){
			    						allowed_limit = "1";
			    						allowed_limit = parseInt(allowed_limit);
			    					}else{
			    						allowed_limit = limit;
			    					}
			    				}
			    				$("#available_limit_span").html(allowed_limit);
			    			}else if("failed"==msg || "exception"==msg){
			    				alert("Interest request is not successful. Please try again.");
			    			}
			    		
						
					});
			}
		}
		
		function displayMobileNum(profileId,listType){
			var roleId = ${cacheGuest.roleId};
			$("#id").val(profileId);
			var profileObj = serviceUnitArray[profileId];
			if(roleId==4){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
				var membershipStatus = ${cacheGuest.membership_status};
				if(membershipStatus!="1"){
					alert("Your membership validity period is over. Renew your membership plan and get more profiles");
					return false;
				}
				if(profileObj.expressedInterest==0 && profileObj.message_sent_status==0){
					if(allowed_limit<=0){
						alert("Exceeded allowed profiles limit.");
						return false;
					}
				}
				
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
			    				$("#mobileTD"+profileId).html('<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+profileObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>');
			    				if(typeof limit != "undefined"){
			    					if(limit=="unlimited"){
			    						allowed_limit = "1";
			    						allowed_limit = parseInt(allowed_limit);
			    					}else{
			    						allowed_limit = limit;
			    					}
			    				}
			    				$("#available_limit_span").html(allowed_limit);
			    			}else{
			    				alert("Some problem occured. Please try again.");
			    			}
			    		}
			    		
				});
			}
			
		}
		
		function displayMatches_myhome(listOrders) {
			$('#matches').html('');
			serviceUnitArray = {};
			smallerSlideIndex = {};
			if(listOrders==""){
				//var tblRow = '<div>No matches found.</div>';
				var tblRow = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No data found..!</h6></div>';
				$(tblRow).appendTo("#matches"); 
				$("#pagination_div").prop("hidden",true);
			}
			$.each(listOrders,function(i, orderObj) 
			{
				paginationSetup(total_items_count);
				$("#altLists").asPaginator('enable');
				$("#pagination_div").removeAttr("hidden");
				displayTableFooter(1);
				serviceUnitArray[orderObj.id] = orderObj;
				
				var array = null;
//		 		var imageUrl =null;
				
				var image = null; image = orderObj.profileImage;
				if(image == "" || image == null || image == "undefined"){
					image = "img/default.png";
				}
				/* else{
				array = image.split(",");
				
				$.each(array,function(i){
					image = array[i];
//		 			   alert(array[i]);
					});
				} */
				
					var login_user_role_id = ${cacheGuest.roleId};
					var firstname = '<img src="${baseurl}/images/blurr.png"/>',lastname='';
					var ageStr = orderObj.age;
					var age = ageStr.split(".")[0];
					var occName = orderObj.occupationName;
					if(occName==null)
						occName = "";
					if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
							|| (login_user_role_id == 13) || (login_user_role_id == 14) || (login_user_role_id == 15) || (login_user_role_id == 16)){ //means premium,premium_plus,aarna premium users
					
						firstname = orderObj.firstName;
						lastname = orderObj.lastName;
						//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
						//more_details_str = '<tr><td><span><a href="#no" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
						//mobile_no__str = '<tr><td><span><a href="#no" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
					}
					
					var premiumMember = "";
					var memberRoleId = orderObj.role_id;
					if(memberRoleId!=null && memberRoleId!="" && (typeof memberRoleId != "undefined")){
						if(memberRoleId==12){
							 premiumMember = "<span class='premium-member'>Classic Member</span>";
						}
						if(memberRoleId==13){
							 premiumMember = "<span class='premium-member'>Classic Advantage Member</span>";
						}
						if(memberRoleId==6){
							 premiumMember = "<span class='premium-member'>Premium Member</span>";
						}
						if(memberRoleId==11){
							 premiumMember = "<span class='premium-member'>Premium Plus Member</span>";
						}
						if(memberRoleId==14){
							 premiumMember = "<span class='premium-member'>Aarna Family Member</span>";
						}
						if(memberRoleId==15){
							 premiumMember = "<span class='premium-member'>Premium Member</span>";
						}
					}
					var shortListType = "${list_type}";
					var shortListedStr;
					if(shortListType != null && typeof shortListType != "undefined" && shortListType=="shortListedByMe"){
						shortListedStr = '';
					}else{
						shortListedStr = '<span id="shortlistTD'+orderObj.id+'"><a  href="#no" type="button" class="btn btn-warning btn-sm" onclick="shortList('+orderObj.id+')"> Shortlist</a></span>';
						if(orderObj.short_listed == "1"){
							shortListedStr = '<span><a type="button" class="btn btn-warning btn-sm" disabled="true"> Shortlisted</a></span>';
						}
					}
					var expressed = orderObj.expressedInterest;
					var interestStr = "";
					if(expressed==0){
						interestStr = '<span id="expInterest'+orderObj.id+'"><a   href="#no" type="button" class="btn btn-success  btn-sm"  onclick="expressInterest('+orderObj.id+')">  Express Interest  </a></span>';
					}else if(expressed>0){
						interestStr = '<span><a type="button" class="btn btn-success btn-sm" disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>';
					}
					var message_sent_status = orderObj.message_sent_status;
					var messageStr = "";
					if(message_sent_status>0){
						messageStr = 'You sent an email to this member.';
					}
					var mobNumViewed = orderObj.mobileNumViewed;
					var mobile_num_Str = "";
					if(mobNumViewed=="1" || expressed=="1" || message_sent_status=="1"){
						mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;float:left;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;float:left;color:#4baa26;">Verified </span>)</font></span>';
					}else{
						mobile_num_Str = '<span ><a href="#no" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+')">View Mobile Number</a></span>';
					}
					var profession = orderObj.occupationName;
					if((profession == null) || profession == ""){
						profession = "Not Specified";
					}
					var photos_list = orderObj.photosList;
					var slider = "", displayStyle = ' ';
					if(typeof photos_list != "undefined" && photos_list!=""){
						smallerSlideIndex[orderObj.id] = 0;
						$.each(photos_list,function(index,photo){
							if(photo.image==orderObj.profileImage){
								displayStyle = ' style="display:block;" '
							}else{
								displayStyle = ' style="display:none" ';
							}
							slider += '<div class="picstyle smallSlides'+orderObj.id+'" '+displayStyle+'>'
									+'	<a href="#"	onclick="fullProfile('+orderObj.id+')"><img src="${catalina_base}/'+photo.image+'" class="img img-responsive watermark_text" style="margin-bottom:0;height: auto;width: 100%;" ></a>'
									+'</div>'
						});
						if(photos_list.length>1){
							slider += '<p style="display: table;">'
									+'	<a id="prevBtn'+orderObj.id+'" class="" style="text-decoration: none; margin: 0px 0px 0px 7px;" href="#no" onclick="plusSmallSlides(-1,'+orderObj.id+')">&#10094;</a>'
									//+'	<span>'+(i+1)+' of '+photos_list.length+'</span><br>'
				    			    +'	<a id="nextBtn'+orderObj.id+'" class="" style="text-decoration: none; margin-left: 41px;" href="#no" onclick="plusSmallSlides(1,'+orderObj.id+')">&#10095;</a>'
									+'</p>'
						}
					}else{
						slider = '<a href="#"	onclick="fullProfile('+orderObj.id+')"><img src="${catalina_base}/'+image+'" class="img-responsive thumbnail" style="margin-bottom: 0px; "></a>';
					}
					var profile_highlisht_str = '<div class="panel panel-default" style="padding-top:5px;" >';
					var highlight_option = orderObj.profile_highlighter;
					if(typeof highlight_option != "undefined" && highlight_option=='1'){
						profile_highlisht_str = '<div class="panel panel-default" style="background:url(); padding-top:5px;">';
					}
					var tblRow = profile_highlisht_str
						+ '<div class="col-md-2" style="margin-right:0; padding-right:0;">'
			            //+ 	"<img src="+image+" class='img-responsive thumbnail' style='margin-bottom: 0px;'>"
			            + slider
			            + '</div>'
			            + '<div class="col-md-6">'
			            + 	'<div class="profilesimilar">'
			            + 		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
			            + 			'<tr><td><h4><a href="#" style="font-weight:bold;" onclick="fullProfile('+orderObj.id+')">'+firstname+'&nbsp;'+lastname+'</h4>&nbsp;('+orderObj.username+')</a>&nbsp;'+premiumMember+'</td></tr>'
			            + 			'<tr><td><p>'+age+' yrs, '+orderObj.religionName+', '+orderObj.casteName+',</p></td></tr>'
			            + 			'<tr><td><p>'+orderObj.inches+'&nbsp'+occName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'.</p></td></tr>'
			            //+			mobile_no__str
			            //+ 			'<tr><td><span><a href="#no" onclick="fullProfile('+orderObj.id+')">Full Profile</span> </td></tr>'
			            + 		'</table>'
			            + 	'</div>'
			            + '</div>'
			            + '<div class="col-md-3" style="margin-right:0; padding-right:0;">'
			            +  '<h4 style="margin-bottom:20px;">Like this Profile?</h4>'
			            + interestStr
			            //+ 	'<a href="#no" id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</a><br><br>'
			            +   '<br>'
			            + 	'<a href="#no"  type="button" class="btn btn-primary btn-sm view0" onclick="fullProfile('+orderObj.id+')">View Full Profile</a>'
			               //+   '<button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
			            +   shortListedStr
			            + '<a href="#no" type="button" class="btn btn-danger btn-sm" id="sendMail'+orderObj.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a>'
			            + '</div>'
			            //+ mobile_num_Str
			            + '<div class="row container-fluid">'
			            + 	'<div class="col-md-12" style="margin-right:0; padding-right:0;">'
			            +		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
			            + 			'<tr>'
			            //+				'<td><button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button></td>'
			            //+ 				'<td>&nbsp;</td><td><button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>'
			            //+				'<td><a href="#no" onclick="fullProfile('+orderObj.id+')">View Full Profile</a></td>'
			            + 				'<td id="mobileTD'+orderObj.id+'">'+mobile_num_Str+'</td>'
			            +				'<td></td>'
// 			            + 				'<td id="shortlistTD'+orderObj.id+'">'+shortListedStr+'</td>'
			            + '</tr>'
			            + 		'</table>'
			            //+ 		'<button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
			            //+   	'<button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
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
				
			});
		}
		
		function displayMatches_matches(listOrders,new_matches) {
			$('#searchResults').html('');
			$("#search_criteria").prop("hidden",true);
			$('#searchresultsDiv').removeAttr("hidden");
			serviceUnitArray = {};
			smallerSlideIndex = {};
			$.each(listOrders,function(i, orderObj) 
			{
				serviceUnitArray[orderObj.id] = orderObj;
				
				var array = null;
//		 		var imageUrl =null;
				
				var image = null; image = orderObj.profileImage;
				if(image == "" || image == null || image == "undefined"){
					image = "../img/default.png";
				}
				/* else{
				array = image.split(",");
				
				$.each(array,function(i){
					image = array[i];
//		 			   alert(array[i]);
					});
				} */
				
					var login_user_role_id = ${cacheGuest.roleId};
					var insert_str = '';
					var mobile_no__str = '';
					var more_details_str = '';
					var expressed = orderObj.expressedInterest;
					var firstname = '<img src="${baseurl}/images/blurr.png"/>',lastname='';
					//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><a href="#no" type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</a></td></tr>';
					//insert_str = '<a href="#no" id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</a>';
					/* if(expressed==0){
						insert_str = '<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button>';
					}else if(expressed>0){
						insert_str = '<button class="btn btn-primary btn-block">Expressed Interest</button>';
					} */
					/* if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 14)){ //means premium user
						mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
						//more_details_str = '<tr><td><span><a href="#no" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
						//mobile_no__str = '<tr><td><span><a href="#no" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
						if(expressed==0){
							insert_str = '<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button>';
						}else if(expressed>0){
							insert_str = '<button class="btn btn-primary btn-block">Expressed Interest</button>';
						}
					} */
					if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
							|| (login_user_role_id == 13) || (login_user_role_id == 14) || (login_user_role_id == 15) || (login_user_role_id == 16)){ //means premium,premium_plus,aarna premium users
					
						firstname = orderObj.firstName;
						lastname = orderObj.lastName;
					}
					var abtMySelf = orderObj.aboutMyself;
					if(typeof abtMySelf == "undefined" || abtMySelf==null){
						abtMySelf = "";
					}else{
						abtMySelf = abtMySelf.substring(0,40);
					}
					var premiumMember = "";
					var memberRoleId = orderObj.role_id;
					if(memberRoleId!=null && memberRoleId!="" && (typeof memberRoleId != "undefined")){
						if(memberRoleId==12){
							 premiumMember = "<span class='premium-member'>Classic Member</span>";
						}
						if(memberRoleId==13){
							 premiumMember = "<span class='premium-member'>Classic Advantage Member</span>";
						}
						if(memberRoleId==6){
							 premiumMember = "<span class='premium-member'>Premium Member</span>";
						}
						if(memberRoleId==11){
							 premiumMember = "<span class='premium-member'>Premium Plus Member</span>";
						}
						if(memberRoleId==14){
							 premiumMember = "<span class='premium-member'>Aarna Family Member</span>";
						}
						if(memberRoleId==15){
							 premiumMember = "<span class='premium-member'>Premium Member</span>";
						}
					}
					var shortListedStr = '<span id="shortlistTD'+orderObj.id+'" name="shortlistTD[]"><a href="#no" type="button" class="btn btn-info btn-sm" onclick="shortList('+orderObj.id+')"> Shortlist</a></span>';
					if(orderObj.short_listed == "1"){
						shortListedStr = '<span><a type="button" class="btn btn-info btn-sm" disabled="true"> Shortlisted</a></span>';
					}
					var status_str = "";
					var expressed = orderObj.expressedInterest;
					var interestStr = "";
					var check_box_str = ' yet-to-send"';
					if(expressed==0){
						interestStr = '<span id="expInterest'+orderObj.id+'" name="expInterest[]"><a   href="#no" type="button" class="btn btn-warning btn-sm"  onclick="expressInterest('+orderObj.id+')">  Express Interest  </a></span>';
					}else if(expressed>0){
						interestStr = '<span><a type="button" class="btn btn-warning btn-sm" disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>';
						check_box_str = '" disabled="true"  checked="checked"';
					}
					var message_sent_status = orderObj.message_sent_status;
					var messageStr = "";
					if(message_sent_status>0){
						messageStr = 'You sent an email to this member.';
					}
					var mobNumViewed = orderObj.mobileNumViewed;
					var mobile_num_Str = "";
					if(mobNumViewed=="1" || expressed=="1" || message_sent_status=="1"){
						mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;float:left;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;float:left;color:#4baa26;">Verified </span>)</font></span>';
					}else{
						//mobile_num_Str = '<span ><a href="#no" type="button" style="margin: 11px 0px 10px 0px;" class="btn btn-info btn-sm" onclick="displayMobileNum('+orderObj.id+')">View Mobile Number</a></span>';
						mobile_num_Str = '<span id="mobileTD'+orderObj.id+'"><h2 style="margin-top:10px;" class="pull-right"><a href="#" data-toggle="tooltip" data-placement="bottom" title="View Mobile Number" onclick="displayMobileNum('+orderObj.id+')"><img style="margin-top:-10px;" src="${baseurl}/images/Mobile_Icon.png"/> &nbsp;</a></h2></span>';
					}
					var profession = orderObj.occupationName;
					if((profession == null) || profession == ""){
						profession = "Not Specified";
					}
					if(new_matches!="" && new_matches=="newMatches"){
						var photos_list = orderObj.photosList;
						var slider = "", displayStyle = ' ';
						if(photos_list == "" || typeof photos_list == "undefined"){
							slider = '<a href="#" onclick="fullProfile('+orderObj.id+')"><img src="../img/default.png" class="img img-responsive thumbnail " style="margin-bottom:0;height: 140px;width: 100%;" ></a>';
						}else{
							smallerSlideIndex[orderObj.id] = 0;
							var slider = "", displayStyle = ' ';
							var photosArray = photos_list.split(",");
							$.each(photosArray,function(index){
								if(photosArray[index]==orderObj.profileImage){
									displayStyle = ' style="display:block;" '
								}else{
									displayStyle = ' style="display:none;" ';
								}
								slider += '<div class="picstyle smallSlides'+orderObj.id+'" '+displayStyle+'>'
										+'	<a href="#" onclick="fullProfile('+orderObj.id+')">	<img src="${catalina_base}/'+photosArray[index]+'" class="img img-responsive thumbnail " style="margin-bottom:0;height: 140px;width: 100%;" >'
										+'</div>'
							});
							if(photosArray.length>1){
								slider += '<p style="display: table;">'
									+'	<a id="prevBtn'+orderObj.id+'" class="" style="text-decoration: none; margin: 0px 0px 0px 7px;" href="#no" onclick="plusSmallSlides(-1,'+orderObj.id+')">&#10094;</a>'
									//+'	<span>'+(i+1)+' of '+photos_list.length+'</span><br>'
				    			    +'	<a id="nextBtn'+orderObj.id+'" class="" style="text-decoration: none; margin-left: 41px;" href="#no" onclick="plusSmallSlides(1,'+orderObj.id+')">&#10095;</a>'
									+'</p>'
							}
							
						}
					}else{
						var photos_list = orderObj.photosList;
						var slider = "", displayStyle = ' ';
						if(typeof photos_list != "undefined" && photos_list!=""){
							smallerSlideIndex[orderObj.id] = 0;
							$.each(photos_list,function(index,photo){
								if(photo.image==orderObj.profileImage){
									displayStyle = ' style="display:block" '
								}else{
									displayStyle = ' style="display:none" ';
								}
								slider += '<div class=" picstyle smallSlides'+orderObj.id+'" '+displayStyle+'>'
										+	'<a href="#" onclick="fullProfile('+orderObj.id+')"> <img src="${catalina_base}/'+photo.image+'" class="img img-responsive thumbnail" style="margin-bottom:0;height: auto;width: 100%;" ></a>'
										+'</div>'
							});
							if(photos_list.length>1){
								slider += '<p style="display: table;">'
										+'	<a id="prevBtn'+orderObj.id+'" class="" style="text-decoration: none; margin: 0px 0px 0px 7px;" href="#no" onclick="plusSmallSlides(-1,'+orderObj.id+')">&#10094;</a>'
										//+'	<span>'+(i+1)+' of '+photos_list.length+'</span><br>'
					    			    +'	<a id="nextBtn'+orderObj.id+'" class="" style="text-decoration: none; margin-left: 41px;" href="#no" onclick="plusSmallSlides(1,'+orderObj.id+')">&#10095;</a>'
										+'</p>'
							}
						}else{
							slider = '<a href="#" onclick="fullProfile('+orderObj.id+')"><img src="${catalina_base}/'+image+'" class="img-responsive thumbnail" style="margin-bottom: 0px;"></a>';
						}
					}
					var profile_highlisht_str = '<div class="panel panel-default">';
					var highlight_option = orderObj.profile_highlighter;
					if(typeof highlight_option != "undefined" && highlight_option=='1'){
						profile_highlisht_str = '<div class="panel panel-default" style=" background: url(../nimages/newbackground.png); padding-top:5px;">';
					}
					
					var tblRow = profile_highlisht_str
						+ '<div class="panel-heading">'
						+ '<h5 class="panel-title">'
						+ '<div class="form-check">'
						+ '	<label class="form-check-label"> <input type="checkbox" id="chkbox'+orderObj.id+'" class="form-check-input '+check_box_str+' value="'+orderObj.id+'"><a href="#" onclick="fullProfile('+orderObj.id+')">'+firstname+' '+lastname+'&nbsp;('+orderObj.username+')</a>&nbsp;'+premiumMember+'</label>'
						+ '	<span class="pull-right">Created for '+orderObj.createProfileFor+' </span>'
						/* <a href="#" data-toggle="tooltip" data-placement="bottom" title="Mark As Viewed"><img style="margin-left:15px;" src="${baseurl}/images/eye.png"/></a>
						<a href="#" data-toggle="tooltip" data-placement="bottom" title="Move this profile &#xa; to ignore  list"><img style="margin-left:15px;" src="${baseurl}/images/ignore.png"/></a>
						 */
						//+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+orderObj.firstName+' '+orderObj.lastName+'</label>'
//		 				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'

						+ '</div>'
						+ '</h5>'
						+ '</div>'
						+ '<div class="panel-body">'
						+ '<div class="col-md-3 picstyle" style="padding-left:0px; padding-right:0px;">'
						//+ '<a href="#no"> <img src='+image+' class="img img-responsive thumbnail" style="width: 150px; height: 120px;"></a>'
						+ slider
						+ '<div class="watermarkcontent">'
						+ '<span>aarnamatrimony.com</span>'
						+ '</div>	'
		            	+ '</div>'
		            	+ '<div class="col-md-4">'
		  				+ mobile_num_Str
		                + '<div class="clearfix"></div>'
		            	+ '<blockquote style="min-height:100px; max-height:120px; "><p>'+abtMySelf+'....</p><br>'
		                //+ '<br>'
		                + '<a href="#" onclick="fullProfile('+orderObj.id+')"><p style="float:right;">...more</p></a>'
		                + '</blockquote>'
		                + '</div>'
		            	+ '<div class="col-md-5 newma">'
		            	+ '<table>'
		            	+ '	<tr><td width="150px">Age/Height</td><td><span>: '+orderObj.age+' yrs, '+orderObj.inches+'</span></td></tr>'
		            	+ '	<tr><td>Religion</td><td><span>: '+orderObj.religionName+'</span></td></tr>'
		            	+ '	<tr><td>Mother Tongue</td><td><span>: '+orderObj.motherTongueName+'</span></td></tr>'
		            	+ '	<tr><td>Community</td><td><span>: '+orderObj.casteName+'</span></td></tr>'
		            	+ '	<tr><td>Location</td><td><span>: '+orderObj.currentCityName+'</span></td></tr>'
		            	+ '	<tr><td>Education</td><td><span>: '+orderObj.educationName+'</span></td></tr>'
		            	+ '	<tr><td>Profession</td><td><span>: '+profession+'</span></td></tr>'
		            	+ '<tr><td colspan="2"><a href="#no" type="button" class=" " onclick="fullProfile('+orderObj.id+')">View Full Profile</a></td></tr>'
		            	//+ '<tr><td colspan="2"><button type="button" style="background: transparent; margin: 0px 5px 05px 0px;border: none;" id="mobileTD'+orderObj.id+'">'+mobile_num_Str+'</button></td></tr>'
		            	+'</td></tr>'
		            	//+ '	<tr><td>Age</td><td><span>: '+orderObj.age+'</span></td></tr>'
		            	//+ '	<tr><td colspan="2">'+orderObj.aboutMyself+'... <a href="#no" onclick="showMore('+orderObj.id+')"> read more..</a> </td></tr>'
		            	//+  more_details_str
		            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#no" > read more..</a> </td></tr>'
		            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#no" > more detailssss</a> </td></tr>'
		            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#no" > more detailssss</a> </td></tr>'
		            	+ '</table>'
		            	+ '</div>'
		            	+ '<div class="clearfix"></div><hr>'
		            	/* + '<div id="hideMe'+orderObj.id+'" class="form-group hideMe">'
		            	+ '    <label class="col-md-4 control-label" for="textinput"></label>'  
		            	+ '    <div class="col-md-6 text-center">'
		            	+ '    	<span class="more" style="color: #0087AF;cursor: pointer;"><a href="#no" >read more </a></span><i style="cursor: pointer;" class="fa fa-angle-down"></i>'
		            	+ '    </div>'
		            	+ '</div>' */
		            	+ '<div class="col-md-3">'
		            	+ ' Profile Score <button type="button" class="btn btn-primary" style="padding: 0px 1px !important;"><span class="badge"  style="padding: 1px 7px !important;">'+orderObj.match_score+'%</span></button>'
		            	+ '</div>'
		            	+ '<div class="col-md-2">'
		            	+ '<a href="#no" type="button" class="btn btn-default btn-sm" id="sendMail'+orderObj.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a>'
		            	+ '</div>'
		            	+ '<div class="col-md-3">'
		            	+ interestStr
		            	+ '</div>'
		            	//+ '<span id="expInterest'+orderObj.id+'"><a href="#no" type="button" class="btn btn-primary btn-block btn-md"  onclick="expressInterest('+orderObj.id+')">Send Interest</a></span>'
		            	+ '<div class="col-md-3">'
		               //+ '<c:if test="${(cacheGuest.roleId == 6)}">'
		            	//+ insert_str
						//+ '</c:if>	 '
						//+ '<span id="shortlistTD'+orderObj.id+'"><a href="#no" class="btn btn-danger btn-block btn-md" onclick="shortList('+orderObj.id+')">Short List</span></a>'
						+shortListedStr
		            	+ '<div class="clearfix"></div>'
		            	+ '</div>'
		            	+ '</div>'
		            	+ '</div>';
					$(tblRow).appendTo("#searchResults");
				
			});
		}
		
		function displayMatches_inbox(listOrders,listType,tabType){
			serviceUnitArray = {};
			smallerSlideIndex = {};
			var divId = listType;
			var divElem = "#"+divId;
			var element = $(divElem);
			
			$(".tabcontent").attr("hidden",true);
			$("#"+tabType+"_div").removeAttr("hidden");
			
			
			$(".tab-content_inbox").attr("hidden",true);
			$(".tab-content_inbox").removeClass('active');
			var actived_nav = $('.nav-tabs > li.active');
			actived_nav.removeClass('active');
			
			$("#"+listType+"_tab").removeAttr('hidden');
			$("#"+listType+"_tab").removeClass('hide');
			$("#"+listType+"_tab").addClass('active');
			$("#"+listType+"_section").removeClass('hide');
			$("#"+listType+"_section").removeAttr('hidden');
			$("#"+listType+"_section").addClass('active');
			
			$("#"+divId).html('');
			if(listOrders==""){
				var tblRow = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No requests found..!</h6></div>';
				//var tblRow = "No data available";
				$(tblRow).appendTo("#"+divId);
				//$("#table_footer").attr("hidden",true);
    			//$("#altLists").attr("hidden",true);
    			$("#pagination_div").prop("hidden",true);
			}
			$.each(listOrders,function(i, orderObj) 
			{
				console.log(orderObj);
				serviceUnitArray[orderObj.id] = orderObj;
				
				var array = null;
//		 		var imageUrl =null;
				
				var image = null; image = orderObj.profileImage;
				if(image == "" || image == null || image == "undefined"){
					image = "${baseurl}/img/default.png";
				}

				if(orderObj.firstName !=null)
				{
					var login_user_role_id =${cacheGuest.roleId}; 
					var insert_str = '';
					var mobile_no__str = '';
					var more_details_str = '';
					var expressed = orderObj.expressedInterest;
					var firstname = '<img src="${baseurl}/images/blurr.png"/>',lastname='';
					if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
							|| (login_user_role_id == 13) || (login_user_role_id == 14) || (login_user_role_id == 15) || (login_user_role_id == 16)){ //means premium,premium_plus,aarna premium users
					
						firstname = orderObj.firstName;
						lastname = orderObj.lastName;
					}
					var occName = orderObj.occupationName;
					if(occName==null)
						occName = "";
					var ageStr = orderObj.age;
					var age = ageStr.split(".")[0];
					var options = "";
					var acceptOptions = "";
						
						var abtMySelf = orderObj.aboutMyself;
						if(abtMySelf=="undefined" || abtMySelf==null){
							abtMySelf = "";
						}
						/* var premiumMember = "";
						var memberRoleId = orderObj.role_id;
						if(memberRoleId!=null && memberRoleId!="" && (memberRoleId==6 || memberRoleId==11 ||
								memberRoleId==12 || memberRoleId==13 || memberRoleId==14)){
							premiumMember = "<span class='premium-member'>Premium Member</span>";
						} */
						var shortListedStr = '<span id="shortlistTD'+orderObj.id+'" name="shortlistTD[]"><a href="#no" type="button" class="btn btn-primary btn-sm" onclick="shortList('+orderObj.id+')"> Shortlist</a></span>';
						if(orderObj.short_listed == "1"){
							shortListedStr = '<span><a type="button" class="btn btn-warning btn-sm" disabled="true"> Shortlisted</a></span>';
						}
						var expressed = orderObj.expressedInterest;
						var interestStr = "";
						if(expressed==0){
							interestStr = '<span id="expInterest'+orderObj.id+'" name="expInterest[]"><a   href="#no" type="button" class="btn btn-success btn-sm"  onclick="expressInterest('+orderObj.id+')">  Express Interest  </a></span>';
						}else if(expressed>0){
							interestStr = '<span><a type="button" class="btn btn-success btn-sm" disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>';
						}
						var message_sent_status = orderObj.message_sent_status;
						var messageStr = "";
						if(message_sent_status>0){
							messageStr = 'You sent an email to this member.';
						}
						var mobNumViewed = orderObj.mobileNumViewed;
						var mobile_num_Str = "";
						if(mobNumViewed=="1" || expressed=="1" || message_sent_status=="1"){
							mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="image" title="image" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
						}else{
							mobile_num_Str = '<span id="mobileTD'+orderObj.id+'"><a href="#no" type="button" class="btn btn-info btn-sm" onclick="displayMobileNum('+orderObj.id+')">View Mobile Number</a></span>';
						}
						var profession = orderObj.occupationName;
						if((profession == null) || profession == ""){
							profession = "Not Specified";
						}
						
						var premiumMember = "";
						var memberRoleId = orderObj.role_id;
						if(memberRoleId!=null && memberRoleId!="" && (typeof memberRoleId != "undefined")){
							if(memberRoleId==12){
								 premiumMember = "<span class='premium-member'>Classic Member</span>";
							}
							if(memberRoleId==13){
								 premiumMember = "<span class='premium-member'>Classic Advantage Member</span>";
							}
							if(memberRoleId==6){
								 premiumMember = "<span class='premium-member'>Premium Member</span>";
							}
							if(memberRoleId==11){
								 premiumMember = "<span class='premium-member'>Premium Plus Member</span>";
							}
							if(memberRoleId==14){
								 premiumMember = "<span class='premium-member'>Aarna Family Member</span>";
							}
							if(memberRoleId==15){
								 premiumMember = "<span class='premium-member'>Premium Member</span>";
							}
						}
						var user_gender = '${cacheGuest.gender}';
						var opp_gender_str = "",her_his_you = "";
						if(user_gender!=null && user_gender!="" && (typeof user_gender != "undefined")){
							if(user_gender=="Female"){
								opp_gender_str = "He";
								her_his_you = "his";
							}else if(user_gender=="Male"){
								opp_gender_str = "She";
								her_his_you = "her";
							}
								
						}
						// activities to display
						/* var act_list = orderObj.activities_list;
						var logged_in_user_id = ${cacheGuest.id};
						$.each(act_list,function(i,activity){
							var act_str = "";
							var act_type = activity.get("activity_type");
							var act_done_by_id = activity.get("act_done_by_user_id");
							if(act_done_by_id==logged_in_user_id){
								act_str = "You";
							}else{
								act_str = opp_gender_str;
								her_his_you = "your";
							}
							if(act_type=="profile_viewed"){
								act_str += " viewed "+her_his_you+" profile";
							}
							if(act_type=="interest_request"){
								act_str += " have sent an interest to "+her_his_you;
							}
							if(act_type=="mobile_no_viewed"){
								act_str += " viewed "+her_his_you+" mobile number";
							}
							if(act_type=="email"){
								act_str += " have sent an email to "+her_his_you;
							}
						}); */ 
						/* var myMobileNumViewed_str = "";
						var tempStr = orderObj.myMobileNumViewed;
						if(tempStr!=null && tempStr!="" && (typeof tempStr != "undefined")){
							myMobileNumViewed_str = opp_gender_str+" viewed your mobile number.<br>";
						} */
						
						/* var message_sent_to_me_str = "";
						tempStr="";
						tempStr = orderObj.message_sent_to_me;
						if(tempStr!=null && tempStr!="" && (typeof tempStr != "undefined")){
							message_sent_to_me_str = opp_gender_str+" sent you a personal mail.<br>";
						} 
						
						var shortListedMe_str = "";
						tempStr="";
						tempStr = orderObj.shortListedMe;
						if(tempStr!=null && tempStr!="" && (typeof tempStr != "undefined")){
							shortListedMe_str = opp_gender_str+" shortlisted your profile.<br>";
						}
						
						var myProfileViewed_str = "";
						tempStr="";
						tempStr = orderObj.myProfileViewed;
						if(tempStr!=null && tempStr!="" && (typeof tempStr != "undefined")){
							myProfileViewed_str = opp_gender_str+" viewed your profile.<br>";
						}
						*/
						var recent_activity = orderObj.recent_activity_map;
						var acceptOptions = '';
						if(listType == "pending_requests" || listType == "filtered_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-sm"<a href="#" onclick="fullProfile('+orderObj.id+')">View Full Profile</button></a>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum_messages('+orderObj.id+',\'preferences\,'+orderObj.requestId+')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
							acceptOptions = "<span id='accept"+recent_activity.id+"'><a type='button' class='btn btn-primary btn-sm' onclick='acceptRequest("+recent_activity.id+",\"1\")'>Yes</a><a type='button' class='btn btn-danger btn-sm' id='reject"+recent_activity.id+"' href='#' onclick='acceptRequest("+recent_activity.id+", \"0\")'>Not Interested</a></span>";
							
						}else if(listType == "accepted_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-block" <a href="#"  onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br></a>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn1 btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
						}else if(listType == "rejected_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br>'
				            	+ mobile_num_Str
				            	//+ '<button class="btn1 btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
						}else if(listType == "sent_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-block" <a href ="#" onclick="fullProfile('+orderObj.id+')">View Full Profile</button></a>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum_messages('+orderObj.id+',\'preferences\,'+orderObj.requestId+')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
							interestStr = '';
						}else if(listType == "awaiting_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-block" <a href="#" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br></a>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
				           //acceptOptions = "<tr><td title=''><div id='accept"+orderObj.requestId+"'><a href='#' onclick='acceptRequest("+orderObj.requestId+",\"1\")'>Accept</a>&nbsp;|&nbsp;<a id='reject"+orderObj.requestId+"' href='#' onclick='rejectRequest("+orderObj.requestId+" \"0\")'>Reject</a></td><tr>";
						}else if(listType == "myProfileViews"){
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-block" <a href="#" onclick="fullProfile('+orderObj.id+')">View Full Profile</button></a>'
				            	+ mobile_num_Str
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
						} 
					//}
						
						var photos_list = orderObj.photosList;
						var slider = "", displayStyle = ' ';
						if(photos_list == "" || typeof photos_list == "undefined"){
							slider = '<a href="#" onclick="fullProfile('+orderObj.id+')"><img src="${baseurl}/img/default.png" class="img img-responsive thumbnail " style="margin-bottom:0;height: 60px;width: 60px;" ></a>';
						}else{
							smallerSlideIndex[orderObj.id] = 0;
							var slider = "", displayStyle = ' ';
							$.each(photos_list,function(index,photo){
								if(photo.image==orderObj.profileImage){
									displayStyle = ' style="display:block" '
								}else{
									displayStyle = ' style="display:none" ';
								}
								slider += '<div class="smallSlides'+orderObj.id+'" '+displayStyle+'>'
										+'<a href="#" onclick="fullProfile('+orderObj.id+')"><img src="${catalina_base}/'+photo.image+'" class="img img-responsive thumbnail " style="margin-bottom:0;height: auto;width: 100%;" ></a>'
										+'</div>'
							});
							if(photos_list.length>1){
								slider += '<p style="display: table;">'
									+'	<a id="prevBtn'+orderObj.id+'" class="" style="text-decoration: none; margin: 0px 0px 0px 7px;" href="#no" onclick="plusSmallSlides(-1,'+orderObj.id+')">&#10094;</a>'
									//+'	<span>'+(i+1)+' of '+photos_list.length+'</span><br>'
				    			    +'	<a id="nextBtn'+orderObj.id+'" class="" style="text-decoration: none; margin-left: 41px;" href="#no" onclick="plusSmallSlides(1,'+orderObj.id+')">&#10095;</a>'
									+'</p>'	
							}
							
						}
						var more_conversations_str = '';
						// to display recent activity details
						var activity_str = "",act_short_str = "";
						var reply_content = "";
						var received_msg_str = "";
						var login_user_id = ${cacheGuest.id};
						var replyDivStr = '', idStr = '';
						if(typeof recent_activity != "undefined"){
							if(recent_activity.activity_type=="interest_request"){
								if(login_user_id==recent_activity.act_done_by_user_id){
									act_short_str = "Interest Request Sent";
									if(her_his_you=="his")
										activity_str = "You sent an interest request to him";
									else
										activity_str = "You sent an interest request to "+her_his_you ;
									acceptOptions = '<span id="mail'+orderObj.id+'"><a type="button" class="btn btn-primary btn-sm" id="sendMail'+recent_activity.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a></span>';
								}else{
									act_short_str = "Interest Request Received";
									activity_str = opp_gender_str +" sent an interest request to you. Would you like to take it further?" ;
									//acceptOptions = '<span id="mail'+orderObj.id+'"><a type="button" class="btn btn-primary btn-sm" id="sendMail'+orderObj.requestId+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a></span>';
									idStr = "id=\"profileBlock"+recent_activity.id+"\"";
								}
									
							}
							if(recent_activity.activity_type=="interest_accepted"){
								act_short_str = "Request Accepted";
								if(login_user_id==recent_activity.act_done_by_user_id){
									activity_str = "You accepted "+her_his_you+" request";
								}else{
									activity_str = opp_gender_str+" accepted your request";
								}
								acceptOptions = '<span id="mail'+recent_activity.id+'"><a type="button" class="btn btn-primary btn-sm" id="sendMail'+orderObj.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a></span>';
							}
							if(recent_activity.activity_type=="interest_rejected"){
								act_short_str = "Request Rejected";
								if(login_user_id==recent_activity.act_done_by_user_id){
									activity_str = "You rejected "+her_his_you+" request";
								}else{
									activity_str = opp_gender_str+" rejected your request";
								}
							}
							/* if(recent_activity.activity_type=="message"){
								if(login_user_id==recent_activity.act_done_by_user_id){
									act_short_str = "Message Sent";
									if(her_his_you=="his")
										activity_str = "You sent a message to him";
									else
										activity_str = "You sent a message to "+her_his_you ;
								}else{
									act_short_str = "Interest Request Received";
									activity_str = opp_gender_str +" sent a message to you" ;
								}
								
							} */
							if(recent_activity.activity_type=="message"){
								if(login_user_id==recent_activity.act_done_by_user_id){
									act_short_str = "Message Sent";
									if(her_his_you=="his")
										activity_str = "You sent a message to him";
									else
										activity_str = "You sent a message to "+her_his_you ;
									received_msg_str = recent_activity.activity_content;
									if(received_msg_str!=null && typeof received_msg_str != "undefined"){
										received_msg_str = received_msg_str.replace(/##newline##/g," ");
										received_msg_str = received_msg_str.replace(/##tabspace##/g," ")+".";
									}
									acceptOptions = '<span id="mail'+orderObj.id+'"><a type="button" class="btn btn-primary btn-sm" id="sendMail'+recent_activity.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a></span>';
								}else{
									act_short_str = "Message Received";
									activity_str = opp_gender_str +" sent a message to you. Would you like to take it further?" ;
									received_msg_str = recent_activity.activity_content;
									if(received_msg_str!=null && typeof received_msg_str != "undefined"){
										received_msg_str = received_msg_str.replace(/##newline##/g," ");
										received_msg_str = received_msg_str.replace(/##tabspace##/g," ")+".";
									}
									acceptOptions = "<span id='accept"+recent_activity.id+"'><a type='button' class='btn btn-primary btn-sm' onclick='acceptMessage("+recent_activity.id+",\"1\")'>Yes</a><a type='button' class='btn btn-danger btn-sm' id='reject"+recent_activity.id+"' href='#' onclick='acceptMessage("+recent_activity.id+", \"0\")'>Not Interested</a></span>";
									idStr = "id=\"profileBlock"+recent_activity.id+"\"";
								}
								
							}
							if(recent_activity.activity_type=="message_accepted"){
								act_short_str = "Message Accepted";
								if(login_user_id==recent_activity.act_done_by_user_id){
									activity_str = "You accepted "+her_his_you+" message";
									reply_content = recent_activity.activity_content;
									if(reply_content!=null && typeof reply_content != "undefined"){
										reply_content = reply_content.replace(/##newline##/g," ");
										reply_content = reply_content.replace(/##tabspace##/g," ");
										reply_content = "\r\n\r\n\r\n\r\n---Original message---\r\nFrom:"+orderObj.username+"\r\nTo:${cacheGuest.username}\r\n"+reply_content;
									}
									//acceptOptions = '<span id="reply'+orderObj.requestId+'"><a type="button" class="btn btn-primary btn-sm" onclick="replyMessage('+orderObj.requestId+',\''+recent_activity.activity_content+'\')">Reply</a></span>';
									acceptOptions = '<span id="replyBtn'+recent_activity.id+'"><button type="button" onclick="displayReplyArea(this.id)" id="'+recent_activity.id+'reply"  class="btn btn-warning btn-sm">Reply</button><button type="button" class="btn btn-danger btn-sm" id="'+recent_activity.id+'sendmail" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')" style="display:none">Send Mail</button></span>';
								}else{
									activity_str = opp_gender_str+" accepted your message";
									acceptOptions = '<span id="mail'+orderObj.id+'"><a type="button" class="btn btn-primary btn-sm" id="sendMail'+recent_activity.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a></span>';
								}
								
								replyDivStr = '<div class="panel panel-success" id="'+recent_activity.id+'myDIV"  style="display:none">'
								+ '<div class="panel-heading">Reply To This Message </div>'
		  						+ '<div class="panel-body">'
									//+ '<textarea id="replyContent" style="width:100%; height:150px; overflow-y:scroll;" >'+reply_content
								+ '<textarea id="replyContent'+recent_activity.id+'" style="width:100%; height:150px; overflow-y:scroll;" >'+reply_content
								+ '</textarea>'
								+  ' <br><button type="button" class="btn btn-warning pull-right " onclick="replyMessage('+recent_activity.id+')">Reply</button>'
								+ '</div> '
								+'</div>'
								+'</div>';
							}
							if(recent_activity.activity_type=="message_rejected"){
								act_short_str = "Message Rejected";
								if(login_user_id==recent_activity.act_done_by_user_id){
									activity_str = "You rejected "+her_his_you+" message";
								}else{
									activity_str = opp_gender_str+" rejected your message";
								}
							}
							if(recent_activity.activity_type=="message_replied"){
								act_short_str = "Message Replied";
								if(login_user_id==recent_activity.act_done_by_user_id){
									activity_str = "You replied to "+her_his_you+" message";
								}else{
									activity_str = opp_gender_str+" replied to your message";
								}
								received_msg_str = recent_activity.replied_msg_content;
								if(received_msg_str!=null && typeof received_msg_str != "undefined"){
									received_msg_str = received_msg_str.replace(/##newline##/g," ");
									received_msg_str = received_msg_str.replace(/##tabspace##/g," ")+".";
								}else{
									received_msg_str = "";
								}
								acceptOptions = '<span id="mail'+orderObj.id+'"><a type="button" class="btn btn-primary btn-sm" id="sendMail'+orderObj.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a></span>';
							}
							/* if(recent_activity.activity_type=="profile_viewed"){
								act_short_str = "Profile Viewed";
								if(login_user_id==recent_activity.act_done_by_user_id){
									activity_str = "You viewed "+her_his_you+" profile";
								}else{
									activity_str = opp_gender_str+" viewed your profile";
								}
							} */
							if(recent_activity.activity_type=="mobile_no_viewed"){
								act_short_str = "Number Viewed";
								if(login_user_id==recent_activity.act_done_by_user_id){
									activity_str = "You viewed "+her_his_you+" mobile number";
								}else{
									activity_str = opp_gender_str+" viewed your mobile number";
								}
							}
							if(recent_activity.activity_type=="short_listed"){
								act_short_str = "Shortlisted";
								if(login_user_id==recent_activity.act_done_by_user_id){
									activity_str = "You shortlisted "+her_his_you+" profile";
								}else{
									activity_str = opp_gender_str+" shortlisted your profile";
								}
							}
							var conversations_count = recent_activity.conversations_count;
							if(typeof conversations_count != "undefined" && conversations_count>=1){
								more_conversations_str = ' <a href="moreConversations?pid='+orderObj.id+'&tab_type='+tabType+'&list_type='+listType+'"><span class="pull-right" style="color:#006699;">+ More Conversations</span></a> ';
							}
						}
						
						/////
						
						var profile_highlisht_str = '<div class="panel panel-default">';
						var highlight_option = orderObj.profile_highlighter;
						if(typeof highlight_option != "undefined" && highlight_option=='1'){
							profile_highlisht_str = '<div class="panel panel-default" style="    background: url(../nimages/newbackground.png); padding-top:5px;">';
						}
						var tblRow = profile_highlisht_str
							+ '<div class="panel-body" '+idStr+'>'
							+ '<div class="col-md-2" >'
							//+ ' <div class="smallSlides" style="display:block"> '
							//+ '		<a href="#no"> <img src='+image+' class="img img-responsive thumbnail watermark_text" style="margin-bottom:0;height: 60px;width: 60px;" ></a>'
							//+ ' </div>'
							+  slider
			            	+ '</div>'
			            	+ '<div class="col-md-10 table-responsive">'
			            	+ '<table style="width:100%;" class="table-responsive pendinginbox">'
			            	+ '	<tr><td style="font-weight:bold;">'+firstname+' '+lastname+'&nbsp;('+orderObj.username+')&nbsp;<a href="#" data-toggle="tooltip" data-placement="bottom" title="View Mobile Number"></a>&nbsp;'+premiumMember+'<span class="pull-right"><img src="${baseurl}/images/ar.png"/>'+recent_activity.activity_done_on+'</span></td></tr>'
			            	+ '	<tr><td>'+orderObj.age+'Yrs,'+orderObj.inches+','+orderObj.religionName+','+orderObj.casteName+','
			            	+ 		orderObj.currentCityName+','+orderObj.currentStateName+','+orderObj.currentCountryName+','
			            	+ 		orderObj.educationName+','+orderObj.occupationName+'.'
			            	+'	</td></tr>'
			            	+ '</table>'
			            	+ '<div id="detailsArea">'
			            	+ '<table style="width:100%;">'
			            	+'<tr><td><button class="btn btn-default bt-block">'+act_short_str+'</button></td></tr>'
			            	/* + '	<tr><td>'
			            	+ myMobileNumViewed_str 
			            	+ message_sent_to_me_str 
			            	+ shortListedMe_str 
			            	+ myProfileViewed_str 
			            	+ '</td></tr>'*/
			            	+ '	<tr><td>'+activity_str+'.</td></tr>' 
			            	+ '	<tr><td>'+received_msg_str+'</td></tr>'
			            	+ '	<tr>'
			            	+ '<td>'+acceptOptions+'</td>'
			            	+ '<td>'+more_conversations_str+'</td>'
			            	+ '	</tr>'
			            	//+' <a href="moreConversations?pid='+orderObj.id+'&tab_type='+tabType+'&list_type='+listType+'"><span class="pull-right" style="color:#006699;">+ More Conversations</span></a></td></tr>'
			            	//+ '<tr><td><button type="button" class="btn btn-danger btn-sm" id="sendMail'+orderObj.requestId+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')" style="display:none">Send Mail</button></td></tr>'
			            	+ '</table>'
			            	+ '<!-- Reply start -->'
			            	+ replyDivStr
							+'<!-- Reply End -->'
			            	+ '</div>'
			            	+ '</div>';
					$(tblRow).appendTo("#"+divId);
				}
			});
		}
		 
		/* function displayMatches_inbox_bkp(listOrders,listType,tabType){
			serviceUnitArray = {};
			smallerSlideIndex = {};
			var divId = listType;
			var divElem = "#"+divId;
			var element = $(divElem);
			
			$(".tabcontent").attr("hidden",true);
			$("#"+tabType+"_div").removeAttr("hidden");
			
			
			$(".tab-content_inbox").attr("hidden",true);
			$(".tab-content_inbox").removeClass('active');
			var actived_nav = $('.nav-tabs > li.active');
			actived_nav.removeClass('active');
			
			$("#"+listType+"_tab").removeAttr('hidden');
			$("#"+listType+"_tab").removeClass('hide');
			$("#"+listType+"_tab").addClass('active');
			$("#"+listType+"_section").removeClass('hide');
			$("#"+listType+"_section").removeAttr('hidden');
			$("#"+listType+"_section").addClass('active');
			
			$("#"+divId).html('');
			if(listOrders==""){
				var tblRow = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No requests found..!</h6></div>';
				//var tblRow = "No data available";
				$(tblRow).appendTo("#"+divId);
				//$("#table_footer").attr("hidden",true);
    			//$("#altLists").attr("hidden",true);
    			$("#pagination_div").prop("hidden",true);
			}
			$.each(listOrders,function(i, orderObj) 
			{
				serviceUnitArray[orderObj.id] = orderObj;
				
				var array = null;
//		 		var imageUrl =null;
				
				var image = null; image = orderObj.profileImage;
				if(image == "" || image == null || image == "undefined"){
					image = "img/default.png";
				}

				if(orderObj.firstName !=null)
				{
					var login_user_role_id =${cacheGuest.roleId}; 
					var insert_str = '';
					var mobile_no__str = '';
					var more_details_str = '';
					var expressed = orderObj.expressedInterest;
					var firstname = 'xxxxxx',lastname='xxxxxx';
					if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
							|| (login_user_role_id == 13) || (login_user_role_id == 14)){ //means premium,premium_plus,aarna premium users
					
						firstname = orderObj.firstName;
						lastname = orderObj.lastName;
					}
					var occName = orderObj.occupationName;
					if(occName==null)
						occName = "";
					var ageStr = orderObj.age;
					var age = ageStr.split(".")[0];
					var options = "";
					var acceptOptions = "";
						
						var abtMySelf = orderObj.aboutMyself;
						if(abtMySelf=="undefined" || abtMySelf==null){
							abtMySelf = "";
						}
						var premiumMember = "";
						var memberRoleId = orderObj.role_id;
						if(memberRoleId!=null && memberRoleId!="" && (memberRoleId==6 || memberRoleId==11 ||
								memberRoleId==12 || memberRoleId==13 || memberRoleId==14)){
							premiumMember = "<span class='premium-member'>Premium Member</span>";
						}
						var shortListedStr = '<span id="shortlistTD'+orderObj.id+'"><a href="#no" type="button" class="btn btn-warning btn-sm" onclick="shortList('+orderObj.id+')"> Shortlist</a></span>';
						if(orderObj.short_listed == "1"){
							shortListedStr = '<span><a type="button" class="btn btn-warning btn-sm" disabled="true"> Shortlisted</a></span>';
						}
						var expressed = orderObj.expressedInterest;
						var interestStr = "";
						if(expressed==0){
							interestStr = '<span id="expInterest'+orderObj.id+'"><a   href="#no" type="button" class="btn btn-success btn-sm"  onclick="expressInterest('+orderObj.id+')">  Express Interest  </a></span>';
						}else if(expressed>0){
							interestStr = '<span><a type="button" class="btn btn-success btn-sm" disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>';
						}
						var message_sent_status = orderObj.message_sent_status;
						var messageStr = "";
						if(message_sent_status>0){
							messageStr = 'You sent an email to this member.';
						}
						var mobNumViewed = orderObj.mobileNumViewed;
						var mobile_num_Str = "";
						if(mobNumViewed==1 || expressed==1 || message_sent_status==1){
							//mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="image" title="image" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
							mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
						}else{
							mobile_num_Str = '<span id="mobileTD'+orderObj.id+'"><a href="#no" type="button" class="btn btn-primary btn-sm" onclick="displayMobileNum('+orderObj.id+')">View Mobile Number</a></span>';
						}
						var profession = orderObj.occupationName;
						if((profession == null) || profession == ""){
							profession = "Not Specified";
						}
						var acceptOptions = '';
						if(listType == "pending_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-sm" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum_messages('+orderObj.id+',\'preferences\,'+orderObj.requestId+')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
							acceptOptions = "<span id='accept"+orderObj.requestId+"'><a type='button' class='btn btn-primary btn-sm' onclick='acceptRequest("+orderObj.requestId+",\"1\")'>Accept</a><a type='button' class='btn btn-danger btn-block' id='reject"+orderObj.requestId+"' href='#' onclick='acceptRequest("+orderObj.requestId+", \"0\")'>Ignore</a></span><br>";
							
						}else if(listType == "accepted_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-sm" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn1 btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
						}else if(listType == "rejected_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-sm" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br>'
				            	+ mobile_num_Str
				            	//+ '<button class="btn1 btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
						}else if(listType == "sent_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-sm" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum_messages('+orderObj.id+',\'preferences\,'+orderObj.requestId+')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
							interestStr = '';
						}else if(listType == "awaiting_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-sm" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
				           //acceptOptions = "<tr><td title=''><div id='accept"+orderObj.requestId+"'><a href='#' onclick='acceptRequest("+orderObj.requestId+",\"1\")'>Accept</a>&nbsp;|&nbsp;<a id='reject"+orderObj.requestId+"' href='#' onclick='rejectRequest("+orderObj.requestId+" \"0\")'>Reject</a></td><tr>";
						}else if(listType == "myProfileViews"){
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-primary btn-sm" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
				            	+ mobile_num_Str
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
						} 
					//}
						
						var photos_list = orderObj.photosList;
						var slider = "", displayStyle = ' ';
						if(photos_list == "" || typeof photos_list == "undefined"){
							slider = '<img src="${baseurl}/img/default.png" class="img img-responsive thumbnail " style="margin-bottom:0;height: 60px;width: 60px;" >';
						}else{
							smallerSlideIndex[orderObj.id] = 0;
							var slider = "", displayStyle = ' ';
							$.each(photos_list,function(index,photo){
								if(photo.image==orderObj.profileImage){
									displayStyle = ' style="display:block" '
								}else{
									displayStyle = ' style="display:none" ';
								}
								slider += '<div class="smallSlides'+orderObj.id+'" '+displayStyle+'>'
										+'		<img src="${baseurl}/'+photo.image+'" class="img img-responsive thumbnail " style="margin-bottom:0;height: 60px;width: 60px;" >'
										+'</div>'
							});
							if(photos_list.length>1){
								slider += '<p style="display: table;">'
									+'	<a id="prevBtn'+orderObj.id+'" class="" style="text-decoration: none; margin: 0px 0px 0px 7px;" href="#no" onclick="plusSmallSlides(-1,'+orderObj.id+')">&#10094;</a>'
									//+'	<span>'+(i+1)+' of '+photos_list.length+'</span><br>'
				    			    +'	<a id="nextBtn'+orderObj.id+'" class="" style="text-decoration: none; margin-left: 41px;" href="#no" onclick="plusSmallSlides(1,'+orderObj.id+')">&#10095;</a>'
									+'</p>'	
							}
							
						}
						var tblRow = '<div class="panel panel-default">'
							+ '<div class="panel-heading">'
							+ '<h5 class="panel-title">'
							+ '<div class="form-check">'

							+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+firstname+' '+lastname+'&nbsp;('+orderObj.username+')</label>'
							+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'
							//+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+orderObj.firstName+' '+orderObj.lastName+'</label>'
//			 				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'

							+ '</div>'
							+ '</h5>'
							+ '</div>'
							+ '<div class="panel-body">'
							+ '<div class="col-md-2" >'
							//+ ' <div class="smallSlides" style="display:block"> '
							//+ '		<a href="#no"> <img src='+image+' class="img img-responsive thumbnail watermark_text" style="margin-bottom:0;height: 60px;width: 60px;" ></a>'
							//+ ' </div>'
							+  slider
			            	+ '</div>'
			            	+ '<div class="col-md-6">'
			            	+ '<table>'
			            	+ '	<tr><td>Age/Height</td><td><span>: '+age+', '+orderObj.inches+'</span></td></tr>'
			            	+ '	<tr><td>Religion</td><td><span>: '+orderObj.religionName+'</span></td></tr>'
			            	+ '	<tr><td>Mother Tongue</td><td><span>: '+orderObj.motherTongueName+'</span></td></tr>'
			            	+ '	<tr><td>Community</td><td><span>: '+orderObj.casteName+'</span></td></tr>'
			            	+ '	<tr><td>Location</td><td><span>: '+orderObj.currentCityName+'</span></td></tr>'
			            	+ '	<tr><td>Education</td><td><span>: '+orderObj.educationName+'</span></td></tr>'
			            	+ '	<tr><td>Profession</td><td><span>: '+profession+'</span></td></tr>'
			            	+ '<tr><td id="mobileTD'+orderObj.requestId+'">'+mobile_num_Str+'</td><td></td></tr>'
			            	//+ '<td id="shortlisttd'+orderObj.id+'"><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">Shortlist</button></td></tr>'
			            	//+ '	<tr><td>Age</td><td><span>: '+orderObj.age+'</span></td></tr>'
			            	//+ '	<tr><td colspan="2">'+orderObj.aboutMyself+'... <a href="#no" onclick="showMore('+orderObj.id+')"> read more..</a> </td></tr>'
			            	//+  more_details_str
			            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#no" > read more..</a> </td></tr>'
			            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#no" > more detailssss</a> </td></tr>'
			            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#no" > more detailssss</a> </td></tr>'
			            	+ '</table>'
			            	+ '</div>'
			            	+ '<div class="col-md-4">'
			            	+ '<h4 style="margin-bottom:20px;">Like this Profile?</h4>'
			            	+ interestStr
							//+ '<button class="btn btn-danger btn-block btn-md" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br><br><br><br><br>'
							+ '<a href="#no" class="btn btn-primary btn-sm" onclick="fullProfile('+orderObj.id+')">View Full Profile</a><br>'
							+ acceptOptions
							+ shortListedStr
							//+ '<span id="shortlistTD"><a href="#no" type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="shortList('+orderObj.id+')">Shortlist</a></span> '
							+ '<div class="clearfix"></div>'
			            	+ '</div>'
			            	+ '</div>'
			            	+ '</div>';
					$(tblRow).appendTo("#"+divId);
				}
			});
		} */
		
		function displayMobileNum_messages(profileId,listType,requestId){
			var roleId = ${cacheGuest.roleId};
			$("#id").val(profileId);
			if(roleId==4){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
				var membershipStatus = ${cacheGuest.membership_status};
				if(membershipStatus!="1"){
					alert("Your membership validity period is over. Renew your membership plan and get more profiles");
					return false;
				}
				if(allowed_limit<=0){
					alert("Exceeded allowed profiles limit. Renew/Upgrade your membership and get more profiles");
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
			    				$("#mobileTD"+requestId).html('<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+profileObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>');
			    				if(typeof limit != "undefined"){
			    					if(limit=="unlimited"){
			    						allowed_limit = "1";
			    						allowed_limit = parseInt(allowed_limit);
			    					}else{
			    						allowed_limit = limit;
			    					}
			    				}
			    			}else{
			    				alert("Some problem occured. Please try again.");
			    			}
			    		}
			    		
				});
			}
			
		}
		var mail_default_textt = "${mail_default_text}";
		var option_selection = "${default_text_option}";
		
		function displayMailPopup(profile_id,memberName){
            $('#expressModal').hide();
            $('#shortlistModal').hide();
            
			var roleId = ${cacheGuest.roleId};
			if(roleId==4 || roleId==12 || roleId==13){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
				var membershipStatus = ${cacheGuest.membership_status};
				if(membershipStatus!="1"){
					alert("Your membership validity period is over. Renew your membership plan and get more profiles");
					return false;
				}
				$("#profile_id").val(profile_id);
				$("#memberName").val(memberName);
				$("#member_name_todisplay").html(" to "+memberName);
				
				if(typeof option_selection != "undefined"){ 
					if(option_selection=="1"){
						$("#default_text_opt").prop("checked",true);
						var texttt = mail_default_textt; 
						 texttt = texttt.replace(/##newline##/g,"\r\n");
						 texttt = texttt.replace(/##newline##/g,"\n");
						 texttt = texttt.replace(/##tabspace##/g,"\t");
						 $("#mail_content").val(texttt);
						 
					}else{
						$("#default_text_opt").removeAttr("checked");
						$("#mail_content").val("");
					}
				}
				
				$('#myModal').show();
				$('#myModal').modal();
				
			}
			
			/* var current_selection = $("#default_text_opt").prop("checked");
			 if(typeof current_selection != "undefined"){ 
					if(current_selection=="1"){
						$("#default_text_opt").removeAttr("checked");
					}
			 } */
			/* if(roleId==4 || roleId==12 || roleId==13){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
				var membershipStatus = ${cacheGuest.membership_status};
				if(membershipStatus!="1"){
					alert("Your membership validity period is over. Renew your membership plan and get more profiles");
					return false;
				}
				
				$('#myModal').show();
				$('#myModal').modal();
				
			} */
		}

		function sendMail(){
			var content = $("#mail_content").val();
			//var textval = $("#mail_content").text();
			//var htmlval = $("#mail_content").html();
			if(content.trim() == ""){
				alert("Please enter some content");
				return false;
			}
			$("#sendMailBtn").prop("disabled",true);
			$("#sendMailBtn").val("Please wait...");
			 var formData = new FormData();
			 formData.append("profile_id",$("#profile_id").val());
			 formData.append("mail_content",content);
			 var default_option = $("#default_text_opt").prop("checked");
			 formData.append("default_text_option",default_option);
			 $.fn.makeMultipartRequest('POST', 'sendMail', false,
						formData, false, 'text', function(data){
					var jsonobj = $.parseJSON(data);
					var msg = jsonobj.message;
					if(msg != null && typeof msg != "undefined"){
						if(msg == "success"){
							alert("E-Mail has been sent successfully.");
							$("#sendMailBtn").removeAttr("disabled");
							$("#sendMailBtn").val("Send Mail");
							var current_selection = $("#default_text_opt").prop("checked");
							 if(typeof current_selection != "undefined"){ 
									if(current_selection=="1"){
										option_selection = "1";
										mail_default_textt = content;
									}
							 }
							 
							$("#closeBtn").trigger("click");
						}else{
							alert("Some problem occured while sending e-mail!! Please try again.");
							$("#sendMailBtn").removeAttr("disabled");
							$("#sendMailBtn").val("Send Mail");
							$("#mail_content").val("");
							//var t = $("#myModal");
							//t.hide();
							$("#closeBtn").trigger("click");
						}
					}
					
			 });
			//$("#sendMailBtn").removeAttr("disabled");
			//$("#sendMailBtn").val("Send Mail");
			
		
		}
		function displayInbox(tab_type,list_type){
			 document.searchForm2.action = "inboxAction?tab_type="+tab_type+"&list_type="+list_type;
		     document.searchForm2.submit();             // Submit the page
		    return true;
			 /* $.fn.makeMultipartRequest('POST', 'inboxAction', false,
						formData, false, 'text', function(data){
					var jsonobj = $.parseJSON(data);
					var requestList = jsonobj.inbox_requests;
					if(tab_type=="inbox"){
						$("#inbox").attr('class','active');
					}
					displayMatches_inbox(requestList,list_type,tab_type);
					
			 }); */
		}
		
		function displayBlock(tabType,listType){
			 
			if(tabType == 'inbox'){
				
				$("#sent").removeAttr( 'style' );
				$("#filtered").removeAttr( 'style' );
			}
			if(tabType == 'sent'){
				$("#inbox").toggleClass('inbox' );
				$("#inbox").removeClass('inbox');
				$("#inbox").removeAttr( 'style' );
				$("#filtered").removeAttr( 'style' );

			}
			if(tabType == 'filtered'){
				$("#inbox").toggleClass('inbox' );
				$("#inbox").removeClass('inbox');
				$("#inbox").removeAttr( 'style' );
				$("#sent").removeAttr( 'style' );
			}
			
			
				
			$("#"+tabType).css('color', 'blue'); 
			$("#"+tabType).css('font-weight', 'bold'); 
			
			filter_requests_flag = false;
			
			$(".tabcontent").attr("hidden",true);
			$("#"+tabType+"_div").removeAttr("hidden");
			
			
			$(".tab-content_inbox").attr("hidden",true);
			$(".tab-content_inbox").removeClass('active');
			var actived_nav = $('.nav-tabs > li.active');
			actived_nav.removeClass('active');
			
			$("#"+listType+"_tab").removeAttr('hidden');
			$("#"+listType+"_tab").removeClass('hide');
			$("#"+listType+"_tab").addClass('active');
			$("#"+listType+"_section").removeClass('hide');
			$("#"+listType+"_section").removeAttr('hidden');
			$("#"+listType+"_section").addClass('active');
			
			var formData = new FormData();
		  	formData.append("tab_type",tabType);
		  	formData.append("list_type",listType);
				$.fn.makeMultipartRequest('POST', 'inboxAjaxAction', false,
						formData, false, 'text', function(data){
					var jsonobj = $.parseJSON(data);
					var inboxRequests = jsonobj.inbox_requests;
					var listType = jsonobj.listType;
					var tabType = jsonobj.tabType;
						total_items_count = jsonobj.total_records;
						$("#"+listType).html('');
						if(inboxRequests==""){
							var tblRow = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No requests found..!</h6></div>';
							//var tblRow = "No data available";
							$(tblRow).appendTo("#"+listType);
							$("#table_footer").attr("hidden",true);
			    			$("#altLists").attr("hidden",true);
						}else{
							$("#altLists").asPaginator('destroy');
			    			paginationSetup(total_items_count);
			    			$("#altLists").asPaginator('enable');
			    			displayMatches_inbox(inboxRequests,listType,tabType);
			    			//$("#table_footer").removeAttr("hidden");
			    			//$("#altLists").removeAttr("hidden");
			    			$("#pagination_div").removeAttr("hidden");
			    			$("#table_footer").removeAttr("hidden");
			    			$("#altLists").removeAttr("hidden");
			    			displayTableFooter(1);
						}
						chnageAllCommunications();
		    		
					
				});
		}
		
		function acceptRequest(requestId,flag){
			var roleId = ${cacheGuest.roleId};
			$("#id").val(requestId);
			 if(roleId==4){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
				 /* if(allowed_limit<=0){
					alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
					return false;
				}  */ 
				var membershipStatus = ${cacheGuest.membership_status};
				if(membershipStatus!="1"){
					alert("Your membership validity period is over. Renew your membership plan and get more profiles");
					return false;
				}
				var formData = new FormData();
			
				formData.append("requestId",requestId);
				formData.append("accept_flag",flag);
				
				jQuery.fn.makeMultipartRequest('POST', 'acceptRequest', false,
						formData, false, 'text', function(data){
			    		var jsonobj = $.parseJSON(data);
			    		var msg = jsonobj.message;
			    		
			    			if("success"==msg){
			    				displayFilterRequestsBlock();
			    				if(flag==1){
			    					alert("Request accepted successfully");
			    					$("#accept"+requestId).html('');
			    					$("#accept"+requestId).html("<a type='button' class='btn btn-success btn-sm' disabled='true'>Accepted</a>");
			    				}else{
			    					alert("Request rejected successfully");
			    					$("#accept"+requestId).html('');
			    					$("#accept"+requestId).html("<a type='button' class='btn btn-danger btn-sm' disabled='true' >Ignored</a>");
			    				}
			    				$("#pend_req_count_span").html("${cacheGuest.pendingRequestsCount}");
			    				$(".pend_req_count_class").html("${cacheGuest.pendingRequestsCount}");
			    			}else if("failed"==msg || "exception"==msg){
			    				alert("Some problem occured. Please try again.");
			    			}
			    		
			    		
						
					});
			}
		}
		
		function acceptMessage(requestId,flag){
			var roleId = ${cacheGuest.roleId};
			$("#id").val(requestId);
			 if(roleId==4){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
				 /* if(allowed_limit<=0){
					alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
					return false;
				}  */ 
				var membershipStatus = ${cacheGuest.membership_status};
				if(membershipStatus!="1"){
					alert("Your membership validity period is over. Renew your membership plan and get more profiles");
					return false;
				}
				var formData = new FormData();
			
				formData.append("requestId",requestId);
				formData.append("accept_flag",flag);
				
				jQuery.fn.makeMultipartRequest('POST', 'acceptMessage', false,
						formData, false, 'text', function(data){
			    		var jsonobj = $.parseJSON(data);
			    		var msg = jsonobj.message;
			    			if("success"==msg){
			    				displayFilterRequestsBlock();
			    				if(flag==1){
			    					alert("Message accepted successfully");
			    					$("#accept"+requestId).html('');
			    					$("#accept"+requestId).html("<a type='button' class='btn btn-success btn-sm' disabled='true'>Accepted</a>");
			    				}else{
			    					alert("Message rejected successfully");
			    					$("#accept"+requestId).html('');
			    					$("#accept"+requestId).html("<a type='button' class='btn btn-danger btn-sm' disabled='true' >Ignored</a>");
			    				}
			    				$("#pend_req_count_span").html("${cacheGuest.pendingRequestsCount}");
			    				$(".pend_req_count_class").html("${cacheGuest.pendingRequestsCount}");
			    			}else if("failed"==msg || "exception"==msg){
			    				alert("Some problem occured. Please try again.");
			    			}
			    		
			    		
						
					});
			}
		}
		function displayReplyArea(id){
			//$("#detailsArea").attr("hidden",true);
			//$("#replyArea").removeAttr("hidden");
			
			var x = document.getElementById("myDIV");
		    var replay = document.getElementById("replay");
		    var sendmail = document.getElementById("sendmail");
		   
		       $("#"+id).hide();
		       var mydiv =id.replace("reply", "");
		      $("#"+mydiv+"myDIV").show();
		}
		function replyMessage(requestId){
			var roleId = ${cacheGuest.roleId};
			$("#id").val(requestId);
			 if(roleId==4){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
				 /* if(allowed_limit<=0){
					alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
					return false;
				}  */ 
				var membershipStatus = ${cacheGuest.membership_status};
				if(membershipStatus!="1"){
					alert("Your membership validity period is over. Renew your membership plan and reply to the messages");
					return false;
				}
				/* var texttt = message_content;
				texttt = texttt.replace(/##newline##/g,"\r\n");
				texttt = texttt.replace(/##tabspace##/g,"\t");
				$("#replyArea").val(texttt);
				$("#replyArea").removeAttr("hidden"); */ 
				var message_content = $("#replyContent"+requestId).val();
				//alert("message_content:"+message_content);
				var reply_content = message_content.split("---Original message---")[0];
				var formData = new FormData();
			
				formData.append("requestId",requestId);
				formData.append("reply_content",reply_content);
				 jQuery.fn.makeMultipartRequest('POST', 'replyMessage', false,
						formData, false, 'text', function(data){
			    		var jsonobj = $.parseJSON(data);
			    		var msg = jsonobj.message;
			    		
			    			if("success"==msg){
			    					alert("Message replied successfully");
			    					$("#"+requestId+"sendmail").show();
			    					 $("#"+requestId+"myDIV").hide();
			    					//$("#accept"+requestId).html('');
			    					//$("#accept"+requestId).html("<a type='button' class='btn btn-success btn-sm' disabled='true'>Accepted</a>");
			    			}else if("failed"==msg || "exception"==msg){
			    				alert("Some problem occured. Please try again.");
			    				/* $("#"+requestId+"sendmail").hide();
		    					 $("#"+requestId+"myDIV").show(); */
			    			}
			    		
			    		
						
					}); 
				 
			}
		}
//// Photo pop-up related script---starts
	function openModal() {
  document.getElementById('myPhotoModal').style.display = "block";
}

function closeModal() {
  document.getElementById('myPhotoModal').style.display = "none";
}



function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function currentSlide_inpage(current_img){
	var str = '<img id="profilepic" src="${catalina_base}/'+current_img+'" class="hover-shadow cursor img img-responsive thumbnail " style="margin-bottom:0;height:auto;width: 100%;">';
	//$("#profilepic").prop("src",photoImage);
	$("#fullProfilePicOuterTag").html('');
	$("#fullProfilePicOuterTag").html(str);
	addWaterMark();
	//$("#img_inpage").attr("src",current_img);
}
function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("demo");
	  var imgs = document.getElementsByClassName("myImg");
	  var captionText = document.getElementById("caption");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  
	  imgs[slideIndex-1].className += " watermark_text";
	  dots[slideIndex-1].className += " active";
	  slides[slideIndex-1].style.display = "block";
	  captionText.innerHTML = dots[slideIndex-1].alt;
	  addWaterMark();
	}
	////Photo pop-up related script---ends

	/* function getFilteredStatesMultiSelect(id){
		if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
			$("#"+id).select2({
			    placeholder: "-- Choose Country --"
			});
			$("#rState").empty();
			
		}else{
			var countryIds =$("#"+id).val();
			var formData = new FormData();
		     formData.append('country_ids', countryIds);
		     
		    $.fn.makeMultipartRequest('POST', 'getFilteredStates', false,
					formData, false, 'text', function(data){
				var jsonobj = $.parseJSON(data);
				var statesList = jsonobj.states_list;
	         $("#rState").empty();
				$("#rState").append("<option value='' >-- Choose State --</option>");
				
				$.each(statesList, function(i, state) {
					$("#rState").append("<option value="+state.id+" >"+ state.name+"</option>");
				});
				
			});
			
		}
	} */
	
	function getFilteredCitiesMultiSelect(id) {
		if ($("#" + id).val() == null || $('#' + id).val() == ""
				|| $('#' + id).val() == "undefined") {
			$("#" + id).select2({
				placeholder : "-- Choose State --"
			});
			$("#rCity").empty();
			$("#city").empty();
			$("#rCity").select2({
	    	    placeholder: "-- Choose City --"
	    	});
	    	$("#city").select2({
	    	    placeholder: "-- Select City --"
	    	});
			/* $("#rState").select2({
				placeholder : "-- Choose State --"
			}); */
		} else {
			var stateIds = $("#" + id).val();
			var formData = new FormData();
			formData.append('state_ids', stateIds);
			$.fn
					.makeMultipartRequest(
							'POST',
							'getFilteredCities',
							false,
							formData,
							false,
							'text',
							function(data) {
								var jsonobj = $.parseJSON(data);
								var citiesList = jsonobj.city_list;
								$("#rCity").empty();
								/* $("#rState")
										.append(
												"<option value='' >-- Choose State --</option>"); */

								$.each(citiesList,
										function(i, city) {
											$("#rCity").append(
													"<option value="+city.id+" >"
															+ city.name
															+ "</option>");
											$("#city").append(
													"<option value="+city.id+" >"
															+ city.name
															+ "</option>");
										});
								$("#rCity").trigger('change.select2');
								var selected_values = "${profileBean.rCity}";
							    if(selected_values == "" || selected_values==null){
							    	$("#rCity").select2({
							    	    placeholder: "-- Choose City --"
							    	});
							    	$("#city").select2({
							    	    placeholder: "-- Select City --"
							    	});
							    }else{
							    	
							        $("#rCity").val(selected_values.split(","));
							        $("#city").val(selected_values.split(","));
							    }
							    $("#rCity").trigger('change.select2');
							    $("#city").trigger('change.select2');
							});

		}
	}
function openPhotoModal(photos_list){
	var str1 = "";
	var len = photos_list.length;
	//var scoppedPhotos = ${scopped_photos};
	$.each(photos_list,function(i, photoObject) 
	{
		var j = i+1;
		str1 = ' <div class="mySlides" style="height:400px; overflow:hidden;"> '
  		+' <div class="numbertext">'+j+' / '+len+'</div> '
		+' <img src="${baseurl}/'+photoObject.image+'"  class="myImg" style="height: auto;width:100%"> '
		+' </div> ';
		
	});
	var modelContent = ' <span class="close cursor" onclick="closeModal()">&times;</span> '
	  +' <div class="modal-content"> '
		//+' <c:set var="counter" value="${0}" /> ' 
		//+' <c:forEach items="${photosList}" var="photo" > '
			//+' <c:set var="counter" value="${counter+1}" /> '
	      	+str1
		//+' </c:forEach> '
	    +' <div class="row"> '
			//+' <c:set var="counter2" value="${0}" /> ' 
			//+' <c:forEach items="${photosList}" var="photo" > '
				//+' <c:set var="counter2" value="${counter2+1}" /> '
				+' <div class="col-sm-2"> '
			      +' <img class="demo cursor" src="${baseurl}/img/default.png" style="width:100%;" onclick="currentSlide(1)" alt=""> '
			    +' </div> '
		   // +' </c:forEach> '
		+' </div> '
		+' <a class="prev" onclick="plusSlides(-1)">&#10094;</a> '
	    +' <a class="next" onclick="plusSlides(1)">&#10095;</a> '
	    +' <div class="caption-container"> '
	      +' <p id="caption"></p> '
	    +' </div> '   
	  +' </div> ';
	  $("#myPhotoModal").html(modelContent);
	  document.getElementById('myPhotoModal').style.display = "block";
	  
}




	////Photo pop-up related script---ends
	
var smallerSlideIndex = {};
function plusSmallSlides(n,profile_id) {
	if(n>0){
		smallerSlideIndex[profile_id] += n;
	}else if(n<0){
		smallerSlideIndex[profile_id] = smallerSlideIndex[profile_id]-1;
	}
	
		
	  var i;
	  var slides = document.getElementsByClassName("smallSlides"+profile_id);
	  
	  //var captionText = document.getElementById("caption");
	  //if (slideIndex > slides.length) {slideIndex = 1}
	  //if (slideIndex < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  
	  
	  slides[smallerSlideIndex[profile_id]].style.display = "block";
	  if(smallerSlideIndex[profile_id]==slides.length-1){
		//disable next button	
		//var btn = $("#nextBtn"+profile_id);
		//$("#nextBtn"+profile_id).attr("disabled","disabled");
		//$("#nextBtn"+profile_id).href = "javascript:;"
		$("#nextBtn"+profile_id).removeAttr("href");
		$("#nextBtn"+profile_id).removeAttr("onclick");
		//$("#nextBtn"+profile_id).style.color = "gray";
		//$("#nextBtn"+profile_id).style.cursor = "";
		//document.getElementById("myImg"+profile_id)
	  }else{
		  $("#nextBtn"+profile_id).attr("href","#no");
		  $("#nextBtn"+profile_id).attr("onclick","plusSmallSlides(1,"+profile_id+")");
	  }
	  if(smallerSlideIndex[profile_id]==0){
		  //disable previous button
	  	$("#prevBtn"+profile_id).removeAttr("href");
		$("#prevBtn"+profile_id).removeAttr("onclick");
		//$("#nextBtn"+profile_id).style.cursor = "";
		//document.getElementById("myImg"+profile_id)
	  }else{
		  $("#prevBtn"+profile_id).attr("href","#no");
		  $("#prevBtn"+profile_id).attr("onclick","plusSmallSlides(-1,"+profile_id+")");
	  }
}

	function getFilteredStatesMultiSelect(id){
		if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
			$("#"+id).select2({
			    placeholder: "-- Choose Country --"
			});
			$("#rState").empty();
			$("#rState").select2({
	    	    placeholder: "-- Choose State --"
	    	});
			$("#rState").trigger('change.select2');
		}else{
			var countryIds =$("#"+id).val();
			var formData = new FormData();
		     formData.append('country_ids', countryIds);
		     
		    $.fn.makeMultipartRequest('POST', 'getFilteredStates', false,
					formData, false, 'text', function(data){
				var jsonobj = $.parseJSON(data);
				var statesList = jsonobj.states_list;
	         $("#rState").empty();
				//$("#rState").append("<option value='' >-- Choose State --</option>");
				
				$.each(statesList, function(i, state) {
					$("#rState").append("<option value="+state.id+" >"+ state.name+"</option>");
				});
				$("#rState").trigger('change.select2');
				var selected_values = "${profileBean.rState}";
			    if(selected_values == "" || selected_values==null){
			    	$("#rState").select2({
			    	    placeholder: "-- Choose State --"
			    	});
			    }else{
			    	
			        $("#rState").val(selected_values.split(","));
			    }
			    $("#rState").trigger('change.select2');
				
			});
			
		}
	}
function openPhotoModal(photos_list){
	var str1 = "";
	var len = photos_list.length;
	//var scoppedPhotos = ${scopped_photos};
	$.each(photos_list,function(i, photoObject) 
	{
		var j = i+1;
		str1 = ' <div class="mySlides"> '
  		+' <div class="numbertext">'+j+' / '+len+'</div> '
		+' <img src="${baseurl}/'+photoObject.image+'"  class="myImg" style="height: auto;width:100%;"> '
		+' </div> ';
		
	});
	var modelContent = ' <span class="close cursor" onclick="closeModal()">&times;</span> '
	  +' <div class="modal-content"> '
		//+' <c:set var="counter" value="${0}" /> ' 
		//+' <c:forEach items="${photosList}" var="photo" > '
			//+' <c:set var="counter" value="${counter+1}" /> '
	      	+str1
		//+' </c:forEach> '
	    +' <div class="row"> '
			//+' <c:set var="counter2" value="${0}" /> ' 
			//+' <c:forEach items="${photosList}" var="photo" > '
				//+' <c:set var="counter2" value="${counter2+1}" /> '
				+' <div class="col-sm-2"> '
			      +' <img class="demo cursor" src="${baseurl}/img/default.png" style="width:100%" onclick="currentSlide(1)" alt=""> '
			    +' </div> '
		   // +' </c:forEach> '
		+' </div> '
		+' <a class="prev" onclick="plusSlides(-1)">&#10094;</a> '
	    +' <a class="next" onclick="plusSlides(1)">&#10095;</a> '
	    +' <div class="caption-container"> '
	      +' <p id="caption"></p> '
	    +' </div> '   
	  +' </div> ';
	  $("#myPhotoModal").html(modelContent);
	  document.getElementById('myPhotoModal').style.display = "block";
	  
}


function validate(id, errorMessage)
{
	var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
	if($('#'+id).val() ==  null || $('#'+id).val() == ""  || $('#'+id).val()=="undefined" ) {
		$('style').append(styleBlock);
		$('#'+id).css('border-color','#cc0000');
		$('#'+id).css('color','#cc0000');
		$('#'+id).attr('placeholder',errorMessage);
		$('#'+id).addClass('placeholder-style your-class');
		return false;
//			$('#'+id).css('color','#cc0000');
//			$('#'+id+'Error').text(errorMessage);
	}else{
		$('#'+id).css('border-color','');
		$('#'+id).removeClass('placeholder-style your-class');
		$('#'+id).attr('placeholder','');
		return true;
//			$('#'+id).css('color','');
//			$('#'+id+'Error').text("");
	}
	
}

function editMobileNumber(user_id,old_mobile_no){
	var userId = user_id;
	var mobileNum = $("#mobile").val();
	if(mobileNum.trim()==""){
		var v1 = validate('mobile','Enter Mobile Number');
		if(v1==false)
			return false;
	}
	if($('#mobile').val().trim().length<10){
		$('#mobileError').text("Please enter a valid mobile number.");
		event.preventDefault();
		return false;
	}
	var formData = new FormData();
	formData.append("userId",userId);
	formData.append("mobileNum",mobileNum);
	formData.append("oldMobileNum",old_mobile_no);
	$.fn.makeMultipartRequest('POST', '${baseurl}/users/updateMobileNumber', false,
		formData, false, 'text', function(data){
	var jsonobj = $.parseJSON(data);
	var msg = jsonobj.message;
	
	if("success"==msg){
		var location = "${baseurl}";
		window.location.href =location+"/users/sendOtp";
		//alert("Mobile Number Updated Successfully.");
		/* $("#editMobileDiv").attr("hidden",true);
		 $("#mobileNoDiv").removeAttr("hidden");
		$("#mobileNoText").html(mobileNum);
		$("#editMobileAnchor").html("Edit Mobile No.");
		$("#editMobileAnchor").attr("onclick","displayEditMobilenumberDiv("+user_id+","+mobileNum+")"); */
	}else if(msg == "duplicate"){
		alert("Mobile number already in use. Please try another.");
	}else{
		alert("Some problem occured!! Please try again.");
	}	
	
});
}

function getAllNotifications(){
	document.allNotificationsForm.action = "allNotifications"
    document.allNotificationsForm.target = "_blank";    // Open in a new window
    document.allNotificationsForm.submit();             // Submit the page
    return true;
}
function goBack() {
    window.history.back();
}

	</script>
	<script type="text/javascript">
        $(document).ready(function() {
            $('.nailthumb-container').nailthumb();
        });
    </script>
    
	<script type="text/javascript" src="${baseurl }/js/ajax.js"></script>
	<script type="text/javascript" src="${baseurl }/js/jquery-asPaginator.js"></script>
	<script src="${baseurl }/js/jquery.watermark.js"></script>
	<%-- <script type="text/javascript" src="${baseurl }/js/common.js"></script> --%>
	
    <script type="text/javascript" src="${baseurl }/js/jquery.nailthumb.1.1.js"></script>
    
    <link href="${baseurl }/css/jquery.nailthumb.1.1.css" type="text/css" rel="stylesheet" />
    <style type="text/css" media="screen">
        .square-thumb {
            width: 100px;
            height: 100px;
        }
    </style>
 <!-- for Raxus Slider -->
    <link rel="stylesheet" href="${baseurl}/css/raxus.css" media="screen" type="text/css">
    <script type="text/javascript" src="${baseurl}/js/raxus-slider.min.js"></script>
    <!-- for Raxus Slider #end -->

    <!-- for documentation: you don't need them -->
    <link rel="stylesheet" href="${baseurl }/documentation/css/documentation.css" media="screen" type="text/css">
    <link rel="stylesheet" href="http://yandex.st/highlightjs/8.0/styles/default.min.css" media="screen" type="text/css">
    <script type="text/javascript" src="${baseurl }/documentation/js/document.js"></script>
    <script src="${baseurl }/documentation/js/highlight.pack.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>
    <!-- for documentation #end: you don't need them -->

    <style>
     .modal fade .in {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1040;
    background-color: #000;
    display:none;
}
        #mySlider {
            width: 580px;
            height: 520px;
            margin: auto; /* for center alignment */
        }
        #mySlider .mini-images li {
            width: 100px;
            height: 50px;
        }
        
       /*  .modal-header .close {
    margin-top: -12px;
} */
/* @media (min-width: 768px) {
.modal-dialog {
   width: px !important;
    margin: 30px 250px !important;
}
} */
        /* for tablet */
        @media screen and (max-width: 980px) {
            #mySlider {
                width: 100%;
                height: 450px;
            }
        }
        /* for mobile */
        @media screen and (max-width: 640px) {
            #mySlider {
                width: 570px;
                height: 450px;
            }
        }
         @media screen and (max-width: 480px) {
            #mySlider {
                width: 400px;
                height: 380px;
            }
        }
         @media screen and (max-width: 414px) {
            #mySlider {
                width: 350px;
                height: 350px;
            }
        }
          @media screen and (max-width: 360px) {
            #mySlider {
                width: 300px;
                height: 350px;
            }
        }
          @media screen and (max-width: 320px) {
            #mySlider {
                width: 280px;
                height: 250px;
            }
        }
    </style>    
<style type="text/css">
.animated.infinite {
	animation-iteration-count: infinite
}
.thumbimg {
border:none !important;
width:100%;
height:auto;
}
blockquote {
 margin: 0.5em 10px !important;
}
blockquote p {
  display: inline;
  word-wrap:break-word;
  min-height:10px;
 
}
.preprofile {
	width:90px;
	height:65px;
	overflow:hidden;
	padding-top:3px;
	padding-bottom:3px;
	    margin-bottom: 4px;
}
#shortlistTD168 {
margin-bottom:5px;
}
.thumbnailmain {
height:88px;
overflow:hidden;
}
/* .profilepic0 {
height:220px;
overflow:hidden;

} */
body {
/* background:url('images/body.jpg')  !important;
 background-repeat: repeat-y; */
 background:#f1f1f1 !important;
 }
 .products{
/* background:url('images/body.jpg')  !important;
 background-repeat: repeat-y; */
  background:#f1f1f1 !important;
 }
.upgradeOption {
    color: #f35626;
    background-image: -webkit-linear-gradient(2deg, #fff, #fff);
    -webkit-background-clip: text;
    -webkit-animation: hue 2s infinite linear;
}

.multiSelect {
	width: 187px;
}

.dropdown-menu {
	box-shadow: 0px 0px 2px 0px #363636;
	border-radius: 6px;
}

.dropdown-menu:after {
	content: '';
	position: absolute;
	bottom: 100%;
	left: 40px;
	margin-left: 0;
	width: 0;
	height: 0;
	border-bottom: 8px solid #ffffff;
	border-right: 8px solid transparent;
	border-left: 8px solid transparent;
	opacity: 1;
	-webkit-transform: translate3d(0, 0px, 0);
	transform: translate3d(0, 0px, 0);
	-webkit-transition: all .1s ease-in-out;
	transition: all .1s ease-in-out;
}
.view0 {
margin-bottom:5px;
}
.btn-sm {
width:128px;
}
.panel-title {
	font-size: 16px;
	color: #000;
	text-align: right;
}

h4.panel-title a {
	font-size: 15px;
	text-transform: capitalize;
	color: #000;
}

.matchcount {
	background-color: #FFECD9;
	color: #000;
	padding: 2px 4px;
	font-size: 11px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	vertical-align: top;
	margin: 2px 2px;
}
.pull-right {

float:right;}
.ptransition {
transition:none !important;
  -webkit-transition:none !important;
  -moz-transition:none !important;
  -o-transition:none !important;
  transition:none !important;
}
.premium-member {
	background-color: #319604;
	color: #fff !important;
	padding: 2px 8px;
	font-size: 11px !important;
	border: none;
	
	border-radius: 1px;
	
	margin: 2px 2px;
	margin-left:5px;
}
.btn-sm {
margin-bottom:5px;
margin-left:5px;
}
.ptransition {
cursor:pointer;
}
@https://unsplash.it/600/400?image=984
-webkit-keyframes hue {from { -webkit-filter:hue-rotate(0deg);
	
}

to {
	-webkit-filter: hue-rotate(-360deg);
}

}
@
keyframes flash { 0%,50%,
	to {opacity: 1
}

25%,75%{
opacity
:
0
}
}
.flash {
	animation-name: flash
}
/* carousel */
.media-carousel {
	margin-bottom: 0;
	padding: 0 40px 30px 40px;
	margin-top: 30px;
}
/* Previous button  */
.media-carousel .carousel-control.left {
	left: -12px;
	background-image: none;
	background: none repeat scroll 0 0 #222222;
	border: 4px solid #FFFFFF;
	border-radius: 23px 23px 23px 23px;
	height: 40px;
	width: 40px;
	margin-top: 80px
}
/* Next button  */
.media-carousel .carousel-control.right {
	right: -12px !important;
	background-image: none;
	background: none repeat scroll 0 0 #222222;
	border: 4px solid #FFFFFF;
	border-radius: 23px 23px 23px 23px;
	height: 40px;
	width: 40px;
	margin-top: 80px
}

p {
	letter-spacing: px;
}

.thumbnail {
	display: block;
	padding: 4px;
	margin-bottom: 5px;
	line-height: 1.42857143;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	-webkit-transition: border .2s ease-in-out;
	-o-transition: border .2s ease-in-out;
	transition: border .2s ease-in-out;
}
/* Changes the position of the indicators */
.media-carousel .carousel-indicators {
	right: 50%;
	top: auto;
	bottom: 0px;
	margin-right: -19px;
}
/* Changes the colour of the indicators */
.media-carousel .carousel-indicators li {
	background: #c0c0c0;
}

.media-carousel .carousel-indicators .active {
	background: #333333;
}

.media-carousel img {
	width: 100%;
	height: auto;
}

.img-replace {
	/* replace text with an image */
	display: inline-block;
	overflow: hidden;
	text-indent: 100%;
	color: transparent;
	white-space: nowrap;
}

.edit-style {
	text-decoration: none;
	background-color: cornflowerblue;
	padding: 6px;
	width: 52px;
	font-size: 13px;
	padding-top: 0px;
	padding-left: 7px;
	border-radius: 3px;
	margin-right: 0px;
	color: white;
	height: 26px;
	padding:0;
	font-weight:400;
}

.img-replace {
	display: inline-block;
	overflow: hidden;
	text-indent: 100%;
	color: transparent;
	white-space: nowrap;
}

.font {
	color: #006699;
	line-height: 2;
	font-size: 18px;
}

.cd-nugget-info {
	text-align: center;
	position: absolute;
	width: 100%;
	height: 50px;
	line-height: 50px;
	bottom: 0;
	left: 0;
}

.cd-nugget-info a {
	position: relative;
	font-size: 14px;
	color: #5e6e8d;
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	transition: all 0.2s;
}

.no-touch .cd-nugget-info a:hover {
	opacity: .8;
}

.cd-nugget-info span {
	vertical-align: middle;
	display: inline-block;
}

.cd-nugget-info span svg {
	display: block;
}

.cd-nugget-info .cd-nugget-info-arrow {
	fill: #5e6e8d;
}

/* -------------------------------- 

Main components 

-------------------------------- */
header {
	height: 200px;
	line-height: 200px;
	text-align: center;
	background-color: #5e6e8d;
	color: #FFF;
}

header h1 {
	font-size: 20px;
	font-size: 1.25rem;
}

.cd-popup-trigger {
	display: block;
	width: 170px;
	height: 50px;
	line-height: 50px;
	margin: 3em auto;
	text-align: center;
	color: #FFF;
	font-size: 14px;
	font-size: 0.875rem;
	font-weight: bold;
	text-transform: uppercase;
	border-radius: 50em;
	background: #35a785;
	box-shadow: 0 3px 0 rgba(0, 0, 0, 0.07);
}

@media only screen and (min-width: 1170px) {
	.cd-popup-trigger {
		margin: 6em auto;
	}
}
@media  (min-width: 320px) and (max-width:640px) {
/* .dropdown:hover .dropdown-menu {
.dropdown:hover .dropdown-menu {
display:none !important;
} */
.modal-open .modal {
    overflow-x: auto;
    overflow-y: auto;
}
.products {
    margin-top: 182px;
}
.scrollup{
			width:40px;
			height:40px;			
			text-indent:-9999px;
			
			position:fixed;
			bottom:10px;
			right:10px;
			display:none;			
			background: url('${baseurl }/images/icon_top.png') no-repeat;
		}
#searchResults .panel-heading {
padding:18px 5px;
}
#searchResults .form-check-label {
margin-top:-9px;
}
.newma td {
width:107px !important;
vertical-align:initial;
}
.mid-grids h5 {
    color: #C00;
    margin: 0;
    font-size: 14px;
    margin-top: -10px;
}
.panel-heading {
    padding: 10px 3px;
    }
    
.dropdown-menu:after {
display:none !important;
}
.dropdown-menu1:after {
bottom:100% !important;
}
.dearb {
display:none;
}
.open .dropdown .dropdown-menu {
    display: block !important;
}
.premium-member {
display:inline-block;
margin-left:0px;}
.logo img{
margin:0 auto;
height:auto;
}
.table-responsive {
border:none !important;}
.box_1 p {
    margin: 20px 50px 20px 15px;
}
.logo {
    margin-bottom: 5px !important;
}
}
/* -------------------------------- 

xpopup 

-------------------------------- */
.cd-popup {
	position: fixed;
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	background-color: rgba(94, 110, 141, 0.9);
	opacity: 0;
	visibility: hidden;
	-webkit-transition: opacity 0.3s 0s, visibility 0s 0.3s;
	-moz-transition: opacity 0.3s 0s, visibility 0s 0.3s;
	transition: opacity 0.3s 0s, visibility 0s 0.3s;
}

.cd-popup.is-visible {
	opacity: 1;
	visibility: visible;
	-webkit-transition: opacity 0.3s 0s, visibility 0s 0s;
	-moz-transition: opacity 0.3s 0s, visibility 0s 0s;
	transition: opacity 0.3s 0s, visibility 0s 0s;
}

.cd-popup-container {
	position: relative;
	width: 90%;
	max-width: 400px;
	margin: 4em auto;
	background: #FFF;
	border-radius: .25em .25em .4em .4em;
	text-align: center;
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
	-moz-box-shadow: inset 0 0 10px #006699;
	-webkit-box-shadow: inset 0 0 10px #006699;
	box-shadow: inset 0 0 10px #006699;
}

.cd-popup-container {
	padding: 3em 1em;
}

.cd-popup-container p {
	text-align: left;
}

.cd-popup-container .cd-buttons:after {
	content: "";
	display: table;
	clear: both;
}

.cd-popup-container .cd-buttons li {
	float: left;
	width: 50%;
	list-style: none;
}

.cd-popup-container .cd-buttons a {
	display: block;
	height: 60px;
	line-height: 60px;
	text-transform: uppercase;
	color: #FFF;
	-webkit-transition: background-color 0.2s;
	-moz-transition: background-color 0.2s;
	transition: background-color 0.2s;
}

.cd-popup-container .cd-buttons li:first-child a {
	background: #fc7169;
	border-radius: 0 0 0 .25em;
}

.no-touch .cd-popup-container .cd-buttons li:first-child a:hover {
	background-color: #fc8982;
}

.cd-popup-container .cd-buttons li:last-child a {
	background: #b6bece;
	border-radius: 0 0 .25em 0;
}

.no-touch .cd-popup-container .cd-buttons li:last-child a:hover {
	background-color: #c5ccd8;
}

.cd-popup-container .cd-popup-close {
	position: absolute;
	top: 8px;
	right: 8px;
	width: 30px;
	height: 30px;
}

.cd-popup-container .cd-popup-close::before, .cd-popup-container .cd-popup-close::after
	{
	content: '';
	position: absolute;
	top: 12px;
	width: 14px;
	height: 3px;
	background-color: #8f9cb5;
}

.cd-popup-container .cd-popup-close::before {
	-webkit-transform: rotate(45deg);
	-moz-transform: rotate(45deg);
	-ms-transform: rotate(45deg);
	-o-transform: rotate(45deg);
	transform: rotate(45deg);
	left: 8px;
}
@media (min-width: 767px) {
  .navbar-custom .dropdown:hover .dropdown-menu {
    display: none;
  }
}

.cd-popup-container .cd-popup-close::after {
	-webkit-transform: rotate(-45deg);
	-moz-transform: rotate(-45deg);
	-ms-transform: rotate(-45deg);
	-o-transform: rotate(-45deg);
	transform: rotate(-45deg);
	right: 8px;
}

.is-visible .cd-popup-container {
	-webkit-transform: translateY(0);
	-moz-transform: translateY(0);
	-ms-transform: translateY(0);
	-o-transform: translateY(0);
	transform: translateY(0);
}

@media only screen and (min-width: 1170px) {
	.cd-popup-container {
		margin: 8em auto;
	}
}

#thumbs-wrapper, #viewer-wrapper, #setup-wrapper {
	padding: 15px;
}

/*  #thumbs-wrapper,  #setup-wrapper,  #thumbs-nav { }*/
#viewer-wrapper {
	height: 300px;
}

#gallery-viewer {
	height: 100%;
}

#gallery-viewer img {
	max-width: 100%;
	max-height: 100%;
}

#viewer-nav, #thumbs-nav {
	height: 0px;
}

#viewer-nav {
	margin-top: 2px;
}

#thumbs-nav {
	margin-top: 10px;
	margin-bottom: 2px;
}

#thumbs-nav p {
	width: 50%;
	text-align: center;
	margin: 0 auto;
	line-height: 30px;
}

#gallery-next, #gallery-viewer-next, #gallery-prev, #gallery-viewer-prev
	{
	text-indent: -9999px;
	margin: 6.5px 25px;
	height: 17px;
	width: 16px;
	background-image: url('../images/spt_arrows.png');
	background-repeat: no-repeat;
}

#gallery-next, #gallery-viewer-next {
	background-position: -16px 0;
	float: right;
}

#gallery-prev, #gallery-viewer-prev {
	float: left;
}

.thumbnail {
	float: left;
	width: 100%;
	height: auto;
	padding: 0px;
	margin: 0px
}

body {
	font-family:'Open Sans', sans-serif;
	margin: 0;
}

* {
	box-sizing: border-box;
}

.row>.column {
	padding: 0 8px;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.column {
	float: left;
	width: 100%;
}

/* The Modal (background) */
/* .modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: black;
} */

/* Modal Content */
/* .modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	width: 60%;
	height: 50%;
	background-color: black;
} */

/* The Close Button */
/* .close {
	color: white;
	position: absolute;
	top: 10px;
	right: 25px;
	font-size: 35px;
	font-weight: bold;
} */

.close:hover, .close:focus {
	color: #999;
	text-decoration: none;
	cursor: pointer;
}

.mySlides {
	display: none;
}

.cursor {
	cursor: pointer
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	width: auto;
	padding: 16px;
	color: white;
	font-weight: bold;
	font-size: 30px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
	-webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

img {
	margin-bottom: 0px;
}

.caption-container {
	text-align: center;
	background-color: black;
	padding: 2px 16px;
	color: white;
}

.demo {
	opacity: 0.6;
}

.active, .demo:hover {
	opacity: 1;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.column {
	float: left;
	width: 100%;
}

/* The Modal (background) */
/* .modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: black;
} */

/* Modal Content */
/* .modal-content {
	position: relative;
	background-color: #fefefe;
	margin: auto;
	padding: 0;
	width: 60%;
	height: 0px;
	background-color: transparent;
} */

/* The Close Button */
/* .close {
	color: white;
	position: absolute;
	top: 10px;
	right: 25px;
	font-size: 35px;
	font-weight: bold;
} */

.close:hover, .close:focus {
	color: #999;
	text-decoration: none;
	cursor: pointer;
}

.mySlides {
	display: none;
}

.smallSlides {
	display: none;
}

.cursor {
	cursor: pointer
}

/* Next & previous buttons */
.prev, .next {
	cursor: pointer;
	position: absolute;
	width: auto;
	padding: 16px;
	color: white;
	font-weight: bold;
	font-size: 30px;
	transition: 0.6s ease;
	border-radius: 0 3px 3px 0;
	user-select: none;
	-webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
	right: 0;
	border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
	background-color: rgba(0, 0, 0, 0.8);
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

img {
	margin-bottom: 0px;
}

.caption-container {
	text-align: center;
	background-color: black;
	padding: 2px 16px;
	color: white;
}

.demo {
	opacity: 0.6;
}

.active, .demo:hover {
	opacity: 1;
}

img.hover-shadow {
	transition: 0.3s
}

/* .hover-shadow:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19)
} */

.mySlides {
	width: 100%;
	height: 600px;
	overflow:hidden;
}

.manditory {
	color: red;
}

/*   Notifications styles    */
#notification_li
			{
			position:relative
			}
			#notificationContainer 
			{
			background-color: #fff;
			border: 1px solid rgba(100, 100, 100, .4);
			-webkit-box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
			overflow: visible;
			position: absolute;
			top: 35px;
			
			width: 250px;
			z-index:999;
			display: none; // Enable this after jquery implementation 
			}
			// Popup Arrow
			#notificationContainer:before {
			content: '';
			display: block;
			position: absolute;
			width: 0;
			height: 0;
			color: transparent;
			border: 10px solid black;
			border-color: transparent transparent white;
			margin-top: -20px;
			margin-left: 188px;
			}
			#notificationTitle
			{
			font-weight: bold;
			padding: 8px;
			font-size: 13px;
			background-color: #f2f2f3;
			
			z-index: 1000;
			width: 248px;
			border-bottom: 1px solid #dddddd;
			}
			#notificationsBody
			{
			padding: 3px 0px 0px 0px !important;
			max-height:300px;	
    overflow-y: scroll;
			}
			#notificationFooter
			{
			background-color: #e9eaed;
			text-align: center;
			font-weight: bold;
			padding: 8px;
			font-size: 12px;
			border-top: 1px solid #dddddd;
			}



		#notification_count 
		{
		padding: 3px 7px 3px 7px;
		background: #cc0000;
		color: #ffffff;
		font-weight: bold;
		margin-left: 77px;
		border-radius: 9px;
		-moz-border-radius: 9px; 
		-webkit-border-radius: 9px;
		position: absolute;
		margin-top: -11px;
		font-size: 11px;
		}
@media screen and only (max-width: 992px) {
.ntag {
		margin-bottom: 5px;
		display: inline-flex;
		margin-top: !important;
		font-size: 12px !important;
		color: #000;
	}
}
@media ( min-width : 980px) {
	.ntag {
		margin-bottom: 5px;
		display: inline-flex;
		margin-top: px;
		font-size: 10px;
		color: #000;
	}
	}
	.ntag {
	margin-bottom: 5px;
	display: inline-flex;
	font-size: 10.5px;
	color: #3c3636;
	margin-left: 3px;
	font-weight: bold;
}
	
</style>
</head>
<body style="background: ;">
<%@ page import="com.aurospaces.neighbourhood.bean.UsersBean"%>
 <%
	UsersBean userBean = null;
	//if(session.getAttribute("cacheGuest") != null){
		userBean= (UsersBean)session.getAttribute("cacheGuest");
		String otpStatus = userBean.getOtpStatus();
		if(org.apache.commons.lang.StringUtils.isBlank(otpStatus) || "0".equals(otpStatus)){
%>			
			
<%			
		}
	//}
%> 
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<div class="header">
<div class="header_top">
	<div class="container" style="background: #FFF;width:;">
    	<div class="col-md-3">
			<div class="logo" style="margin-top:5px;">
				<a href="dashboard"><img  src="${baseurl}/images/logo.png" class="img img-responsive"></a>
				<!-- <p class="ntag">NO. 1 TELUGU MATRIMONIAL SERVICE</p> -->
			</div>
			<div class="clearfix"></div>
		</div>
		
			<!-- <ul class="nav navbar-nav">
				<li><a href="#no">Matches<span class="badge badge-notify">30</span></a></li>
				<li><a href="#no">Search</a></li>
				<li><a href="#no">Inbox<span class="badge badge-notify">30</span></a></li>
			</ul> -->
			<!-- <div class="box_1 midfont">
				<p><a href="#no">Matches</a><span class="badge badge-notify">0</span>&nbsp;&nbsp;&nbsp;
        		<a href="searchProfiles">Search</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       			<a href="#no">Inbox</a><span class="badge badge-notify">0</span></p>
			</div> -->
		<div class="col-md-9">
		<div class="col-md-1 dearb"></div>
		<div class="col-md-10 col-xs-10">
			<div class="cart box_1">
				<p>Dear <%= userBean.getFirstName() %> <%= userBean.getLastName() %></p>
				<div class="clearfix"> </div>
			</div>				 
		</div>
		<div class="col-md-1 col-xs-1">
		<div class="pull-right" style="width:80px;">
		<ul class="nav navbar-nav navbar-right">
							<li class="dropdown dropdown1 settings pull-right" style="height:62px; width:96px; background:#f1f1f1; padding:0px;">
								<a href="#no" class="dropdown-toggle setpic" data-toggle="dropdown" style="background:#f1f1f1;">
									
									
<!-- 										<img id="profilepic" src="${baseurl}/img/default.png" class="img-responsive thumbnail " style="margin-top:-10px;height: 40px;width: 40px;border-radius:15%;">  -->

									<c:if test="${not empty cacheGuest.profileImage}">
										<img id="profilepic" src="${catalina_base}/${cacheGuest.profileImage}" alt="" class="img img-responsive thumbnail watermark_text" style="border-radius:15%;"><i style="margin-right:-18px; margin-top:17px;font-size:22px;" class="fa fa-angle-down" aria-hidden="true"></i>
									</c:if>
									<c:if test="${empty cacheGuest.profileImage}">
										<img id="profilepic" src="${baseurl}/img/default.png" alt="image" class="img-responsive thumbnail " style="border-radius:15%;height:50px;"/><i style="margin-right: -18px;margin-top: 17px;font-size: 22px;" class="fa fa-angle-down" aria-hidden="true"></i>
									</c:if>

									
								</a>
								<ul class="dropdown-menu dropdown-menu1" style="min-width:90px !important;">
									<li><a href="settings">Settings</a></li>
									<li><a href="${baseurl}/logoutHome" >Sign out</a></li>
								</ul>
							</li>
							
						</ul></div>	</div>
						</div>
						
						</div>
	</div>
<div class="nav"  style="width:100%;background:#006699;">
	<div class="container">
		<div class="row">
			<nav class="navbar navbar-custom navbar-inverse" role="navigation" >
				<div >
	        		<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="dropdown dashboard">
								<a href="dashboard" class="dropdown-toggle" data-toggle="dropdown">My Home</a>
								<ul class="dropdown-menu">
									<li><a href="dashboard">Dashboard</a></li>
									<li><a href="myProfile">My Profile</a></li>
									<!-- <li><a href="myPhotos">My Photos</a></li> -->
									<li><a href="myProfileViewsList">Who viewed my profile</a></li>
									<li><a href="shortListedMe">Who short listed me</a></li>
									
									<li><a href="mobileNumViewedByMeList">Mobile no viewed by me</a></li>
									<li><a href="myMobileNoViewsList">Who viewed my mobile number</a></li>
									<li><a href="inboxAction?tab_type=inbox&list_type=rejected_requests">Ignored profiles</a></li>
								</ul>
							</li>
							<li class="dropdown searchPage">
								<a href="#no" class="dropdown-toggle" data-toggle="dropdown">Search</a>
								<ul class="dropdown-menu">
									<li><a href="searchProfiles">Regular search</a></li>
									<li><a href="searchById">Search by ID </a></li>
									<li><a href="recentlyViewedProfiles">Recently viewed profiles</a></li>
									<li><a href="premiumMembers">Premium Members</a></li>
								</ul>
							</li>
							<li class="dropdown matches">
								<a href="#no" class="dropdown-toggle" data-toggle="dropdown">Matches <span class="matchcount">${cacheGuest.yetToBeViewedCount}</span></a>
								<ul class="dropdown-menu">
									<li><a href="newMatches">New Matches</a></li>
									<li><a href="yetToBeViewed">Yet to be viewed(${cacheGuest.yetToBeViewedCount}) </a></li>
									<li><a href="viewedNotContacted">Viewed & not contacted(${cacheGuest.viewedNotContactedCount})</a></li>
									<li><a href="shortListedByMe">Shortlisted Matches</a></li>
									<!-- <li><a href="#no">Premium Members</a></li> -->
								</ul>
							</li>
							<li class="dropdown messages">
								<a href="#no" class="dropdown-toggle" data-toggle="dropdown">Messages <span class="matchcount pend_req_count_class" id="pend_req_count">${cacheGuest.pendingRequestsCount}</span></a>
								<ul class="dropdown-menu">
									<li><a href="inboxAction?tab_type=inbox&list_type=pending_requests">Inbox - Pending <span class="pend_req_count_class">${cacheGuest.pendingRequestsCount}</span></a></li>
									<li><a href="inboxAction?tab_type=inbox&list_type=accepted_requests" >Inbox - Accepted </a></li>
									<li><a href="inboxAction?tab_type=sent&list_type=sent_requests" >Sent All</a></li>
									<!-- <li><a href="#no">SMS received/sent</a></li> -->
								</ul>
							</li>
							<!-- <li class="dropdown upgrade">
								<a href="#no" class="dropdown-toggle" data-toggle="dropdown">Upgrade</a>
								<ul class="dropdown-menu">
									<li><a href="memberShipPage">Payment Options</a></li>
									<li><a href="#no">Profile Highliter </a></li>
								</ul>
							</li> -->
							
							<li class="dropdown dropdown1 notifications" id="notification_li">
								<a href="#" id="notificationLink"> <span class="fa fa-bell"></span>Notifications <c:if test="${not empty notificationsList}"><span class="matchcount" id="matchcountId">${notificationsCount}</span></c:if></a>
								<div id="notificationContainer" class="dropdown-menu dropdown-menu1">
									<c:if test="${not empty notificationsList}">
											<div id="notificationsBody" class="notifications">
												<c:forEach var="notification" items="${notificationsList}">
												<div class="notifyDivAll notifyDiv${notification.id}">
													<div class="col-md-3 col-xs-3"  style="height:55px; overflow:hidden;padding-right:0px; padding-left:0px;" >
														<c:if test="${not empty notification.profileImage}">
															<img src="${catalina_base}/${notification.profileImage}" style="width: 100%;padding: 5px;">
														</c:if>
														<c:if test="${empty notification.profileImage}">
															<img src="${baseurl}/img/default.png" style="width: 100%;padding: 5px;">
														</c:if>
													</div>
													<div class="col-md-7" style="padding-right:0px; padding-left:0px;" >
														<p>
															
															<!-- <a href="inboxAction?tab_type=inbox&list_type=rejected_requests"> -->
															
															
															<%-- <a href="padma?pid=${notification.user_id}&nid=${notification.id}&rfrm=notifications" > --%>
															
																<%-- <c:out value="${notification.fullName}" /> (<c:out value="${notification.username}" />) --%>
																<c:if test="${cacheGuest.roleId == 4}"><img src="${baseurl}/images/blurr.png"/></c:if><c:if test="${cacheGuest.roleId != 4}">${notification.fullName}</c:if><c:set var="name" value="(${notification.username})" />
																<c:if test="${notification.notifi_type == 'interest'}">
																	<a href="inboxAction?tab_type=inbox&list_type=pending_requests&nid=${notification.id}">
																		<c:out value="${name}" /> expressed interest in your profile
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'mobile_num_viewed'}">
																	<a href="myMobileNoViewsList?nid=${notification.id}">
																		<c:out value="${name}" /> viewed your mobile number
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'profile_viewed'}">
																	<a href="myProfileViewsList?nid=${notification.id}">
																		<c:out value="${name}" /> viewed your profile
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'mail'}">
																	<a href="inboxAction?tab_type=inbox&list_type=pending_requests&nid=${notification.id}">
																		<c:out value="${name}" /> sent you personal mail
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'short_listed'}">
																	<a href="shortListedMe?nid=${notification.id}">
																		<c:out value="${name}" /> shortlisted your profile
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'message_replied'}">
																	<a href="inboxAction?tab_type=inbox&list_type=accepted_requests&nid=${notification.id}" >
																		<c:out value="${name}" /> replied to your message
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'message_accepted'}">
																	<a href="inboxAction?tab_type=inbox&list_type=accepted_requests&nid=${notification.id}" >
																		<c:out value="${name}" /> accepted your message
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'interest_accepted'}">
																	<a href="inboxAction?tab_type=inbox&list_type=accepted_requests&nid=${notification.id}" >
																		<c:out value="${name}" /> accepted your interest request
																	</a>
																</c:if>
															</a>
															<br>
															<c:out value="${notification.created_on}" />
														.</p>
													</div>
													<div class="col-md-2">
													<a  href="#" onclick="removeNotification(${notification.id});"><span class="fa fa-trash pull-right" style="margin-top:5px;"></span></a></div>
													<div class="clearfix"></div><hr>
												</div>
												</c:forEach>
											</div>
											<form:form commandName="notificationsForm"  class="form-horizontal" id="allNotificationsForm" name="allNotificationsForm" role="form"   method="post">
												<div id="notificationFooter"><a href="#" onclick="getAllNotifications();">See All</a></div>
											</form:form>
									</c:if>
									<c:if test="${empty notificationsList}">
										<p>Currently, you have no notifications.</p>
									</c:if>
								</div>	
							</li>
							<li><a href="help" >Help <%-- <div id="load_me">
							<%@ include file="sample.jsp" %>
							</div> --%>
							</a></li>
							<li><a href="refer" >Refer & Earn <%-- <div id="load_me">
							<%@ include file="refer.jsp" %>
							</div> --%>
							</a></li>
							<c:if test="${cacheGuest.roleId == '4' || cacheGuest.membership_status == '0'}">
							<li><a class="upgradeOption animated flash infinite" href="memberShipPage" style="font-size: 18px; font-weight: bold; color: #fff;">Upgrade</a></li>
							</c:if>
							
                            
                            </ul>
                            
                            
                            
                           <%--  <ul class="nav navbar-nav navbar-right">
                            
                            
							<li class="dropdown settings pull-right">
								<a href="#no" class="dropdown-toggle setpic" data-toggle="dropdown">
								<c:if test="${not empty cacheGuest.profileImage}">
										<img id="profilepic" src="${cacheGuest.profileImage}" alt="profileImage" class="img img-responsive thumbnail watermark_text" style="margin-top:-10px;height: 40px;width: 40px;border-radius:15%;"><i class="fa fa-angle-down" aria-hidden="true"></i>
									</c:if>
									<c:if test="${empty cacheGuest.profileImage}">
										<img id="profilepic" src="${baseurl}/img/default.png" alt="image" class="img-responsive thumbnail " style="margin-top:-10px;height: 40px;width: 40px;border-radius:15%;"><i class="fa fa-angle-down" aria-hidden="true"></i>
									</c:if>

									
								</a>
								<ul class="dropdown-menu" style="left: none; right: auto; min-width: 85px;">
									<li><a href="settings">Settings</a></li>
									<li><a href="logoutHome" >Sign out</a></li>
								</ul>
							</li>
							
						</ul>	 --%>
							
						
	        		</div>
	        		<!-- /.navbar-collapse -->
	      		</div>
	      		<!-- /.container-fluid -->
	    	</nav>
			
		</div>
	</div></div></div><div class="clearfix"></div>
</div>
<div class="modal fade" id="myModal" role="dialog" style="background: transparent;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background: yellowgreen; border-radius: 0px; ">
          <button type="button" id="closeBtn" class="close" data-dismiss="modal" style="margin-top:0px; margin-right:8px; font-size: 28px;color: #fff;opacity:1;'">&times;</button>
          <h4 class="modal-title" style="color: aliceblue;padding: 10px; padding-left: px; font-size: 18px;">Send Message <span id="member_name_todisplay"></span></h4>
        </div>
        <div class="modal-body" style="background: transparent;">
        <label>Enter Your Message</label>
        	<input type="hidden" name="profile_id" id="profile_id">
        	<input type="hidden" id="memberName" name="memberName">
        	<div id="content_div">
        	<c:if test="${default_text_option == '0' }">
        		<textarea id="mail_content" placeholder="Enter Your Message..." onblur="this.placeholder='Enter Your Message'" onfocus="this.placeholder=''" name="mail_content" class="form-control" rows="10" style="white-space: pre-wrap; margin-top:5px; resize:none; overflow:auto;" ></textarea>
        	</c:if>
        	<%-- <c:if test="${default_text_option != '0' }">
        		<textarea id="mail_content" placeholder="Enter Your " onblur="this.placeholder='Enter Your Message'" onfocus="this.placeholder=''" name="mail_content" cols="70" rows="10"style="margin-top:5px;" ></textarea>
        	</c:if> --%>
         	 <c:if test="${default_text_option != '0' }">
        		<textarea id="mail_content" placeholder="" onblur="this.placeholder='Enter Your Message'" onfocus="this.placeholder=''" name="mail_content"   style="width:100%; height:150px;white-space: pre-wrap;margin-top:5px;" ><c:out value="${mail_default_text}" />
        			
        		</textarea>
        	</c:if> 
         	</div>
         	<br><div class="clearfix"></div>
          	
        </div><div class="modal-footer">
      <span style="float:left;">  &nbsp; <input type="checkbox" name="default_text_opt" id="default_text_opt" /> &nbsp; Set as default text </span>
          <span type="button" id="sendMailBtn" onclick="sendMail()" class="btn btn-danger " style="  " >Send Message</span>
        </div>
      </div>
      
    </div>
</div>	
<div class="modal fade" id="expressModal" role="dialog" style="background: transparent;    background-color: rgba(0,0,0,0.4);">
    <div class="modal-dialog" style="    border: 10px solid #888383; border-radius:15px;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background:none;border-radius: 0px; ">
          <button type="button" id="closeBtn" class="close" data-dismiss="modal" style="margin-top:0px; margin-right:8px; font-size: 28px;color: #000;'">&times;</button>
          <h4 class="modal-title" style="color: aliceblue;padding: 10px; padding-left: px; font-size: 18px;"> <span id="member_name_todisplay"></span></h4>
        </div>
        <div class="modal-body" style="background: transparent;">
       
       <p><b>Interest request has been sent successfully to <span id="expressModalName"></span></b></p>
         	</div>
         	<br><div class="clearfix"></div>
          	
        <div class="modal-footer">
          <a type="button" id="sendMailexpressModal" class="btn btn-danger" >Send Mail</a>
        </div>
      </div>
      
    </div>
</div>	
<div class="modal fade" id="shortlistModal" role="dialog" style="background: transparent;    background-color: rgba(0,0,0,0.4);">
    <div class="modal-dialog" style="    border: 10px solid #888383; border-radius:15px;">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background:none;border-radius: 0px; ">
          <button type="button" id="closeBtn" class="close" data-dismiss="modal" style="margin-top:0px; margin-right:8px; font-size: 28px;color: #000;'">&times;</button>
          <h4 class="modal-title" style="color: aliceblue;padding: 10px; padding-left: px; font-size: 18px;"> <span id="member_name_todisplay"></span></h4>
        </div>
        <div class="modal-body" style="background: transparent;">
       <p><b><span id="shortListModalName"></span> Profile has been shortlisted</b></p>
         	</div>
         	<br><div class="clearfix"></div>
          	
        <div class="modal-footer">
          <span type="button" id="sendMailShortlistModal" class="btn btn-danger">Send Mail</span>
        </div>
      </div>
      
    </div>
</div>
<div id="myPhotoModal" class="modal">
  <span class="close cursor" onclick="closeModal()">&times;</span>
  <div class="modal-content">
	<c:set var="counter" value="${0}" /> 
	<c:forEach items="${photosList}" var="photo" >
		<c:set var="counter" value="${counter+1}" />
      	<div class="mySlides">
      		<div class="numbertext">${counter} / ${photosListSize}</div>
	    		<img src="${baseurl}/${photo.image}"  class="myImg" style="height:auto;width:100%">
	    </div>
	</c:forEach>
    <!--slider-->
	<div class="row">
		<c:set var="counter2" value="${0}" /> 
		<c:forEach items="${photosList}" var="photo" >
			<c:set var="counter2" value="${counter2+1}" />
			<div class="col-sm-2">
		      <img class="demo cursor" src="${baseurl}/${photo.image}" style="width:100%" onclick="currentSlide(${counter2})" alt=""/>
		    </div>
	    </c:forEach>
	</div>
	<!--slider-->
    
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a>

    <div class="caption-container">
      <p id="caption"></p>
    </div>   
  </div>
  </div>

 <!-- Modal -->
  <%-- <div tabindex="-1" class="modal fade in" id="myModalNew" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
    
      <div class="modal-content">
        
        <div class="modal-body">
       
         


<section >
    <div >

        <div >
            
  <button style="float:right;margin-bottom:5px;" type="button" class="close" data-dismiss="modal">&times;</button>
                <div id="mySlider" class="raxus-slider" data-autoplay="4000" data-arrows="show"  data-dots="show" data-keypress="true" data-thumbnail="bottom">
                	<ul class="slider-relative" >
						<c:forEach items="${logged_in_user_photosList}" var="photo" >
					      	<li class="slide fix-width">
	                            <img src="${catalina_base}/${photo.folder_name}/full-images/${photo.image_name}" alt="" class="">
	                            <div class="watermarkcontent_fullpic">
									<span>aarnamatrimony.com</span>
								</div>
	                        </li>
						</c:forEach>
                    
                        <!-- <li class="slide fix-width">
                            <img src="${baseurl}/img/113510.png" alt="">
                            
                        </li>
                        
                        <li class="slide">
                            <img src="${baseurl}/img/100587.png" alt="" data-thumbnailurl="img/100587.png">
                           
                        </li>
                        <li class="slide">
                            <img src="${baseurl}/img/74520.png" alt="">
                           
                        </li>
                       
                        <li class="slide">
                            <img src="${baseurl}/img/74564.png" alt="">
                        </li>
                        <li class="slide fix-width">
                            <img src="${baseurl}/img/101765.png" alt="">
                            
                        </li>
                        <li class="slide fix-width">
                            <img src="${baseurl}/img/102306.png" alt="">
                        </li>
                       
                        <li class="slide">
                             <img src="${baseurl}/img/102379.png" alt="">
                        </li>
                        <li class="slide">
                            <img src="${baseurl}/img/10323.png" alt="">
                        </li>
                        <li class="slide">
                             <img src="${baseurl}/img/10533.png" alt="">
                        </li>
                        <li class="slide">
                            <img src="${baseurl}/img/106234.png" alt="">
                            
                        </li>
                        <li class="slide">
                           <img src="${baseurl}/img/106967.png" alt="">
                        </li>
                        <li class="slide fix-width">
                            <img src="${baseurl}/img/106621.png" alt="">
                          
                        </li> -->
                    </ul>
               

            </div>

            
        </div>
    </div>
</section>

        </div>
       
      </div>
      
    </div>
  </div> --%>

	<%-- <div class="mega_nav">
		<div class="container">
			<div class="menu_sec">
				<!-- start header menu -->
				<ul class="megamenu skyblue">
					<!-- <li><a class="color1" href="" style="padding: 0px 15px;"><img src="${baseurl}/img/aarna-fav.png" class="img img-responsive"></a></li> -->
					<li class="active" ><a class="color1" href="dashboard">My Home</a></li>
					<li><a class="color1" href="myProfile">My Profile</a></li>
					<li><a class="color1" href="myPhotos">My Photos</a></li>
					<li><a class="color1" href="searchProfiles">Search</a></li>
					<li><a class="color1" href="#no">Matches</a></li>
					<li><a class="color1" href="memberShipPage">Upgrade</a></li>
					<li><a class="color1" href="#no">Help</a></li>
					<li><a class="color1" href="#no">Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %></a></li>
					<li><a class="color1" href="logoutHome">Logout</a></li>
				</ul> 
				<div class="clearfix"></div>
			</div>
		</div>
	</div> --%>

<!-- body starts here-->
<script>
function myFunction1(id) {
    var x = document.getElementById("myDIV");
    var replay = document.getElementById("replay");
    var sendmail = document.getElementById("sendmail");
   
       $("#"+id).hide();
       var mydiv =id.replace("reply", "");
      $("#"+mydiv+"myDIV").show();
}
function myFunction2(id) {
	 $("#"+id+"sendmail").show();
	 $("#"+id+"myDIV").hide();
}



 function removeNotification(id){
	var formData = new FormData();
    formData.append('id', id);
	$.fn.makeMultipartRequest('POST', '${baseurl }/users/removeNotification?id='+id, false, formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;//success or not check pettaledenti?
		if(msg=="delete"){
			
			var count_str = $("#matchcountId").html();
			var count_int = parseInt(count_str)-1;
			if(count_int<0){
				count_int = 0;
			}
			$("#matchcountId").html(count_int);
		
		$(".notifyDiv"+id).remove();
		alert("Notification succelufully deleted");
		}else{
			alert("Some problem occured. Please try again.");
		}
	});
} 
 

 $( document ).ready(function() {
	    $("img").on("contextmenu",function(){
	       return false;
	    }); 
	}); 

 $(".navbar-toggle").click(function(){
	 
 })

 function fullProfile(profile_id){
 	/* var roleId = ${cacheGuest.roleId};
 	$("#id").val(profile_id);
 	if(roleId==4){
 		document.searchForm2.action = "memberShipPage"
 	}else{
 		document.searchForm2.action = "fullProfile"
 	} */
 	$("#id").val(profile_id);
 	document.searchForm2.action = "fullProfile"
     document.searchForm2.target = "_blank";    // Open in a new window
     document.searchForm2.submit();             // Submit the page
     return true;
 	
 }
 function expressInterest_SidegridFullProfile(profile_id){
		var roleId = ${cacheGuest.roleId};
		$("#id").val(profile_id);
		if(roleId==4){
			document.searchForm2.action = "memberShipPage"
			document.searchForm2.submit();
			return true;
		}else{
			var membershipStatus = ${cacheGuest.membership_status};
			if(membershipStatus!="1"){
				alert("Your membership validity period is over. Renew your membership plan and get more profiles");
				return false;
			} 
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
		    				$("#expIntFullProfile"+profile_id).html('Expressed Interest');
		    				$("#mobileTD"+profile_id).html('<span style="background:url(${baseurl}/user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+profileObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>');
		    				if(typeof limit != "undefined"){
		    					if(limit=="unlimited"){
		    						allowed_limit = "1";
		    						allowed_limit = parseInt(allowed_limit);
		    					}else{
		    						allowed_limit = limit;
		    					}
		    				}
		    				
		    			}else if("failed"==msg || "exception"==msg){
		    				alert("Interest request is not successful. Please try again.");
		    			}
		    		//}
		    		/* if(profiles==""){
		    			$('#countId').html('0');
		    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
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
		    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
		    			$('#searchResults').html('');
		    			$(str).appendTo("#searchResults");
		    		}else{
		    			$('#countId').html(filtered_list.length);
		    			displayMatches(filtered_list);
		    		} */
					
				});
		}
	}
 
</script>


