<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- <link rel="stylesheet" href="${baseurl}/css/jquery.awesome-cropper.css"> --%>
<link href="${baseurl}/css/imgareaselect-default.css" rel="stylesheet" media="screen">
<script src="${baseurl}/crop/js/jquery.min.js"></script>
<script src="${baseurl}/crop/js/jquery.Jcrop.min.js"></script> 
 <script src="${baseurl}/crop/js/script.js"></script>
<link href="${baseurl}/crop/css/main.css" rel="stylesheet" type="text/css" />
<link href="${baseurl}/crop/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />

<style>
 .imgareaselect-border1, .imgareaselect-border2, .imgareaselect-border3, .imgareaselect-border4 {
    filter: alpha(opacity=50);
    opacity: 0.5;
}
.imgareaselect-outer {

 background-color: #fff;
    filter: alpha(opacity=50);
    
} 
canvas{display:none}
btn-primary {
    
    margin-top: 10px;
}
#uploadBtn {
margin-top:10px;
}
</style>

				<div class="col-md-5 col-sm-12"></div>
	            <div  class="clearfix"></div>    
<div class="col-md-3"></div><div class="col-md-8">
			   	<fieldset>
			   		
			   		<div id="secondForm">
			   			<div class="col-md-12">
					      <h3>Upload photo.</h3>
					    </div>
							    <div><input type="file" name="image_file" id="image_file" onChange="fileSelectHandler()"  /></div>
		                                        <input type="hidden" id="x1" name="x1" />
							                     <input type="hidden" id="y1" name="y1" />
							                     <input type="hidden" id="x2" name="x2" />
							                     <input type="hidden" id="y2" name="y2" />
		                     <div class="error"></div>
		
		                     <div class="step2">
		                         <h2>Step2: Please select a crop region</h2>
		                         <div class="table-responsive">
			                         <img id="preview"  />
									</div>
		
		                         <div class="info">
		                             <label>File size</label> <input type="text" id="filesize" name="filesize" />
		                             <label>Type</label> <input type="text" id="filetype" name="filetype" />
		                             <label>Image dimension</label> <input type="text" id="filedim" name="filedim" />
		                             <label>W</label> <input type="text" id="w" name="w" />
		                             <label>H</label> <input type="text" id="h" name="h" />
		                         </div>
		
		                         <div class="form-group">
							    	<div class="col-md-8">
							    		<input type="button" class="btn btn-primary" id="uploadBtn" value="Upload Photo" onclick="imageAjax()">
							    	</div>
							    </div>
		                     </div>
					    <!-- <div class="form-group">
					    	<div class="col-md-8">
					    	<img alt="Preview" id="previewImg" align="middle" style="border-style: solid;height: 100px;width: 100px;border-bottom-style: none;border-left-style: none;border-top-style: none;">
					    	</div>
					    </div> -->
					    <!-- <div class="form-group">
					    	<div class="col-md-8">
					    		<input type="button" class="btn btn-primary" id="uploadBtn" value="Upload Photo" onclick="imageAjax()">
					    	</div>
					    </div> -->
					    
			   		</div>
			   	</fieldset>
			   </div>

<script>

// var firstName='${firstName}'
$('#user').html('${firstName}');
$('#lastNameId').html('${lastName}');


    $(document).ready(function () {
        /* $('#imageName').awesomeCropper(
        {
        	width: 626, height: 417, debug: true}
        ); */
    });
    var fullImg = "";

function imageAjax(){
	var selected_image = $("#preview").attr("src");
	if(selected_image == "" || selected_image == "undefined" || selected_image == null){
		alert("Please Select An Image..!");
	}
	else
	{
		$("#uploadBtn").prop("disabled",true);
		$("#uploadBtn").val("Please wait...");
		var id= ${id};
		var formData = new FormData();
		//var imgurl =  $("#imageName").getCroppedCanvas().toDataURL();
		//formData.append("imageName", $("#imageName").val());
		formData.append("imageData", $("#preview").attr("src"));
		formData.append("fullImg", $('#image_file')[0].files[0]);
		 formData.append("x_val", $("#x1").val());
		 formData.append("y_val", $("#y1").val());
		 formData.append("width", $("#w").val());
		 formData.append("height", $("#h").val());
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
