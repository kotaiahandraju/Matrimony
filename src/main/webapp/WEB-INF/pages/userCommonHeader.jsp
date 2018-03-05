<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>

<html>
<head>
	<title>Aarna Matrimony</title>
	<link rel="shortcut icon" href="img/aarna-fav.png"/>
	<!-- for-mobile-apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript">
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); }
	</script>
	<!-- //for-mobile-apps -->
	<link href="user/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="user/css/style-profile.css" rel="stylesheet" type="text/css" media="all" />
	<link href="user/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" type="text/css" href="css/asPaginator.css">
	<link href="user/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/animate.min.css" />
	<link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'>
	<link href="css/thickbox.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/plugins/select2/select2.css">
	<link href="user/css/style.css" rel="stylesheet" type="text/css">
	<link href="user/css/style-profile.css" rel="stylesheet" type="text/css">
	<script src="user/js/jquery-1.11.1.min.js"></script>
	<script src="js/plugins/select2/select2.min.js"></script>
	<script src="js/jquery.watermark.js"></script>
	<script src="js/jquery.littlelightbox.js"></script>
	<link href="css/jquery.littlelightbox.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	$(function(){
		 //add text water mark;	
	  addWaterMark();
	 });
	 function addWaterMark(){
		  $('.watermark_text').watermark({
			  text: 'aarnamatrimony.com',
			  textWidth: 700,
			  textSize: 76,
			  textColor: 'white',
			  gravity: 'w',
			   opacity: 0.8,
			   //margin: 0,
			   outputWidth: 'auto',
			   outputHeight: 'auto'
			 });
	 }
		$(function(){
			$(".dropdown").hover(            
				function() {
					$('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
					$(this).toggleClass('open');
				},
				function() {
					$('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
					$(this).toggleClass('open');
			});
		});
		function zoomImage(image){
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
				  gravity: 'w',
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
		}
		
		function shortList(profileId){
			$("#id").val(profileId);
			var profileObj = serviceUnitArray[profileId];
			var formData = new FormData();
			formData.append('profile_id',profileId);
			jQuery.fn.makeMultipartRequest('POST', 'shortList', false,
					formData, false, 'text', function(data){
		    		var jsonobj = $.parseJSON(data);
		    		var msg = jsonobj.message;
		    		if(typeof msg != "undefined"){
		    			if(msg=="success"){
		    				$("#shortlistTD"+profileId).html('<a type="button" class="btn btn-primary btn-block" disabled="true"> Shortlisted</a>');
		    				//$("#shortlistTD"+profileId).removeAttr("href");
		    				//$("#shortlistTD"+profileId).attr("disabled");
		    			}else{
		    				alert("Some problem occured. Please try again.");
		    			}
		    		}
		    		
			});
	}
		
		function expressInterest(profile_id){
			var roleId = ${cacheGuest.roleId};
			$("#id").val(profile_id);
			if(roleId==4){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
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
			    				$("#expInterest"+profile_id).html('<a type="button" class="btn btn-success btn-block" disabled="true">Expressed Interest</a>');
			    				alert("Interest request has been sent successfully");
			    				//$("#expInterest"+profile_id).html('You Expressed Interest');
			    				//$("#expInterest"+profile_id).attr("disabled",true);
			    				allowed_limit = limit;
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
		
		function displayMobileNum(profileId,listType){
			var roleId = ${cacheGuest.roleId};
			$("#id").val(profileId);
			if(roleId==4){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
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
			    				$("#mobileTD"+profileId).html('<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+profileObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>');
			    				allowed_limit = limit;
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
					var firstname = 'xxxxxx',lastname='xxxxxx';
					var ageStr = orderObj.age;
					var age = ageStr.split(".")[0];
					var occName = orderObj.occupationName;
					if(occName==null)
						occName = "";
					if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
							|| (login_user_role_id == 13) || (login_user_role_id == 14)){ //means premium,premium_plus,aarna premium users
					
						firstname = orderObj.firstName;
						lastname = orderObj.lastName;
						//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
						//more_details_str = '<tr><td><span><a href="#" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
						//mobile_no__str = '<tr><td><span><a href="#" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
					}
					
					var premiumMember = "";
					var memberRoleId = orderObj.role_id;
					if(memberRoleId!=null && memberRoleId!="" && (memberRoleId==6 || memberRoleId==11 ||
							memberRoleId==12 || memberRoleId==13 || memberRoleId==14)){
						premiumMember = "<span class='premium-member' style='color:#000;text-decoration:none'>Premium Member</span>";
					}
					var shortListType = "${list_type}";
					var shortListedStr;
					if(shortListType != null && typeof shortListType != "undefined" && shortListType=="shortListedByMe"){
						shortListedStr = '';
					}else{
						shortListedStr = '<span id="shortlistTD'+orderObj.id+'"><a href="#" type="button" class="btn btn-primary" onclick="shortList('+orderObj.id+')"> Shortlist</a></span>';
						if(orderObj.short_listed == "1"){
							shortListedStr = '<span><a type="button" class="btn btn-primary" disabled="true"> Shortlisted</a></span>';
						}
					}
					var expressed = orderObj.expressedInterest;
					var interestStr = "";
					if(expressed==0){
						interestStr = '<span id="expInterest'+orderObj.id+'"><a   href="#" type="button" class="btn btn-success btn-block btn-md"  onclick="expressInterest('+orderObj.id+')">  Express Interest  </a></span>';
					}else if(expressed>0){
						interestStr = '<span><a type="button" class="btn btn-success btn-block" disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>';
					}
					var mobNumViewed = orderObj.mobileNumViewed;
					var mobile_num_Str = "";
					if(mobNumViewed==0){
						mobile_num_Str = '<span ><a href="#" type="button" class="btn btn-primary btn-block" onclick="displayMobileNum('+orderObj.id+')">View Mobile Number</a></span>';
					}else if(mobNumViewed>0){
						mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
					}
					var profession = orderObj.occupationName;
					if((profession == null) || profession == ""){
						profession = "Not Specified";
					}
					var tblRow = '<div class="row container-fluid">'
						+ '<div class="col-md-2" style="margin-right:0; padding-right:0;">'
			            + 	"<img src="+image+" class='img-responsive thumbnail' style='margin-bottom: 0px;'>"
			            + '</div>'
			            + '<div class="col-md-6">'
			            + 	'<div class="profilesimilar">'
			            + 		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
			            + 			'<tr><td><h4>'+firstname+'&nbsp;'+lastname+'</h4>&nbsp;('+orderObj.username+')&nbsp;'+premiumMember+'</td></tr>'
			            + 			'<tr><td><p>'+age+' yrs, '+orderObj.religionName+', '+orderObj.casteName+',</p></td></tr>'
			            + 			'<tr><td><p>'+orderObj.inches+'&nbsp'+occName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'.</p></td></tr>'
			            //+			mobile_no__str
			            //+ 			'<tr><td><span><a href="#" onclick="fullProfile('+orderObj.id+')">Full Profile</span> </td></tr>'
			            + 		'</table>'
			            + 	'</div>'
			            + '</div>'
			            + '<div class="col-md-3" style="margin-right:0; padding-right:0;">'
			            +  '<h4 style="margin-bottom:20px;">Like this Profile?</h4>'
			            + interestStr
			            //+ 	'<a href="#" id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</a><br><br>'
			            +   '<br>'
			            + 	'<a href="#"  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</a>'
			            //+   '<button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
			            + '</div>'
			            + '<div class="row container-fluid">'
			            + 	'<div class="col-md-7" style="margin-right:0; padding-right:0;">'
			            +		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
			            + 			'<tr>'
			            //+				'<td><button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button></td>'
			            //+ 				'<td>&nbsp;</td><td><button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>'
			            //+				'<td><a href="#" onclick="fullProfile('+orderObj.id+')">View Full Profile</a></td>'
			            + 				'<td id="mobileTD'+orderObj.id+'">'+mobile_num_Str+'</td>'
			            +				'<td></td>'
			            + 				'<td id="shortlistTD'+orderObj.id+'">'+shortListedStr+'</td></tr>'
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
		
		function displayMatches_matches(listOrders) {
			$('#searchResults').html('');
			$("#search_criteria").prop("hidden",true);
			$('#searchresultsDiv').removeAttr("hidden");
			serviceUnitArray = {};
			$.each(listOrders,function(i, orderObj) 
			{
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
					var insert_str = '';
					var mobile_no__str = '';
					var more_details_str = '';
					var expressed = orderObj.expressedInterest;
					var firstname = 'xxxxxx',lastname='xxxxxx';
					//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><a href="#" type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</a></td></tr>';
					//insert_str = '<a href="#" id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</a>';
					/* if(expressed==0){
						insert_str = '<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button>';
					}else if(expressed>0){
						insert_str = '<button class="btn btn-primary btn-block">Expressed Interest</button>';
					} */
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
					var shortListedStr = '<span id="shortlistTD'+orderObj.id+'"><a href="#" type="button" class="btn btn-primary btn-block" onclick="shortList('+orderObj.id+')"> Shortlist</a></span>';
					if(orderObj.short_listed == "1"){
						shortListedStr = '<span><a type="button" class="btn btn-primary btn-block" disabled="true"> Shortlisted</a></span>';
					}
					var expressed = orderObj.expressedInterest;
					var interestStr = "";
					if(expressed==0){
						interestStr = '<span id="expInterest'+orderObj.id+'"><a   href="#" type="button" class="btn btn-success btn-block btn-md"  onclick="expressInterest('+orderObj.id+')">  Express Interest  </a></span>';
					}else if(expressed>0){
						interestStr = '<span><a type="button" class="btn btn-success btn-block" disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>';
					}
					var mobNumViewed = orderObj.mobileNumViewed;
					var mobile_num_Str = "";
					if(mobNumViewed==0){
						mobile_num_Str = '<span ><a href="#" type="button" class="btn btn-primary btn-block" onclick="displayMobileNum('+orderObj.id+')">View Mobile Number</a></span>';
					}else if(mobNumViewed>0){
						mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
					}
					var profession = orderObj.occupationName;
					if((profession == null) || profession == ""){
						profession = "Not Specified";
					}
					var tblRow = '<div class="panel panel-default">'
						+ '<div class="panel-heading">'
						+ '<h5 class="panel-title">'
						+ '<div class="form-check">'

						+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+firstname+' '+lastname+'&nbsp;('+orderObj.username+')&nbsp;'+premiumMember+'</label>'
						+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'
						//+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+orderObj.firstName+' '+orderObj.lastName+'</label>'
//		 				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'

						+ '</div>'
						+ '</h5>'
						+ '</div>'
						+ '<div class="panel-body">'
						+ '<div class="col-md-3">'
						+ '<a href="#"> <img src='+image+' class="img img-responsive thumbnail" style="margin-bottom:0;"></a>'
		            	+ '</div>'
		            	+ '<div class="col-md-4"  style="overflow-y:scroll;max-height: 300px">'
		                + '<blockquote><p>'+abtMySelf+'</p></blockquote>'
		                + '</div>'
		            	+ '<div class="col-md-5">'
		            	+ '<table>'
		            	+ '	<tr><td>Age/Height</td><td><span>: '+orderObj.age+' yrs, '+orderObj.inches+'</span></td></tr>'
		            	+ '	<tr><td>Religion</td><td><span>: '+orderObj.religionName+'</span></td></tr>'
		            	+ '	<tr><td>Mother Tongue</td><td><span>: '+orderObj.motherTongueName+'</span></td></tr>'
		            	+ '	<tr><td>Community</td><td><span>: '+orderObj.casteName+'</span></td></tr>'
		            	+ '	<tr><td>Location</td><td><span>: '+orderObj.currentCityName+'</span></td></tr>'
		            	+ '	<tr><td>Education</td><td><span>: '+orderObj.educationName+'</span></td></tr>'
		            	+ '	<tr><td>Profession</td><td><span>: '+profession+'</span></td></tr>'
		            	+ '<tr><td id="mobileTD'+orderObj.id+'">'
		            	+ mobile_num_Str
		            	+'</td></tr>'
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
		            	+ '<div class="col-md-3">'
		            	+ '<a href="#" type="button" class="btn btn-success btn-block btn-md" onclick="fullProfile('+orderObj.id+')">View Full Profile</a>'
		            	+ '</div>'
		            	+ '<div class="col-md-3">'
		            	+ '<a href="#" type="button" class="btn btn-primary btn-block btn-md" id="sendMail'+orderObj.id+'" onclick="displayMailPopup('+orderObj.id+')">Send Mail</a>'
		            	+ '</div>'
		            	+ '<div class="col-md-3">'
		            	+ interestStr
		            	+ '</div>'
		            	//+ '<span id="expInterest'+orderObj.id+'"><a href="#" type="button" class="btn btn-primary btn-block btn-md"  onclick="expressInterest('+orderObj.id+')">Send Interest</a></span>'
		            	+ '<div class="col-md-3">'
		               //+ '<c:if test="${(cacheGuest.roleId == 6)}">'
		            	//+ insert_str
						//+ '</c:if>	 '
						//+ '<span id="shortlistTD'+orderObj.id+'"><a href="#" class="btn btn-danger btn-block btn-md" onclick="shortList('+orderObj.id+')">Short List</span></a>'
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
						var shortListedStr = '<span id="shortlistTD'+orderObj.id+'"><a href="#" type="button" class="btn btn-primary btn-block" onclick="shortList('+orderObj.id+')"> Shortlist</a></span>';
						if(orderObj.short_listed == "1"){
							shortListedStr = '<span><a type="button" class="btn btn-primary btn-block" disabled="true"> Shortlisted</a></span>';
						}
						var expressed = orderObj.expressedInterest;
						var interestStr = "";
						if(expressed==0){
							interestStr = '<span id="expInterest'+orderObj.id+'"><a   href="#" type="button" class="btn btn-success btn-block btn-md"  onclick="expressInterest('+orderObj.id+')">  Express Interest  </a></span>';
						}else if(expressed>0){
							interestStr = '<span><a type="button" class="btn btn-success btn-block" disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>';
						}
						var mobNumViewed = orderObj.mobileNumViewed;
						var mobile_num_Str = "";
						if(mobNumViewed==0){
							mobile_num_Str = '<span id="mobileTD'+orderObj.id+'"><a href="#" type="button" class="btn btn-primary btn-block" onclick="displayMobileNum('+orderObj.id+')">View Mobile Number</a></span>';
						}else if(mobNumViewed>0){
							mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
						}
						var profession = orderObj.occupationName;
						if((profession == null) || profession == ""){
							profession = "Not Specified";
						}
						var acceptOptions = '';
						if(listType == "pending_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum_messages('+orderObj.id+',\'preferences\,'+orderObj.requestId+')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
							acceptOptions = "<span id='accept"+orderObj.requestId+"'><a type='button' class='btn btn-primary btn-block' onclick='acceptRequest("+orderObj.requestId+",\"1\")'>Accept</a><a type='button' class='btn btn-danger btn-block' id='reject"+orderObj.requestId+"' href='#' onclick='acceptRequest("+orderObj.requestId+", \"0\")'>Ignore</a></span><br>";
							
						}else if(listType == "accepted_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn1 btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
						}else if(listType == "rejected_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br>'
				            	+ mobile_num_Str
				            	//+ '<button class="btn1 btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
						}else if(listType == "sent_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum_messages('+orderObj.id+',\'preferences\,'+orderObj.requestId+')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
							interestStr = '';
						}else if(listType == "awaiting_requests"){
							interestStr = '';
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br>'
				            	+ mobile_num_Str
				            	+ shortListedStr
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
				           //acceptOptions = "<tr><td title=''><div id='accept"+orderObj.requestId+"'><a href='#' onclick='acceptRequest("+orderObj.requestId+",\"1\")'>Accept</a>&nbsp;|&nbsp;<a id='reject"+orderObj.requestId+"' href='#' onclick='rejectRequest("+orderObj.requestId+" \"0\")'>Reject</a></td><tr>";
						}else if(listType == "myProfileViews"){
							options =  '<div class="col-md-3">'
				            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
				            	+ mobile_num_Str
				            	//+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
				            	+ '<div class="clearfix"></div>'
				            	+ '</div>';
						} 
					//}
					
					
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
							+ '<div class="col-md-2">'
							+ '<a href="#"> <img src='+image+' class="img img-responsive thumbnail watermark_text" style="margin-bottom:0;height: 60px;width: 60px;"></a>'
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
			            	+ interestStr
							//+ '<button class="btn btn-danger btn-block btn-md" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br><br><br><br><br>'
							+ '<a href="#" class="btn btn-primary btn-block btn-md" onclick="fullProfile('+orderObj.id+')">View Full Profile</a><br>'
							+ acceptOptions
							+ shortListedStr
							//+ '<span id="shortlistTD"><a href="#" type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="shortList('+orderObj.id+')">Shortlist</a></span> '
							+ '<div class="clearfix"></div>'
			            	+ '</div>'
			            	+ '</div>'
			            	+ '</div>';
					$(tblRow).appendTo("#"+divId);
				}
			});
		}
		
		function displayMobileNum_messages(profileId,listType,requestId){
			var roleId = ${cacheGuest.roleId};
			$("#id").val(profileId);
			if(roleId==4){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
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
			    				$("#mobileTD"+requestId).html('<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+profileObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>');
			    				allowed_limit = limit;
			    			}else{
			    				alert("Some problem occured. Please try again.");
			    			}
			    		}
			    		
				});
			}
			
		}
		
		function displayMailPopup(profile_id){
			var roleId = ${cacheGuest.roleId};
			$("#profile_id").val(profile_id);
			if(roleId==4 || roleId==12 || roleId==13){
				document.searchForm2.action = "memberShipPage"
				document.searchForm2.submit();
				return true;
			}else{
				$('#myModal').modal();
				
			}
		}

		function sendMail(){
			
			var content = $("#mail_content").val();
			if(content.trim() == ""){
				alert("Please enter some content");
				return false;
			}
			$("#sendMailBtn").prop("disabled",true);
			$("#sendMailBtn").val("Please wait...");
			 var formData = new FormData();
			 formData.append("profile_id",$("#profile_id").val());
			 formData.append("mail_content",content);
			 
			 $.fn.makeMultipartRequest('POST', 'sendMail', false,
						formData, false, 'text', function(data){
					var jsonobj = $.parseJSON(data);
					var msg = jsonobj.message;
					if(msg != null && typeof msg != "undefined"){
						if(msg == "success"){
							alert("E-Mail has been sent successfully.");
							$("#myModal").dialog("close");
						}else{
							alert("failed");
						}
					}
					$("#sendMailBtn").removeAttr("disabled");
					$("#sendMailBtn").val("Send Mail");
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
				var formData = new FormData();
			
				formData.append("requestId",requestId);
				formData.append("accept_flag",flag);
				
				jQuery.fn.makeMultipartRequest('POST', 'acceptRequest', false,
						formData, false, 'text', function(data){
			    		var jsonobj = $.parseJSON(data);
			    		var msg = jsonobj.message;
			    		
			    			if("success"==msg){
			    				if(flag==1){
			    					alert("Request accepted successfully");
			    					$("#accept"+requestId).html('');
			    					$("#accept"+requestId).html("<a type='button' class='btn btn-primary btn-block' disabled='true'>Accepted</a>");
			    				}else{
			    					alert("Request rejected successfully");
			    					$("#accept"+requestId).html('');
			    					$("#accept"+requestId).html("<a type='button' class='btn btn-danger btn-block' disabled='true'>Ignored</a>");
			    				}
			    			}else if("failed"==msg || "exception"==msg){
			    				alert("Some problem occured. Please try again.");
			    			}
			    		
			    		
						
					});
			}
		}

	</script>
	
	<script type="text/javascript" src="js/ajax.js"></script>
	<script type="text/javascript" src="js/jquery-asPaginator.js"></script>
	<script src="js/jquery.watermark.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
<style type="text/css">
.animated.infinite{animation-iteration-count:infinite}
.upgradeOption {
    color: #f35626;
    background-image: -webkit-linear-gradient(2deg, #f35626, red);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    -webkit-animation: hue 2s infinite linear;
}
.multiSelect{
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
#matchcount {
background-color: red;
color: #ffffff;
padding: 2px 4px;
font-size: 11px;
border: none;
cursor: pointer;
border-radius: 5px;
vertical-align: top;
margin:2px 2px;
}
.premium-member {
background-color: #8bb2e2;
color: #000;
padding: 2px 4px;
font-size: 11px;
border: none;
cursor: pointer;
border-radius: 5px;
vertical-align: top;
margin:2px 2px;
}
@-webkit-keyframes hue {
  from {
    -webkit-filter: hue-rotate(0deg);
  }

  to {
    -webkit-filter: hue-rotate(-360deg);
  }
}
@keyframes flash{0%,50%,to{opacity:1}25%,75%{opacity:0}}.flash{animation-name:flash}
	/* carousel */
.media-carousel 
{
  margin-bottom: 0;
  padding: 0 40px 30px 40px;
  margin-top: 30px;
}
/* Previous button  */
.media-carousel .carousel-control.left 
{
  left: -12px;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px 23px 23px 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px
}
/* Next button  */
.media-carousel .carousel-control.right 
{
  right: -12px !important;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px 23px 23px 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px
}
p{letter-spacing:1px;}
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
.media-carousel .carousel-indicators 
{
  right: 50%;
  top: auto;
  bottom: 0px;
  margin-right: -19px;
}
/* Changes the colour of the indicators */
.media-carousel .carousel-indicators li 
{
  background: #c0c0c0;
}
.media-carousel .carousel-indicators .active 
{
  background: #333333;
}
.media-carousel img
{
  width: 250px;
  height: 100px
}
.img-replace {
  /* replace text with an image */
  display: inline-block;
  overflow: hidden;
  text-indent: 100%; 
  color: transparent;
  white-space: nowrap;
}
.edit-style{
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
height: 23px;
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
font-size:18px;}
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
   -moz-box-shadow:    inset 0 0 10px #006699;
   -webkit-box-shadow: inset 0 0 10px #006699;
   box-shadow:         inset 0 0 10px #006699;
}
.cd-popup-container  {
  padding: 3em 1em;
  
}
.cd-popup-container p {
  text-align:left;
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
.cd-popup-container .cd-popup-close::before, .cd-popup-container .cd-popup-close::after {
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
#thumbs-wrapper, #viewer-wrapper, #setup-wrapper { padding: 15px; }

/*  #thumbs-wrapper,  #setup-wrapper,  #thumbs-nav { }*/

#viewer-wrapper { height: 300px; }

#gallery-viewer { height: 100%; }

#gallery-viewer img {
  max-width: 100%;
  max-height: 100%;
}

#viewer-nav, #thumbs-nav { height: 0px; }

#viewer-nav { margin-top: 2px; }

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

#gallery-next, #gallery-viewer-next, #gallery-prev, #gallery-viewer-prev {
  text-indent: -9999px;
  margin: 6.5px 25px;
  height: 17px;
  width: 16px;
  background-image: url('images/spt_arrows.png');
  background-repeat: no-repeat;
}

#gallery-next, #gallery-viewer-next {
  background-position: -16px 0;
  float: right;
}

#gallery-prev, #gallery-viewer-prev { float: left; }

.thumbnail {
  float: left;
  width: 80px;
  height: 75px;
  padding:0px;
  margin:5px
}

</style>
</head>
<body style="background: #F1F1F2;">
<%@ page import="com.aurospaces.neighbourhood.bean.UsersBean"%>
<%
	UsersBean userBean = null;
	if(session.getAttribute("cacheGuest") != null){
		userBean= (UsersBean)session.getAttribute("cacheGuest");
		String otpStatus = userBean.getOtpStatus();
		if(org.apache.commons.lang.StringUtils.isBlank(otpStatus) || "0".equals(otpStatus)){
%>			
			
<%			
		}
	}
%>
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<div class="header_top">
	<div class="container" style="background: #FFF;">
    	<div class="col-md-3">
			<div class="logo">
				<img src="user/images/logo1.jpg" class="img img-responsive">
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="col-md-4">
			<!-- <ul class="nav navbar-nav">
				<li><a href="#">Matches<span class="badge badge-notify">30</span></a></li>
				<li><a href="#">Search</a></li>
				<li><a href="#">Inbox<span class="badge badge-notify">30</span></a></li>
			</ul> -->
			<div class="box_1 midfont">
				<p><a href="#">Matches</a><span class="badge badge-notify">0</span>&nbsp;&nbsp;&nbsp;
        		<a href="searchProfiles">Search</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       			<a href="#">Inbox</a><span class="badge badge-notify">0</span></p>
			</div>
		</div>
		<div class="col-md-5">
			<div class="cart box_1">
				<p>Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %> | &nbsp;&nbsp;<a class="upgradeOption animated flash infinite" href="memberShipPage" style="color: red;">Upgrade</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="#" >Help</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="logoutHome" >Signout</a></p>
				<div class="clearfix"> </div>
			</div>				 
		</div>
	</div>

	<div class="container">
		<div class="row">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="container-fluid">
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
								<a href="dashboard">My Home</a>
								<ul class="dropdown-menu">
									<!-- <li><a href="dashboard">My Home</a></li> -->
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
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Search</a>
								<ul class="dropdown-menu">
									<li><a href="searchProfiles">Regular search</a></li>
									<li><a href="searchById">Search by ID </a></li>
									<li><a href="#">Recently viewed profiles</a></li>
								</ul>
							</li>
							<li class="dropdown matches">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Matches <span id="matchcount">${cacheGuest.yetToBeViewedCount}</span></a>
								<ul class="dropdown-menu">
									<li><a href="newMatches">New Matches</a></li>
									<li><a href="yetToBeViewed">Yet to be viewed(${cacheGuest.yetToBeViewedCount}) </a></li>
									<li><a href="viewedNotContacted">Viewed & not contacted(${cacheGuest.viewedNotContactedCount})</a></li>
									<li><a href="shortListedByMe">Shortlisted Matches</a></li>
									<li><a href="#">Premium Members</a></li>
								</ul>
							</li>
							<li class="dropdown messages">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Messages <span id="matchcount">${cacheGuest.pendingRequestsCount}</span></a>
								<ul class="dropdown-menu">
									<li><a href="inboxAction?tab_type=inbox&list_type=pending_requests">Inbox - pending ${cacheGuest.pendingRequestsCount}</a></li>
									<li><a href="inboxAction?tab_type=inbox&list_type=accepted_requests" >Inbox - Accepted </a></li>
									<li><a href="inboxAction?tab_type=sent&list_type=sent_requests" >Sent All</a></li>
									<!-- <li><a href="#">SMS received/sent</a></li> -->
								</ul>
							</li>
							<li class="dropdown upgrade">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Upgrade</a>
								<ul class="dropdown-menu">
									<li><a href="memberShipPage">Payment Options</a></li>
									<li><a href="#">Profile Highliter </a></li>
								</ul>
							</li>
							
							<li class="dropdown notifications">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Notifications <span id="matchcount">${notificationsCount}</span></a>
								<ul class="dropdown-menu">
									<li><a href="myProfileViewsList">(${cacheGuest.profileViewedCount})members viewed your profile</a></li>
									<li><a href="myMobileNoViewsList">(${cacheGuest.mobileNumViewedCount})members viewed your mobile number </a></li>
									<li><a href="#">Received interest from (${cacheGuest.receivedInterestCount})  members</a></li>
									<li><a href="shortListedMe">(${cacheGuest.shortListedCount}) members shortlisted your profile</a></li>
								</ul>
							</li>
						</ul>
	        		</div>
	        		<!-- /.navbar-collapse -->
	      		</div>
	      		<!-- /.container-fluid -->
	    	</nav>
		</div>
	</div>
</div>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background: yellowgreen; border-radius: 6px;">
          <button type="button" class="close" data-dismiss="modal" style="margin-top: 0px;margin-right: 9px; font-size: 28px;color: black;">&times;</button>
          <h4 class="modal-title" style="color: aliceblue;padding-bottom: 5px; padding-left: 44px; font-size: 24px;">Mail Content</h4>
        </div>
        <div class="modal-body">
        	<input type="hidden" name="profile_id" id="profile_id">
         	<textarea id="mail_content" name="mail_content" cols="70" rows="10" style="margin: 0px 0px 0px 29px;" ></textarea><br><div class="clearfix"></div>
          	
        </div>
        <div class="modal-footer">
          <button type="button" id="sendMailBtn" onclick="sendMail()" class="btn btn-primary" >Send Mail</button>
        </div>
      </div>
      
    </div>
</div>	

	<%-- <div class="mega_nav">
		<div class="container">
			<div class="menu_sec">
				<!-- start header menu -->
				<ul class="megamenu skyblue">
					<!-- <li><a class="color1" href="" style="padding: 0px 15px;"><img src="img/aarna-fav.png" class="img img-responsive"></a></li> -->
					<li class="active" ><a class="color1" href="dashboard">My Home</a></li>
					<li><a class="color1" href="myProfile">My Profile</a></li>
					<li><a class="color1" href="myPhotos">My Photos</a></li>
					<li><a class="color1" href="searchProfiles">Search</a></li>
					<li><a class="color1" href="#">Matches</a></li>
					<li><a class="color1" href="memberShipPage">Upgrade</a></li>
					<li><a class="color1" href="#">Help</a></li>
					<li><a class="color1" href="#">Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %></a></li>
					<li><a class="color1" href="logoutHome">Logout</a></li>
				</ul> 
				<div class="clearfix"></div>
			</div>
		</div>
	</div> --%>

<!-- body starts here-->