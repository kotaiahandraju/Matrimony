<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style>
h5 {
color:#006699;
}
.notifications1:hover {
    background-color: #ddd;
}

.preprofile {
	width:90px;
	height:60px;
	overflow:hidden;
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
    background-color: #f7f0f0;
}
::-webkit-scrollbar {
    width: 3px;
}

/* Track */
::-webkit-scrollbar-track {
    background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
    background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background: #555; 
}

</style>
<div class="container" style="background:#fff; padding:15px;">
	<div class="col-md-12">
		<h5>Your Notifications <span class="pull-right">Notification Settings</span></h5>
<hr>
		<c:if test="${not empty paymentNotificationsList}">
			<div id="notificationsBody" class="notifications">
				<c:forEach var="notification" items="${paymentNotificationsList}">
				<div class="notifications1 col-md-12">
					<div class="col-md-2 preprofile"
						>
						<c:if test="${not empty notification.profileImage}">
							<img src="${baseurl }/${notification.profileImage}"
								style="max-width: 100%;height:auto; padding: 5px;">
						</c:if>
						<c:if test="${empty notification.profileImage}">
							<img src="${baseurl }/img/default.png"
								style"max-width: 100%;height:60px;padding: 5px;">
						</c:if>
					</div>
					<div class="col-md-10 notifications1"
						>
						<p>
							<a
								href="fullProfile?pid=${notification.profile_id}&nid=${notification.id}&rfrm=notifications"
								target="_blank"> <b><c:out
										value="${notification.fullName}" /> (<c:out
										value="${notification.username}" />)</b> paid an amount of
								${notification.amount}
							</a> <br>
							<c:out value="${notification.created_on}" />
							.
						</p>
					</div>
					</div>
					
					<div class="clearfix"></div>
					<hr>
				</c:forEach>
			</div>
		</c:if></div></div>