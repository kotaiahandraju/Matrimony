<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

				<div class="col-md-5 col-sm-12"></div>
	            <div  class="clearfix"></div>    
			</div>
		</div>
     
		<div class="row">
			<div class="midcontnet">
				<div class="col-md-8">
   					<div id="secondForm">
			   			<div class="col-md-12">
					      <h3>Upload photo.</h3>
					    </div>
					    <div class="form-group">
					      <label class="col-md-4 control-label" for="textinput">Image</label>
					      <div class="col-md-8">
					      	<img src="${baseurl}/img/default.png" alt="Preview" id="previewImg" align="middle" style="border-style: solid;height: 100px;width: 100px;border-bottom-style: none;border-left-style: none;border-top-style: none;">
					      	<input type="file" id='imageName'  onchange="checkImg(this)"><br>
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
					    		<a style="color: blue;text-decoration: none;" href="${baseurl}/partner-profile">&nbsp;&nbsp;Continue</a>
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
   
<script src="${baseurl }/js/jquery-ui.min.js"></script>
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
//	formData.append("id", id);
  	$.fn.makeMultipartRequest('POST', 'photoUpload', false, formData, false, 'text', function(data){
	  	var jsonobj = $.parseJSON(data);
	  	var msg = jsonobj.message;
	  	if("success" == msg){
	  		alert("Photo uploaded Successfully");
	  	}else{
	  		alert("Photo upload failed, Please try again..!");
	  	}
	  	$("#uploadBtn").removeAttr("disabled");
   		$("#uploadBtn").val("Upload Photo");
	});
}

function goToNextPage(){
	var location = $("#loc").val();
	window.location.href =location+"/partner-profile";
}

</script>

<%@ include file="userStepsFooter.jsp"%>