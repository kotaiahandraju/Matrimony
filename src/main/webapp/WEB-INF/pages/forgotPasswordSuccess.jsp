<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<style>
.copyright {
position:fixed;
bottom:0;
width:100%;
} 
</style>
				<div class="col-md-5 col-sm-12"></div>
	            <div  class="clearfix"></div>    
			</div>
		</div>
     
		<div class="row">
			<div class="midcontnet">
				<div id="fpStep1">
					<div class="panel panel-success" style="padding:50px;">
	   					<c:if test="${message == 'success' }">
				    		<span>New password has been sent to your ${sentToStr}.</span><br><br>
				    		<a href="HomePage" class="btn4 btn btn-info">Login</a> with new password.
				    	</c:if>
				    	<c:if test="${message == 'failed' }">
				    		<div class="alert alert-success fadeIn animated">Some problem occured while sending the new password!! Please Try again.</div>
				    		<a href="HomePage" class="btn4 btn btn-info">Go To HomePage</a>
						</c:if>
	   					
		             		
		             			
						
					</div>
				</div>
				
<script src="${baseurl }/js/jquery-ui.min.js"></script>


<%@ include file="userStepsFooter.jsp"%>