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
<script src="user/js/jquery-1.11.1.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling -->
<!-- <script type="text/javascript" src="user/js/move-top.js"></script>
<script type="text/javascript" src="user/js/easing.js"></script>
<script type="text/javascript" src="user/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script src="user/js/menu_jquery.js"></script>
<link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'> -->
<!-- the jScrollPane script -->
<!-- <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script> -->
<!-- //the jScrollPane script -->
</head>
	
<body>
<%
UsersBean userBean = null;
if(session.getAttribute("cacheGuest") != null){
	userBean= (UsersBean)session.getAttribute("cacheGuest");
}
%>
<!-- top-header -->

<!-- top-header -->
<!-- logo-cart -->
<div class="header_top">
	<div class="container">
    <div class=" col-md-3">
		<div class="logo">
		 	<img src="user/images/logo1.jpg" class="img-responsive" >
	  </div>
      <div class="clearfix"></div>
      </div>
      
      <div class="col-md-4 ">
      <div class=" box_1 midfont">
		<p> <a href="#">Matches</a>  <span class="badge badge-notify">30</span>&nbsp;&nbsp;&nbsp;
        <a href="#">Search</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <a href="#">Inbox</a>  <span class="badge badge-notify">30</span></p>
        
        </div>      
      </div>
      
		<div class="col-md-5">
			<div class="cart box_1">
				<p>Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %> | &nbsp;&nbsp;<a href="paymentDetails" >Upgrade</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="#" >Help</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="logoutHome" >Signout</a></p>
				<div class="clearfix"> </div>
			</div>				 
		</div>
        
        
        
	</div>
</div>
<!-- //logo-cart -->
<!------>
<div class="top_bg">
	
</div>
<div class="mega_nav">
	 <div class="container">
		 <div class="menu_sec">
		 <!-- start header menu -->
		<ul class="megamenu skyblue">
			<li><a class="color1" href="dashboard">Dashboard</a></li>
			<li><a class="color1" href="myProfile">My Profile</a></li>
            <li class="active"><a class="color1" href="myPhotos">My Photos</a></li>
            <li><a class="color1" href="searchProfiles">Search</a></li>
             <li><a class="color1" href="#">More</a></li>
		</ul> 
			<div class="clearfix"></div>
		 </div>
	  </div>
</div>
<!---->
<!-- products -->
	<div class="products">
		<div class="container">
			<div class="mid-grids">
            <div class="col-md-12">
            <h4>Hello <%= userBean.getFirstName() %>. <%= userBean.getLastName() %><span>(<%= userBean.getUsername() %>)</span></h4>
            </div>   
            
				<div class="col-md-3 products-grid-right">
					<div class="well">
                    <div class="row">
					<div class="col-md-5 ">
						<c:if test="${not empty cacheGuest.profileImage}">
							<img id="profilepic" src="${cacheGuest.profileImage}" class="img-responsive thumbnail" style="margin-bottom:0;">
						</c:if>
						<c:if test="${empty cacheGuest.profileImage}">
							<img id="profilepic" src="img/default.png" class="img-responsive thumbnail" style="margin-bottom:0;">
						</c:if>
                      
                      </div>	
                      
                      <div class="col-md-7" style="padding-left:0;" >
                      <div class="profiletable">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="EditUserProfile">Edit Profile</a></td>
  </tr>
   <tr>
    <td><a href="#">Manage Profile</a></td>
  </tr>
  <tr>
    <td><a href="#">Edit Preferrences</a></td>
  </tr>
  <tr>
    <td><a href="#">Privacy Options</a></td>
  </tr>
</table>
						</div>
                      </div>
                      
                      
                      
                    <div class="clearfix"></div>
                    </div>
                    </div>
                    
                    
                  <div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Inbox
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="#">Invitations</a></td>
    <td><div class="badge pull-right">${cacheGuest.receivedInterestCount}</div></td>
  </tr>
</table>

				</div>
				
			</div>  
            
            
            <div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Accepted
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="#">Members</a></td>
    <td><div class="badge pull-right">${cacheGuest.acceptedInterestCount}</div></td>
  </tr>
</table>

				</div>
				
			</div>
                    
                    
             <div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Sent
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="#">Invitations</a></td>
    <td><div class="badge pull-right">${cacheGuest.sentInterestCount}</div></td>
  </tr>
</table>

				</div>
				
			</div>       
				</div>
             
                
                
                <div class="col-md-9 products-grid-left">
					
            <div class="panel panel-default">
            
            <div class="panel-body">
				<div id="imagesDiv" class="row" style="margin-bottom: 0.4em;">
			      	<c:forEach items="${photosList}" var="photo" >
			      		<div class="col-md-2">
			      			<img id="photo" src="${photo.image}" class="img-responsive thumbnail" style="margin-bottom:0;">
			      			<a href="#" onclick="setAsProfilePicture(${photo.id},'${photo.image}')">Set as Profile Picture</a>
			      		</div>
					</c:forEach>
			    	
			    </div>
   
			   <div class="col-md-8">
			   	<fieldset>
			   		
			   		<div id="secondForm">
			   			<div class="col-md-12">
					      <h3>Upload photo.</h3>
					    </div>
					    <div class="form-group">
					      <div class="col-md-8">
					      	<input type="file" id='imageName'  onchange="checkImg(this)"><br>
					    	
					      </div>
					    </div>
					    <div class="form-group">
					    	<div class="col-md-8">
					    	<img alt="Preview" id="previewImg" align="middle" style="border-style: solid;height: 100px;width: 100px;border-bottom-style: none;border-left-style: none;border-top-style: none;">
					    	</div>
					    </div>
					    <div class="form-group">
					    	<div class="col-md-8">
					    		<input type="button" id="uploadBtn" value="Upload Photo" onclick="imageAjax()">
					    	</div>
					    </div>
					    
			   		</div>
			   	</fieldset>
			   </div>
   
    
    
    
   <div class="clearfix"></div>
   
   </div>
   
   </div> 
         </div></div>
				</div>
                
                
                
                
                
              
			</div>  
            

<!-- //products -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 footer-grid">
				<h6>About us</h6>
				<p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel tincidunt elementum, nunc urna tristique nisi, in interdum libero magna .</p>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>Search</h6>
				<ul>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Terms &amp; Conditions</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>My Account</h6>
				<ul>
					<li><a href="#">My Account</a></li>
					<li><a href="#">My Profile</a></li>
					<li><a href="#">My Interest</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>Extras</h6>
				<ul>
					<li><a href="#">Login</a></li>
					<li><a href="#">Register</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="footer-copy">
		<p>© 2017. All rights reserved.</p>
	</div>

<!-- //footer -->
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<script src="js/ajax.js"></script>
<script type="text/javascript">
function checkImg(objImg)
{
	$("#previewImg").prop("src",window.URL.createObjectURL(objImg.files[0]));
}

	function imageAjax(){
		$("#uploadBtn").prop("disabled",true);
		$("#uploadBtn").val("Please wait...");
	var formData = new FormData();
	formData.append("imageName", imageName.files[0]);
	//formData.append("id", id);
	  $.fn.makeMultipartRequest('POST', 'photoUpload', false,
				formData, false, 'text', function(data){
		  	var jsonobj = $.parseJSON(data);
		  	var msg = jsonobj.message;
		  	var photosList = jsonobj.photosList;
		  	if("success" == msg){
		  		alert("Photo uploaded successfully.");
		  		updateImagesList(photosList);
		  	}else{
		  		alert("Photo upload failed. Please try again.");
		  	}
		  	$("#uploadBtn").removeAttr("disabled");
	   		$("#uploadBtn").val("Upload Photo");
		});
 }
function updateImagesList(photosList){
	var str = "";
	$.each(photosList,function(i,photoObj){
		 str += '<div class="col-md-2">'
  			+'<img src="'+photoObj.image+'" class="img-responsive thumbnail" style="margin-bottom:0;">'
  			+'</div>';
		
	});
	$("#imagesDiv").html(str);
}
function setAsProfilePicture(photoId,photoImage){
	var formData = new FormData();
	formData.append("photoId", photoId);
	//formData.append("id", id);
	  $.fn.makeMultipartRequest('POST', 'setAsProfilePicture', false,
				formData, false, 'text', function(data){
		  	var jsonobj = $.parseJSON(data);
		  	var msg = jsonobj.message;
		  	if("success" == msg){
		  		alert("Profile picture updated.");
		  		$("#profilepic").prop("src",photoImage);
		  	}else{
		  		alert("Some problem occured. Please try again.");
		  	}
		  	
		});
}
</script>

</body>
</html>