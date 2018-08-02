<%@ include file="userCommonHeader.jsp"%>
<style>
.vertical-menu {
    width: 200px;
}

.vertical-menu a {
    background-color: #eee;
    color: black;
    display: block;
    padding: 12px;
    text-decoration: none;
}

.vertical-menu a:hover {
    background-color: #ccc;
}

.vertical-menu a.active {
    background-color: #4CAF50;
    color: white;
}
.container {
background:#fff;
}
h3{
color:#000;
}
.conver {
padding:0px;
}
.conver12 {
background:#f8f8f8;
padding:10px;}
</style>
<div class="container" style="padding:15px;">
<a type="button"   href="${back_link_val}" class="btn btn-success pull-right" > Back</a>
<div class="clearfix"></div>
<br>
			<div class="col-md-3 products-grid-right">
		
				<div class="panel panel-success">
					<div class="panel-body">
						<h4><strong>Activity</strong></h4>
						<div class="tabbable" id="tabs-343694">
							
							<div class="tab-content">
								<div class="tab" id="inbox">
									<table width="100%" class="dotted-seperator">
										<tbody><tr>
											<td height="30"><a href="#" onclick="displayBlock('inbox','pending_requests');" class="tablinks" id="defaultOpen">Inbox</a></td>
											
										</tr>
										<tr>
											<td height="30"><a href="#" onclick="displayBlock('sent','sent_requests');" class="tablinks">Sent</a></td>
											
										</tr>
										
									</tbody></table>
									
									
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
<div class="col-md-9">


<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">More Conversations </div>
						<div class="panel-body conver">
						<form:form commandName="notificationsForm"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
						<div class="col-md-12 conver12">
						<div class="col-md-2">
							<c:if test="${empty fullProfilePhotosList}">
								<img id="img_inpage" src="${baseurl }/images/default.png" class="img-responsive" style="margin-bottom:0;">
							</c:if>
							<c:if test="${not empty fullProfilePhotosList}">
								<c:forEach items="${fullProfilePhotosList}" var="photo">
									<c:if test="${photo.image == profileBean.profileImage }">
										<div class="picstyle smallSlides${profileBean.id}" style="display:block;">
											<img src="${baseurl }/${photo.image}" class="img img-responsive watermark_text" style="margin-bottom:0;height: auto;width: 100%;" >
										</div>
									</c:if>
									<c:if test="${photo.image != profileBean.profileImage }">
										<div class="picstyle smallSlides${profileBean.id}" style="display:none;">
											<img src="${baseurl }/${photo.image}" class="img img-responsive watermark_text" style="margin-bottom:0;height: auto;width: 100%;" >
										</div>
									</c:if>
								</c:forEach>
								<c:if test="${photosListSize>1 }">
									<p style="display: table;">
										<a id="prevBtn${profileBean.id}" class="" style="text-decoration: none; margin: 0px 0px 0px 7px;" href="#no" onclick="plusSmallSlide(-1,${profileBean.id})">&#10094;</a>
										<a id="nextBtn${profileBean.id}" class="" style="text-decoration: none; margin-left: 41px;" href="#no" onclick="plusSmallSlide(1,${profileBean.id})">&#10095;</a>
									</p>
								</c:if>
							</c:if>
						</div>
						<div class="col-md-10">
						<h3>${profileBean.firstName} ${profileBean.lastName}<span><a href="#"><img  data-toggle="tooltip" title="View Mobile Number" src="${baseurl }/images/micon.png"/></a></span> <span class="pull-right"><a href="#"><i data-toggle="tooltip" title="Delete" class="fa fa-trash-o" style="font-size:16px;"></i></a></span></h3>
						<p>${profileBean.age} Yrs, ${profileBean.heightInches}, ${profileBean.religionName}: ${profileBean.casteName}, ${profileBean.currentCityName}, ${profileBean.currentStateName}, ${profileBean.currentCountryName}, ${profileBean.educationName}, ${profileBean.occupationName}</p>
						</div>
						</div>
						<div class="clearfix"></div><br>
						<c:set var="loggedin_user_gender" value="${cacheGuest.gender}" />
						<c:set var="opp_gender_str" value="${''}" />
						<c:set var="her_his_you" value="${''}" />
						<c:set var="short_str" value="${''}" />
						<c:if test="${loggedin_user_gender == 'Female' }">
							<c:set var="opp_gender_str" value="${'He'}" />
							<c:set var="her_his_you" value="${'his'}" />
						</c:if>
						<c:if test="${loggedin_user_gender == 'Male' }">
							<c:set var="opp_gender_str" value="${'She'}" />
							<c:set var="her_his_you" value="${'her'}" />
						</c:if>
						<c:if test="${not empty conversationsList}">
							<c:forEach items="${conversationsList}" var="conversation">
								<c:set var="act_type" value="${conversation.activity_type}" />
								<c:set var="act_done_by" value="${conversation.act_done_by_user_id}" />
								<c:set var="act_str" value="${''}" />
								<c:set var="message_content" value="${''}" />
								<c:set var="short_str_symbol" value="${'../images/arrowaccepted.png'}" />
								
								<div class="col-md-12">
									<c:if test="${act_done_by == cacheGuest.id }">
										<c:set var="act_str" value="${'You'}" />
									</c:if>
									<c:if test="${act_done_by != cacheGuest.id }">
										<c:set var="act_str" value="${opp_gender_str}" />
										<%-- <c:set var="her_his_you" value="${'your'}" /> --%>
									</c:if>
									<%-- <c:if test="${act_type == 'profile_viewed' }">
										<c:if test="${act_done_by == cacheGuest.id }">
											<c:set var="act_str" value="You viewed ${her_his_you} profile" />
										</c:if>
										<c:if test="${act_done_by != cacheGuest.id }">
											<c:set var="act_str" value="${act_str} viewed your profile" />
										</c:if>
										<c:set var="short_str" value="${'Profile Viewed'}" />
									</c:if> --%>
									<c:if test="${act_type == 'interest_request' }">
										<c:if test="${act_done_by == cacheGuest.id }">
											<c:set var="short_str" value="${'Interest Request Sent'}" />
											<c:choose>
											<c:when test="${her_his_you == 'his'}">
												<c:set var="act_str" value="You sent an interest request to him" />
											</c:when>
											<c:otherwise>
												<c:set var="act_str" value="You sent an interest request to ${her_his_you}" />
											</c:otherwise>
										</c:choose>
										</c:if>
										<c:if test="${act_done_by != cacheGuest.id }">
											<c:set var="short_str" value="${'Interest Request Received'}" />
											<c:set var="short_str_symbol" value="${baseurl }/images/arrowreceived.png}" />
											<c:set var="act_str" value="${act_str} sent an interest request to you" />
										</c:if>
									</c:if>
									<c:if test="${act_type == 'interest_accepted' }">
										<c:if test="${act_done_by == cacheGuest.id }">
											<c:set var="act_str" value="You accepted ${her_his_you} interest request" />
										</c:if>
										<c:if test="${act_done_by != cacheGuest.id }">
											<c:set var="act_str" value="${act_str} accepted your interest request" />
										</c:if>
										<c:set var="short_str" value="${'Interest Accepted '}" />
									</c:if>
									<c:if test="${act_type == 'interest_rejected' }">
										<c:if test="${act_done_by == cacheGuest.id }">
											<c:set var="act_str" value="You rejected ${her_his_you} interest request" />
										</c:if>
										<c:if test="${act_done_by != cacheGuest.id }">
											<c:set var="act_str" value="${act_str} rejected your interest request" />
										</c:if>
										<c:set var="short_str" value="${'Interest Rejected '}" />
									</c:if>
									<c:if test="${act_type == 'message' }">
										<c:if test="${act_done_by == cacheGuest.id }">
											<c:choose>
												<c:when test="${her_his_you == 'his'}">
													<c:set var="act_str" value="You sent him a message" />
												</c:when>
												<c:otherwise>
													<c:set var="act_str" value="You sent ${her_his_you} a message" />
												</c:otherwise>
											</c:choose>
										
											<c:set var="short_str" value="${'Message Sent'}" />
										</c:if>
										<c:if test="${act_done_by != cacheGuest.id }">
											<c:set var="short_str" value="${'Message Received'}" />
											<c:set var="short_str_symbol" value="${baseurl }/images/arrowreceived.png}" />
											<c:set var="act_str" value="${act_str} sent you a message" />
										</c:if>
										<c:set var="message_content" value="${conversation.activity_content}" />
									</c:if>
									<c:if test="${act_type == 'message_accepted' }">
										<c:if test="${act_done_by == cacheGuest.id }">
											<c:set var="act_str" value="You accepted ${her_his_you} message" />
										</c:if>
										<c:if test="${act_done_by != cacheGuest.id }">
											<c:set var="act_str" value="${act_str} accepted your message" />
										</c:if>
										
										<c:set var="short_str" value="${'Message Accepted'}" />
									</c:if>
									<c:if test="${act_type == 'message_rejected' }">
										<c:if test="${act_done_by == cacheGuest.id }">
											<c:set var="act_str" value="You rejected ${her_his_you} message" />
										</c:if>
										<c:if test="${act_done_by != cacheGuest.id }">
											<c:set var="act_str" value="${act_str} rejected your message" />
										</c:if>
										<c:set var="short_str" value="${'Message Rejected'}" />
									</c:if>
									<c:if test="${act_type == 'message_replied' }">
										<c:if test="${act_done_by == cacheGuest.id }">
											<c:set var="act_str" value="You replied to ${her_his_you} message" />
										</c:if>
										<c:if test="${act_done_by != cacheGuest.id }">
											<c:set var="act_str" value="${act_str} replied to your message" />
										</c:if>
										<c:set var="short_str" value="${'Message Replied'}" />
										<c:set var="message_content" value="${conversation.activity_content}" />
									</c:if>
									<c:if test="${act_type == 'mobile_no_viewed' }">
										<c:if test="${act_done_by == cacheGuest.id }">
											<c:set var="act_str" value="You viewed ${her_his_you} mobile number" />
										</c:if>
										<c:if test="${act_done_by != cacheGuest.id }">
											<c:set var="act_str" value="${act_str} viewed your mobile number" />
										</c:if>
										<c:set var="short_str" value="${'Mobilenumber Viewed'}" />
									</c:if>
									<c:if test="${act_type == 'short_listed' }">
										<c:if test="${act_done_by == cacheGuest.id }">
											<c:set var="act_str" value="You shortlisted ${her_his_you} profile" />
										</c:if>
										<c:if test="${act_done_by != cacheGuest.id }">
											<c:set var="act_str" value="${act_str} shortlisted your profile" />
										</c:if>
										<c:set var="short_str" value="${'Shortlisted'}" />
									</c:if>
								<p><span><img src="${short_str_symbol}"/> <c:out value="${short_str}" /> <span class="pull-right"><c:out value="${conversation.created_on}" /> <a href="#"><i data-toggle="tooltip" title="Delete" class="fa fa-trash-o" style="font-size:16px;"></i></a></span></p>
								<p><strong> &nbsp; &nbsp; <c:out value="${act_str}" />.</strong></p>
								<p><c:out value="${message_content}" /></p>
								<a class="btn btn-danger" id="sendMail${profileBean.id}" onclick="displayMailPopup(${profileBean.id},'${profileBean.firstName} ${profileBean.lastName}')">Send mail</a> &nbsp; &nbsp;
								</div>
								<div class="clearfix"></div><br><hr>
							</c:forEach>
						</c:if>
						<!-- <div class="col-md-12">
						<p><span><img src="images/arrowaccepted.png"/> Interest Accepted <span class="pull-right">21-mar-2018 <a href="#"><i data-toggle="tooltip" title="Delete" class="fa fa-trash-o" style="font-size:16px;"></i></a></span></p>
						<p><strong> &nbsp; &nbsp; You have accepted her interest.</strong></p>
						<a class="btn btn-danger">Send mail</a> &nbsp; &nbsp;	<a class="btn btn-success">Call Now</a>
						</div>
						<div class="clearfix"></div><br><hr>
						<div class="col-md-12">
						<p><span><img src="images/arrowaccepted.png"/> Add Photo Requested <span class="pull-right">21-mar-2018 <a href="#"><i data-toggle="tooltip" title="Delete" class="fa fa-trash-o" style="font-size:16px;"></i></a></span></p>
						<p><strong> &nbsp; &nbsp; You have requested her to add photo.</strong></p>
						<a class="btn btn-danger">Send mail</a> &nbsp; &nbsp;	<a class="btn btn-success">Call Now</a>
						</div>
						<div class="clearfix"></div><br><hr>
						<div class="col-md-12">
						<p><span><img src="images/arrowreceived.png"/> Interest Received <span class="pull-right">21-mar-2018 <a href="#"><i data-toggle="tooltip" title="Delete" class="fa fa-trash-o" style="font-size:16px;"></i></a></span></p>
						<p><strong> &nbsp; &nbsp; She sent you an interest.</strong></p>
						<a class="btn btn-danger">Send mail</a> &nbsp; &nbsp;	<a class="btn btn-success">Call Now</a>
						</div> -->
						<div class="clearfix"></div><br><hr>
	</form:form>
</div>
</div>
</div>
<script type="text/javascript">
var smallSlideIndex = 0;
function plusSmallSlide(n,profile_id) {
	if(n>0){
		smallSlideIndex += n;
	}else if(n<0){
		smallSlideIndex = smallSlideIndex-1;
	}
	
		
	  var i;
	  var slides = document.getElementsByClassName("smallSlides"+profile_id);
	  
	  //var captionText = document.getElementById("caption");
	  //if (slideIndex > slides.length) {slideIndex = 1}
	  //if (slideIndex < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  
	  
	  slides[smallSlideIndex].style.display = "block";
	  if(smallSlideIndex==slides.length-1){
		//disable next button	
		//var btn = $("#nextBtn"+profile_id);
		//$("#nextBtn"+profile_id).attr("disabled","disabled");
		//$("#nextBtn"+profile_id).href = "javascript:;"
		$("#nextBtn"+profile_id).removeAttr("href");
		$("#nextBtn"+profile_id).removeAttr("onclick");
		//$("#nextBtn"+profile_id).style.color = "gray";
		//$("#nextBtn"+profile_id).style.cursor = "";
		//document.getElementById("myImg"+profile_id)
	  }else{
		  $("#nextBtn"+profile_id).attr("href","#no");
		  $("#nextBtn"+profile_id).attr("onclick","plusSmallSlide(1,"+profile_id+")");
	  }
	  if(smallSlideIndex==0){
		  //disable previous button
	  	$("#prevBtn"+profile_id).removeAttr("href");
		$("#prevBtn"+profile_id).removeAttr("onclick");
		//$("#nextBtn"+profile_id).style.cursor = "";
		//document.getElementById("myImg"+profile_id)
	  }else{
		  $("#prevBtn"+profile_id).attr("href","#no");
		  $("#prevBtn"+profile_id).attr("onclick","plusSmallSlide(-1,"+profile_id+")");
	  }
}
</script>
<%@ include file="userFooter.jsp"%>