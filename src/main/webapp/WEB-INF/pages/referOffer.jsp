<%@ include file="userCommonHeader.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
  

<div class="container" id="printDiv"  style="background:#fff; min-height:500px;">
	
	<div align="center"><img src="${baseurl }/user/images/logo1.jpg" alt="logo"></div>
<br>
	<table align="center" style="min-width: 680px;min-height:0px">
    
	</table>
	<div class="col-md-12"><img src="../nimages/referf.png" class="img-responsive"/></div>
	<div class="col-md-3"></div>
	<div class="col-md-6" >
	<form:form commandName="payment"  class="form-horizontal" id="payment-form" role="form" method="post">
	<input type="hidden" id="package_id" name="package_id" value="${selected_package_id}" />
	<table class="table table-bordered table-responsive" align="center" >      
		
      <tr>
        
        <th>Plan</th>
        <td id="">${package_name}</td>
        </tr>
         <tr>
        
        <th>Referral Discount</th>
        <td id="">${discount}%</td>
        </tr>
        <tr>
       
        <th>Net Amount</th>
        <td id="">Rs.${net_amount}</td>
      </tr>
      <tr>
      <th>Payment</th><td><a href="#" type="button" class="btn btn-success" id="" onclick="submitPayment(event);">Submit</a></td></tr>
      
  </table>
  </form:form>
  </div>
  <div class="col-md-2">
<%-- <div align="center">	<c:if test="${not empty cacheGuest.profileImage}">
        		<img src="${cacheGuest.profileImage}" alt="passport pic" id="imageID1" style="width: 150px;height: 150px;">
				
			</c:if>
			<c:if test="${empty cacheGuest.profileImage}">
				<img src="img/default.png" alt="passport pic" id="imageID1" style="width: 150px;height: 150px;">
				
			</c:if></div> --%>
			</div><div class="clearfix"></div>
  <div class="col-md-3" style="text-align: center;"></div>
       <div class="col-md-3" style="text-align: center;">
       
       </div>
       <!-- <div class="col-md-3" style="text-align: center;">
       		<a href="dashboard" type="button" class="btn btn-primary noPrint" id="" >Submit</a>
       </div> -->
       <!-- <div class="col-md-2" style="text-align: center;">
       		<p><a href="HomePage" type="button" class="btn btn-success noPrint" id="homepagBtn" >Goto HomePage</a></p>
       
       </div> -->
       <br><br>
</div>
<script>
	function submitPayment(event){
		$("#makePaymentBtn").attr("disabled",true);
		$("#makePaymentBtn").val("Please wait...");
		$("#payment-form").attr('action',"savePayment");
		$("#payment-form").submit();
		event.preventDefault(); 
	}
       
</script> 
<%@ include file="userFooter.jsp"%>