<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    <%
String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
session.setAttribute("baseurl", baseurl);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Aarna Matrimony</title>
  <!-- PLUGINS CSS STYLE -->

  <link href="${baseurl}/css/bootstrap.min.css" rel="stylesheet">
  

<!--   <link rel="stylesheet" href="plugins/selectbox/select_option1.css"> -->

<!--   <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css"> -->


<!--   <link rel="stylesheet" type="text/css" href="plugins/rs-plugin/css/settings.css" media="screen"> -->

  
	<script src="${baseurl }/js/jquery.min.js"></script>
	<script src="${baseurl }/js/jquery-ui.min.js"></script>

  <!-- CUSTOM CSS -->

  <link rel="stylesheet" href="${baseurl }/css1/style.css">

  <link rel="stylesheet" href="${baseurl }/css1/default.css" id="option_color">
</head>
<body>
<%-- <%= request.getAttribute("allOrders1")%><br> --%>
<%-- <%-- <img alt="" src="${baseurl }/img/9TKOM.png"> --%>
<%-- Name : <c:out value="${params.firstname }"></c:out><br> --%>
<%-- Total Fee : <c:out value="${params.amount }"></c:out><br> --%>
<%--   Payment Status:  <c:out value="${params.status }"></c:out><br> --%>
<%--   Transaction Id :  <c:out value="${params.txnid }"></c:out><br> --%>
<div class="container">
	
	<div><img src="${baseurl }/img/header-bill.jpg" alt="logo.com"></div>

	<table align="center" style="min-width: 680px;min-height:0px">
    <tr>
        <th rowspan="3">
        	
        	<c:if test="${not empty cacheGuest.profileImage}">
        		<img src="${cacheGuest.profileImage}" alt="passport pic" id="imageID1" style="width: 50px;height: 50px;">
				
			</c:if>
			<c:if test="${empty cacheGuest.profileImage}">
				<img src="img/default.png" alt="passport pic" id="imageID1" style="width: 50px;height: 50px;">
				
			</c:if>
        </th>
      <tr> 
<!--       <td>Date:xx/xx/xxxx</td> -->
<!--       <td>Time:xx:xx</td> -->
      </tr>
      </tr>
	</table>
	<table class="table table-bordered" align="center" style="min-width: 680px;min-height:200px">      
		<tr>
        <th>Name</th>
        <td id="nameID">xxxxxx</td>
        <th>Payment done on:</th>
        <td id="createdDate">xxxxxx</td>
        </tr>
      
       <tr>
        <th>Email</t>
        <td id="email">xxxxxx</td>
        <th>Total Price</th>
        <td id="totalPrice">xxxxxx</td>
      </tr>
      
      <tr>
        <th>Transaction ID</th>
        <td id="txid">xxxxxx</td>
        
      </tr>
  </table>
  
       <div style="text-align: center;">
       <button onclick="printpage()" id="printpagebutton">Print</button>
       </div>
       <div style="text-align: center;">
       		<a href="dashboard" type="button" class="btn btn-primary" id="myaccountBtn" >Goto My Account</a>
       </div><br>
       <div style="text-align: center;">
       		<p><a href="HomePage" type="button" class="btn btn-primary" id="homepagBtn" >Goto HomePage</a></p>
       
       </div>
       <script>
       function printpage() {
           var printButton = document.getElementById("printpagebutton");
           printButton.style.visibility = 'hidden';
           $("#printButton").attr("hidden",true);
           $("#myaccountBtn").attr("hidden",true);
           $("#homepagBtn").attr("hidden",true);
           window.print()
           printButton.style.visibility = 'visible';
           $("#printButton").removeAttr("hidden");
           $("#myaccountBtn").removeAttr("hidden");
           $("#homepagBtn").removeAttr("hidden");
       }
      var listOrders1 = ${payment_details};
  	if (listOrders1 != "") {
  		$.each(listOrders1,function(i, orderObj) {
  			$("#createdDate").text(orderObj.paymentDate);
  			$("#txid").text(orderObj.transactionId);
  			$("#totalPrice").text(orderObj.price);
  			$("#email").text(orderObj.email);
  			$("#nameID").text(orderObj.firstName+" "+orderObj.lastName);
  			// $("#imageID1").attr("src", "${baseurl }/"+orderObj.memberImage);
  			
  			/*$("#createdBy").text(orderObj.createdBy); */
  			// var date =new Date(orderObj.createdDate);
  			//date=	String(date).replace("GMT+0530 (India Standard Time)","")
//   			date =date.replace("GMT+0530 (India Standard Time)","") ;
  			//$("#createdDate").text(date);
//   			alert(new Date(orderObj.createdDate));
  		});
  	}
</script>
</div>
</body>
<script type="text/javascript">
// var params = ${params };
</script>

</html>