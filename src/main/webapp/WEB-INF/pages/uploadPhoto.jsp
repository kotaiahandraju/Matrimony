<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<script src="${baseurl}/crop/js/jquery.min.js"></script>
<script src="${baseurl}/crop/js/jquery.Jcrop.min.js"></script> 
 <script src="${baseurl}/crop/js/script.js"></script>
<link href="${baseurl}/crop/css/main.css" rel="stylesheet" type="text/css" />
<link href="${baseurl}/crop/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />
<!-- <script type="text/javascript">
var fileReader = new FileReader();
var filterType = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;

fileReader.onload = function (event) {
		  var image = new Image();
		  
		  image.onload=function(){
		      document.getElementById("original-Img").src=image.src;
		      var canvas=document.createElement("canvas");
		      var context=canvas.getContext("2d");
		      canvas.width=image.width/3;
		      canvas.height=image.height/3;
		      context.drawImage(image,
		          0,
		          0,
		          image.width,
		          image.height,
		          0,
		          0,
		          canvas.width,
		          canvas.height
		      );
		      
		      document.getElementById("upload-Preview").src = canvas.toDataURL();
		  }
		  image.src=event.target.result;
};

var loadImageFile = function () {
  var uploadImage = document.getElementById("upload-Image");
  
  //check and retuns the length of uploded file.
  if (uploadImage.files.length === 0) { 
    return; 
  }
  
  
  //Is Used for validate a valid file.
  var uploadFile = document.getElementById("upload-Image").files[0];
  
 var image = new Image();
  
  image.onload = function() {
      
      alert("The image width is " +uploadFile.width + " and image height is " + uploadFile.height);
  };
  if (!filterType.test(uploadFile.type)) {
    alert("Please select a valid image."); 
    return;
  }
  
  fileReader.readAsDataURL(uploadFile);
}
</script> -->
<style>
@media screen and (max-width: 640px) and (min-width: 320px) {
.modal-footer {
text-align:left !important;}
}
}
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

 /* #preview {
width:70% !important; height:70% !important;} */
</style>
<link href="${baseurl}/css/imgareaselect-default.css" rel="stylesheet" media="screen">
<%-- <link rel="stylesheet" href="${baseurl}/css/jquery.awesome-cropper.css"> --%>
				<div class="col-md-5 col-sm-12"></div>
	            <div  class="clearfix"></div>    
			</div>
		</div>
     
		<div class="row">
			<div class="midcontnet">
				<div class="col-md-12" style="min-height:250px;">
				<%-- <form name="uploadForm">
    <table>
      <tbody>
        <tr>
          <td>Select Image - <input id="upload-Image" type="file" onchange="loadImageFile();" /></td>
        </tr>
        <tr>
          <td>Origal Img - <img id="original-Img" style="display:none;"/></td>
        </tr>
         <tr>
          <td>Compress Img - <img id="upload-Preview"/></td>
        </tr>
        <tr>
          <td><br/> Please select image file and save compress file on your machine.<br/> For more - <a href="https://code-sample.com" ratget="_blank"> codesample</a></td>
        </tr>
      </tbody>
    </table>
  </form> --%>
   					<div id="secondForm">
			   			<div class="col-md-1"></div><div class="col-md-11">
					      <h3 style="text-align:left;" >Upload Photo</h3>
					    </div>
					    <div class="form-group">
					      <label class="col-md-4 control-label" for="textinput"></label>
					      <div class="col-md-8">
<%-- 					      	<img src="${baseurl}/img/default.png" alt="Preview" id="previewImg" align="middle" style="border-style: solid;height: 100px;width: 100px;border-bottom-style: none;border-left-style: none;border-top-style: none;"> --%>
					      	<!-- <input type="file" id='imageName'  onchange="checkImg(this)"> -->
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
										    	<div class="col-md-offset-4 col-md-8">
										    		<input type="button" class="btn btn-info" id="uploadBtn" value="Upload Photo" onclick="imageAjax()">
								<!-- 		    		<button id="secondButton" class="btn2 btn btn-warning" onclick="goToNextPage()">Continue/Skip</button> -->
										    		<a class="btn btn-success " href="${baseurl}/users/partner-profile">&nbsp;&nbsp;Continue</a>
										    	</div>
										    </div>
					                     </div>
					      	<br>
					      </div>
					    </div>
					    <%-- <div class="form-group">
					    	<div class="col-md-8">
					    		<img src="${baseurl}/img/default.png" alt="Preview" id="previewImg" align="middle" style="border-style: solid;height: 100px;width: 100px;border-bottom-style: none;border-left-style: none;border-top-style: none;">
					    	</div>
					    </div> --%>
					    <%-- <div class="form-group">
					    	<div class="col-md-offset-4 col-md-8">
					    		<input type="button" class="btn btn-info" id="uploadBtn" value="Upload Photo" onclick="imageAjax()">
			<!-- 		    		<button id="secondButton" class="btn2 btn btn-warning" onclick="goToNextPage()">Continue/Skip</button> -->
					    		<a class="btn btn-success " href="${baseurl}/users/partner-profile">&nbsp;&nbsp;Continue</a>
					    	</div>
					    </div> --%>
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
	var formData = new FormData();
	//var imgurl =  $("#imageName").getCroppedCanvas().toDataURL();
	//formData.append("imageName", $("#imageName").val());
	formData.append("imageData", $("#preview").attr("src"));
	formData.append("fullImg", $('#image_file')[0].files[0]);
	 formData.append("x_val", $("#x1").val());
	 formData.append("y_val", $("#y1").val());
	 formData.append("width", $("#w").val());
	 formData.append("height", $("#h").val());
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
<%-- <script src="${baseurl}/js/jquery.awesome-cropper.js"></script> --%> 
<script>
    $(document).ready(function () {
        /* $('#imageName').awesomeCropper(
        { width: 626, height: 417, debug: true }
        ); */
    });
    </script>
<%@ include file="homeFooter2.jsp"%>