<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

				<div class="col-md-5 col-sm-12"></div>
	            <div  class="clearfix"></div>    
			</div>
		</div>

		<div class="row">
			<div class="midcontnet">
				<div class="col-md-8">
					<!-- 3rd Step starts here-->
					<div id="thirdForm">
						<div class="col-md-12 text-center">
							<h3>Upgrade Membership</h3>
					    </div>
					    <div class="col-md-12 table-responsive">
					    	<div class="well">
					    		<table class="table table-hover">
					    			<thead style="background: #4CAF50;color: white;">
					    				<tr>
					    					<th>Services</th><th>Duration<br>(Months)</th><th>Amount<br>(INR)</th><th>Messages</th><th>Profiles</th>
					    					<th>Highlight<br>Profile</th><th>Chat</th><th>Horoscope<br>View</th><th>Astrology<br>Match</th>
					    				</tr>
					    			</thead>
					    			<tbody>
					    				<%-- <c:if test="${not empty packagesList}">
					    					<c:forEach items="${packagesList}" var="packagee">
					    						<tr>
							    					<th><c:out value="${packagee.name}"/></th><td>3</td><td>1299</td><td><i style="color: red;" class="fa fa-times"></i></td><td>25</td>
							    					<td><i style="color: red;" class="fa fa-times"></i></td><td><i style="color: red;" class="fa fa-times"></i></td>
							    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
							    				</tr>
					    					</c:forEach>
					    				</c:if> --%>
					    				<tr>
					    					<th>Classic</th><td>3</td><td>1299</td><td><i style="color: red;" class="fa fa-times"></i></td><td>25</td>
					    					<td><i style="color: red;" class="fa fa-times"></i></td><td><i style="color: red;" class="fa fa-times"></i></td>
					    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
					    				</tr>
					    				<tr>
					    					<th>Classic Plus</th><td>6</td><td>2499</td><td><i style="color: red;" class="fa fa-times"></i></td><td>45</td>
					    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
					    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
					    				</tr>
					    				<tr>
					    					<th>Premium</th><td>6</td><td>5299</td><td>Unlimited</td><td>65</td>
					    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
					    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
					    				</tr>
					    				<tr>
					    					<th>Premium Plus</th><td>6</td><td>7499</td><td>Unlimited</td><td>85</td>
					    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
					    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
					    				</tr>
					    				<tr style="background: #ff8080;color: white;">
					    					<th>Aarna Premium</th><td>Till Marry</td><td>14999</td>
					    					<td>Premium Benefits</td><td>Meet Ups</td><td>High priority</td>
					    					<td colspan="3">Quick Response</td>
					    				</tr>
					    			</tbody>
					    			<tfoot>
					    				<tr>
<!-- 					    					<th colspan="7" style="text-align: right;"><a href="memberShipPage" class="btn1 btn btn-info">Upgrade</a></th> -->
					    					<th colspan="2"><a href="dashboard" class="btn1 btn btn-info">My Account</a></th>
					    				</tr>
					    			</tfoot>
					    		</table>
					    	</div>
						<div hidden="true" class="col-md-12">
					    	<div class="well">
					    		<form:form commandName="payment" action="savePayment" class="form-horizontal" id="payment-form" role="form" method="post">
					    		<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label class="col-md-4 control-label required">Membership Package<span style="color:red;">*</span></label>
											<div class="col-md-6">
										  		 <form:select path="packageId" onfocus="removeBorder(this.id)" class="form-control validate">
													<form:option value="">-- Select Package--</form:option>
													<form:options items="${packages}"/>
												</form:select>
										  		<div><form:errors path="packageId" cssClass="error" /></div> 
											</div>
									  	</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-offset-4 col-md-8">
										<div class="form-group">
											<div class="col-md-6">
												<input class="btn btn-primary" type="submit" id="submit1" value="Make Payment">
												<input class="btn btn-danger cancel" type="reset" id="reset11" value="Reset">
											</div>
										</div>
									</div>
								</div>
								</form:form>
					    	</div>
						</div>
					</div>
					<!-- 3rd Step ends here-->
				</div>

 <%@ include file="userStepsFooter.jsp"%>