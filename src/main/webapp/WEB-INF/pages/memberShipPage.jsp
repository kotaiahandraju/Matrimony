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
						<div class="col-md-12">
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