<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="${baseurl}/css/jquery.awesome-cropper.css">
<link href="${baseurl}/css/imgareaselect-default.css" rel="stylesheet" media="screen">
<style>
.imgareaselect-outer {
 background-color: #fff;
    filter: alpha(opacity=50);
    opacity: 0.5;
}
canvas{display:none}
</style>

<div class="col-md-8">
			   	<fieldset>
			   		
			   		<div id="secondForm">
			   			<div class="col-md-12">
					      <h3>Upload photo.</h3>
					    </div>
					    <div class="form-group">
					      <div class="col-md-8">
					      	<!-- <input type="file" id='imageName1'  onchange="checkImg(this)"><br> -->
					    	<form role="form">
						      <input id="imageName" type="hidden" name="test[image]">
						    </form>
					      </div>
					    </div>
					    <div class="form-group">
					    	<div class="col-md-8">
<!-- 					    	<img alt="Preview" id="previewImg" align="middle" style="border-style: solid;height: 100px;width: 100px;border-bottom-style: none;border-left-style: none;border-top-style: none;"> -->
					    	</div>
					    </div>
					    <div class="form-group">
					    	<div class="col-md-8">
					    		<input type="button" class="btn btn-primary" id="uploadBtn" value="Upload Photo" onclick="imageAjax()">
					    	</div>
					    </div>
					    
			   		</div>
			   	</fieldset>
			   </div>

<script>

// var firstName='${firstName}'
$('#user').html('${firstName}');
$('#lastNameId').html('${lastName}');


    $(document).ready(function () {
        $('#imageName').awesomeCropper(
        {
        	width: 626, height: 417, debug: true}
        );
    });
    var fullImg = "";
    function imageAjax(){
    	if($("#imageName").val() == "" || $("#imageName").val() == "undefined" || $("#imageName").val() == null){
    		alert("Please Select An Image..!");
    	}
    	else
    	{
 	$('#imageName').hide();
   	 $("#uploadBtn").prop("disabled",true);
   		$("#uploadBtn").val("Please wait...");
   	var id= ${id};
    //var form = $('#fileUploadForm')[0];
   	var formData = new FormData();
   	formData.append("imageData", $("#imageName").val());
	formData.append("fullImg", fullImg);
//    	formData.append("imageName", imageName.files[0]);
//formData.append("imageData", $("#imageName").val());
   	formData.append("id", id);
   	  $.fn.makeMultipartRequest('POST', '${baseurl}/admin/croppedImageUpload', false,
   				formData, false, 'text', function(data){
   		  	var jsonobj = $.parseJSON(data);
   		  	var msg = jsonobj.message;
   		  	if("success" == msg){
   		  		alert("Photo uploaded Successfully");
   		  	}else{
   		  		alert("Photo upload failed, Please try again..!");
   		  	}
   		  	$("#uploadBtn").removeAttr("disabled");
   	   		$("#uploadBtn").val("Upload Photo");
   	   	   location.reload();
   		});
   	  
    }
    }
    </script> 	
	<script src="${baseurl}/js/jquery.imgareaselect.js"></script>
	<script src="${baseurl}/js/jquery.awesome-cropper.js"></script> 
