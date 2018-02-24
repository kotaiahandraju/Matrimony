<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<style>
.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #f5f5f5;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
}
</style>
				<div class="col-md-5 col-sm-12"></div>
	            <div  class="clearfix"></div>    
			</div>
		</div>

		<div class="row">
			<div class="midcontnet">
				<div class="col-md-12">
					<!-- 3rd Step starts here-->
					<div id="thirdForm">
						<div class="col-md-12 text-center">
							<h3>Upgrade Membership</h3>
					    </div>			
					    <div class="col-md-9"  style="margin-top:20px;">
					    <form:form commandName="payment"  class="form-horizontal" id="payment-form" role="form" method="post">
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
								    							<c:choose>
																    <c:when test="${packMsg == null || packMsg=='NO'}">
																        <i style="color: red;" class="fa fa-times"></i>
																    </c:when>    
																    <c:otherwise>
																        <c:out value="${packMsg}"/>
																    </c:otherwise>
																</c:choose>
								    							
								    						</td>
								    						<td><c:out value="${pack.allowed_profiles_limit}"/></td>
								    						<td>
								    							<c:set var="packHighlight" value="${pack.highlight_profile}"/>
								    							<c:choose>
																    <c:when test="${packHighlight == '1'}">
																    	<i style="color: green;" class="fa fa-check"></i>
																    </c:when>    
																    <c:otherwise>
																        <i style="color: red;" class="fa fa-times"></i>
																    </c:otherwise>
																</c:choose>
								    						</td>
								    						<td>
								    							<c:set var="packChat" value="${pack.chat_allowed}"/>
								    							<c:choose>
																    <c:when test="${packChat == '1'}">
																    	<i style="color: green;" class="fa fa-check"></i>
																    </c:when>    
																    <c:otherwise>
																        <i style="color: red;" class="fa fa-times"></i>
																    </c:otherwise>
																</c:choose>
								    						</td>
								    						<td>
								    							<c:set var="packHoroscope" value="${pack.horoscope_view}"/>
								    							<c:choose>
																    <c:when test="${packHoroscope == '1'}">
																    	<i style="color: green;" class="fa fa-check"></i>
																    </c:when>    
																    <c:otherwise>
																        <i style="color: red;" class="fa fa-times"></i>
																    </c:otherwise>
																</c:choose>
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
					    					<th colspan="2"><input class="btn btn-primary" type="button" id="makePaymentBtn" value="Make Payment" onclick="makePayment(event)"></th>
					    				</tr>
					    			</tfoot>
					    		</table>
					    	</div>
						</form:form>
					</div>
					<!-- 3rd Step ends here-->
				</div>
<script>
	function makePayment(event){
		var selected_pack = $("input[name=package_id]:checked").val();
		if((typeof(selected_pack) == "undefined") || (selected_pack=="")){
			alert("Select any package");
			return false;
		}else{
			$("#makePaymentBtn").attr("disabled",true);
			$("#makePaymentBtn").val("Please wait...");
			$("#payment-form").attr('action',"savePayment");
			$("#payment-form").submit();
			event.preventDefault(); 
		}
		
		
	}
</script>
 <%@ include file="userStepsFooter.jsp"%>