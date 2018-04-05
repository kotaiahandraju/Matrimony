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