<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<%@page import="com.aurospaces.neighbourhood.bean.UsersBean"%>
<html>
<head>
<title>View Profiles</title>
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
<script src="${baseurl}/user/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling -->
<!-- <script type="text/javascript" src="${baseurl}/user/js/move-top.js"></script>
<script type="text/javascript" src="${baseurl}/user/js/easing.js"></script>
<script type="text/javascript" src="${baseurl}/user/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script src="${baseurl}/user/js/menu_jquery.js"></script>
<link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'> -->
<!-- the jScrollPane script -->
<!-- <script type="text/javascript" src="${baseurl}/js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script> -->
<!-- //the jScrollPane script -->
<style>
.watermarkcontent2_profilepic {
  position: absolute; /* Position the background text */
  top: -15px; /* At the bottom. Use top:0 to append it to the top */
  //background: rgb(0, 0, 0); /* Fallback color */
  //background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: white; /* Grey text */
  width: 100%; /* Full width */
  padding-left: 30px; /* Some padding */
  transform: rotate(90deg);
//transform-origin: left top 0;
width : 0;
}
.watermarkcontent2_profilepic span{
opacity : 0.6;
font-size : 13px;
}
.watermarkcontent3_profilepic {
  position: absolute; /* Position the background text */
  top: -15px; /* At the bottom. Use top:0 to append it to the top */
  //background: rgb(0, 0, 0); /* Fallback color */
  //background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: white; /* Grey text */
  width: 100%; /* Full width */
  padding-left: 30px; /* Some padding */
  transform: rotate(90deg);
//transform-origin: left top 0;
width : 0;
}
.watermarkcontent3_profilepic span{
opacity : 0.6;
font-size : 16px;
}
@media only screen and (max-width: 640px) and (min-width: 320px) {
.container .col-md-12 {
padding:0px !important;
}
.container  {
padding:5px !important;
}
.panel-body {
padding:0px !important;}
}</style>
</head>
	
<body>

<!-- top-header -->

<!-- top-header -->
<!-- logo-cart -->

<!-- products -->
	<div class="products">
		<div class="container">
			<div class="col-md-12 products-grid-left" style="margin-top:10px;">
					
	            <div class="panel panel-success">
	             <div class="panel-heading pull-right">
	             <c:set value="${photosList[0]}" var="photoFirstObj"/>
	             <span class=""><input type="checkbox" id="selectAllCheackbox"/> Select All &nbsp; <a  onclick="requetAllCheckboxApprov(1,${photoFirstObj.photo1.user_id});" href="#" style="text-decoration:none;">Approve &nbsp; </a></span>
				 <span class=""><a id="reject${photo1.id}" onclick="requetAllCheckboxApprov(2,${photo1.user_id});" href="#" style="text-decoration:none;">Reject </a></span>
	            </div><div class="clearfix"></div>
		            <div class="panel-body">
		            	<div id="imagesDiv" class="row" style="margin-bottom: 0.4em;">
					      	<c:forEach items="${photosList}" var="photo1" >
					      		<c:set var="uId" value="${photo1.user_id}" scope="page" />
					      		<div class="col-md-2">
					      			<img src="${catalina_base}/${photo1.image}" class="img-responsive thumbnail " style="margin-bottom:0;"><div class="watermarkcontent2_profilepic">
										<span>aarnamatrimony.com</span>
									</div>
					      			<c:if test="${photo1.approved_status == '1'}">
										<span>Approved</span>
										
									</c:if>
									<c:if test="${photo1.approved_status == '2'}">
										<span>Rejected</span>
									</c:if>
									<c:if test="${photo1.approved_status == '0'}">
										<div id="approveDiv${photo1.id}">
										<input type="checkbox" class="check-box" id="${photo1.id}" value="${photo1.id}" />
											<a id="approve${photo1.id}" href="#" onclick="approvePhoto(${photo1.id},1,${photo1.user_id})" >Approve</a>
											<a id="reject${photo1.id}" href="#" style="padding-left:5px;" onclick="approvePhoto(${photo1.id},2,${photo1.user_id})">Reject</a>
										</div>
									</c:if>
					      			
					      		</div>
					      		
							</c:forEach>
												    </div>
						<div class="col-md-3">
							 <c:if test="${not empty profileBean.profileImage}">
								<img id="profImage" src="${catalina_base}/${profileBean.profileImage}" class="img-responsive thumbnail " style="margin-bottom:0;">
							<div class="watermarkcontent3_profilepic">
										<span>aarnamatrimony.com</span>
									</div>
							</c:if>
							<c:if test="${empty profileBean.profileImage}">
								<img src="${baseurl }/img/default.png" class="img-responsive thumbnail" style="margin-bottom:0;">
							</c:if> 
							<c:forEach items="${photosList}" var="photo" >
					      		
					      			<a href="#" onclick="displayImage('${catalina_base}/${photo.image}')"><b>O</b></a>
					      		
							</c:forEach><br>
							<label><b>${profileBean.username}</b></label>
		            	</div>
		            	<div class="col-md-9 well">
			            	<table>
			            		<tr><th>Name</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.firstName}</span></td></tr>
			            		<tr><th>SurName</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.lastName} </span></td></tr>
			            		<tr><th>Gender</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.gender} </span></td></tr>
			            		<tr><th>Date of Birth</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.dob} </span></td></tr>
			            		<tr><th>Caste</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.casteName} </span></td></tr>
			            		<tr><th>Religion</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.religionName}</span></td></tr>
			            		<tr><th>Marital Status</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.maritalStatus}</span></td></tr>
			            		<tr><th>Education</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.educationName} </span></td></tr>
			            		<tr><th>Profession</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.occupationName}</span></td></tr>
			            		<tr><th>Working with</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.workingWith}</span></td></tr>
			            		<tr><th>Annual Income</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.annualIncome}</span></td></tr>
			            		<tr><th>City</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.currentCityName} </span></td></tr>
			            		<tr><th>State</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.currentStateName} </span></td></tr>
			            		<tr><th>Country</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.currentCountryName} </span></td></tr>
			            		
			            		
			            		<tr><th>Mothertongue</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.motherTongueName} </span></td></tr>
			            		<tr><th>E-mail</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.email} </span></td></tr>
			            		<tr><th>Gotram</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.gotram} </span></td></tr>
			            		<tr><th>Nakshatram</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.starName} </span></td></tr>
			            		<tr><th>Dosham</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.dosam} </span></td></tr>
			            		<tr><th>Dosham Name</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.dosamName} </span></td></tr>
			            		<tr><th>Diet</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.diet} </span></td></tr>
			            		<tr><th>Smoking</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.smoking} </span></td></tr>
			            		<tr><th>Drinking</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.drinking} </span></td></tr>
			            		<tr><th>Height</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.heightInches} </span></td></tr>
			            		<tr><th>Body Type</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.bodyTypeName} </span></td></tr>
			            		<tr><th>Complexion</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.complexionName} </span></td></tr>
			            		<tr><th>Disability</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.disability} </span></td></tr>
			            		
			            		<tr><th>Father's Name</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.fatherName} </span></td></tr>
			            		<tr><th>Father's Occupation</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.fOccupation} </span></td></tr>
			            		<tr><th>Mother's Name</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.motherName} </span></td></tr>
			            		<tr><th>Mother's Occupation</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.mOccupation} </span></td></tr>
			            		<tr><th>No.of Brothers</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.noOfBrothers} </span></td></tr>
			            		<tr><th>Brothers Married</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.noOfBrothersMarried} </span></td></tr>
			            		<tr><th>No.of Sisters</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.noOfSisters} </span></td></tr>
			            		<tr><th>Sisters Married</th><th>:</th><td style="text-align: left;padding-left: 10px;"><span>${profileBean.noOfSistersMarried} </span></td></tr>
			            	</table>
		            	</div>
		         	</div>
	            </div>
				</div>
		</div>
				<div class="clearfix"></div>
	</div>

<script src="${baseurl }/js/ajax.js"></script>
<script src="${baseurl }/js/jquery.watermark.js"></script>
<script type="text/javascript">

$("#selectAllCheackbox").on("click", function() {
	
	if ($(this).prop("checked")==true) {
    $('.check-box').prop('checked', true);
  } else {
    $('.check-box').prop('checked', false);
  }
}); 

/* $("#selectAllCheackbox1").on("click", function() {
	
	 if ($(this).prop("checked")==true) {
        $('.check-box').prop('checked', true);
}else {
  $('.check-box').prop('checked', false);
}
});


// if($("#selectAllCheackbox").prop("checked",checked)){
// 	$("#selectAllCheackbox1").prop("checked",false);
// }else{
// 	$("#selectAllCheackbox1").prop("checked",true);
// }
 */	
	
function requetAllCheckboxApprov(approvedStatus,user_id){
	var selected_boxes = $('.check-box:checked');
			var selected_boxes_length = selected_boxes.length;
			if (selected_boxes_length == 0) {
				alert("Please select atleast one profile.");
				return false;
			}
			
			profile_id = [];  
			
// 				$('.form-check-input[type="checkbox"]:checked').each(function(){
					$('.check-box:checked').each(function(){
					var res = this.value;
					profile_id.push(res);
			     });
		 var formData = new FormData();
		 formData.append('photoId',profile_id);
		 formData.append("approvedStatus",approvedStatus);
		 formData.append("user_id","${uId}"); 
  	 jQuery.fn.makeMultipartRequest('POST', 'approvePhotoAll', false,
			formData, false, 'text', function(data){
  		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		if(typeof msg != "undefined"){
			if(msg=="success"){
				if(approvedStatus==1){
					alert("Photo approved successfully");
					//$("#approve"+photoId).removeAttr("href");
					//var t = $("#approve"+photoId).text();
					$('.check-box:checked').each(function(){
					$("#approveDiv"+this.value).html('');
					$("#approveDiv"+this.value).html("Approved");
			    });
				}else{
					$('.check-box:checked').each(function(){
					$("#approveDiv"+this.value).html('');
					$("#approveDiv"+this.value).html("Rejected");
					});
					alert("Photo rejected successfully");
				}
				var pending_count = jsonobj.approval_pending_count;
				if(pending_count==0){
					var existing_count = $("#updated_cnt").html();
					var new_count = parseInt(existing_count)-1;
					$("#updated_cnt").html(new_count);
				}
			}else{
				alert("Some problem occured. Please try again.");
			}
		}
	    		
	        });  
	  }
  	 
  	 


$(function(){
	 //add text water mark;	
	 $('.watermark_text').watermark({
	  text: 'aarnamatrimony.com',
	  textWidth: 500,
	  textSize: 70,
	  textColor: 'white',
	  gravity: 'n',
	   opacity: 0.7,
	   margin: 5,
	   outputWidth: 'auto',
	   outputHeight: 'auto'
	 });
	 });

function displayMobileNum(profileId,listType){
	 var profileObj = serviceUnitArray[profileId];
	var formData = new FormData();
	formData.append('profile_id',profileId);
	formData.append('list_type',listType);
	jQuery.fn.makeMultipartRequest('POST', 'viewedMobileNumber', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var msg = jsonobj.message;
    		if(typeof msg != "undefined"){
    			if(msg=="success"){
    				$("#row"+profileId).html('<td>'+profileObj.mobile+'</td>');
    			}else{
    				alert("Some problem occured. Please try again.");
    			}
    		}
    		
	}); 
	
}

function displayImage(imageName){
	$("#profImage").prop("src",imageName);
}
function approvePhoto(photoId,approvedStatus,user_id){
	var formData = new FormData();
	formData.append("photoId",photoId);
	formData.append("approvedStatus",approvedStatus);
	formData.append("user_id",user_id);
	$.fn.makeMultipartRequest('POST', 'approvePhoto', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		if(typeof msg != "undefined"){
			if(msg=="success"){
				//photoId=[];
				if(approvedStatus==1){
					alert("Photo approved successfully");
					//$("#approve"+photoId).removeAttr("href");
					//var t = $("#approve"+photoId).text();
					$("#approveDiv"+photoId).html('');
					$("#approveDiv"+photoId).html("Approved");
				}else{
					$("#approveDiv"+photoId).html('');
					$("#approveDiv"+photoId).html("Rejected");
					alert("Photo rejected successfully");
				}
				var pending_count = jsonobj.approval_pending_count;
				if(pending_count==0){
					var existing_count = $("#updated_cnt").html();
					var new_count = parseInt(existing_count)-1;
					$("#updated_cnt").html(new_count);
				}
			}else{
				alert("Some problem occured. Please try again.");
			}
		}
		
	}); 
}

</script>

</body>
</html>