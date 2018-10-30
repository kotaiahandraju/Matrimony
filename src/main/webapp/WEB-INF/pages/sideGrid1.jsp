<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.tab td:hover {
    background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab td.active {
    background-color: #ccc;
}
</style>
<div class="col-md-3 products-grid-right">
				<div class="panel panel-success">
					<div class="panel-body">
						<h4><strong>Activity</strong></h4>
						<div class="tabbable" id="tabs-343694">
							
							<div class="tab-content">
								<div class="tab" id="inbox">
									<table width="100%" class="dotted-seperator">
										<tr>
											<td height="30"><a href="#" onclick="displayBlock('inbox','pending_requests');" id="defaultOpen">Inbox</a></td>
											
										</tr>
										<tr>
											<td height="30"><a href="#" id="sent" onclick="displayBlock('sent','sent_requests');" >Sent</a></td>
											
										</tr>
										<tr>
											<td height="30"><a href="#" id="filtered" onclick="displayBlock('filtered','filtered_requests');"  >Filtered</a></td>
											
										</tr>
									</table>
									
									
								</div>
								
							</div>
						</div>
					</div>
				</div>
				<c:if test="${cacheGuest.roleId == '4' || cacheGuest.membership_status == '0'}">
				<a href="#"><img style="border-radius:10px;" src="../images/upgra.jpg" class="img-responsive"/></a>
				</c:if>
				<!-- <div class="panel-group" id="accordion">
    <div class="panel panel-default">
        <div class="panel-heading">
             <h4 class="panel-title">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel1"><i class="glyphicon glyphicon-minus"></i>Panel 1</a>
            </h4>

        </div>
        <div id="panel1" class="panel-collapse collapse in">
            <div class="panel-body">Contents panel 1</div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
             <h4 class="panel-title">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel2"><i class="glyphicon glyphicon-plus"></i>Panel 2</a>
            </h4>

        </div>
        <div id="panel2" class="panel-collapse collapse">
            <div class="panel-body">Contents panel 2</div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
             <h4 class="panel-title">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel3"><i class="glyphicon glyphicon-plus"></i>Panel 3</a>
            </h4>

        </div>
        <div id="panel3" class="panel-collapse collapse">
            <div class="panel-body">Contents panel 3</div>
        </div>
    </div>
</div> -->
			</div>
			
			