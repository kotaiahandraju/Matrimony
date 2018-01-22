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
				<h1>Membership</h1> 
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
					<span style="color: #999;cursor: auto;">Membership</span>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="portlet" id="yw0">
					<div class="portlet-content w3-animate-zoom">
						<!-- MemberShip Form Starts Here-->
						<form:form modelAttribute="membershipForm" class="form-horizontal" role="form" id="membership-form" action="addMemberShip" method="post">								
							<div class="row">
					  			<div class="col-md-6">
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message code="label.membershipName" text="default text" /> <span class="impColor">*</span></label>
										<div class="col-sm-8">
											<form:hidden path="id"/>
											<form:input path="name" type="text" class="form-control nospecialCharacter validate" autocomplete="off" placeholder="Enter MemberShip Name" maxlength="255"/>						
											<span class="hasError" id="nameError"></span>
									  		<div><form:errors path="name" cssClass="error"/></div>										
										</div>
								  	</div>
						  		</div>
						  		<div class="col-md-6">
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message code="label.price" text="default text" /> <span class="impColor">*</span></label>
										<div class="col-sm-8">
											<form:input path="price" type="text" class="form-control numericOnly validate" autocomplete="off"  placeholder="Enter Price" maxlength="255"/>						
									  		<span class="hasError" id="priceError"></span>
									  		<div><form:errors path="price" cssClass="error" /></div>										
										</div>
								  	</div>
						  		</div>
						  		<div class="col-md-6">
						  			<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message code="label.duration" text="default text" /> <span style="color:red;">*</span></label>
										<div class="col-sm-8">
									  		<form:input path="duration" type="text" class="form-control numericOnly validate"  autocomplete="off" Placeholder="Enter Duration" maxlength="255"/>						
									  		<span class="hasError" id="durationError"></span>
									  		<div><form:errors path="duration" cssClass="error" /></div>										
										</div>
								  	</div>
						  		</div>
						  		<div class="col-md-6">
						  			<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message code="label.description" text="default text" /><span style="color:red;">*</span></label>
										<div class="col-sm-8">
									  		<form:textarea path="description" type="text" class="form-control nospecialCharacter validate"  autocomplete="off" Placeholder="Enter Description" maxlength="255"/>						
									  		<span class="hasError" id="descriptionError"></span>
									  		<div><form:errors path="description" cssClass="error" /></div>										
										</div>
								  	</div>
						  		</div>
						  	</div>
							<div class="row">
						  		<div class="col-md-offset-6 col-md-6">
							  		<div class="form-group">
										<div class="col-md-6">
											<input class="btn btn-primary" type="submit" id="submit1" name="yt0" value="Add">
											<input class="btn btn-danger cancel" type="button" id="reset" name="yt1" value="Reset">
										</div>
								  	</div>
						  		</div>
						  	</div>
						</form:form>
						<!-- MemberShip Form Ends Here-->
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="box">
					<div class="box-title">
						<h3><i class="fa fa-table"></i> Membership's List</h3>
					</div>
					<div class="box-content nopadding w3-animate-zoom" id="tableId">
						<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,text,null">
							<thead>
							<tr>
								<th>Membership Name</th><th>Duration(In Days)</th><th>Price (In Rs)</th><th>Description</th><th></th>
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
	var tableHead = '<table  class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,text,null">'
		+ '<thead><tr><th>Membership Name</th><th>Duration(In Days)</th><th>Price (In Rs)</th><th>Description</th><th style="text-align: center;"></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		var edit = "<a class='edit editIt' onclick='editMemberShip("+ orderObj.id+ ")'><i class='fa fa-pencil'></i></a>"
		var deleterow = "<a class='delete' onclick='deleteMemberShip("+ orderObj.id+ ")'><i class='fa fa-trash'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr >"
			+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
			+ "<td title='"+orderObj.duration+"'>" + orderObj.duration + "</td>"
			+ "<td title='"+orderObj.price+"'>" + orderObj.price + "</td>"
			+ "<td title='"+orderObj.description+"'>" + orderObj.description + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;|&nbsp;" + deleterow + "</td>" 
			+ "</tr >";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isCheck=="Yes") $(".dataTable").dataTable();
}

function editMemberShip(id) {
	$("#id").val(serviceUnitArray[id].id);
	$("#name").val(serviceUnitArray[id].name);
	$("#price").val(serviceUnitArray[id].price);
	$("#duration").val(serviceUnitArray[id].duration);
	$("#description").val(serviceUnitArray[id].description);
	$("#submit1").val("Update");
	$(window).scrollTop($('body').offset().top);
}

function deleteMemberShip(id){
	var checkstr =  confirm('Are you sure you want to Delete?');
	if(checkstr == true){
		var formData = new FormData();
	    formData.append('id', id);
		$.fn.makeMultipartRequest('POST', 'deleteMemberShip', false, formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
// 			alert(jsonobj.message);
			if(jsonobj.message == "yes"){
				getDeleteMsg("alert-info","MemberShip Deleted Successfully");
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
$(".membership").addClass("active");
</script>