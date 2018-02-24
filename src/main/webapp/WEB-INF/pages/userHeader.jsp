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
								<a href="#" onclick="zoomImage('${cacheGuest.profileImage}');" id="profilePicOuterTag"><img id="profilepic" src="${cacheGuest.profileImage}" class="img img-responsive thumbnail watermark_text" style="margin-bottom:0;height: 120px;width: 150px;"></a>
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
									<tr><td><a href="#">Edit Partner Preferences</a></td></tr>
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
											<td height="30"><a href="pendingRequests">Pending</a></td>
											<td><span class="badge pull-right">${cacheGuest.pendingRequestsCount}</span></td>
										</tr>
										<tr>
											<td height="30"><a href="acceptedRequests">Accepted</a></td>
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
											<td height="30"><a href="sentRequests">All</a></td>
											<td><span class="badge pull-right">${cacheGuest.sentInterestCount}</span></td>
										</tr>
										<tr>
											<td height="30"><a href="sentRequests">Awaiting Reply</a></td>
											<td><span class="badge pull-right">${cacheGuest.sentInterestCount}</span></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="dial1"></div>