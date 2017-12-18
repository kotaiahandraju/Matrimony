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
				<h1>Body Type</h1> 
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
					<span style="color: #999;cursor: auto;">Body Type</span>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div class="portlet" id="yw0" class="">
					<div class="portlet-content w3-animate-zoom">
						<form:form modelAttribute="bodyTypeForm" class="form-horizontal" role="form" id="branch-form" action="addBodyType" method="post">								
							<div class="form-group">
								<label class="col-sm-3 control-label required"><spring:message code="label.bodyType" text="default text" /> <span class="impColor">*</span></label>
								<div class="col-sm-6">
									<form:hidden path="id"/>
									<form:input path="name" type="text" class="form-control onlyCharacters validate" placeholder="Enter Body Type"  autocomplete="off"  maxlength="255"/>						
									<span class="hasError" id="nameError"></span>
							  		<div><form:errors path="name" cssClass="error"/></div>										
								</div>
						  	</div>
					  		<div class="form-group">
								<div class="col-sm-6 col-sm-offset-3">
									<input class="btn btn-primary" type="submit"  id="submit1" name="yt0" value="Add">
									<input class="btn btn-danger cancel" type="button"  id="reset" name="yt1" value="Reset">
								</div>
						  	</div>
						</form:form>
						<!-- form -->
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
							Body Type's List
						</h3>
					</div>
					<div class="box-content nopadding w3-animate-zoom" id="tableId">
						<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,null">
							<thead>
							<tr>
								<th>Body Type</th>
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
function validate(id)
{
	if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" )
	{
		$('#nameError').css('color','red');
	    $("#nameError").text("Body Type cannot be blank.");
	}
	else{$("#nameError").text("");}
}
	

$("#submit11").click(function(){			
	if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined")
	{
		if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" ) 
		{
// 			$("#name").css("border-color","#e73d4a");
// 			$("#name").attr("placeholder","Please Enter Body Type");
// 			$('#name').addClass('your-class');
			$('#nameError').css('color','red');
			$("#nameError").text("BodyType cannot be blank.");
		}
		return false;
		$("#bodyType-form").submit();
	}
});



var listOrders1 = ${allOrders1};
if (listOrders1 != "") {
	displayTable(listOrders1);
}

function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table  class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,null">'
			+ '<thead><tr><th>Body Type</th><th style="text-align: center;"></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		var edit = "<a class='edit editIt' onclick='editBodyType("+orderObj.id+")'><i style='color: green;' class='fa fa-pencil'></i></a>"
		var deleterow = "<a class='delete' onclick='deleteBodyType("+orderObj.id+")'><i style='color: red;' class='fa fa-trash'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr>"
			+ "<td title='"+orderObj.name+"'>"+ orderObj.name + "</td>"
			+ "<td style='text-align: center;'>" + edit + "&nbsp;|&nbsp;" + deleterow + "</td>" + "</tr>";
		$(tblRow).appendTo("#tableId table tbody");
	});
	if(isCheck=="Yes") $(".dataTable").dataTable();
}

function editBodyType(id)
{
	$("#id").val(serviceUnitArray[id].id);
	$("#name").val(serviceUnitArray[id].name);
	$("#submit1").val("Update");
	$(window).scrollTop($('body').offset().top);
}
function deleteBodyType(id)
{
	var checkstr =  confirm('Are you sure you want to Delete?');
	if(checkstr == true)
	{
		var formData = new FormData();
	    formData.append('id', id);
		$.fn.makeMultipartRequest('POST', 'deleteBodyType', false,
		formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
// 			alert(jsonobj.message);
			if(jsonobj.message == "yes"){
				getDeleteMsg("alert-info","Body Type Deleted Successfully");
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
$(".bodyType").addClass("active"); 
</script>
