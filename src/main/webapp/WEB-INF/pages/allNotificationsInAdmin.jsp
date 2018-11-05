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
	margin-bottom:4px;
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
    width: 6px;
}

/* Track */
::-webkit-scrollbar-track {
    background: #f1f1f1; 
}
 .col-md-10 {
    width: 91.33333333%;
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
	<div class="col-md-9">
		<h5>Your Notifications </h5></div><div class="col-md-3" id="allDeleteNotifications"><button type="button" class="btn btn-danger pull-right"><a href="#" onclick="removeALLNotification();" style="color:#fff;">Delete All</a></button></span></div>
<div class="clearfix"></div>
<hr><div class="col-md-12">
		<c:if test="${not empty paymentNotificationsList}">
			<div id="notificationsBody" class="notifications">
				<c:forEach var="notification" items="${paymentNotificationsList}">
				<div  class="notifyDivAll notifyDiv${notification.id}">
				<div class="notifications1 col-md-12">
					<div class="col-md-2 preprofile"
						>
						<c:if test="${not empty notification.profileImage}">
							<img src="${catalina_base}/${notification.profileImage}"
								style="max-width: 100%;height:auto; padding: 5px;">
						</c:if>
						<c:if test="${empty notification.profileImage}">
							<img src="${baseurl }/img/default.png"
								style"max-width: 100%;height:60px;padding: 5px;">
						</c:if>
					</div>
					<div class="col-md-10 notifications1">
						<p>
							<a
								href="fullProfile?id=${notification.profile_id}"
								target="_blank"> <b><c:out
										value="${notification.fullName}" /> (<c:out
										value="${notification.username}" />)</b> paid an amount of
								${notification.amount}
							</a> <br>
							<c:out value="${notification.created_on}" />
							<a  href="#" onclick="removeNotification(${notification.id});"><span class="fa fa-trash pull-right" style="margin-top:5px;"></span></a><br>
						</p>
						</div>
					</div>
	       </div>
					</div>
					
					<div class="clearfix"></div>
					<hr>
				</c:forEach>
			</div>
		</c:if></div></div>
		
		<script type="text/javascript">
		function removeALLNotification(){
			 var checkstr =  confirm('Are you sure you want to delete all');
				if(checkstr == true){
			 var formData = new FormData();
				$.fn.makeMultipartRequest('POST', '${baseurl}/admin/removeALLNotificationInAdmin', false, formData, false, 'text', function(data){
					var jsonobj = $.parseJSON(data);
					var msg = jsonobj.message;
					if(msg=="delete"){
						$("#allDeleteNotifications").remove();
						$(".notifyDivAll").remove();
					alert("Notification succelufully deleted");
					}else{
						alert("Some problem occured. Please try again.");
					}
				});
			} 
		}
</script>
		
		