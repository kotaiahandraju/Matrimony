<%@ include file="userCommonHeader.jsp"%>

<c:if test="${not empty notificationsList}">
											<div id="notificationsBody" class="notifications">
												<c:forEach var="notification" items="${notificationsList}">
													<div class="col-md-3"  style="padding-right:0px; padding-left:0px;" >
														<c:if test="${not empty notification.profileImage}">
															<img src="${notification.profileImage}" style="border-radius:  50%;width: 100%;padding: 5px;">
														</c:if>
														<c:if test="${empty notification.profileImage}">
															<img src="img/default.png" style="border-radius:  50%;width: 100%;padding: 5px;">
														</c:if>
													</div>
													<div class="col-md-9" style="padding-right:0px; padding-left:0px;" >
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
											<form:form commandName="notificationsForm"  class="form-horizontal" id="allNotificationsForm" name="allNotificationsForm" role="form"   method="post">
												<div id="notificationFooter"><a href="#" onclick="getAllNotifications();">See All</a></div>
											</form:form>
									</c:if>

<%@ include file="userFooter.jsp"%>