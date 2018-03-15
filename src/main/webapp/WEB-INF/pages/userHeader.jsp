
<%@ include file="userCommonHeader.jsp"%>

<!-- body starts here-->
<div class="products">
	<div class="container" style="background: #FFF;">
		<div class="mid-grids">
			<div class="col-md-12">
				<h4>Hello <%= userBean.getFirstName() %>. <%= userBean.getLastName() %><span>(<%= userBean.getUsername() %>)</span></h4>
			</div>   
			<div class="col-md-3 products-grid-right">
				<div class="well">
					<div class="row">
						<div class="col-md-11">
							<c:if test="${not empty cacheGuest.profileImage}">
								<a href="#" id="profilePicOuterTag"><img id="profilepic" src="${cacheGuest.profileImage}" class="hover-shadow cursor img img-responsive thumbnail watermark_text" style="margin-bottom:0;height: 120px;width: 150px;" onclick="openModal();currentSlide(1)" ></a>
							</c:if>
							<c:if test="${empty cacheGuest.profileImage}">
								<img id="profilepic" src="img/default.png" class="img-responsive thumbnail " style="margin-bottom:0;">
							</c:if>
						</div>	
						<div class="col-md-12" style="padding-left:0;" >
							<div class="profiletable">
								<table  style="margin-left: 20px;" width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr><td><a href="myPhotos">My Photos</a></td></tr>
									<tr><td><a href="myProfile">Edit Profile</a></td></tr>
									<tr><td><a href="myProfile">Edit Partner Preferences</a></td></tr>
									<c:if test="${cacheGuest.roleId != '4' && cacheGuest.membership_status!='0'}">
					            		
					            	</c:if>
									
								</table>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				
				<div class="panel panel-success">
					<div class="panel-body">
						<h4><strong>Messages</strong></h4>
						<div class="tabbable" id="tabs-343694">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#inbox" data-toggle="tab"><strong>INBOX</strong></a></li>
								<li><a href="#sent" data-toggle="tab"><strong>SENT</strong></a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="inbox">
									<table width="100%" class="dotted-seperator">
										<tr>
											<td height="30"><a href="#" onclick="displayInbox('inbox','pending_requests')">Pending</a></td>
											<td><span class="badge pull-right">${cacheGuest.pendingRequestsCount}</span></td>
										</tr>
										<tr>
											<td height="30"><a href="#" onclick="displayInbox('inbox','accepted_requests')">Accepted</a></td>
											<td><span class="badge pull-right">${cacheGuest.acceptedInterestCount}</span></td>
										</tr>
										<%-- <tr>
											<td height="30"><a href="profileViewedMembers">Profile Viewed</a></td>
											<td><span class="badge pull-right">${cacheGuest.profileViewedCount}</span></td>
										</tr> --%>
									</table>
								</div>
								<div class="tab-pane" id="sent">
									<table width="100%" class="dotted-seperator">
										<tr>
											<td height="30"><a href="#" onclick="displayInbox('sent','sent_requests')">All</a></td>
											<td><span class="badge pull-right">${cacheGuest.sentInterestCount}</span></td>
										</tr>
										<tr>
											<td height="30"><a href="#" onclick="displayInbox('sent','awaiting_requests')">Awaiting Reply</a></td>
											<td><span class="badge pull-right">${cacheGuest.awaitingInterestCount}</span></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div><div class="panel-group" id="accordion">
    <div class="panel panel-default">
        <div class="panel-heading">
             <h4 class="panel-title">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel1"><i class="glyphicon glyphicon-minus"></i>Membership Details</a>
            </h4>

        </div>
        <div id="panel1" class="panel-collapse collapse in">
            <div class="panel-body">
            	<c:if test="${cacheGuest.roleId == '4'}">
            		Not a paid member.
            	</c:if>
            	<c:if test="${cacheGuest.roleId != '4'}">
	            	<c:if test="${membership_details.validity <= 0}">
	            		Your membership validity is over on <c:out value="${membership_details.renewal_date}" /><br>
	            		<a type="button" class="btn btn-primary btn-block" href="memberShipPage">Renew Membership</a>
	            	</c:if>
	            	<c:if test="${membership_details.validity > 0}">
		            	
		            		<b><c:out value="${membership_details.name}" /></b><br>
			            	<c:out value="${membership_details.validity}" /> days remaining <br>
			            	Balance Profiles Limit:<c:out value="${allowed_profiles_limit}" />/
			            	<c:out value="${membership_details.allowed_profiles_limit}" />
		            	
	            	</c:if>
	            </c:if>
            	
            </div>
        </div>
    </div>
    
    
</div>
			</div>
			<div id="dial1"></div>