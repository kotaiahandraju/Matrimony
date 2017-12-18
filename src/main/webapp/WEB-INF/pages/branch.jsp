<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<div id="main">
<div class="container-fluid">
	<div class="page-header">
		<div class="pull-left">
			<h1>Branch</h1> 
		</div>
	</div>
	<div class="breadcrumbs">
		<ul>
			<li>
				<i class="fa fa-edit"></i>
				<a href="javascript:void(0)" style="color: blue;text-decoration: none;">Data List 1</a>
				<i class="fa fa-angle-right"></i>&nbsp;
			</li>
			<li>
				&nbsp;<i class="fa fa-file"></i>
				<span style="color: #999;cursor: auto;">Branch</span>
			</li>
		</ul>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet" id="yw0">
				<div class="portlet-content w3-animate-zoom">
					<!-- Branch Form Starts Here-->
					<form:form modelAttribute="branchForm" class="form-horizontal" action="addBranch" role="form" id="branch-form"  method="post">								
					  	<div class="row">
					  		<div class="col-lg-4 col-md-6">
								<form:hidden path="id"/>
					  			<div class="form-group">
									<label class="col-sm-5 control-label required"><spring:message code="label.branchName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-7">
								  		<form:input path="name" placeholder="Enter Branch Name" type="text" class="form-control onlyCharacters validate" autocomplete="off"  maxlength="255"/>							
								  		<span class="hasError" id="nameError"></span>
								  		<div><form:errors path="name" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  		<div class="col-lg-4 col-md-6">
					  			<div class="form-group">
									<label class="col-sm-5 control-label required"><spring:message code="label.prefix" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-7">
								  		<form:input path="prefix" placeholder="Enter Prefix " type="text" class="form-control onlyCharacters validate"  autocomplete="off"  maxlength="255"/>							
								  		<span class="hasError" id="prefixError"></span>
								  		<div><form:errors path="prefix" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  		<div class="col-lg-4 col-md-6">
					  			<div class="form-group">
									<label class="col-sm-5 control-label required"><spring:message code="label.adminRegNo" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-7">
								  		<form:input path="admin" placeholder="Enter Admin Reg No"  type="text" class="form-control numericOnly validate"  autocomplete="off"  maxlength="255"/>							
								  		<span class="hasError" id="adminError"></span>
								  		<div><form:errors path="admin" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  		<div class="col-lg-4 col-md-4">
					  			<div class="form-group">
									<label class="col-sm-5 control-label required"><spring:message code="label.premiumRegNo" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-7">
								  		<form:input path="premium" placeholder="Enter Premium Reg No" type="text" class="form-control numericOnly validate" autocomplete="off"  maxlength="255"/>							
								  		<span class="hasError" id="premiumError"></span>
								  		<div><form:errors path="premium" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  		<div class="col-lg-4 col-md-4">
					  			<div class="form-group">
									<label class="col-sm-5 control-label required"><spring:message code="label.freeRegNo" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-7">
								  		<form:input path="free" placeholder="Enter Free Reg No" type="text" class="form-control numericOnly validate" autocomplete="off"  maxlength="255"/>							
								  		<span class="hasError" id="freeError"></span>
								  		<div><form:errors path="free" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  		<div class="col-lg-4 col-md-4">
					  			<div class="form-group">
									<label class="col-sm-5 control-label required"><spring:message code="label.widowRegNo" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-7">
								  		<form:input path="widow" placeholder="Enter Widow/Divorcee Reg No" type="text" class="form-control numericOnly validate"  autocomplete="off"  maxlength="255"/>							
								  		<span class="hasError" id="widowError"></span>
								  		<div><form:errors path="widow" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  	</div>
					  	<div class="row">
					  		<div class="col-sm-7 col-offset-sm-5">
						  		<div class="form-group">
									<div class="col-sm-4 col-sm-offset-8">
										<input class="btn btn-primary" type="submit" id="submit1" name="yt0" value="Add">
										<input class="btn btn-danger cancel" type="button" id="reset" name="yt1" value="Reset">
									</div>
							  	</div>
					  		</div>
					  	</div>
					</form:form>
					<!-- Branch Form Ends Here-->
				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-sm-12">
			<div class="box">
				<div class="box-title">
					<h3>
						<i class="fa fa-table"></i>
						Branch's List
					</h3>
				</div>
				<div class="box-content nopadding w3-animate-zoom" id="tableId">
					<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,null">
						<thead>
						<tr>
							<th>Inches</th><th>Cm</th>
							<th></th>
						</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
		
<script type="text/javascript">

function validate(id){
	if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" ) {
		$('#nameError').css('color','red');
	    $("#nameError").text("Name is Required Field.");
	    return false;
	}else{
		$("#nameError").text("");
	}
}
function validate1(id){
	
	if($('#prefix').val() ==  null || $('#prefix').val() == ""  || $('#prefix').val()=="undefined" ) {
		$('#prefixError').css('color','red');
	    $("#prefixError").text("Prefix Cannot Be Blank.");
	}else{
		$("#prefixError").text("");
	}
}
function validate2(id){
	if($('#admin').val() ==  null || $('#admin').val() == ""  || $('#admin').val()=="undefined" ) {
		$('#adminError').css('color','red');
	    $("#adminError").text("Admin Cannot Be Blank.");
	}else{
		$("#adminError").text("");
	}
}
function validate3(id){
	if($('#premium').val() ==  null || $('#premium').val() == ""  || $('#premium').val()=="undefined" ) {
		$('#premiumError').css('color','red');
	    $("#premiumError").text(" Premium Cannot Be Blank.");
	}else{
		$("#premiumError").text("");
	}
}
function validate4(id){
	if($('#free').val() ==  null || $('#free').val() == ""  || $('#free').val()=="undefined" ) {
		$('#freeError').css('color','red');
	    $("#freeError").text(" Free Cannot Be Blank.");
	}else{
		$("#freeError").text("");
	}
}
function validate5(id){
	if($('#widow').val() ==  null || $('#widow').val() == ""  || $('#widow').val()=="undefined" ) {
		$('#widowError').css('color','red');
	    $("#widowError").text(" Widow Cannot Be Blank.");
	}else{
		$("#widowError").text("");
	}
}

$("#submit11").click(function()
{			
			if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" ||$('#prefix').val() ==  null || $('#prefix').val() == ""  || $('#prefix').val()=="undefined")
			{
				if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" ) 
				{
				    $('#nameError').css('color','red');
				    $("#nameError").text("Name is Required Field.");
			    }
				if($('#prefix').val() ==  null || $('#prefix').val() == ""  || $('#prefix').val()=="undefined" ) 
				{			   
				    $('#prefixError').css('color','red');
				    $("#prefixError").text("Prefix Cannot Be Blank.");
			    }
				if($('#admin').val() ==  null || $('#admin').val() == ""  || $('#admin').val()=="undefined" ) 
				{
				    $('#adminError').css('color','red');
				    $("#adminError").text("Admin Cannot Be Blank.");
			    }
				if($('#premium').val() ==  null || $('#premium').val() == ""  || $('#premium').val()=="undefined" ) 
				{
				    $('#premiumError').css('color','red');
				    $("#premiumError").text("Premium Cannot Be Blank.");
			    }
				if($('#free').val() ==  null || $('#free').val() == ""  || $('#free').val()=="undefined" ) 
				{
				    $('#freeError').css('color','red');
				    $("#freeError").text("Free Cannot Be Blank.");
			    }
				if($('#widow').val() ==  null || $('#widow').val() == ""  || $('#widow').val()=="undefined" ) 
				{
				    $('#widowError').css('color','red');
				    $("#widowError").text("Widow Cannot Be Blank.");
			    }
				
				return false;
				 $("#branch-form").submit();
			}
});


 var listOrders1 = ${allOrders1};
	if (listOrders1 != "") {
		displayTable(listOrders1);
	}
function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table  class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,text,text,text,text,null">'
		+ '<thead><tr><th>Branch</th><th>Prefix</th><th>Admin</th><th>Premium</th><th>Free</th><th>Widow</th><th>Sms Sender</th><th style="text-align: center;"></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};  
	$.each(listOrders,function(i, orderObj) {
		var edit = "<a class='edit editIt' onclick='editBodyType("+ orderObj.id+ ")'><i class='fa fa-pencil'></i></a>"
		var deleterow = "<a class='delete' onclick='deleteBodyType("+ orderObj.id+ ")'><i class='fa fa-trash'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr >"
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ "<td title='"+orderObj.prefix+"'>" + orderObj.prefix + "</td>"
			+ "<td title='"+orderObj.admin+"'>" + orderObj.admin + "</td>"
			+ "<td title='"+orderObj.premium+"'>" + orderObj.premium + "</td>"
			+ "<td title='"+orderObj.free+"'>" + orderObj.free + "</td>"
			+ "<td title='"+orderObj.widow+"'>" + orderObj.widow + "</td>"
			+ "<td title='"+orderObj.sms_sender+"'>" + orderObj.sms_sender + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;|&nbsp;" + deleterow + "</td>" 
			+ "</tr >";
			$(tblRow).appendTo("#tableId table tbody");
	});
	if(isCheck=="Yes") $(".dataTable").dataTable();
}
	
function editBodyType(id) {
	$("#id").val(serviceUnitArray[id].id);
	$("#name").val(serviceUnitArray[id].name);
	$("#prefix").val(serviceUnitArray[id].prefix);
	$("#admin").val(serviceUnitArray[id].admin);
	$("#premium").val(serviceUnitArray[id].premium);
	$("#free").val(serviceUnitArray[id].free);
	$("#widow").val(serviceUnitArray[id].widow);
	$("#sms_sender").val(serviceUnitArray[id].sms_sender);
	$("#submit1").val("Update");
	$(window).scrollTop($('body').offset().top);
}

function deleteBodyType(id){
	var checkstr =  confirm('Are you sure you want to Delete?');
	if(checkstr == true){
		var formData = new FormData();
	    formData.append('id', id);
		$.fn.makeMultipartRequest('POST', 'deleteBranch', false, formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
// 			alert(jsonobj.message);
			if(jsonobj.message == "yes"){
				getDeleteMsg("alert-info","Branch Deleted Successfully");
			}
			else if(jsonobj.message == "no"){
				getDeleteMsg("alert-danger","Failed to Delete..!");
			}
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata);
		});
	}
}

$(".catalog1").addClass("active");
$(".branch").addClass("active"); 
</script>