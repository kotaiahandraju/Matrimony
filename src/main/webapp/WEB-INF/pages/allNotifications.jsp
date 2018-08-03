<%@ include file="userCommonHeader.jsp"%>
<style>
h5 {
color:#006699;
}
.notifications1:hover {
    background-color: #ddd;
} 
hr {
    margin-top: 1px !important;
    margin-bottom: 1px !important;
}
hr:hover {
    background-color: #ddd;
}
/* Create an active/current "tab button" class */
.notifications1.active {
    background-color: #ccc;
}
.allnoti {
    background-color: #fff;
    min-height: 300px;
}
.allnoti p {
font-size:14px;}

</style>
<script>

function notificationId(id){
	$("#id").css("background-color","red");
}


function removeALLNotification(){
	 
	 var formData = new FormData();
		$.fn.makeMultipartRequest('POST', '${baseurl }/users/removeALLNotification', false, formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			location.reload();
		});
	} 


</script>




<div class="container" style="background:#fff; padding:15px; min-height:500px;">
	<div class="col-md-9">
		<h5>Your Notifications </h5></div><div class="col-md-3"><button type="button" class="btn btn-danger pull-right"><a href="#" onclick="removeALLNotification();" style="color:#fff;">Delete All</a></button></span></div>
<div class="clearfix"></div>
<hr><div class="col-md-12">

						<c:if test="${not empty notificationsList}">
											<div id="notificationsBody" class="notifications">
												<c:forEach var="notification" items="${notificationsList}">
													<div class="col-md-1 col-xs-1"  style="height:55px; overflow:hidden;padding-right:0px; padding-left:0px;" >
														<c:if test="${not empty notification.profileImage}">
															<img src="${baseurl}/${notification.profileImage}" style="width: 100%;padding: 5px;">
														</c:if>
														<c:if test="${empty notification.profileImage}">
															<img src="${baseurl}/img/default.png" style="width: 100%;padding: 5px;">
														</c:if>
													</div>
													<div class="col-md-10" style="padding-right:0px; padding-left:0px;" >
														<p>
															
															<!-- <a href="inboxAction?tab_type=inbox&list_type=rejected_requests"> -->
															
															
															<%-- <a href="padma?pid=${notification.user_id}&nid=${notification.id}&rfrm=notifications" > --%>
															
																<%-- <c:out value="${notification.fullName}" /> (<c:out value="${notification.username}" />) --%>
																<c:set var="name" value="${notification.fullName} (${notification.username})" />
																<c:if test="${notification.notifi_type == 'interest'}">
																	<a href="inboxAction?tab_type=inbox&list_type=pending_requests&nid=${notification.id}">
																		<c:out value="${name}" /> expressed interest in your profile
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'mobile_num_viewed'}">
																	<a href="myMobileNoViewsList?nid=${notification.id}">
																		<c:out value="${name}" /> viewed your mobile number
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'profile_viewed'}">
																	<a href="myProfileViewsList?nid=${notification.id}">
																		<c:out value="${name}" /> viewed your profile
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'mail'}">
																	<a href="inboxAction?tab_type=inbox&list_type=pending_requests&nid=${notification.id}">
																		<c:out value="${name}" /> sent you personal mail
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'short_listed'}">
																	<a href="shortListedMe?nid=${notification.id}">
																		<c:out value="${name}" /> shortlisted your profile
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'message_replied'}">
																	<a href="inboxAction?tab_type=inbox&list_type=accepted_requests&nid=${notification.id}" >
																		<c:out value="${name}" /> replied to your message
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'message_accepted'}">
																	<a href="inboxAction?tab_type=inbox&list_type=accepted_requests&nid=${notification.id}" >
																		<c:out value="${name}" /> accepted your message
																	</a>
																</c:if>
																<c:if test="${notification.notifi_type == 'interest_accepted'}">
																	<a href="inboxAction?tab_type=inbox&list_type=accepted_requests&nid=${notification.id}" >
																		<c:out value="${name}" /> accepted your interest request
																	</a>
																</c:if>
															</a>
															<br>
															<c:out value="${notification.created_on}" />
														.</p>
													</div>
													<div class="col-md-1">
													<a  href="#" onclick="removeNotification(${notification.id});"><span class="fa fa-trash pull-right" style="margin-top:5px;"></span></a></div>
													<div class="clearfix"></div><hr>
												</c:forEach>
											</div>
										
									</c:if>
									<c:if test="${empty notificationsList}">
										<p>Currently, you have no notifications.</p>
									</c:if>						
								
</div></div>
<%@ include file="userFooter.jsp"%>