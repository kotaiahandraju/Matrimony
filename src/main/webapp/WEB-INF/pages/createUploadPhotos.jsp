<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="${baseurl}/css/jquery.awesome-cropper.css">
<link href="${baseurl}/css/imgareaselect-default.css" rel="stylesheet" media="screen">
<style>
canvas{display:none}
</style>

<div class="container">
			<h2>Upload Photos</h2> <br>
	<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
    <input type="hidden" name="files" id="imageName"/><br/>
    <input type="submit" value="UploadPhoto" onclick="imageAjax()" id=uploadBtn class="btn btn-primary"/>
</form>	<br>
    <a href="${baseurl}/admin/AllProfilesHome" class="btn btn-primary">Back to Active Profile</a>	
</div>
<script>
    $(document).ready(function () {
        $('#imageName').awesomeCropper(
        {
        	width: 626, height: 417, debug: true}
        );
    });
    
    function imageAjax(){
    	if($("#imageName").val() == "" || $("#imageName").val() == "undefined" || $("#imageName").val() == null){
    		alert("Please Select An Image..!");
    	}
    	else
    	{
   	 $("#uploadBtn").prop("disabled",true);
   		$("#uploadBtn").val("Please wait...");
   	var id= ${id};
    var form = $('#fileUploadForm')[0];
   	var formData = new FormData(form);
//    	formData.append("imageName", imageName.files[0]);
formData.append("imageData", $("#imageName").val());
   	formData.append("id", id);
   	  $.fn.makeMultipartRequest('POST', '../../croppedImageUpload', false,
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
<script src="${baseurl}/js/jquery.awesome-cropper.js"></script> 
	<script src="${baseurl}/js/jquery.imgareaselect.js"></script> 
