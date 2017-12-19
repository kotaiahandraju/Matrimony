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
				<h1>City</h1> 
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
					<span style="color: #999;cursor: auto;">City</span>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-lg-8">
				<div class="portlet" id="yw0">
					<div class="portlet-content w3-animate-zoom">
						<!-- City Form Starts Here-->
						<form:form modelAttribute="cityForm" class="form-horizontal" role="form" id="city-form" action="addCity" method="post">								
							<div class="row">
					  			<div class="col-md-12">
									<div class="form-group">
										<label class="col-sm-3 control-label required"><spring:message code="label.state" text="State" /> <span class="impColor">*</span></label>
										<div class="col-sm-6">
											<form:hidden path="id"/>
											<form:select path="state" class="form-control validate" onfocus="removeBorder(this.id)">
											    <form:option value="">-- Choose State --</form:option>
												<form:options items="${states}"></form:options>
											</form:select>
											<span class="hasError" id="stateError"></span>
									  		<div><form:errors path="state" cssClass="error"/></div>										
										</div>
								  	</div>
						  		</div>
						  	</div>
						  	<div class="row">
					  			<div class="col-md-12">
									<div class="form-group">
										<label class="col-sm-3 control-label required"><spring:message code="label.city" text="City" /> <span class="impColor">*</span></label>
										<div class="col-sm-6">
											<form:input path="name" type="text" class="form-control onlyCharacters validate" placeholder="Enter City Name" autocomplete="off"  maxlength="255"/>						
											<span class="hasError" id="nameError"></span>
											<div><form:errors path="name" cssClass="error" /></div>									
										</div>
								  	</div>
						  		</div>
						  	</div>
						  	<div class="row">
					  			<div class="col-md-12">
									<div class="form-group">
										<label class="col-sm-3 control-label required"><spring:message code="label.cityCode" text="City Code" /> <span class="impColor">*</span></label>
										<div class="col-sm-6">
											<form:input path="city_code" type="text" class="form-control validate" placeholder="Enter City Code" autocomplete="off" maxlength="255"/>						
											<span class="hasError" id="city_codeError"></span>
											<div><form:errors path="city_code" cssClass="error" /></div>									
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
						<!-- City Form Ends Here-->
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3><i class="fa fa-table"></i> Cities List</h3>
					</div>
					<div class="box-content nopadding w3-animate-zoom" id="tableId">
						<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,null">
							<thead>
							<tr>
								<th>State</th><th>City</th><th>City Code</th><th></th>
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
	var tableHead = '<table  class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,null">'
			+ '<thead><tr><th>State</th><th>City</th><th>City Code</th><th style="text-align: center;"></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		var edit = "<a class='edit editIt' onclick='editCity("+ orderObj.id+ ")'><i class='fa fa-pencil'></i></a>"
		var deleterow = "<a class='delete' onclick='deleteCity("+ orderObj.id+ ")'><i class='fa fa-trash'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr >"
			+ "<td title='"+orderObj.stateName+"'>" + orderObj.stateName + "</td>"
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ "<td title='"+orderObj.city_code+"'>" + orderObj.city_code + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;|&nbsp;" + deleterow + "</td>" 
			+ "</tr >";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isCheck=="Yes") $(".dataTable").dataTable();
}

function editCity(id) {
	$("#id").val(serviceUnitArray[id].id);
	$("#state").val(serviceUnitArray[id].state);
	$("#name").val(serviceUnitArray[id].name);
	$("#city_code").val(serviceUnitArray[id].city_code);
	$("#submit1").val("Update");
	$(window).scrollTop($('body').offset().top);
}

function deleteCity(id){
	var checkstr =  confirm('Are you sure you want to Delete?');
	if(checkstr == true){
		var formData = new FormData();
	    formData.append('id', id);
		$.fn.makeMultipartRequest('POST', 'deleteCity', false, formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
// 			alert(jsonobj.message);
			if(jsonobj.message == "yes"){
				getDeleteMsg("alert-info","City Deleted Successfully");
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
$(".city").addClass("active");
</script>