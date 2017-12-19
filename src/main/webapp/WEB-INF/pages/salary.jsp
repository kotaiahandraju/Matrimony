<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>Salary</h1> 
			</div>
		</div>
		<div class="breadcrumbs">
			<ul>
				<li>
					<i class="fa fa-edit"></i>
					<a href="javascript:void(0)" style="color: blue;text-decoration: none;">Data List 2</a>
					<i class="fa fa-angle-right"></i>&nbsp;
				</li>
				<li>
					&nbsp;<i class="fa fa-file"></i>
					<span style="color: #999;cursor: auto;">Yearly Salary</span>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-lg-8">
				<div class="portlet" id="yw0" class="">
					<div class="portlet-content w3-animate-zoom">
						<!-- Salary Form Starts Here-->
						<form:form modelAttribute="salaryForm" class="form-horizontal" role="form" id="salary-form" action="addSalary" method="post">								
							<div class="row">
					  			<div class="col-md-12">
									<div class="form-group">
										<label class="col-sm-3 control-label required"><spring:message code="label.salary" text="Salary" /> <span class="impColor">*</span></label>
										<div class="col-sm-6">
											<form:hidden path="id"/>
											<form:input path="name" type="text" class="form-control validate" placeholder="Enter Yearly Salary" autocomplete="off" maxlength="255"/>						
											<span class="hasError" id="nameError"></span>
											<div><form:errors path="name" cssClass="error" /></div>									
										</div>
								  	</div>
						  		</div>
						  	</div>
							<div class="row">
						  		<div class="col-md-offset-3 col-md-6">
							  		<div class="form-group">
										<div class="col-md-6">
											<input class="btn btn-primary" type="submit" id="submit1" name="yt0" value="Add">
											<input class="btn btn-danger cancel" type="button" id="reset" name="yt1" value="Reset">
										</div>
								  	</div>
						  		</div>
						  	</div>
						</form:form>
						<!-- Salary Form Ends Here-->
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3><i class="fa fa-table"></i> Salary List</h3>
					</div>
					<div class="box-content nopadding w3-animate-zoom" id="tableId">
						<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,null">
							<thead>
							<tr>
								<th>Salary</th><th></th>
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

var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayTable(listOrders1);
}

function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table  class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,null">'
		+ '<thead><tr><th>Salary</th><th style="text-align: center;"></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		var edit = "<a class='edit editIt' onclick='editSalary("+ orderObj.id +")'><i class='fa fa-pencil'></i></a>"
		var deleterow = "<a class='delete' onclick='deleteSalary("+ orderObj.id +")'><i class='fa fa-trash'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr >"
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;|&nbsp;" + deleterow + "</td>" 
			+ "</tr >";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isCheck=="Yes") $(".dataTable").dataTable();
}

function editSalary(id) {
	$("#id").val(serviceUnitArray[id].id);
	$("#name").val(serviceUnitArray[id].name);
	$("#submit1").val("Update");
	$(window).scrollTop($('body').offset().top);
}

 function deleteSalary(id){
	var checkstr =  confirm('Are you sure you want to Delete?');
	if(checkstr == true){
		var formData = new FormData();
	    formData.append('id', id);
		$.fn.makeMultipartRequest('POST', 'deleteSalary', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
// 			alert(jsonobj.message);
			if(jsonobj.message == "yes"){
				getDeleteMsg("alert-info","Salary Deleted Successfully");
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

$(".catalog2").addClass("active");
$(".Salary").addClass("active");
</script>