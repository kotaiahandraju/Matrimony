<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<style>
input[type="file"] {
margin:5px;
}
.modal-footer .btn-group .btn + .btn {
     margin-left: 5px; 
}
.copyright {
position:fixed;
bottom:0;
width:100%;
}

.midcontnet {
    border-bottom: 12px solid #F1F1F2;
    padding-bottom: 40px;
    margin: 0 33px;
}
.imgareaselect-outer {
position:fixed !important;
background:#fff !important;}
canvas {
display:none;}
</style>
<link href="${baseurl}/css/imgareaselect-default.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="${baseurl}/css/jquery.awesome-cropper.css">
				<div class="col-md-5 col-sm-12"></div>
	            <div  class="clearfix"></div>    
			</div>
		</div>
     
		<div class="row">
			<div class="midcontnet">
				<div class="col-md-8">
   					<div id="secondForm">
			   			<div class="col-md-1"></div><div class="col-md-11">
					      <h3>Upload Photo.</h3>
					    </div>
					    <div class="form-group">
					      <label class="col-md-4 control-label" for="textinput"></label>
					      <div class="col-md-8">
<%-- 					      	<img src="${baseurl}/img/default.png" alt="Preview" id="previewImg" align="middle" style="border-style: solid;height: 100px;width: 100px;border-bottom-style: none;border-left-style: none;border-top-style: none;"> --%>
					      	<!-- <input type="file" id='imageName'  onchange="checkImg(this)"> -->
					      	<form role="form">
						      <input id="imageName" type="hidden" name="test[image]">
						    </form>
					      	<br>
					      </div>
					    </div>
					    <%-- <div class="form-group">
					    	<div class="col-md-8">
					    		<img src="${baseurl}/img/default.png" alt="Preview" id="previewImg" align="middle" style="border-style: solid;height: 100px;width: 100px;border-bottom-style: none;border-left-style: none;border-top-style: none;">
					    	</div>
					    </div> --%>
					    <div class="form-group">
					    	<div class="col-md-offset-4 col-md-8">
					    		<input type="button" class="btn btn-info" id="uploadBtn" value="Upload Photo" onclick="imageAjax()">
			<!-- 		    		<button id="secondButton" class="btn2 btn btn-warning" onclick="goToNextPage()">Continue/Skip</button> -->
					    		<a class="btn btn-success " href="${baseurl}/users/partner-profile">&nbsp;&nbsp;Continue</a>
					    	</div>
					    </div>
					    <div class="form-group">
					      <label class="col-md-4 control-label" for="textinput"></label>  
					      <div class="col-md-6">
					      <!-- 	<a href="thankyou" class="btn1 btn btn-info">Continue</a> -->
					      </div>
					    </div>
					</div>
				</div>
   <div class="clearfix"></div><br>
<script src="${baseurl }/js/jquery-ui.min.js"></script>
<script type="text/javascript">

function checkImg(objImg)
{
	$("#previewImg").prop("src",window.URL.createObjectURL(objImg.files[0]));
}
  
function imageAjax(){
	if($("#imageName").val() == "" || $("#imageName").val() == "undefined" || $("#imageName").val() == null){
		alert("Please Upload Image..!");
	}
	else
	{
		$("#uploadBtn").prop("disabled",true);
		$("#uploadBtn").val("Please wait...");
		var formData = new FormData();
		//formData.append("imageName", imageName.files[0]);
		formData.append("imageData", $("#imageName").val());
	//	formData.append("id", id);
	  	$.fn.makeMultipartRequest('POST', 'croppedPhotoUpload', false, formData, false, 'text', function(data){
		  	var jsonobj = $.parseJSON(data);
		  	var msg = jsonobj.message;
		  	if("success" == msg){
		  		alert("Photo uploaded Successfully");
		  	}else{
		  		alert("Photo upload failed, Please try again..!");
		  	}
		  	$("#uploadBtn").removeAttr("disabled");
	   		$("#uploadBtn").val("Upload Photo");
	   	 window.location.href="${baseurl}/users/partner-profile";
		});
	}
}

function goToNextPage(){
	var location = $("#loc").val();
	window.location.href =location+"/partner-profile";
}

</script>
<script src="${baseurl}/js/jquery.imgareaselect.js"></script> 
<script src="${baseurl}/js/jquery.awesome-cropper.js"></script> 
<script>
    $(document).ready(function () {
        $('#imageName').awesomeCropper(
        { width: 626, height: 417, debug: true }
        );
    });
    </script>
<%@ include file="userStepsFooter.jsp"%>