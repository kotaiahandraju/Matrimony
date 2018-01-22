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
					    <form:form commandName="payment" action="savePayment" class="form-horizontal" id="payment-form" role="form" method="post">
					    	<div class="well">
					    		<table class="table table-hover">
					    			<thead style="background: #4CAF50;color: white;">
					    				<tr>
					    					<th>Select</th><th>Services</th><th>Duration<br>(Months)</th><th>Amount<br>(INR)</th><th>Messages</th><th>Profiles</th>
					    					<th>Highlight<br>Profile</th><th>Chat</th><th>Horoscope<br>View</th><th>Astrology<br>Match</th>
					    				</tr>
					    			</thead>
					    			<tbody>
					    				 <c:if test="${not empty packagesList}">
					    					<c:forEach items="${packagesList}" var="pack">
					    						<c:set var="packName" value="${pack.name}"/>
							    				<c:if test="${packName != 'Aarna Premium' }">
						    						<tr><td><input type="radio" name="package_id" value="${pack.id}" />  </td>
								    					<th><c:out value="${pack.name}"/></th>
								    						<td><c:out value="${pack.duration}"/></td>
								    						<td><c:out value="${pack.price}"/></td>
								    						<td>
								    							<c:set var="packMsg" value="${pack.allowed_messages_limit}"/>
								    							<c:if test="${packMsg == null }">
								    								<i style="color: red;" class="fa fa-times"></i>
								    							</c:if>
								    							<c:if test="${packMsg != null }">
								    								<c:out value="${packMsg}"/>
								    							</c:if>
								    							
								    						</td>
								    						<td><c:out value="${pack.allowed_profiles_limit}"/></td>
								    						<td>
								    							<c:set var="packHighlight" value="${pack.highlight_profile}"/>
								    							<c:if test="${packHighlight == null }">
								    								<i style="color: red;" class="fa fa-times"></i>
								    							</c:if>
								    							<c:if test="${packHighlight != null }">
								    								<i style="color: green;" class="fa fa-check"></i>
								    							</c:if>
								    						</td>
								    						<td>
								    							<c:set var="packChat" value="${pack.chat_allowed}"/>
								    							<c:if test="${packChat == null }">
								    								<i style="color: red;" class="fa fa-times"></i>
								    							</c:if>
								    							<c:if test="${packChat != null }">
								    								<i style="color: green;" class="fa fa-check"></i>
								    							</c:if>
								    						</td>
								    						<td>
								    							<c:set var="packHoroscope" value="${pack.horoscope_view}"/>
								    							<c:if test="${packHoroscope == null }">
								    								<i style="color: red;" class="fa fa-times"></i>
								    							</c:if>
								    							<c:if test="${packHoroscope != null }">
								    								<i style="color: green;" class="fa fa-check"></i>
								    							</c:if>
								    						</td>
								    					<td>
								    						<%-- <c:set var="packAstroMatch" value="${pack.Astrology_match}"/>
							    							<c:if test="${packAstroMatch == null }">
							    								<i style="color: red;" class="fa fa-times"></i>
							    							</c:if>
							    							<c:if test="${packAstroMatch != null }">
							    								<i style="color: green;" class="fa fa-check"></i>
							    							</c:if> --%>
								    					</td>
								    				</tr>
								    			</c:if>
								    			<c:if test="${packName == 'Aarna Premium' }">
								    				<tr style="background: #ff8080;color: white;">
								    					<td><input type="radio" name="package_id" value="${pack.id}" />  </td>
								    					<th><c:out value="${pack.name}"/></th><td>Till Marry</td><td><c:out value="${pack.price}"/></td>
								    					<td>Premium Benefits</td><td>Meet Ups</td><td>High priority</td>
								    					<td colspan="3">Quick Response</td>
								    				</tr>
								    			</c:if>
					    					</c:forEach>
					    				</c:if>
					    				<!-- <tr>
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
					    				</tr> -->
					    			</tbody>
					    			<tfoot>
					    				<tr>
<!-- 					    					<th colspan="7" style="text-align: right;"><a href="memberShipPage" class="btn1 btn btn-info">Upgrade</a></th> -->
					    					<th colspan="2"><a href="dashboard" class="btn1 btn btn-info">My Account</a></th>
					    					<th colspan="2"><input class="btn btn-primary" type="submit" id="submit1" value="Make Payment"></th>
					    				</tr>
					    			</tfoot>
					    		</table>
					    	</div>
						</form:form>
					</div>
					<!-- 3rd Step ends here-->
				</div>

 <%@ include file="userStepsFooter.jsp"%>