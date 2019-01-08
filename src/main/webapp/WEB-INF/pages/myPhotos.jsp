<%@ include file="userHeader.jsp"%>
<%-- <link href="${baseurl}/css/imgareaselect-default.css" rel="stylesheet" media="screen">
<link rel="stylesheet" href="${baseurl}/css/jquery.awesome-cropper.css">
<script src="${baseurl}/js/jquery.imgareaselect.js"></script> 
<script src="${baseurl}/js/jquery.awesome-cropper.js"></script> --%> 

<link href="${baseurl}/crop/css/main.css" rel="stylesheet" type="text/css" />
<link href="${baseurl}/crop/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />

<style>
.watermarkcontent5_profilepic {
  position: absolute; /* Position the background text */
  top: -16px; /* At the bottom. Use top:0 to append it to the top */
  //background: rgb(0, 0, 0); /* Fallback color */
  //background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: white; /* Grey text */
  width: 100%; /* Full width */
  padding: 10px; /* Some padding */
  transform: rotate(90deg);
//transform-origin: left top 0;
width : 0;
}
.watermarkcontent15profilepic span{
opacity : 0.6;
font-size :14px;
}
.progress img {
height:  250px;
}
@media screen and (max-width: 640px) and (min-width: 320px) {
.modal-footer {
text-align:left !important;}
}
}
.imgareaselect-outer {
position:fixed !important;
}
 /* .awesome-cropper  img {
height:250px !important;
}  */
canvas{
display : none
}
.progress  img {
height:250px;
}
.ui-dialog-titlebar-close
{
 width: 25px;
    height: 25px;
    left-padding: 100px;
    background-image: url(${baseurl }/img/close.png);
    background-repeat: no-repeat;
}
.well #profilepic {
    color: #000;
    pointer-events: none;
}
</style>
			<div class="col-md-9 products-grid-left">
				<div class="panel panel-success">
					<div class="panel-heading">My Photos</div>
					<div class="panel-body">
					
				<div id="imagesDiv" class="row" style="margin-bottom: 0.4em;">
			      	<c:forEach items="${photosList}" var="photo" >
			      		<div id="div${photo.id}" class="col-md-3" style="text-align:center;">
 			      			<a href="${catalina_base}/${photo.image}" data-littlelightbox-group="gallery" class="lightbox thumbnail"><img id="photo${photo.id}" src="${catalina_base}/${photo.image}" class="img-responsive thumbnail " style="margin-bottom:0;"><div class="watermarkcontent5_profilepic">
										<span>aarnamatrimony.com</span>
									</div></a>
			      			<c:if test="${photo.approved_status == '0' }">
			      					<span style="display:block;">Approval Pending</span>
			      			</c:if>
			      			<c:if test="${photo.approved_status == '1' }">
			      				<c:if test="${photo.is_profile_picture == '1' }">
			      					<div class="all_pics_normal">
				      					<span>Profile Picture</span>
				      				</div>
				      				<div class="all_pics_a" hidden="true">
				      					<a id="profilepic${photo.id}" href="#" class="all_pics" data-littlelightbox-group="gallery" onclick="setAsProfilePicture(${photo.id},'${photo.image}')">Set as Profile Picture</a>
				      				</div>
				      			</c:if>
				      			<c:if test="${photo.is_profile_picture == '0' }">
				      				<div class="all_pics_normal" hidden="true">
				      					<span>Profile Picture</span>
				      				</div>
				      				<div class="all_pics_a">
				      					<a style="text-align:center;" id="profilepic${photo.id}" href="#" class="all_pics" data-littlelightbox-group="gallery" onclick="setAsProfilePicture(${photo.id},'${photo.image}')">Set as Profile Picture</a>
				      				</div>
				      			</c:if>
			      			</c:if>
			      			<c:if test="${photo.approved_status == '2' }">
			      				<span style="text-align:center;display:block;">Rejected by Admin</span>
			      			</c:if>
			      			&nbsp;<a  style="text-align:center;" href="#" onclick="deletePhoto(${photo.id},'div${photo.id}')" style="text-align:center;margin-right: 90px;margin-top: 12px;">Delete</a>
			      		</div>
					</c:forEach>
			    	
			    </div>
   
			   <!-- <div class="col-md-8">
			   	<fieldset> -->
			   		 <div class="col-md-12">
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

                         <input type="button" value="Upload" onclick="imageAjax()" />
                     </div>
                                <!-- <fieldset>
			   		
			   		<div id="secondForm">
			   			<div class="col-md-12">
					      <h3>Upload photo.</h3>
					    </div>
					    <div class="form-group">
					      <div class="col-md-8">
					      	<!-- <input type="file" id='imageName1'  onchange="checkImg(this)"><br> -->
					    	<!-- <form role="form">
						      <input id="imageName" type="hidden" name="test[image]">
						    </form>
					      </div>
					    </div>
					    <div class="form-group">
					    	<div class="col-md-8">
					    	<img alt="Preview" id="previewImg" align="middle" style="border-style: solid;height: 100px;width: 100px;border-bottom-style: none;border-left-style: none;border-top-style: none;">
					    	</div>
					    </div> -->
					    <!-- <div class="form-group">
					    	<div class="col-md-8">
					    	<br>
					    		<input type="button" class="btn btn-primary" id="uploadBtn" value="Upload Photo" onclick="imageAjax()">
					    	</div>
					    </div> -->
					    
			   		</div>
			   	<!-- </fieldset> -->
			   </div>
   
    
    
    
   <div class="clearfix"></div>
   
   </div>
				</div>

				
			</div>       
				
             
                
                
                <div class="col-md-9 products-grid-left">
					
            <div class=" ">
            
            
   
   </div> 
         </div>
			
			<div class="col-md-3 products-grid-right">
			</div>
			<div id="dial1"></div>
 <script src="${baseurl }/js/jquery-ui.min.js"></script> 
<script>
	$('.lightbox').littleLightBox();
</script>   
    
<script type="text/javascript">

$(function(){
	 //add text water mark;	
 addWaterMark();
 
});
function addWaterMark(){
 $('.watermark_text').watermark({
	  text: 'aarnamatrimony.com',
	  textWidth: 250,
	  textSize: 15,
	  textColor: 'white',
	  gravity: 'n',
	   opacity: 0.8,
	   //margin: 10,
	   outputWidth: 'auto',
	   outputHeight: 'auto'
	 });
}
var fullImg = "";
function checkImg(objImg)
{
	console.log(window.URL.createObjectURL(objImg.files[0]));
	$("#previewImg").prop("src",window.URL.createObjectURL(objImg.files[0]));
}

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

		//formData.append("id", id);
	  	$.fn.makeMultipartRequest('POST', 'croppedPhotoUpload', false, formData, false, 'text', function(data){
		  	var jsonobj = $.parseJSON(data);
		  	var msg = jsonobj.message;
		  	var photosList = jsonobj.photosList;
		  	if("success" == msg){
		  		alert("Photo Uploaded Successfully.");
		  		updateImagesList(photosList);
		  		var profile_picc = "${cacheGuest.profileImage}";
		  		if(typeof profile_picc == "undefined" || profile_picc=="" || profile_picc==null){
		  			var image_path = jsonobj.image_path;
			  		 var str = '<img id="profilepic" src="${catalina_base}/'+image_path+'" class="img img-responsive thumbnail watermark_text" style="margin-bottom:0;height: auto;width: 100%;">';
			  		$("#profilePicOuterTag").html('');
			  		$("#profilePicOuterTag").html(str); 
		  		}
		  		addWaterMark();
		  		fullImg = "";
		  	}else{
		  		alert("Photo upload failed. Please try again..!");
		  		$("#uploadBtn").removeAttr("disabled");
		   		$("#uploadBtn").val("Upload Photo");
		  		return false;
		  	}
		  	
		  	$("#uploadBtn").removeAttr("disabled");
	   		$("#uploadBtn").val("Upload Photo");
	  		window.location.href="myPhotos";
		});
	}
}
function updateImagesList(photosList){
	var str = "";
	$.each(photosList,function(i,photoObj){
		//var photoId = ${photoObj.id};
		//var photoImage = ${photoObj.image};
		 str += '<div class="col-md-2">'

  			+'<a href=""><img src="${baseurl}/'+photoObj.image+'" class="img-responsive thumbnail watermark_text" style="margin-bottom:0;"></a>'
  			+' <span>Sent for approval</span> '
  			//+' <a href="#" onclick="sendForApproval('+photoId+')">Send for approval</a> '
  			//+' <a href="#" onclick="setAsProfilePicture('+photoImage+')">Set as Profile Picture</a> '
  			//+'<img src="'+photoObj.image+'" class="img-responsive thumbnail watermark_text" style="margin-bottom:0;height: 60px;width: 60px;">'
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
		  		var str = '<img id="profilepic" src="${catalina_base}/'+photoImage+'" class="img img-responsive thumbnail watermark_text" style="margin-bottom:0;height: auto;width: 100%;">';
		  		//$("#profilepic").prop("src",photoImage);
		  		$("#profilePicOuterTag").html('');
		  		$("#profilePicOuterTag").html(str);
		  		addWaterMark();
		  		$('.all_pics_normal').attr("hidden",true);
		  		$('.all_pics_a').removeAttr("hidden");
		  		$('#div'+photoId+' .all_pics_normal').removeAttr("hidden");
		  		$('#div'+photoId+' .all_pics_a').attr("hidden",true);
		  		/* $("#profilepic"+photoId).removeAttr("href");
		  		$("#profilepic"+photoId).removeAttr("onclick");
		  		$("#profilepic"+photoId).html('Profile Picture'); */
		  		
		  		alert("Profile picture updated.");
		  	}else{
		  		alert("Some problem occured. Please try again.");
		  	}
		  	
		});
}


function deletePhoto(photoId,divId){
	var checkstr =  confirm('Are you sure you want to delete this photo?');
	if(checkstr == true){
		var formData = new FormData();
		formData.append("photoId", photoId);
		//formData.append("id", id);
		  $.fn.makeMultipartRequest('POST', 'deletePhoto', false,
					formData, false, 'text', function(data){
			  	var jsonobj = $.parseJSON(data);
			  	var msg = jsonobj.message;
			  	if("success" == msg){
			  		alert("Photo Deleted.");
			  		$("#"+divId).prop("hidden",true);
			  	}else{
			  		alert("Some problem occured. Please try again.");
			  	}
			  	
			});
	}
}

$(".dashboard").addClass("active");

</script>

<%-- <script src="${baseurl}/js/jquery.imgareaselect.js"></script> 
<script>

    $(document).ready(function () {
       /*  $('#imageName').awesomeCropper(
        { width: 626, height: 417, debug: true }
        ); */
    });
    </script> --%>
   		
 
<%@ include file="userFooter.jsp"%>
