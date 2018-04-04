<%@ include file="userCommonHeader.jsp"%>
<style>
h5 {
color:#006699;
}
</style>
<div class="container" style="background:#fff; padding:15px;">
	<div class="col-md-9">
									<h5>Your Notifications <span class="pull-right">Notification Settings</span></h5>
<hr>

<c:if test="${not empty notificationsList}">
											<div id="notificationsBody" class="notifications">
												<c:forEach var="notification" items="${notificationsList}">
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
															<a href="fullProfile?pid=${notification.profile_id}&nid=${notification.id}&rfrm=notifications" target="_blank" >
																<b><c:out value="${notification.fullName}" /> (<c:out value="${notification.username}" />)</b> 
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
															</a>
														.</p>
													</div><hr>
													<div class="clearfix"></div><hr>
												</c:forEach>
											</div>
											<%-- <form:form commandName="notificationsForm"  class="form-horizontal" id="allNotificationsForm" name="allNotificationsForm" role="form"   method="post">
												<div id="notificationFooter"><a href="#" onclick="getAllNotifications();">See All</a></div>
											</form:form> --%>
									</c:if>
								
</div>
<%@ include file="userFooter.jsp"%>