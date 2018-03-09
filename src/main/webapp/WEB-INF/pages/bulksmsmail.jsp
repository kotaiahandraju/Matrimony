<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<link href="${baseurl }/css/datepicker1.css" rel="stylesheet" type="text/css" />
<script src="${baseurl }/js/jquery-ui.min.js"></script>
<div id="main">

	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>Bulk SMS&Mails</h1> 
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li>
					<i class="fa fa-edit"></i>
<!-- 					<a href="javascript:void(0)" style="color: blue;text-decoration: none;">Data List 1</a> -->
					<i class="fa fa-angle-right"></i>&nbsp;
				</li>
				<li>
					&nbsp;<i class="fa fa-file"></i>
					<span style="color: #999;cursor: auto;">Reports</span>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="portlet" id="yw0" class="">
					<div class="portlet-content w3-animate-zoom">
						<form:form modelAttribute="usersForm" class="form-horizontal" action="submitbulkmessage" role="form" id="branch-form"  method="post">								
							<div class="row">
					  			<div class="col-md-12">
					  			
										
								  	<div class="col-sm-1"></div>
								  	<label class="col-sm-1 control-label required">Plan <span class="impColor">*</span></label>
										<div class="col-sm-2">
											<form:select path="packages" class="multiSelect" multiple="multiple">
											<form:option value="">--Select Package --</form:option>
											<form:options items="${packages }"/>
											</form:select>
								  	</div>
								  	<label class="col-sm-1 control-label required">Profiles  <span class="impColor">*</span></label>
										<div class="col-sm-2">
											<form:select path="profiles" >
											<form:option value="">--Select profile Type --</form:option>
											<form:option value="1">Free Register Profiles</form:option>
											<form:option value="2">Active Profiles</form:option>
											</form:select>
								  	</div>
								  	<label class="col-sm-2 control-label required">Mail Subject <span class="impColor">*</span></label>
										<div class="col-sm-2">
											<form:input path="mailSubject"/>
								  	</div><div class="clearfix"></div><br>
								  	<label class="col-sm-2 control-label required">Message Type <span class="impColor">*</span></label>
										<div class="col-sm-2">
											<form:select path="messageType" >
											<form:option value="">--Select Message Type --</form:option>
											<form:option value="1">SMS</form:option>
											<form:option value="2">Mail</form:option>
											<form:option value="3">SMS&Mail</form:option>
											
											</form:select>
								  	</div>
								  	
								  	<label class="col-sm-1 control-label required">message <span class="impColor">*</span></label>
								  	<div class="col-sm-6">
											<form:textarea path="message" cols="50" rows="3"/>
								  	</div>
								  									  	
								  	
						  		</div>
						  		</div>
						  		<div>&nbsp;</div>
						  	</div>
						  	<div>&nbsp;</div>
							<div class="row">
						  		<div class="col-md-offset-6 col-md-6">
							  		<div class="form-group">
										<div class="col-md-6">
											<input style="padding: 8px 21px;" class="btn btn-primary" type="submit" name="yt0" value="submit" id="submit11">
											<input style="padding: 8px 21px;" class="btn btn-danger cancel" type="reset" id="reset" name="yt1" value="Reset">
										</div>
								  	</div>
						  		</div>
						  	</div>
						</form:form>
						<!-- form -->
					</div>
				</div>
			</div>
		</div>

		
	</div>
</div>

		
<script type="text/javascript">
$( document ).ready(function() {
	$('.multiSelect').select2();
	$("#packages").select2({
	    placeholder: "-- Select package --"
	});
});
$("#submit11").click(function(){			
		/* if($('#packages').val() ==  null || $('#packages').val() == "" || $('#packages').val()=="undefined") 
		{
			alert("Please Seletct Package");
			return false;
		}
		if($('#message').val() ==  null || $('#message').val() == "" || $('#message').val()=="undefined") 
		{
			alert("Please Enter message");
// 			return false;
		} */
		
		$("#bodyType-form").submit();
});

$(".bulksmsmail").addClass("active"); 
</script>
