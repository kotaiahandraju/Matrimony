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

		<h1 align='center' style='font-size: 36px;'>Membership</h1>
<ul class="cd-pricing-list cd-bounce-invert">

			<li style="width: 17%; border: 3px solid;">
				<ul class="cd-pricing-wrapper" style="width: 186px;">
					<li data-type="monthly" style="height: 311px;" class="is-visible" data-toggle="collapse" data-target="#demo">
					<br>
					<label style='margin-left: 90px;'><input type="radio"></label>
					<button type="button" style='background: transparent; font-size: 24px;' class="btn btn-block">
					 3&nbsp;Months</button>
						<header class="cd-pricing-header">
							<h2>CLASSIC</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency"><i class="fa fa-rupee"></i></span>
								<span class="cd-value" style='font-size: 32px;'>4500</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html">Select</a>
						</footer> <!-- .cd-pricing-footer -->
					</li>
				</ul> <!-- .cd-pricing-wrapper -->
			</li>
			&nbsp;&nbsp;&nbsp;
				<li class="cd-popular" style="width: 17%; margin: 0px 0px 0px 13px;">
				<ul class="cd-pricing-wrapper" style="width: 200px;">
					<li data-type="monthly" class="is-visible" style='height: 317px;' data-toggle="collapse" data-target="#demo">
						<br>
						<label style='margin-left: 90px;'><input type="radio"></label>
					<button type="button" style='background: transparent; font-size: 24px;' class="btn btn-block">
					 3&nbsp;Months</button>
						<header class="cd-pricing-header">
							<h2>CLASSIC ADVANTAGE</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency"><i class="fa fa-rupee"></i></span>
								<span class="cd-value" style='font-size: 32px;'>5200</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html" style='margin: -15px 0px 0px 0px;'>Select</a>
						</footer> <!-- .cd-pricing-footer -->
					</li>
				</ul> <!-- .cd-pricing-wrapper -->
			</li>

			<li style="width: 17%; border: 3px solid; margin: 0px 0px 0px 19px;">
				<ul class="cd-pricing-wrapper" style="width: 186px;">
					<li data-type="monthly" class="is-visible" style='height: 311px;' data-toggle="collapse" data-target="#demo">
						<br>
						<label style='margin-left: 90px;'><input type="radio"></label>
					<button type="button" style='background: transparent; font-size: 24px;' class="btn btn-block">
					 3&nbspMonths</button>
						<header class="cd-pricing-header">
							<h2>CLASSIC PREMIUM</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency"><i class="fa fa-rupee"></i></span>
								<span class="cd-value" style='font-size: 32px;'>6500</span>
							</div>
							<br>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html" style='margin: -35px 0px 0px 0px;'>Select</a>
						</footer>  <!-- .cd-pricing-footer -->
					</li>
				</ul> <!-- .cd-pricing-wrapper -->
			</li>
			
			<li class="cd-popular" style="width: 17%; margin: 0px 0px 0px 13px; margin: 0px 0px 0px 19px;">
				<ul class="cd-pricing-wrapper" style="width: 200px;">
					<li data-type="monthly" class="is-visible" style='height: 317px;' data-toggle="collapse" data-target="#demo">
						<br>
						<label style='margin-left: 90px;'><input type="radio"></label>
					<button type="button" style='background: transparent; font-size: 24px;' class="btn btn-block">
					 3&nbsp;Months</button>
						<header class="cd-pricing-header">
							<h2>ASSISTED SERVICE</h2>
							<br>
							<div class="cd-price">
								<span class="cd-currency"><i class="fa fa-rupee"></i></span>
								<span class="cd-value" style='font-size: 32px;'>8,000</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html" style='margin: -15px 0px 0px 0px;'>Select</a>
						</footer> <!-- .cd-pricing-footer -->
					</li>
				</ul> <!-- .cd-pricing-wrapper -->
			</li>
			
			<li style="width: 17%; border: 3px solid; margin: 0px 0px 0px 19px;">
				<ul class="cd-pricing-wrapper" style="width: 186px">
					<li data-type="monthly" style='height: 311px;' class="is-visible" data-toggle="collapse" data-target="#demo">
						<br>
						<label style='margin-left: 90px;'><input type="radio"></label>
						<header class="cd-pricing-header">
							<h2>TILL U MARRY</h2>
							<h4>(1 Year)</h4>
							<br>
							<div class="cd-price">
								<span class="cd-currency"><i class="fa fa-rupee"></i></span>
								<span class="cd-value" style='font-size: 32px;'>10,900</span>
							</div>
						</header> <!-- .cd-pricing-header -->

						<footer class="cd-pricing-footer">
							<a class="cd-select" href="pay.html" style="margin: 21px 0px 0px 0px;">Select</a>
						</footer>  <!-- .cd-pricing-footer -->
					</li>
				</ul> <!-- .cd-pricing-wrapper -->
			</li>
		</ul> <!-- .cd-pricing-list -->
</div>
</div>
<div class="well" id="demo" style='width: 1100px;'>
<div class="row">
<div class="col-md-4">
<i class="fa fa-envelope-o" style='font-size: 28px;'></i>&nbsp;Send Unlimited Personalized Messages
</div>
<div class="col-md-4">
<i class="glyphicon glyphicon-phone" style='font-size: 28px;'></i>&nbsp;View mobile numbers of 40 members to contact them directly.
</div>
<div class="col-md-4">
<i class="fa fa-comments"  style='font-size: 28px;'></i>&nbsp;Chat with Prospects Directly.
</div>
</div>
</div>	
</div>


 <%@ include file="userStepsFooter.jsp"%>