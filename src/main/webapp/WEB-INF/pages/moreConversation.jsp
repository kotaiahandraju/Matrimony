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
<a type="button"  class="btn btn-success pull-right" > Back</a>
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
						<div class="col-md-12 conver12">
						<div class="col-md-2">
						<img src="images/default.png" class="img-responsive"/>
						</div>
						<div class="col-md-10">
						<h3>Krishna Jonnadula <span><a href="#"><img  data-toggle="tooltip" title="Vie Mobile Number" src="images/micon.png"/></a></span> <span class="pull-right"><a href="#"><i data-toggle="tooltip" title="Delete" class="fa fa-trash-o" style="font-size:16px;"></i></a></span></h3>
						<p>18 Yrs, 4 Ft 6 In / 137 Cms, Hindu: Yadav, Puja, Guntur, Andhra Pradesh, India, B.Sc IT/ Computer Science, Not working</p>
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
								<div class="col-md-12">
									<c:if test="${act_done_by == cacheGuest.id }">
										<c:set var="act_str" value="${'You'}" />
									</c:if>
									<c:if test="${act_done_by != cacheGuest.id }">
										<c:set var="act_str" value="${opp_gender_str}" />
										<c:set var="her_his_you" value="${'your'}" />
									</c:if>
									<c:if test="${act_type == 'profile_viewed' }">
										<c:set var="act_str" value="${act_str} viewed ${her_his_you} profile" />
										<c:set var="short_str" value="${'Profile Viewed'}" />
									</c:if>
									<c:if test="${act_type == 'interest_request' }">
										<c:set var="act_str" value="${act_str} have sent an interest to ${her_his_you}" />
										<c:set var="short_str" value="${'Profile Viewed'}" />
									</c:if>
									<c:if test="${act_type == 'mobile_no_viewed' }">
										<c:set var="act_str" value="${act_str} viewed ${her_his_you} mobile number" />
										<c:set var="short_str" value="${'Mobilenumber Viewed'}" />
									</c:if>
									<c:if test="${act_type == 'email' }">
										<c:set var="act_str" value="${act_str} have sent an email to ${her_his_you}" />
									</c:if>
								<p><span><img src="images/arrowaccepted.png"/> <c:out value="${short_str}" /> <span class="pull-right"><c:out value="${conversation.created_on}" /> <a href="#"><i data-toggle="tooltip" title="Delete" class="fa fa-trash-o" style="font-size:16px;"></i></a></span></p>
								<p><strong> &nbsp; &nbsp; <c:out value="${act_str}" />.</strong></p>
								<a class="btn btn-danger">Send mail</a> &nbsp; &nbsp;	<a class="btn btn-success">Call Now</a>
								</div>
								<div class="clearfix"></div><br><hr>
							</c:forEach>
						</c:if>
						<div class="col-md-12">
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
						</div>
						<div class="clearfix"></div><br><hr>
</div>
</div>
</div>
<%@ include file="userFooter.jsp"%>