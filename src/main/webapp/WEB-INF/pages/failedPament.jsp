<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%-- <%= request.getAttribute("params")%> --%>
Name : <c:out value="${params.firstname}"></c:out><br>
Total Fee : <c:out value="${params.amount}"></c:out><br>
  Payment Status:  <c:out value="${params.status}"></c:out><br>
  Transaction Id :  <c:out value="${params.txnid}"></c:out><br>
<script type="text/javascript">
// var params = ${params };
</script>

</body>
</html>