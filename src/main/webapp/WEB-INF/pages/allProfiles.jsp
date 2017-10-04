<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<style>
 .error {
        color: red; font-weight: bold;
    }
</style>
<div id="main">
<div class="container-fluid">
	<div class="page-header">
		<div class="pull-left">
			<h1>All Profiles</h1> 
		</div>
	</div>
	<div class="breadcrumbs">
		<ul>
			<li>
				<i class="fa fa-edit"></i>
				<a href="javascript:void(0)" style="color: blue;text-decoration: none;">Profiles </a>
				<i class="fa fa-angle-right"></i>&nbsp;
			</li>
			<li>
				&nbsp;<i class="fa fa-file"></i>
				<span style="color: #999;cursor: auto;">All Profiles</span>
			</li>
		</ul>
		
	</div>
	<div class="col-lg-8">
		<div>
			<div class="portlet" id="yw0">
				<div class="portlet-content w3-animate-zoom">
					<!-- Body Type Form Starts Here-->
					<%-- <form:form modelAttribute="casteForm" class="form-horizontal" role="form" id="branch-form" action="addCaste" method="post">								
						<div class="form-group">
							<div class="col-sm-12">
								<div class="errorMessage" id="Branch_invalid_em_" >
									<c:if test="${not empty msg}">
										<div class="alert alert-success fadeIn animated">${msg}</div>
									</c:if>
								</div>
								<form:hidden path="id"/>
							</div>
					  	</div>
						<div class="form-group">
							<label class="col-sm-4 control-label required"><spring:message code="label.casteName" text="default text" /> <span style="color:red;">*</span></label>
							<div class="col-sm-8">
						  		<form:input path="name" type="text" class="form-control" maxlength="255"/>						
						  		<div><form:errors path="name" cssClass="error" /></div>										
							</div>
					  	</div>
				  		<div class="form-group">
							<div class="col-sm-8 col-sm-offset-4"><input class="btn btn btn-primary" type="submit" name="yt0" value="Add"></div>
					  	</div>
					</form:form> --%>
					<!-- Body Type Form Ends Here-->
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
					All Profiles List
				</h3>
			</div>
			<div class="box-content nopadding w3-animate-zoom" id="tableId">
				<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,null">
					<thead>
					<tr>
						<th>Name</th>
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
		var tableHead = '<table  class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,null">'
				+ '<thead><tr><th>UserName</th><th>Name</th><th>Sur Name</th></tr></thead><tbody></tbody></table>';
		$('#tableId').html(tableHead);
		serviceUnitArray = {};
		$.each(listOrders,function(i, orderObj) {
// 							var edit = "<a onclick='editCaste("	+ orderObj.id+ ")'><i style='color: green;' class='fa fa-edit'></i></a>"
// 							var deleterow = "<a onclick='deleteCaste("+ orderObj.id+ ")'><i style='color: red;' class='fa fa-trash'></i></a>"
							serviceUnitArray[orderObj.id] = orderObj;
							var tblRow = "<tr >"
									+ "<td title='"+orderObj.username+"'>" + orderObj.username + "</td>"
									+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
									+ "<td title='"+orderObj.sname+"'>" + orderObj.sname + "</td>"
									+ "</tr >";
							$(tblRow).appendTo("#tableId table tbody");
						});
		/* $('#DataTables_Table_0').DataTable({
			dom: 'Bfrtip',
			buttons: [{extend:"print",className:"btn default"},{extend:"pdf",className:"btn default"},{extend:"csv",className:"btn default"}]
		}); */
		
		 /*$('#datatable-buttons').DataTable({
		        "dom": 'C<"clear">lfrtip',
		        "colVis": {
		            "buttonText": "Change columns",
		        "buttons": [{extend:"copy",className:"btn default"},{extend:"print",className:"btn default"},{extend:"pdf",className:"btn default"},{extend:"csv",className:"btn default"}]
		        }
		    });*/
	}
 function editCaste(id) {
		$("#id").val(serviceUnitArray[id].id);
		$("#name").val(serviceUnitArray[id].name);
//		$(window).scrollTop($('#addForm').offset().top);
		}
 function deleteCaste(id){
		var checkstr =  confirm('Are you sure you want to delete this?');
		if(checkstr == true){
		var formData = new FormData();
	     formData.append('id', id);
		$.fn.makeMultipartRequest('POST', 'deleteCaste', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			alert(jsonobj.message);
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata);
		});
		}
		
	}
 $(".profiles").addClass("active");
 $(".allProfiles").addClass("active"); 
</script>
</body>


<!-- Mirrored from www.eakroko.de/flat/forms-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 18 Sep 2017 09:43:06 GMT -->
</html>

