<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Aarna Matrimony">
    <meta name="author" content="Aarna Matrimony">

    <title>Aarna Matrimony</title>

    <!-- Bootstrap core CSS -->
    <link href="user/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
           
    <script src="user/js/ie-emulation-modes-warning.js"></script>
    <link href="user/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="user/vendor/woocommerce-FlexSlider/flexslider.css" type="text/css" media="screen" />
    <link href="user/css/style.css" rel="stylesheet">
    <link href="user/css/custom.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="user/css/component.css" />
    <script src="user/js/modernizr.custom.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
.dispnone
{
	display: none !important;
}
.hiddencss
{
	visibility: hidden;
}
body {
	background:#F1F1F2;
}
.container { background:#FFF;}
.ilogo { padding:15px 0; border-bottom:12px solid #F1F1F2 }
.control-label { text-align:left;}
.midcontnet { border-bottom:12px solid #F1F1F2; padding-bottom:40px; }
.manditory{color: red;}

.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}

th,td {text-align: center;}
</style>

  </head>

  <body>
  
  
  
  
        <div class="container">
            <div class="row">
            <div class="ilogo">
            <div class="col-md-7 col-sm-7">
              <img src="user/images/logo.jpg" class="img-responsive">
            </div>
            <div class="col-md-5 col-sm-12">
            	
            </div>
            <div  class="clearfix"></div>    
    		</div>
     </div>
     
   <div class="row">
   <div class="midcontnet">
   
   <div class="col-md-9">

<!-- 3rd Step starts here-->
<div id="thirdForm">
    <div class="col-md-12 text-center">
      <h3>Upgrade Membership</h3>
    </div>
    
    <div class="col-md-12 table-responsive">
    	<div class="well">
					<!-- Create Profile Form Starts Here -->
					<form:form commandName="partnerProfile" action="savePayment" class="form-horizontal" id="creteProfile-form" role="form"   method="post">
					<form:hidden path="id"/>
					<form:hidden path="userrequirementId"/>
						<div class="form-group">
							<div class="col-sm-12">
								<div class="errorMessage" id="Create Profile_invalid_em_" >
								
									<c:if test="${not empty msg}">
										<div class="alert alert-success fadeIn animated">${msg}</div>
									</c:if>
								</div>
								<form:hidden path="id"/>
								<c:if test="${not empty pageName}">
										<form:hidden path="pageName"/>
									</c:if>
							</div>
					  	</div>
						
						
						
						<div class="row">
							<div class="col-md-12">
								<legend>Membership Packages: </legend>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Package<span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		 <form:select path="packageId" onfocus="removeBorder(this.id)" onblur="validate(this.id,'');"  class="form-control">
											<form:option value="">-- Select --</form:option>
											<form:options items="${packages}"/>
										</form:select>
								  		<div><form:errors path="packageId" cssClass="error" /></div> 
									</div>
							  	</div>
							</div>
							
						</div>
						<div class="row">
							<div class="col-md-offset-5 col-md-4">
								<div class="form-group">
								<div class=" col-md-offset-1 col-md-6">
									<input class="btn btn btn-primary" type="submit" id="submit11" name="yt0" value="Make Payment">
									<input class="btn btn btn-danger" type="reset" id="reset11" name="yt1" value="Reset">
								</div>
								</div>
							</div>
						</div>	
					</form:form>					
					<!-- Create Profile Form Ends Here-->
				  </div>
   
   <div class="col-md-3">
     <img src="user/images/pad.jpg" class="img-responsive">
   </div>
    
   <div class="clearfix"></div>
   
   </div>
   
   </div>  
     

     
    
    
    <footer class="footer" id="footer"><!-- Section id-->
    	<div class="row">
            	<div class="col-md-6 col-sm-6">
                	<div class="logo-footer">
                    	<img src="user/images/logo-b.png" alt="" class="img-responsive" />
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                	<div class="contact-info">
                        <h5>Our Office</h5>
                        <p class="fs-12 address"><i class="fa fa-map-marker"></i>#### ###### ######,</p>
                        <p class="fs-12"><i class="fa fa-phone"></i>+91 ##########</p>
                	</div>
                </div>
            </div>
			<div class="row">
                <div class="col-md-6 col-sm-6">
                	<div class="social">
                    	<ul class="list-inline">
                        	<li><a href="#" ><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#" ><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" ><i class="fa fa-instagram"></i></a></li>
                            <li><a href="#" ><i class="fa fa-pinterest-p"></i></a></li>
                        </ul>
                    </div>                	
                </div>
                <div class="col-md-6 col-sm-6">
                	<div class="contact-info">
                        <p class="email-add"><span>Email:</span> info@############.com</p>
                    </div>
                </div>                
            </div>
    </footer>
        </div>
        <div class="copyright clearfix">
            <div class="">
                <p class="copy">Copyright 2017  | All Rights Reserved</p>
		    </div>
        </div>
    
               
    
    <script src="user/js/ie10-viewport-bug-workaround.js"></script>
    <script src="user/vendor/jquery/jquery.min.js"></script>
    <script src="user/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="user/vendor/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="user/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="user/js/theme.js"></script>
    <script src="user/js/custom.js"></script>
    <script defer src="user/vendor/woocommerce-FlexSlider/jquery.flexslider.js"></script>
    <script src="user/js/toucheffects.js"></script>
    <script src="js/custemValidation.js"></script>
    <script src="js/ajax.js"></script>
</body>

</html>

