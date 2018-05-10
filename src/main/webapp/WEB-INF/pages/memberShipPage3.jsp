<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ include file="userCommonHeader.jsp"%>

<!-- for-mobile-apps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript">
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); }
	</script>
	<!-- //for-mobile-apps -->
	
    <!-- for Raxus Slider -->
    <link rel="stylesheet" href="css/raxus.css" media="screen" type="text/css">
    <script type="text/javascript" src="js/raxus-slider.min.js"></script>
    <!-- for Raxus Slider #end -->

    <!-- for documentation: you don't need them -->
   
    <link rel="stylesheet" href="documentation/css/documentation.css" media="screen" type="text/css">
    <link rel="stylesheet" href="../yandex.st/highlightjs/8.0/styles/default.min.css" media="screen" type="text/css">
    <script type="text/javascript" src="documentation/js/document.js"></script>
    <script src="documentation/js/highlight.pack.js"></script>
     
  

<style>

input[name=package_id]
{
	cursor: pointer;
}

.demo{
    
}
.pricingTable{
    text-align: center;
    background: #fff;
    margin: 0 -15px;
    box-shadow: 0 0 10px #ababab;
    padding-bottom: 40px;
    border-radius: 10px;
    color: #cad0de;
    transform: scale(1);
    transition: all 0.5s ease 0s;
}
.pricingTable:hover{
    transform: scale(1.05);
    z-index: 1;
}
.pricingTable .pricingTable-header{
    padding: 40px 0;
    background: #f5f6f9;
    border-radius: 10px 10px 50% 50%;
    transition: all 0.5s ease 0s;
}
.pricingTable:hover .pricingTable-header{
    background: #ff9624;
}
.pricingTable .pricingTable-header i{
    font-size: 50px;
    color: #858c9a;
    margin-bottom: 10px;
    transition: all 0.5s ease 0s;
}
.pricingTable .price-value{
    font-size: 35px;
    color: #ff9624;
    transition: all 0.5s ease 0s;
}
.pricingTable .month{
    display: block;
    font-size: 14px;
    color: #121419;
}
.pricingTable:hover .pricingTable-header i,
.pricingTable:hover .price-value,
.pricingTable:hover .month{
    color: #fff;
}
.pricingTable .heading{
    font-size: 24px;
    color: #ff9624;
    margin-bottom: 20px;
    text-transform: uppercase;
}
.pricingTable .pricing-content ul{
    list-style: none;
    padding: 0;
    margin-bottom: 30px;
}
.pricingTable .pricing-content ul li{
    line-height: 30px;
    color: #a7a8aa;
}
.pricingTable .pricingTable-signup button{
    display: inline-block;
    font-size: 15px;
    color: #fff;
    padding: 10px 35px;
    border-radius: 20px;
    background: #ffa442;
    text-transform: uppercase;
    transition: all 0.3s ease 0s;
}
.pricingTable .pricingTable-signup button:hover{
    box-shadow: 0 0 10px #ffa442;
}
.pricingTable.blue .price-value,
.pricingTable.blue .heading .activeblue{
    color: #fff;
}
.pricingTable.blue .price-value, .pricingTable.blue .heading {
    color: #4b64ff;
}
.pricingTable.blue:hover .pricingTable-header,
.pricingTable.blue .pricingTable-signup button, .activeblue{
    background: #4b64ff;
}
.pricingTable.blue .activeblue .pricingTable-signup button:hover{
    box-shadow: 0 0 10px #4b64ff;
}

.activeblue {
    box-shadow: 0 0 10px #4b64ff;
}

.pricingTable.light .price-value,
.pricingTable.light .heading{
    color: #006699;
}
.pricingTable.light:hover .pricingTable-header,
.pricingTable.light .pricingTable-signup button{
    background: #006699;
}
.pricingTable.light .pricingTable-signup button:hover{
    box-shadow: 0 0 10px 3006699;
}
.pricingTable.red .price-value,
.pricingTable.red .heading{
    color: #ff4b4b;
}
.pricingTable.red:hover .pricingTable-header,
.pricingTable.red .pricingTable-signup button{
    background: #ff4b4b;
}
.pricingTable.red .pricingTable-signup button:hover{
    box-shadow: 0 0 10px #ff4b4b;
}
.pricingTable.green .price-value,
.pricingTable.green .heading{
    color: #40c952;
}
.pricingTable.org .price-value,
.pricingTable.org .heading{
    color: #ff9624 ;
}
.pricingTable.org:hover .pricingTable-header,
.pricingTable.org .pricingTable-signup button{
    background: #ff9624;
}
.pricingTable.org .pricingTable-signup button:hover{
    box-shadow: 0 0 10px #ff9624;
}
.benefit {
position: relative;
    background: rgb(244, 251, 254);
    margin-top: 25px;
    
}


.prit {

width:200px;
margin-left:20px;
}
.pricingTable.green:hover .pricingTable-header,
.pricingTable.green .pricingTable-signup button{
    background: #40c952;
}
.pricingTable.green .pricingTable-signup button:hover{
    box-shadow: 0 0 10px #40c952;
}

.pricingTable.blue:hover .price-value,
.pricingTable.light:hover .price-value,
.pricingTable.red:hover .price-value,
.pricingTable.org:hover .price-value,
.pricingTable.green:hover .price-value{
    color: #fff;
}
@media only screen and (max-width: 480px) and (min-width: 320px) {
.prit {
width:100%;
margin-left:0px;
}

}
@media screen and (max-width: 990px){
    .pricingTable{ margin: 0 0 20px 0; }
}
.box_1 {
    float: right;
     margin-top: 0px !important; 
}
.benefit1 p {
line-height:2.5 !important;
    margin: 0 0 2px 0 !important;
}
.blue1 {
transform:scale(1.05);
z-index:1;
}
.blue2 {
background:#4b64ff !important;
color:#fff !important;
}
.blue2 .month, .blue2 .price-value
{
color: white !important
}
.green1 {
    transform: scale(1.05);
    z-index: 1;
}
.green2 {
background:#40c952 !important;
color:#fff !important;
}
.green2 .month, .green2 .price-value
{
color: white !important
}
.red1 {
    transform: scale(1.05);
    z-index: 1;
}
.red2 {
background:#ff4b4b !important;
color:#fff !important;
}
.red2 .month, .red2 .price-value
{
color: white !important
}

 .org1 {
    transform: scale(1.05);
    z-index: 1;
} 
.org2 {
background:#ff9624 !important;
color:#fff !important;
}
.org2 .month, .org2 .price-value
{
color: white !important
}
.light1 {
    transform: scale(1.05) !important;
    z-index: 1 !important;
}
.light2 {
background:#006699 !important;
color:#fff !important;
}
.light2 .month, .light2 .price-value
{
color: white !important
}
.whitecolor {
color:#fff !important;
}
button {
border:none;}
</style>
<body>
 <div class="container" style="background:#fff; padding-top:25px; z-index:0;">
<div class="demo1">
   <form:form commandName="payment"  class="form-horizontal" id="payment-form" role="form" method="post">
        <div class="row">
        	<c:if test="${not empty packagesList}">
        		<c:forEach items="${packagesList}" var="pack" varStatus="theCount">
					<c:set var="packName" value="${pack.name}"/>
					<c:if test="${packName != 'Aarna Family' }">
						<div class="col-md-2 col-sm-2 prit" onclick="displayDetails('infoDiv${pack.id}');">
						 <c:if test = "${theCount.index=='0'}">
			                <div class="pricingTable blue" id="pricing_${pack.id}">
			                    <div class="pricingTable-header">
			                      
			                        <div class="price-value"><li class="fa fa-inr"></li> <c:out value="${pack.price}"/> <span class="month"><c:out value="${pack.duration}"/> Months</span> </div>
			                    </div>
			                </c:if>
			                 <c:if test = "${theCount.index=='1'}">
			                <div class="pricingTable green" id="pricing_${pack.id}">
			                    <div class="pricingTable-header">
			                      
			                        <div class="price-value "><li class="fa fa-inr"></li> <c:out value="${pack.price}"/> <span class="month"><c:out value="${pack.duration}"/> Months</span> </div>
			                    </div>
			                </c:if>
			                 <c:if test = "${theCount.index=='2'}">
			                <div class="pricingTable red" id="pricing_${pack.id}">
			                    <div class="pricingTable-header">
			                      
			                        <div class="price-value "><li class="fa fa-inr"></li> <c:out value="${pack.price}"/> <span class="month"><c:out value="${pack.duration}"/> Months</span> </div>
			                    </div>
			                </c:if>
			                 <c:if test = "${theCount.index=='3'}">
			                <div class="pricingTable org" id="pricing_${pack.id}">
			                    <div class="pricingTable-header">
			                      
			                        <div class="price-value "><li class="fa fa-inr"></li> <c:out value="${pack.price}"/> <span class="month"><c:out value="${pack.duration}"/> Months</span> </div>
			                    </div>
			                </c:if>
			                 <c:if test = "${theCount.index=='4'}">
			                <div class="pricingTable light" id="pricing_${pack.id}">
			                    <div class="pricingTable-header">
			                      
			                        <div class="price-value "><li class="fa fa-inr"></li> <c:out value="${pack.price}"/> <span class="month"><c:out value="${pack.duration}"/> Months</span> </div>
			                    </div>
			                </c:if>
			                
			                    <h3 class="heading"><c:out value="${pack.name}"/></h3>
			                    <div class="pricing-content">
			                        <ul>
			                            <li><b><input type="radio"  class="benifitscroll"  name="package_id" value="${pack.id}"></input></b></li>
			                            <li><b></b> View Details</li>
			                           <!--  <li><b>50GB</b> Monthly Bandwidth</li>
			                            <li><b>10</b> subdomains</li>
			                            <li><b>15</b> Domains</li> -->
			                        </ul>
			                    </div>
			                    <div class="pricingTable-signup">
			                        <button type="button" href="#" id="makePaymentBtn" disabled="disabled" class="makePaymentBtn" onclick="makePayment(event)">Make Payment</button>
			                    </div>
			                </div>
			            </div>
					</c:if>
					<c:if test="${packName == 'Aarna Family' }">
						<div class="col-md-2 col-sm-2 prit" onclick="displayDetails('infoDiv${pack.id}');">
			                <div class="pricingTable light">
			                    <div class="pricingTable-header light1">
			                      
			                        <div class="price-value  "><li class="fa fa-inr"></li> <c:out value="${pack.price}"/> <span class="month ">Till Marriage</span> </div>
			                    </div>
			                    <h3 class="heading"><c:out value="${pack.name}"/></h3>
			                    <div class="pricing-content">
			                        <ul>
			                            <li><b><input type="radio"  class="benifitscroll"  name="package_id" value="${pack.id}"></input></b></li>
			                            <li><b></b> View Details</li>
			                           <!--  <li><b>50GB</b> Monthly Bandwidth</li>
			                            <li><b>10</b> subdomains</li>
			                            <li><b>15</b> Domains</li> -->
			                        </ul>
			                    </div>
			                    <div class="pricingTable-signup">
			                        <button type="button" href="#" id="makePaymentBtn" disabled="disabled" class="makePaymentBtn" onclick="makePayment(event)">Make Payment</button>
			                    </div>
			                </div>
			            </div>
					</c:if>
				</c:forEach>
        	</c:if>
        </div>
       </form:form>
    </div>
    <c:if test="${not empty packagesList}">
	<c:forEach items="${packagesList}" var="pack">
		<c:set var="packName" value="${pack.name}"/>
		<c:if test="${packName != 'Aarna Family' }">
			<div class="col-md-12 benefit pack_details" id="infoDiv${pack.id}" hidden="true">
    
			    <div class="benefit">  
			    	<h4>Benefits of <c:out value="${pack.name}"/> - <c:out value="${pack.duration}"/> Months</h4>
					    <c:if test="${pack.highlight_profile == '1' }">
					    	<div class="col-md-4 benefit1">
						    	<p><img  src="images/icon1.png"/> Profile Highlighter </p>
						    </div>
					    </c:if>
						<c:if test="${pack.allowed_messages_limit != null && pack.allowed_messages_limit != ''}">    
						    <div class="col-md-4">
						    <p><img  src="images/icon2.png"/>  Send <c:out value="${pack.allowed_messages_limit}"/> Personalized 
							Messages *</p>
						    </div>
					  	</c:if>
					  	<c:if test="${pack.allowed_profiles_limit != null && pack.allowed_profiles_limit != '' && pack.allowed_profiles_limit != 0}">
						    <div class="col-md-4">
						    <p><img  src="images/icon3.png"/> View mobile numbers of <c:out value="${pack.allowed_profiles_limit}"/> members
							to contact </p>
						    </div>
			    		</c:if>
			    		<div class="col-md-4">
			    			<p>Profile tagged with '<c:out value="${pack.name}"/> member'</p>
			    		</div>
			    </div></div>	
		</c:if>
		<c:if test="${packName == 'Aarna Family' }">
			<div class="col-md-12 benefit pack_details" id="infoDiv${pack.id}" hidden="true">
    
				<div class="benefit">
					<h5>Familiar Package</h5><br>
					<h4><c:out value="${pack.name}"/> - <c:out value="${pack.price}"/></h4>
					<p>Premium Benefits</p>
					<p>High Responsive</p>
					<p>Co-ordinate with Mutual Interests</p>
					<p>Weekly Feedback</p>
					<p>Relationship Manager</p>
				</div>
			</div>
		</c:if>
	</c:forEach>
</c:if>
    
    <div class="clearfix"></div>
    <br><br>
    </div>
    <script>    
    $("input[name=package_id]").click(function(){
    	$('.pricingTable').each(function(){
        	var rcls1 = $(this).attr('class').split(' ');
        	var rcls2 = $(this).find('.pricingTable-header').attr('class').split(' ');
        	$(this).removeClass(rcls1[2]);
        	$(this).find('.pricingTable-header').removeClass(rcls2[1]);
        	$(this).find('.makePaymentBtn').attr('disabled',true);
    	});
    	var val = $(this).val();
    	var cls = $('#pricing_'+val).attr('class').split(' ');
    	$('#pricing_'+val).addClass(cls[1]+'1');
    	$('#pricing_'+val).find('.pricingTable-header').addClass(cls[1]+'2');
    	$('#pricing_'+val).find('.makePaymentBtn').attr('disabled',false);
    });
    
    $(".benifitscroll").click(function(){
    	$("#benifitDiv").css('display','block');
    });
    $(".pack_details").attr("hidden",true);
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
		$(".pack_details").attr("hidden",true);
		$("#"+divId).removeAttr("hidden");
	}
    </script>
<%@ include file="userFooter.jsp"%>