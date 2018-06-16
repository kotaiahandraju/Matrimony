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
				<h1>Employee Creation</h1> 
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
					<span style="color: #999;cursor: auto;">Employee</span>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="portlet" id="yw0">
					<div class="portlet-content w3-animate-zoom">
						<!-- MemberShip Form Starts Here-->
						<form:form modelAttribute="createProfile" class="form-horizontal" role="form" id="membership-form" action="saveEmployeeCreation" method="post">								
							<div class="row">
					  			<div class="col-md-6">
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message text="FirstName" /> <span class="impColor">*</span></label>
										<div class="col-sm-8">
<%-- 											<form:hidden path="id"/> --%>
											<form:input path="firstName" type="text" class="form-control nospecialCharacter onlyCharacters validate" autocomplete="off" placeholder="First Name" maxlength="255"/>						
											<span class="hasError" id="nameError"></span>
<%-- 									  		<div><form:errors path="name" cssClass="error"/></div>										 --%>
										</div>
								  	</div>
						  		</div>
						  		<div class="col-md-6">
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message text="LastName" /> <span class="impColor">*</span></label>
										<div class="col-sm-8">
											<form:hidden path="id"/>
											<form:input path="lastName" type="text" class="form-control nospecialCharacter onlyCharacters validate" autocomplete="off" placeholder="Last Name" maxlength="255"/>						
											<span class="hasError" id="nameError"></span>
<%-- 									  		<div><form:errors path="name" cssClass="error"/></div>										 --%>
										</div>
								  	</div>
						  		</div>
						  		<div class="col-md-6">
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message  text="Email" /> <span class="impColor">*</span></label>
										<div class="col-sm-8">
											<form:input path="email" type="text" class="form-control emailOnly validate" autocomplete="off"  placeholder="Email" maxlength="255"/>						
									  	<span class="hasError" id="emailError1" style="font-size: 13px;"></span>
<%-- 									  		<div><form:errors path="price" cssClass="error" /></div>										 --%>
										</div>
								  	</div>
						  		</div>
						  		<div class="col-md-6">
						  			<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message  text="UserName" /> <span style="color:red;">*</span></label>
										<div class="col-sm-8">
									  		<form:input path="username" type="text" class="form-control  validate"  autocomplete="off" Placeholder="UserName" maxlength="255"/>						
									  		<span class="hasError" id="durationError"></span>
<%-- 									  		<div><form:errors path="duration" cssClass="error" /></div>										 --%>
										</div>
								  	</div>
						  		</div>
						  		<div class="col-md-6">
						  			<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message   text="Password" /><span style="color:red;">*</span></label>
										<div class="col-sm-8">
									  		<form:input path="password" type="text" class="form-control nospecialCharacter validate"  autocomplete="off" Placeholder="Password" maxlength="255"/>						
									  		<span class="hasError" id="descriptionError"></span>
<%-- 									  		<div><form:errors path="description" cssClass="error" /></div>										 --%>
										</div>
								  	</div>
						  		</div>
						  	</div>
							<div class="row">
						  		<div class="col-md-offset-6 col-md-6">
							  		<div class="form-group">
										<div class="col-md-6">
											<input class="btn btn-primary" type="submit" id="submit2" name="yt0" value="Add">
											<input class="btn btn-danger cancel" type="button" onclick="cancel()"; id="reset" name="yt1" value="Reset">
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
						<h3><i class="fa fa-table"></i> Employee List</h3>
					</div>
					<div class="box-content nopadding w3-animate-zoom" id="tableId">
						<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,text,text,null">
							<thead>
							<tr>
							<th>First Name</th><th>Last Name</th><th>Email</th><th>UserName</th><th>Password</th><th>Action</th>
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
	var tableHead = '<table  class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,text,text,null">'
		+ '<thead><tr><th>First Name</th><th>Last Name</th><th>Email</th><th>UserName</th><th>Password</th><th>Action</th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) {
		var edit = "<a class='edit editIt' onclick='editMemberShip("+ orderObj.id+ ")'><i class='fa fa-pencil'></i></a>"
		var deleterow = "<a class='delete' onclick='deleteMemberShip("+ orderObj.id+ ")'><i class='fa fa-trash'></i></a>"
		serviceUnitArray[orderObj.id] = orderObj;
		var tblRow = "<tr >"
			+ "<td title='"+orderObj.name+"'>" + orderObj.firstName + "</td>"
			+ "<td title='"+orderObj.duration+"'>" + orderObj.lastName + "</td>"
			+ "<td title='"+orderObj.price+"'>" + orderObj.email + "</td>"
			+ "<td title='"+orderObj.description+"'>" + orderObj.username + "</td>"
			+ "<td title='"+orderObj.description+"'>" + orderObj.password + "</td>"
			+ "<td style='text-align: center;white-space: nowrap;'>" + edit + "&nbsp;|&nbsp;" + deleterow + "</td>" 
			+ "</tr >";
		$(tblRow).appendTo("#tableId table tbody");
	});
	
}

function editMemberShip(id) {
	$("#id").val(id);
	$("#firstName").val(serviceUnitArray[id].firstName);
	$("#lastName").val(serviceUnitArray[id].lastName);
	$("#email").val(serviceUnitArray[id].email);
	$("#username").val(serviceUnitArray[id].username);
	$("#password").val(serviceUnitArray[id].password);
	$("#submit2").val("Update");
	$(window).scrollTop($('body').offset().top);
}

function deleteMemberShip(id){
	var checkstr =  confirm('Are you sure you want to Delete?');
	if(checkstr == true){
		var formData = new FormData();
	    formData.append('id', id);
		$.fn.makeMultipartRequest('POST', 'deleteemployee', false, formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
// 			alert(jsonobj.message);
			if(jsonobj.message == "yes"){
				getDeleteMsg("alert-info","Employee Deleted Successfully");
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

function cancel(){
	$("#submit2").val("Add");
	
}
$(".catalog2").addClass("active");
$(".membership").addClass("active");


var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
$('#email').blur(function() {
	var email = $('#email').val();
	if(email == "" || email == null || email == "undefined")
	{
		$("#email").css("border-color","#e73d4a");
    	$("#email").attr("placeholder","Email");
    	$('#email').css('color','red');
	}
	if(email != "" && !email.match(expr)){
// 		alert("Please Enter Valid Email");
    	$("#email").css("border-color","#e73d4a");
    	$("#email").attr("title","Email-ID");
    	$('#email').css('color','red');
    	$('#emailError1').text("Valid Email-ID..");
//      	$('#email').focus();
		return false;
	}
	else{
		$('#emailError1').text("");
	}

});

$('#submit2').click(function(event) {
	var email = $('#email').val();
	validation = true;
	$.each(idArray, function(i, val) {
		var value = $("#" + idArray[i]).val();
		var placeholder = $("#" + idArray[i]).attr('placeholder');
		if (value == null || value == "" || value == "undefined") {
			
			 $("#" + idArray[i] ).attr("placeholder", placeholder);
			 $("#" + idArray[i] ).css('border-color','#e73d4a');
			    $("#" + idArray[i] ).css('color','#e73d4a');
			    $("#" + idArray[i] ).addClass('your-class');
			    
//			$("#" + idArray[i] + "Error").text("Please " + placeholder);
			validation = false;
		} 
		if(email != "" && !email.match(expr)){
//	 		alert("Please Enter Valid Email");
	    	$("#email").css("border-color","#e73d4a");
	    	$("#email").attr("title","Email-ID");
	    	$('#email').css('color','red');
	    	$('#emailError1').text("Valid Email-ID..");
//	      	$('#email').focus();
			validation = false;
			return false;
		}
		else{
			$('#emailError1').text("");
		}
	});
	if (validation) {
		
		$("#submit2").attr("disabled",true);
		 $("#submit2").val("Please wait...");
		 $("form").submit();											
			event.preventDefault();
		
	} else {
		return false;
		event.preventDefault();
	}
	
	
});
</script>