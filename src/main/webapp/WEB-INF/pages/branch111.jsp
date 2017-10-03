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
		<div class="pull-right">
			<ul class="minitiles">
				<li class='grey'>
					<a href="#">
						<i class="fa fa-cogs"></i>
					</a>
				</li>
				<li class='lightgrey'>
					<a href="#">
						<i class="fa fa-globe"></i>
					</a>
				</li>
			</ul>
			<ul class="stats">
				<li class='satgreen'>
					<i class="fa fa-money"></i>
					<div class="details">
						<span class="big">$324,12</span>
						<span>Balance</span>
					</div>
				</li>
				<li class='lightred'>
					<i class="fa fa-calendar"></i>
					<div class="details">
						<span class="big">February 22, 2013</span>
						<span>Wednesday, 13:56</span>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="breadcrumbs">
		<ul>
			<li>
				<a href="more-login.html">Home</a>
				<i class="fa fa-angle-right"></i>
			</li>
			<li>
				<a href="forms-basic.html">Forms</a>
				<i class="fa fa-angle-right"></i>
			</li>
			<li>
				<a href="forms-basic.html">Branch</a>
			</li>
		</ul>
		
	</div>
	<div class="col-lg-8">
			<div>
				<div class="portlet" id="yw0">
<div class="portlet-content">
					<form:form class="form-horizontal" role="form" id="branch-form" action="addBranch" method="post">								
					<div class="form-group">
						<div class="col-sm-12">
							<div class="errorMessage" id="Branch_invalid_em_" style="display:none"></div>										</div>
					  </div>
					 				 <c:if test="${not empty msg}">
										<div class="alert alert-success fadeIn animated">${msg}</div>
									</c:if>
						<div class="form-group">
						 <label class="col-sm-4 control-label required"><spring:message code="label.branchName" text="default text" /><span style="color:red;">*</span></label>
							<div class="col-sm-8">
						  <form:input path="name" type="text" class="form-control" maxlength="255"/>						
						  		<div><form:errors path="name" cssClass="error" /></div>									<div class="errorMessage" id="Branch_name_em_" style="display:none"></div>										</div>
					  </div>
						<div class="form-group">
							<label class="col-sm-4 control-label required"><spring:message code="label.branchPrefix" text="default text" /><span style="color:red;">*</span></label>
						<div class="col-sm-8">
						 <form:input path="prefix" type="text" class="form-control" maxlength="255"/>						
						  		<div><form:errors path="prefix" cssClass="error" /></div>										</div>
					  </div>
						<div class="form-group">
							<label class="col-sm-4 control-label required" for="Branch_admin">Admin Reg No <span class="required">*</span></label>										
							
						  <input class="form-control" name="Branch[admin]" id="Branch_admin" type="text" maxlength="255">					
						  <div class="errorMessage" id="Branch_admin_em_" style="display:none"></div>										
						  </div>
					  </div>
						<div class="form-group">
							<label class="col-sm-4 control-label required" for="Branch_premium">Premium Reg No <span class="required">*</span></label>
							<div class="col-sm-8">
						  <input class="form-control" name="Branch[premium]" id="Branch_premium" type="text" maxlength="255">						<div class="errorMessage" id="Branch_premium_em_" style="display:none"></div>										</div>
					  </div>
						<div class="form-group">
							<label class="col-sm-4 control-label required" for="Branch_free">Free Reg No <span class="required">*</span></label>										
							<div class="col-sm-8">
						  <input class="form-control" name="Branch[free]" id="Branch_free" type="text" maxlength="255">										<div class="errorMessage" id="Branch_free_em_" style="display:none"></div>										</div>
					  </div>
						<div class="form-group">
							<label class="col-sm-4 control-label required" for="Branch_widow">Widow / Divorcee Reg No <span class="required">*</span></label>										
							<div class="col-sm-8">
						  <input class="form-control" name="Branch[widow]" id="Branch_widow" type="text" maxlength="255">										<div class="errorMessage" id="Branch_widow_em_" style="display:none"></div>										</div>
					  </div>

				  			  <div class="form-group">
							<div class="col-sm-9 col-sm-offset-3"><input class="btn btn btn-primary" type="submit" name="yt0" value="Add"></div>
					  </div>
					  								
					</form:form>
					</div><!-- form -->
					</div>
</div>					</div>


<div class="row">
	<div class="col-sm-12">
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-table"></i>
					Branch List
				</h3>
			</div>
			<div class="box-content nopadding w3-animate-zoom" id="tableId">
				<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,null">
					<thead>
					<tr>
						<th>Branch</th>
						<th></th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>Rendering engine</td>
						<td>Rendering engine</td>
					</tr>
					</tbody>

				</table>
			</div>
		</div>
	</div>
</div>

								</div>
			</div>

		
<script type="text/javascript">
/* var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-38620714-4']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script');
ga.type = 'text/javascript';
ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0];
s.parentNode.insertBefore(ga, s);
})();
 */
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
							var edit = "<a  onclick='editBodyType("	+ orderObj.id+ ")'><i style='color: green;' class='fa fa-edit'></i></a>"
							var deleterow = "<a  onclick='deleteBodyType("+ orderObj.id+ ")'><i style='color: red;' class='fa fa-trash'></i></a>"
							serviceUnitArray[orderObj.id] = orderObj;
							var tblRow = "<tr >"
									+ "<td title='"+orderObj.name+"'>"
									+ orderObj.name
									+ "</td>"
									+ "<td title='"+orderObj.prefix+"'>"
									+ orderObj.prefix
									+ "</td>"
									+ "<td title='"+orderObj.admin+"'>"
									+ orderObj.admin
									+ "</td>"
									+ "<td title='"+orderObj.premium+"'>"
									+ orderObj.premium
									+ "</td>"
									+ "<td title='"+orderObj.free+"'>"
									+ orderObj.free
									+ "</td>"
									+ "<td title='"+orderObj.widow+"'>"
									+ orderObj.widow
									+ "</td>"
									+ "<td title='"+orderObj.sms_sender+"'>"
									+ orderObj.sms_sender
									+ "</td>"
									+ "<td style='text-align: center;'>"
									+ edit
									+ "&nbsp;|&nbsp;"
									+ deleterow
									+ "</td>" 
									+ "</tr >";
							$(tblRow).appendTo("#tableId table tbody");
						});
		/* $('#DataTables_Table_0').DataTable({
			dom: 'Bfrtip',
			buttons: [{extend:"print",className:"btn default"},{extend:"pdf",className:"btn default"},{extend:"csv",className:"btn default"}]
		}); */
		$.fn.dataTableExt.sErrMode = 'console';
		$('#DataTables_Table_0').dataTable();
		 /*$('#datatable-buttons').DataTable({
		        "dom": 'C<"clear">lfrtip',
		        	        "colVis": {
		            "buttonText": "Change columns",
		        "buttons": [{extend:"copy",className:"btn default"},{extend:"print",className:"btn default"},{extend:"pdf",className:"btn default"},{extend:"csv",className:"btn default"}]
		        }
		    });*/
	}
 function editBodyType(id) {
		$("#id").val(serviceUnitArray[id].id);
		$("#name").val(serviceUnitArray[id].name);
//		$(window).scrollTop($('#addForm').offset().top);
		}
 function deleteBodyType(id){
		var checkstr =  confirm('Are you sure you want to delete this?');
		if(checkstr == true){
		var formData = new FormData();
	     formData.append('id', id);
		$.fn.makeMultipartRequest('POST', 'deleteBranch', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			alert(jsonobj.message);
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata);
		});
		}
		
	}
</script>
</body>


<!-- Mirrored from www.eakroko.de/flat/forms-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 18 Sep 2017 09:43:06 GMT -->
</html>
