<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<style>
.select2-container{
width:179px !important;
}
.select2-container-multi .select2-choices {
border-radius:0px !important;}
</style>

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
					<span style="color: #999;cursor: auto;">Bulk SMS&Mails</span>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="portlet" id="yw0" class="">
					<div class="portlet-content w3-animate-zoom">
						<form:form modelAttribute="usersForm" class="form-horizontal" action="submitbulkmessage" role="form" id="bodyType-form"  method="post">								
							<div class="row">
					  			<div class="col-md-12">
					  			<div class="form-group">
					  			<label class="col-sm-2 control-label required">From Date  <span class="impColor">*</span></label>
										<div class="col-sm-2">
										<form:input path="fromdate" placeholder="From Date" readonly="true" class="form-control"/>
								  	</div>
								  	
								  	
								  	<label class="col-sm-2 control-label required">To Date  <span class="impColor">*</span></label>
										<div class="col-sm-2">
											<form:input path="todate" placeholder="To Date" readonly="true" class="form-control"/>
								  	</div>
										
<!-- 								  	<div class="col-sm-1"></div> -->
								  	<label class="col-sm-2 control-label required">Plan <span class="impColor">*</span></label>
										<div class="col-sm-2">
											<form:select path="packages" class="multiSelect" multiple="multiple">
											<form:option value="">--Select Package --</form:option>
											<form:options items="${packages }"/>
											</form:select>
								  	</div>
								  	</div>
								  	<div class="form-group">
								  	<label class="col-sm-2 control-label required">Profiles  <span class="impColor">*</span></label>
										<div class="col-sm-2" style="padding-top:7px">
											<form:select path="profiles" class="form-control" >
											<form:option value="">--Select profile Type --</form:option>
											<form:option value="1">Free Register Profiles</form:option>
											<form:option value="2">Active Profiles</form:option>
											</form:select>
								  	</div>
								  	<label class="col-sm-2 control-label required">Mail Subject <span class="impColor">*</span></label>
										<div class="col-sm-2">
											<form:input path="mailSubject" placeholder="Mail Subject " class="form-control"/>
								  	</div>
								  	<label class="col-sm-2 control-label required">Message Type <span class="impColor">*</span></label>
										<div class="col-sm-2">
											<form:select path="messageType" class="form-control" >
											<form:option value="">--Select Message Type --</form:option>
											<form:option value="1">SMS</form:option>
											<form:option value="2">Mail</form:option>
											<form:option value="3">SMS&Mail</form:option>
											
											</form:select>
								  	</div>
								  	</div>
								  	<div class="clearfix"></div><br>
								
								  	<div class="form-group">
								  	<label class="col-sm-2 control-label required">message <span class="impColor">*</span></label>
								  	<div class="col-sm-6">
											<form:textarea path="message" cols="50" rows="3" placeholder="Message " class="form-control"/>
								  	</div>
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
$("#fromdate").datepicker({
    dateFormat: "dd-MM-yy",
    changeDate : true,
	changeMonth : true,
	changeYear : true,
	maxDate :0
}); 
$("#todate").datepicker({
    dateFormat: "dd-MM-yy",
    changeDate : true,
	changeMonth : true,
	changeYear : true,
	maxDate :0
});

$("#submit11").click(function(){			
		 
		if($('#message').val() ==  null || $('#message').val() == "" || $('#message').val()=="undefined") 
		{
			alert("Please Enter message");
			return false;
		} 
		if($('#messageType').val() ==  null || $('#messageType').val() == "" || $('#messageType').val()=="undefined"){
			alert("Please Enter message Type");
			return false;
		}
		$("#submit11").prop('disabled', true);
		$("#submit11").text("Please wait..");
		$("#bodyType-form").submit();
});

$(".bulksmsmail").addClass("active"); 
</script>
