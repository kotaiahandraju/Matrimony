<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css/membership_style.css"> <!-- Resource style -->
	<script src="js/modernizr.js"></script> <!-- Modernizr -->
  	
	
	
	
	
<style>

.cd-value{
	font-size: 3rem;}
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
					    <div class="col-md-12"  style="margin-top:20px;">
					    <form:form commandName="payment"  class="form-horizontal" id="payment-form" role="form" method="post">
					    	<div class="cd-pricing-container">
		
		
		<ul class="cd-pricing-list cd-bounce-invert" style="margin: 3em 0 0 3em;">
			<li style="width: 19%;">
				<ul class="cd-pricing-wrapper" style="width: 200px;">
					<c:if test="${not empty packagesList}">
    					<c:forEach items="${packagesList}" var="pack">
    						<c:set var="packName" value="${pack.name}"/>
		    				<c:if test="${packName != 'Aarna Premium' }">
		    					<li data-type="monthly" class="is-visible">
									<header class="cd-pricing-header">
										<h2><c:out value="${pack.name}"/></h2>
										<br>
										<div class="cd-price">
											<span class="cd-currency">₹</span>
											<span class="cd-value"><c:out value="${pack.price}"/></span>
											<span class="cd-duration"><c:out value="${pack.duration}"/></span>
										</div>
									</header> <!-- .cd-pricing-header -->
			
									<footer class="cd-pricing-footer">
										<a class="cd-select" href="#" id="makePaymentBtn" onclick="makePayment(${pack.price})">Make Payment</a>
									</footer> <!-- .cd-pricing-footer -->
								</li>
		    				</c:if>
		    				<c:if test="${packName == 'Aarna Premium' }">
		    					<li data-type="monthly" class="is-visible">
									<header class="cd-pricing-header">
										<h2>CLASSIC</h2>
										<br>
										<div class="cd-price">
											<span class="cd-currency">₹</span>
											<span class="cd-value">4500</span>
											<span class="cd-duration">m</span>
										</div>
									</header> <!-- .cd-pricing-header -->
			
									<footer class="cd-pricing-footer">
										<a class="cd-select" href="pay.html">Select</a>
									</footer> <!-- .cd-pricing-footer -->
								</li>
		    				</c:if>
		    			</c:forEach>
		    		</c:if>
		    		
					<li data-type="monthly" class="is-visible">
						<header class="cd-pricing-header">
							<h2>CLASSIC</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency">₹</span>
								<span class="cd-value">4500</span>
								<span class="cd-duration">m</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer> <!-- .cd-pricing-footer -->
					</li>

					<li data-type="yearly" class="is-hidden">
						<header class="cd-pricing-header">
							<h2>CLASSIC</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency">₹</span>
								<span class="cd-value">7600</span>
								<span class="cd-duration">m</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer> <!-- .cd-pricing-footer -->
					</li>
				</ul> <!-- .cd-pricing-wrapper -->
			</li>

			<li class="cd-popular" style="width: 19%;">
				<ul class="cd-pricing-wrapper" style="width: 200px;">
					<li data-type="monthly" class="is-visible">
						<header class="cd-pricing-header">
							<h2>CLASSIC ADVANTAGE</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency">₹</span>
								<span class="cd-value">5200</span>
								<span class="cd-duration">m</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer> <!-- .cd-pricing-footer -->
					</li>

					<li data-type="yearly" class="is-hidden">
						<header class="cd-pricing-header">
							<h2>CLASSIC ADVANTAGE</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency">₹</span>
								<span class="cd-value">8400</span>
								<span class="cd-duration">m</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer> <!-- .cd-pricing-footer -->
					</li>
				</ul> <!-- .cd-pricing-wrapper -->
			</li>

			<li style="width: 19%;">
				<ul class="cd-pricing-wrapper" style="width: 200px;">
					<li data-type="monthly" class="is-visible">
						<header class="cd-pricing-header">
							<h2>CLASSIC PREMIUM</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency">₹</span>
								<span class="cd-value">6500</span>
								<span class="cd-duration">m</span>
							</div>
							<br>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer>  <!-- .cd-pricing-footer -->
					</li>

					<li data-type="yearly" class="is-hidden">
						<header class="cd-pricing-header">
							<h2>CLASSIC PREMIUM</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency">₹</span>
								<span class="cd-value">9900</span>
								<span class="cd-duration">m</span>
							</div><br>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer>  <!-- .cd-pricing-footer -->
					</li>
				</ul> <!-- .cd-pricing-wrapper -->
			</li>
			<li class="cd-popular" style="width: 19%;">
				<ul class="cd-pricing-wrapper" style="width: 200px;">
					<li data-type="monthly" class="is-visible">
						<header class="cd-pricing-header">
							<h2>ASSISTED SERVICE</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency">₹</span>
								<span class="cd-value">17,000</span>
								<span class="cd-duration">m</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer> <!-- .cd-pricing-footer -->
					</li>

					<li data-type="yearly" class="is-hidden">
						<header class="cd-pricing-header">
							<h2>ASSISTED SERVICE</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency">₹</span>
								<span class="cd-value">32,000</span>
								<span class="cd-duration">m</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer> <!-- .cd-pricing-footer -->
					</li>
				</ul> <!-- .cd-pricing-wrapper -->
			</li>
			<li style="width: 19%;">
				<ul class="cd-pricing-wrapper" style="width: 200px">
					<li data-type="monthly" class="is-visible">
						<header class="cd-pricing-header">
							<h2>TILL U MARRY</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency">₹</span>
								<span class="cd-value">10,900</span>
								<span class="cd-duration">m</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer>  <!-- .cd-pricing-footer -->
					</li>

					<li data-type="yearly" class="is-hidden">
						<header class="cd-pricing-header">
							<h2>TILL U MARRY</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency">₹</span>
								<span class="cd-value">12,900</span>
								<span class="cd-duration">m</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer>  <!-- .cd-pricing-footer -->
					</li>
				</ul> <!-- .cd-pricing-wrapper -->
			</li>
		</ul> <!-- .cd-pricing-list -->
	</div> <!-- .cd-pricing-container -->
					    	
					    	
					    	
					    	
					    	<%-- <div class="cd-pricing-container">
					    	<ul class="cd-pricing-wrapper" style="width: 200px;">
					    		<c:if test="${not empty packagesList}">
			    					<c:forEach items="${packagesList}" var="pack">
			    						<c:set var="packName" value="${pack.name}"/>
			    						<li data-type="monthly">
			    							<header class="cd-pricing-header">
												<h2><c:out value="${pack.name}"/></h2>
												<br>
												<div class="cd-price">
													<span class="cd-currency">Rs</span>
													<span class="cd-value"><c:out value="${pack.price}"/></span>
													
												</div>
												<div class="cd-price">
													<span class="cd-currency"><c:out value="${pack.duration}"/></span>
												</div>
												<br>
												
											</header> <!-- .cd-pricing-header -->
					
											<footer class="cd-pricing-footer">
												<a class="cd-select" href="pay.html" id="makePaymentBtn" onclick="makePayment(${pack.id})">Make Payment</a>
											</footer> <!-- .cd-pricing-footer -->
			    						</li>
			    					</c:forEach>
			    				</c:if>
					    		
					    	</ul>
					    	</div> --%>
						</form:form>
					</div>
					<!-- 3rd Step ends here-->
				</div>
<script>
	function makePayment(package_id){
		if((typeof(package_id) == "undefined") || (package_id=="")){
			alert("Select any package");
			return false;
		}else{
			$("#makePaymentBtn").removeAttr("onclick");
			$("#makePaymentBtn").removeAttr("href");
			$("#makePaymentBtn").html("Please wait...");
			$("#payment-form").attr('action',"savePayment");
			$("#payment-form").submit();
			event.preventDefault(); 
		}
		
		
	}
</script>
 <%@ include file="userStepsFooter.jsp"%>