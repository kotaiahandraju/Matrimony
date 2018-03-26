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
.pricingTable .pricingTable-signup a{
    display: inline-block;
    font-size: 15px;
    color: #fff;
    padding: 10px 35px;
    border-radius: 20px;
    background: #ffa442;
    text-transform: uppercase;
    transition: all 0.3s ease 0s;
}
.pricingTable .pricingTable-signup a:hover{
    box-shadow: 0 0 10px #ffa442;
}
.pricingTable.blue .price-value,
.pricingTable.blue .heading{
    color: #4b64ff;
}
.pricingTable.blue:hover .pricingTable-header,
.pricingTable.blue .pricingTable-signup a{
    background: #4b64ff;
}
.pricingTable.blue .pricingTable-signup a:hover{
    box-shadow: 0 0 10px #4b64ff;
}
.pricingTable.light .price-value,
.pricingTable.light .heading{
    color: #006699;
}
.pricingTable.light:hover .pricingTable-header,
.pricingTable.light .pricingTable-signup a{
    background: #006699;
}
.pricingTable.light .pricingTable-signup a:hover{
    box-shadow: 0 0 10px 3006699;
}
.pricingTable.red .price-value,
.pricingTable.red .heading{
    color: #ff4b4b;
}
.pricingTable.red:hover .pricingTable-header,
.pricingTable.red .pricingTable-signup a{
    background: #ff4b4b;
}
.pricingTable.red .pricingTable-signup a:hover{
    box-shadow: 0 0 10px #ff4b4b;
}
.pricingTable.green .price-value,
.pricingTable.green .heading{
    color: #40c952;
}
.benefit {
position: relative;
    background: rgb(244, 251, 254);
    margin-top: 25px;
    display: block;
}


.prit {

width:200px;
margin-left:20px;
}
.pricingTable.green:hover .pricingTable-header,
.pricingTable.green .pricingTable-signup a{
    background: #40c952;
}
.pricingTable.green .pricingTable-signup a:hover{
    box-shadow: 0 0 10px #40c952;
}

.pricingTable.blue:hover .price-value,
.pricingTable.light:hover .price-value,
.pricingTable.red:hover .price-value,
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
</style>
<body>
 <div class="container" style="background:#fff; padding-top:25px; z-index:0;">
<div class="demo1">
   
        <div class="row">
            <div class="col-md-2 col-sm-2 prit">
                <div class="pricingTable blue">
                    <div class="pricingTable-header">
                      
                        <div class="price-value">&#x20b9; 1000.00 <span class="month">3 Months</span> </div>
                    </div>
                    <h3 class="heading">CLASSIC</h3>
                    <div class="pricing-content">
                        <ul>
                            <li><b><input type="radio"  class="benifitscroll" name="radiobtn" ></input></b></li>
                            <li><b></b> View Details</li>
                           <!--  <li><b>50GB</b> Monthly Bandwidth</li>
                            <li><b>10</b> subdomains</li>
                            <li><b>15</b> Domains</li> -->
                        </ul>
                    </div>
                    <div class="pricingTable-signup">
                        <a href="#">Make Payment</a>
                    </div>
                </div>
            </div>
 
            <div class="col-md-2 col-sm-2 prit">
                <div class="pricingTable green">
                    <div class="pricingTable-header">
                        
                        <div class="price-value"> &#x20b9; 2000.00 <span class="month">6 Months</span> </div>
                    </div>
                    <h3 class="heading">CLASSIC PLUS</h3>
                    <div class="pricing-content">
                        <ul>
                           <li><b><input  class="benifitscroll"  type="radio" name="radiobtn"></input></b></li>
                            <li><b></b> View Details</li>
                            <!-- <li><b>60GB</b> Monthly Bandwidth</li>
                            <li><b>15</b> subdomains</li>
                            <li><b>20</b> Domains</li> -->
                        </ul>
                    </div>
                    <div class="pricingTable-signup">
                        <a href="#">Make Payment</a>
                    </div>
                </div>
            </div> <div class="col-md-2 col-sm-2 prit">
                <div class="pricingTable red">
                    <div class="pricingTable-header">
                       
                        <div class="price-value"> &#x20b9; 3000.00 <span class="month">9 Months</span> </div>
                    </div>
                    <h3 class="heading">PREMIUM</h3>
                    <div class="pricing-content">
                        <ul>
                            <li><b><input type="radio" class="benifitscroll" id="benifitbtn" name="radiobtn"></input></b></li>
                            <li><b></b> View Details</li>
                          <!--   <li><b>50GB</b> Monthly Bandwidth</li>
                            <li><b>10</b> subdomains</li>
                            <li><b>15</b> Domains</li> -->
                        </ul>
                    </div>
                    <div class="pricingTable-signup">
                        <a href="#">Make Pament</a>
                    </div>
                </div>
            </div>
             <div class="col-md-2 col-sm-2 prit">
                <div class="pricingTable">
                    <div class="pricingTable-header">
                       
                        <div class="price-value"> &#x20b9; 4000.00 <span class="month">12 Months</span> </div>
                    </div>
                    <h3 class="heading">PREMIUM PLUS</h3>
                    <div class="pricing-content">
                        <ul>
                          <li><b><input type="radio"  class="benifitscroll" name="radiobtn"></input></b></li>
                            <li><b></b> View Details</li>
                           <!--  <li><b>50GB</b> Monthly Bandwidth</li>
                            <li><b>10</b> subdomains</li>
                            <li><b>15</b> Domains</li> -->
                        </ul>
                    </div>
                    <div class="pricingTable-signup">
                        <a href="#">Make Payment</a>
                    </div>
                </div>
            </div>
             <div class="col-md-2 col-sm-2 prit">
                <div class="pricingTable light">
                    <div class="pricingTable-header">
                       
                        <div class="price-value"> &#x20b9; 5000.00 <span class="month">Till Marriage</span> </div>
                    </div>
                    <h3 class="heading">AARNA PREMIUM</h3>
                    <div class="pricing-content">
                        <ul>
                            <li><b><input type="radio"  class="benifitscroll" name="radiobtn" ></input></b></li>
                            <li><b></b> View Details</li>
                           <!--  <li><b>50GB</b> Monthly Bandwidth</li>
                            <li><b>10</b> subdomains</li>
                            <li><b>15</b> Domains</li> -->
                        </ul>
                    </div>
                    <div class="pricingTable-signup">
                        <a href="#">Make payment</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-12 benefit" id='benifitDiv' style='display:none'>
    
    <div class="benefit">
  
    
    <h4>Benefits of Classic Premium - 3 Months</h4>
    <div class="col-md-4 benefit1">
    <p><img  src="images/icon1.png"/> Profile Highlighter for 3 Months - 
</p>
<p><img  src="images/icon4.png"/> Enhanced privacy settings</p>
<p><img  src="images/icon5.png"/>  Enhanced 
profile visibility</p>
    </div>
    <div class="col-md-4">
    <p><img  src="images/icon2.png"/>  Send Unlimited Personalized 
Messages *</p>
    </div>
   
    <div class="col-md-4">
    <p><img  src="images/icon3.png"/> View mobile numbers of 60 members
to contact </p>
    
    </div>
    
    
    </div></div>
    <div class="clearfix"></div>
    <br><br>
    </div>
    <script>
    $(".benifitscroll").click(function(){
    	$("#benifitDiv").css('display','block');
    });
    </script>
<%@ include file="userFooter.jsp"%>