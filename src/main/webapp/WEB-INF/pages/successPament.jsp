<%@ include file="userCommonHeader.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
  

<div class="container"  style="background:#fff;">
	
	<div align="center"><img src="${baseurl }/user/images/logo1.jpg" alt="logo"></div>
<br>
	<table align="center" style="min-width: 680px;min-height:0px">
    <%-- <tr align="right">
        <th rowspan="3" align="right">
        	
        	<c:if test="${not empty cacheGuest.profileImage}">
        		<img src="${cacheGuest.profileImage}" alt="passport pic" id="imageID1" style="width: 50px;height: 50px;">
				
			</c:if>
			<c:if test="${empty cacheGuest.profileImage}">
				<img src="img/default.png" alt="passport pic" id="imageID1" style="width: 50px;height: 50px;">
				
			</c:if>
        </th>
      <tr>  --%>
<!--       <td>Date:xx/xx/xxxx</td> -->
<!--       <td>Time:xx:xx</td> -->
      </tr>
      </tr>
	</table>
	<div class="col-md-3"></div>
	<div class="col-md-6">
	<table class="table table-bordered table-responsive" align="center" >      
		<tr>
        <th>Name</th>
        <td id="nameID">xxxxxx</td>
        
        </tr>
      
       <tr>
        <th>Email</t>
        <td id="email">xxxxxx</td>
       
      </tr>
      <tr>
        
        <th>Payment done on:</th>
        <td id="createdDate">xxxxxx</td>
        </tr>
         <tr>
        
        <th>Package Name:</th>
        <td id="createdDate">xxxxxx</td>
        </tr>
        <tr>
       
        <th>Total Price</th>
        <td id="totalPrice">xxxxxx</td>
      </tr>
      <tr>
        <th>Transaction ID</th>
        <td id="txid">xxxxxx</td>
        
      </tr>
  </table></div>
  <div class="col-md-3">
<%-- <div align="center">	<c:if test="${not empty cacheGuest.profileImage}">
        		<img src="${cacheGuest.profileImage}" alt="passport pic" id="imageID1" style="width: 150px;height: 150px;">
				
			</c:if>
			<c:if test="${empty cacheGuest.profileImage}">
				<img src="img/default.png" alt="passport pic" id="imageID1" style="width: 150px;height: 150px;">
				
			</c:if></div> --%>
			</div><div class="clearfix"></div>
  <div class="col-md-3" style="text-align: center;"></div>
       <div class="col-md-2" style="text-align: center;">
       <button class="btn btn-warning" onclick="printpage()" id="printpagebutton">Print</button>
       </div>
       <div class="col-md-2" style="text-align: center;">
       		<a href="dashboard" type="button" class="btn btn-primary" id="myaccountBtn" >Goto My Account</a>
       </div>
       <div class="col-md-2" style="text-align: center;">
       		<p><a href="HomePage" type="button" class="btn btn-success" id="homepagBtn" >Goto HomePage</a></p>
       
       </div>
       <br><br>
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
<%@ include file="userFooter.jsp"%>