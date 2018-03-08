<%@ include file="userHeader.jsp"%>
<style>
.ui-dialog-titlebar-close
{
 width: 25px;
    height: 25px;
    left-padding: 100px;
    background-image: url(img/close.png);
    background-repeat: no-repeat;
}
</style>
			<div class="col-md-8 products-grid-left">
				<div class="panel panel-success">
					<div class="panel-heading">My Photos</div>
					<div class="panel-body">
					
				<div id="imagesDiv" class="row" style="margin-bottom: 0.4em;">
			      	<c:forEach items="${photosList}" var="photo" >
			      		<div id="div${photo.id}" class="col-md-3">
 			      			<a href="${photo.image}" data-littlelightbox-group="gallery" class="lightbox thumbnail watermark_text1"><img id="photo${photo.id}" src="${photo.image}" class="img-responsive thumbnail watermark_text" style="margin-bottom:0;"></a>
			      			<c:if test="${photo.approved_status == '0' }">
			      					<span>Approval Pending</span>
			      			</c:if>
			      			<c:if test="${photo.approved_status == '1' }">
			      				<c:if test="${photo.is_profile_picture == '1' }">
			      					<div class="all_pics_normal">
				      					<span>Profile Picture</span>
				      				</div><br>
				      				<div class="all_pics_a" hidden="true">
				      					<a id="profilepic${photo.id}" href="#" class="all_pics" data-littlelightbox-group="gallery" onclick="setAsProfilePicture(${photo.id},'${photo.image}')">Set as Profile Picture</a>
				      				</div>
				      			</c:if>
				      			<c:if test="${photo.is_profile_picture == '0' }">
				      				<div class="all_pics_normal" hidden="true">
				      					<span>Profile Picture</span>
				      				</div>
				      				<div class="all_pics_a">
				      					<a style="float: right;" id="profilepic${photo.id}" href="#" class="all_pics" data-littlelightbox-group="gallery" onclick="setAsProfilePicture(${photo.id},'${photo.image}')">Set as Profile Picture</a>
				      				</div>
				      			</c:if>
			      			</c:if>
			      			<c:if test="${photo.approved_status == '2' }">
			      				<span>Rejected by Admin</span>
			      			</c:if>
			      			&nbsp;<a href="#" onclick="deletePhoto(${photo.id},'div${photo.id}')" style="float: right;margin-right: 90px;margin-top: 12px;">Delete</a>
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

				
			</div>       
				
             
                
                
                <div class="col-md-9 products-grid-left">
					
            <div class="panel panel-default">
            
            
   
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
	  textWidth: 700,
	  textSize: 76,
	  textColor: 'white',
	  gravity: 'w',
	   opacity: 0.8,
	   //margin: 10,
	   outputWidth: 'auto',
	   outputHeight: 'auto'
	 });
}
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
		formData.append("imageName", imageName.files[0]);
		//formData.append("id", id);
	  	$.fn.makeMultipartRequest('POST', 'photoUpload', false, formData, false, 'text', function(data){
		  	var jsonobj = $.parseJSON(data);
		  	var msg = jsonobj.message;
		  	var photosList = jsonobj.photosList;
		  	if("success" == msg){
		  		alert("Photo Uploaded Successfully.");
		  		updateImagesList(photosList);
		  		addWaterMark();
		  	}else{
		  		alert("Photo upload failed. Please try again..!");
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

  			+'<a href=""><img src="'+photoObj.image+'" class="img-responsive thumbnail watermark_text" style="margin-bottom:0;"></a>'
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
		  		var str = '<img id="profilepic" src="'+photoImage+'" class="img img-responsive thumbnail watermark_text" style="margin-bottom:0;height: 120px;width: 150px;">';
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

<%@ include file="userFooter.jsp"%>