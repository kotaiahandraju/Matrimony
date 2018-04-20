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

</script>




<div class="container" style="background:#fff; padding:15px;">
	<div class="col-md-12">
									<h5>Your Notifications <span class="pull-right">Notification Settings</span></h5>
<hr>

													<c:if test="${not empty notificationsList}">
											<div id="notificationsBody"  class="notifications allnoti">
												<c:forEach var="notification" items="${notificationsList}">
													<div class="notifications1 col-md-12" id="notificationdiv${notification.id}" onclick="notificationId(this.id);">
													<div class="col-md-2 preprofile"  >
														<c:if test="${not empty notification.profileImage}">
														<div align="center"><img src="${notification.profileImage}" style="max-width: 100%; height:auto;" class="img-responsive"></div>
														</c:if>
														<c:if test="${empty notification.profileImage}">
															<img src="img/default.png" style="max-width: 100%; height:60px;padding: 5px;" class="img-responsive">
														</c:if>
													</div>
													<div class="col-md-10" style="padding-right:0px; padding-left:0px;" >
														<p>
															<a  href="fullProfile?pid=${notification.user_id}&nid=${notification.id}&rfrm=notifications"  target="_blank" >
															
																<c:if test="${ notification.read_status==0}">
																<b><c:out value="${notification.fullName}" /> (<c:out value="${notification.username}" />)</b> 
																</c:if>
																<c:if test="${ notification.read_status==1}">
																<c:out value="${notification.fullName}" /> (<c:out value="${notification.username}" />)
																</c:if>
																<c:if test="${notification.notifi_type == 'interest'}">
																	expressed interest in your profile
																</c:if>
																<c:if test="${notification.notifi_type == 'mobile_num_viewed'}">
																	viewed your mobile number
																</c:if>
																<c:if test="${notification.notifi_type == 'profile_viewed'}">
																	viewed your profile
																</c:if>
																<c:if test="${notification.notifi_type == 'mail'}">
																	sent you personal mail
																</c:if>
																<c:if test="${notification.notifi_type == 'short_listed'}">
																	shortlisted your profile
																</c:if>

															</a></br>
															<p>Last Viewed &nbsp;<c:out value="${notification.created_on}"/></p>
														</p>
														
													
													</div></div><hr>
													<div class="clearfix"></div><hr>
												</c:forEach>
											</div>
											<%-- <form:form commandName="notificationsForm"  class="form-horizontal" id="allNotificationsForm" name="allNotificationsForm" role="form"   method="post">
												<div id="notificationFooter"><a href="#" onclick="getAllNotifications();">See All</a></div>
											</form:form> --%>
									</c:if>
								
</div></div>
<%@ include file="userFooter.jsp"%>