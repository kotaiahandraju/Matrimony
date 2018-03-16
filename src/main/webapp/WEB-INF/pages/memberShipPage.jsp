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
.cd-pricing-list li:hover
{
	background: turquoise;
}
</style>	
<br>
<div class='container' style='padding: 0px 0px 0px 39px;'>
<br>
<div class='row' style='margin-left: -29px; margin-right: -30px;;'>
<div class='col-md-12' style='margin: 30px;'>
<<<<<<< HEAD
	<form:form commandName="payment"  class="form-horizontal" id="payment-form" role="form" method="post">
		<h1 align='center' style='font-size: 36px;'>Membership</h1>
		<c:if test="${not empty packagesList}">
			<ul class="cd-pricing-list cd-bounce-invert">
				<c:forEach items="${packagesList}" var="pack">
					<c:set var="packName" value="${pack.name}"/>
					<c:if test="${packName != 'Aarna Premium' }">
						<li style="width: 17%; border: 3px solid;">
							<ul class="cd-pricing-wrapper" style="width: 186px;">
								<li data-type="monthly" style="height: 311px;" class="is-visible" onclick="displayDetails('infoDiv${pack.id}');">
								<br>
								<label style='margin-left: 90px;'><input type="radio" name="package_id" value="${pack.id}"></label>
								<button type="button" style='background: transparent; font-size: 24px;' class="btn btn-block">
								 <c:out value="${pack.duration}"/>&nbsp;Months</button>
									<header class="cd-pricing-header">
										<h2><c:out value="${pack.name}"/></h2>
										<br>
										<div class="cd-price">
											<span class="cd-currency"><i class="fa fa-rupee"></i></span>
											<span class="cd-value" style='font-size: 32px;'><c:out value="${pack.price}"/></span>
										</div>
									</header> <!-- .cd-pricing-header -->
			
									<footer class="cd-pricing-footer">
										<a class="cd-select" href="#" id="makePaymentBtn" onclick="makePayment(event)">Make Payment</a>
									</footer> <!-- .cd-pricing-footer -->
								</li>
							</ul> <!-- .cd-pricing-wrapper -->
						</li>
						
					</c:if>
					<c:if test="${packName == 'Aarna Premium' }">
						<li style="width: 17%; border: 3px solid;">
							<ul class="cd-pricing-wrapper" style="width: 186px;">
								<li data-type="monthly" style="height: 311px;" class="is-visible" onmouseover="displayDetails(infoDiv${pack.id});">
								<br>
								<label style='margin-left: 90px;'><input type="radio" name="package_id" value="${pack.id}"></label>
								<button type="button" style='background: transparent; font-size: 24px;' class="btn btn-block">
								 Till Marriage</button>
									<header class="cd-pricing-header">
										<h2><c:out value="${pack.name}"/></h2>
										<br>
										<div class="cd-price">
											<span class="cd-currency"><i class="fa fa-rupee"></i></span>
											<span class="cd-value" style='font-size: 32px;'><c:out value="${pack.price}"/></span>
										</div>
									</header> <!-- .cd-pricing-header -->
			
									<footer class="cd-pricing-footer">
										<a class="cd-select" href="#" id="makePaymentBtn" onclick="makePayment(event)">Make Payment</a>
									</footer> <!-- .cd-pricing-footer -->
								</li>
								
							</ul> <!-- .cd-pricing-wrapper -->
						</li>
					</c:if>
				</c:forEach>
			</ul>
		</c:if>
	</form:form>		
</div>
</div>
<c:if test="${not empty packagesList}">
	<c:forEach items="${packagesList}" var="pack">
		<c:set var="packName" value="${pack.name}"/>
		<c:if test="${packName != 'Aarna Premium' }">
			<div class="well" id="infoDiv${pack.id}" style='width: 1100px;' hidden="true">
				<div class="row">
					<c:if test="${pack.allowed_messages_limit != null and not empty pack.allowed_messages_limit}">
						<div class="col-md-4">
							<i class="fa fa-envelope-o" style='font-size: 28px;'></i>&nbsp;Send mails to <b><c:out value="${pack.allowed_messages_limit}" /></b> members
						</div>
					</c:if>
					<c:if test="${pack.allowed_profiles_limit != null and not empty pack.allowed_profiles_limit}">
						<div class="col-md-4">
							<i class="glyphicon glyphicon-phone" style='font-size: 28px;'></i>&nbsp;View mobile numbers of/Send interest requests to <b><c:out value="${pack.allowed_profiles_limit}" /></b> members to contact them directly.
						</div>
					</c:if>
				</div>
			</div>	
		</c:if>
	</c:forEach>
</c:if>

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
	function displayDetails(divId){
		$(".well").attr("hidden",true);
		$("#"+divId).removeAttr("hidden");
	}
</script>

 <%@ include file="userStepsFooter.jsp"%>