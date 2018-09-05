<%@ include file="userCommonHeader.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<style>
.failed {
padding:50px;

}

</style>
 <%--    <%
String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
session.setAttribute("baseurl", baseurl);
%> --%>
<div class="container" style="background:#fff;">
<div class="col-md-12 failed">
<%-- <%= request.getAttribute("params")%> --%>
<div class="col-md-3"></div>
<div class="col-md-6">
<table class="table table-bordered" >
<tr><td>Name</td><td><c:out value="${params.firstname} ${params.lastname}"></c:out></td></tr>
<tr><td>Total Fee </td><td><c:out value="${params.amount}"></c:out></td></tr>
 <tr><td> Payment Status</td><td> <c:out value="${params.status}"></c:out></td></tr>
  <tr><td>Transaction Id</td><td>  <c:out value="${params.txnid}"></c:out></td></tr>
  </table>
  
   </div>
   <div class="col-md-3"></div><div class="clearfix"></div>
    <div class="col-md-3"></div>
   <div class="col-md-3" style="text-align: center;">
   		<a href="memberShipPage" type="button" class="btn btn-primary" id="paymentBtn" >Goto Payment Page</a>
   </div>
   <div class="col-md-3" style="text-align: center;">
   		<p><a href="dashboard" type="button" class="btn btn-success" id="homepagBtn" >Goto My Account</a></p>
   
   </div></div></div>
<script type="text/javascript">
// var params = ${params };
</script>
<%@ include file="userFooter.jsp"%>
