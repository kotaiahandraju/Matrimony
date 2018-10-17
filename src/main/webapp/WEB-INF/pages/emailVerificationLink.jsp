<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<link href="${baseurl}/css/bootstrap.min.css" rel="stylesheet">
<script>
$(document).on('click','.navbar-collapse.in',function(e) {
    if( $(e.target).is('a') ) {
        $(this).collapse('hide');
    }
});	
</script>
<style>
.navbar-brand {
    float: left;
    height: 50px;
    padding: 0px 15px;
    font-size: 18px;
    line-height: 20px;
}
body{background-color: lightgray;}
.list-group-item{
background: transparent;
border: none;
}
.jumbotron p {
    margin-bottom: 15px;
    font-size: 12px;
    font-weight: 200;
}
</style>
</head>
<body>
<div class="container-fluid" style="line-height: 8px;">
<nav class="navbar navbar container" style="background:;">  
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
	 <!-- <a class="pull-left"><img src="img/im.jpg" width="40" height="45"></a> -->
       
      <a class="navbar-brand" href="HomePage"><img src="../images/logo.png"
					class="img-responsive" /></a>
    </div>
   
</nav>
  </div>
  
  <%@ include file="homeMenu.jsp"%>
<div class="clearfix"></div>
<div class="container" style="padding: 85px 0px 0px 0px;">
<div class='jumbotron'style="background-color: whitesmoke;">
<p align="center" >${msg }.</p>
<div class="col-md-4 col-md-offset-5">
<a href="../HomePage"><button type="button" class="btn btn-primary" style="width: 105px;">Login</button></a>
<!--   <a href="../HomePage"><button type="button" class="btn btn-success" style="width: 105px;">New User</button></a> -->
  </div>
</div>
</div>

		<%@ include file="homeFooter2.jsp"%> 
</body>
</html>
