<%@ include file="userHeader.jsp"%>

			<div class="col-md-6 products-grid-left">
				<div class="panel panel-success">
					<div class="panel-heading">My Photos</div>
					<div class="panel-body">
						<div id="imagesDiv" class="row" style="margin-bottom: 0.4em;">
					      	<c:forEach items="${photosList}" var="photo" >
				      		<div class="col-md-3">
				      			<img id="photo" src="${photo.image}" class="img-responsive thumbnail" style="margin-bottom: 0;height: 60px;width: 60px;">
				      			<a href="#" onclick="setAsProfilePicture(${photo.id},'${photo.image}')">Set as Profile Picture</a>
				      		</div>
							</c:forEach>
						</div>
					</div>
				</div>

				
			</div>       
				</div>
             
                
                
                <div class="col-md-9 products-grid-left">
					
            <div class="panel panel-default">
            
            <div class="panel-body">
				<div id="imagesDiv" class="row" style="margin-bottom: 0.4em;">
			      	<c:forEach items="${photosList}" var="photo" >
			      		<div id="div${photo.id}" class="col-md-2">
			      			<img id="photo${photo.id}" src="${photo.image}" class="img-responsive thumbnail" style="margin-bottom:0;">
			      			<c:if test="${photo.approved_status == '0' }">
			      				<span>Approval Pending</span>
			      			</c:if>
			      			<c:if test="${photo.approved_status == '1' }">
			      				<c:if test="${photo.is_profile_picture == '1' }">
				      				<span>Profile Picture</span>
				      			</c:if>
				      			<c:if test="${photo.is_profile_picture == '0' }">
				      				<a id="profilepic${photo.id}" href="#" onclick="setAsProfilePicture(${photo.id},'${photo.image}')">Set as Profile Picture</a>
				      			</c:if>
			      			</c:if>
			      			<c:if test="${photo.approved_status == '2' }">
			      				<span>Rejected by Admin</span>
			      			</c:if>
			      			<a href="#" onclick="deletePhoto(${photo.id},'div${photo.id}')">Delete</a>
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

				<div class="panel panel-info">
					<div class="panel-heading">Upload Photos</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-12">
							    <div class="form-group">
									<div class="col-md-4">
										<img src="images/default.png" alt="Preview" id="previewImg" align="middle" class="img img-responsive thumbnail" style="height: 80px;width: 80px;">
									</div>
									<div class="col-md-8">
										<input type="file" id='imageName' onchange="checkImg(this)"><br>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-8">
										<input type="button" class="btn btn-primary btn-sm" id="uploadBtn" value="Upload Photo" onclick="imageAjax()">
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			
			<div class="col-md-3 products-grid-right">
			</div>
         
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
		formData.append("imageName", imageName.files[0]);
		//formData.append("id", id);
	  	$.fn.makeMultipartRequest('POST', 'photoUpload', false, formData, false, 'text', function(data){
		  	var jsonobj = $.parseJSON(data);
		  	var msg = jsonobj.message;
		  	var photosList = jsonobj.photosList;
		  	if("success" == msg){
		  		alert("Photo Uploaded Successfully.");
		  		updateImagesList(photosList);
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

  			+'<img src="'+photoObj.image+'" class="img-responsive thumbnail" style="margin-bottom:0;">'
  			+' <span>Sent for approval</span> '
  			//+' <a href="#" onclick="sendForApproval('+photoId+')">Send for approval</a> '
  			//+' <a href="#" onclick="setAsProfilePicture('+photoImage+')">Set as Profile Picture</a> '
  			+'<img src="'+photoObj.image+'" class="img-responsive thumbnail" style="margin-bottom:0;height: 60px;width: 60px;">'
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
		  		$("#profilepic"+photoId).html('Profile Picture');
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