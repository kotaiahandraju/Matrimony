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
	<div class="col-md-3"></div>
	<div class="col-md-6" >
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
        
        <th>Payment done on</th>
        <td id="createdDate">xxxxxx</td>
        </tr>
         <tr>
        
        <th>Package Name</th>
        <td id="packageName">xxxxxx</td>
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
       <div class="col-md-3" style="text-align: center;">
       <button class="btn btn-warning noPrint" onclick="PrintElem('#printDiv');" id="printpagebutton">Print</button>
       </div>
       <div class="col-md-3" style="text-align: center;">
       		<a href="dashboard" type="button" class="btn btn-primary noPrint" id="myaccountBtn" >Goto My Account</a>
       </div>
       <!-- <div class="col-md-2" style="text-align: center;">
       		<p><a href="HomePage" type="button" class="btn btn-success noPrint" id="homepagBtn" >Goto HomePage</a></p>
       
       </div> -->
       <br><br>
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
  			$("#packageName").text(orderObj.packageName);
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
  	function PrintElem(elem)
  	{
  		$(".noPrint").hide();
  		$(".printbtn").hide();
  		 $("#printFooter").show();
  	    Popup($(elem).html());
  	    
  	}
  	function Popup(data)
  	{
  		var mywindow = window.open('','new div');

  	    var is_chrome = Boolean(mywindow.chrome);
  	    var isPrinting = false;
  	    mywindow.document.write('<html><head><link rel="stylesheet" type="text/css" href="${baseurl }/user/css/bootstrap.css"></head><body>');
  	    mywindow.document.write(data);
  	   
  	    mywindow.document.write('</body></html>');
  	    mywindow.document.close(); // necessary for IE >= 10 and necessary before onload for chrome

  	$(".printbtn").show();
  	$(".noPrint").show();
  	$("#printFooter").hide();
  	    if (is_chrome) {
  	        mywindow.onload = function() { // wait until all resources loaded 
  	            mywindow.focus(); // necessary for IE >= 10
  	            mywindow.print();  // change window to mywindow
  	            mywindow.close();// change window to mywindow
  	        };
  	    
  	    
  	   } else {
  	        mywindow.document.close(); // necessary for IE >= 10
  	        mywindow.focus(); // necessary for IE >= 10

  	        mywindow.print();
  	        mywindow.close();
  	   }
  		
  		
  		
  	 
  	    return true;
  	}
</script>
<%@ include file="userFooter.jsp"%>