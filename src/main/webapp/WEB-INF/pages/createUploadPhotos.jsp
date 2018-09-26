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

<div class="container">

			<h3>Upload <span id="user" ></span> <span id="lastNameId"></span> Photo</h3>
    <div class="pull-right"><a href="${baseurl}/admin/AllProfilesHome" class="btn btn-primary">Back to Active Profiles</a></div>
			
	<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
    <br><input type="hidden" name="files" id="imageName"/><br/>
    <input type="submit" value="Upload Photo" onclick="imageAjax()" id=uploadBtn class="btn btn-primary"/>
    <input type="button" style="display:none" value="Cancel" onclick="window.location.href='?'" id='uploadCancel' class="btn btn-danger"/>
</form>	<br>	
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
    var form = $('#fileUploadForm')[0];
   	var formData = new FormData(form);
//    	formData.append("imageName", imageName.files[0]);
formData.append("imageData", $("#imageName").val());
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
<script src="${baseurl}/js/jquery.awesome-cropper.js"></script> 
	<script src="${baseurl}/js/jquery.imgareaselect.js"></script> 
