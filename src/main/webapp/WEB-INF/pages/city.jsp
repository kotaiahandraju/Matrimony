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
		<div class="col-lg-12">
			<div class="portlet" id="yw0" class="">
				<div class="portlet-content w3-animate-zoom">
					<form:form modelAttribute="cityForm" class="form-horizontal" role="form" id="city-form" action="addCity" method="post">								
						<c:if test="${not empty msg}">
							<div class="alert alert-success fadeIn animated">${msg}</div>
						</c:if>					
						<div class="form-group">
						  <label class="col-sm-4 control-label required"><spring:message code="label.state" text="State" /><span style="color:red;">*</span></label>
					       <div class="col-sm-8">
						     <form:select path="state" class="form-control">
							    <form:option value="">-- Choose State --</form:option>
								<form:options items="${states}"></form:options>
							</form:select>
							<div><form:errors path="State" cssClass="error" /></div>
						   </div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label required"><spring:message code="label.city" text=" City Name" /><span style="color:red;">*</span></label>
							<div class="col-sm-8">
							<form:hidden path="id"/>
						  <form:input path="name" type="text" class="form-control onlyCharacters validate" placeholder="Enter City Name" autocomplete="off"  maxlength="255"/>						
						  <span class="hasError" id="nameError"></span>
						  <div><form:errors path="name" cssClass="error" /></div>										
						</div>
					  </div>	
					  <div class="form-group">
							<label class="col-sm-4 control-label required">City Code<span style="color:red;">*</span></label>
							<div class="col-sm-8">
							<form:hidden path="id"/>
						  <form:input path="city_code" type="text" class="form-control validate" placeholder="Enter City Code" autocomplete="off"  maxlength="3"/>						
						  <span class="hasError" id="city_codeError"></span>
						  <div><form:errors path="city_code" cssClass="error" /></div>										
						</div>
					  </div>
				  		<div class="form-group">
							<div class="col-sm-9 col-sm-offset-4"><input class="btn btn btn-primary" type="submit"  id="submit1" name="yt0" value="Add"></div>
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
					Cities List
				</h3>
			</div>
			<div class="box-content nopadding w3-animate-zoom" id="tableId">
				<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,null">
					<thead>
					<tr>
						<th>State</th>
						<th>City</th>
						<th>City Code</th>
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
	    $("#nameError").text("City Name cannot be blank.");
	}else{
		$("#nameError").text("");
	}
	}
	





$("#submit11").click(function()
		{			
			if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined")
			{
				if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" ) 
				{
// 				    $("#name").css("border-color","#e73d4a");
// 				    $("#name").attr("placeholder","Please Enter Body Type");
// 				    $('#name').addClass('your-class');
				    $('#nameError').css('color','red');
				    $("#nameError").text("city cannot be blank.");
			    }
				return false;
				 $("#city-form").submit();
			}
			});




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
		var tableHead = '<table  class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,null">'
				+ '<thead><tr><th>State</th><th>City Name</th><th>City Code</th><th style="text-align: center;"></th></tr></thead><tbody></tbody></table>';
		$('#tableId').html(tableHead);
		serviceUnitArray = {};
		$.each(listOrders,function(i, orderObj) {
							var edit = "<a class='edit' onclick='editCity("+ orderObj.id+ ")'><i style='color: green;' class='fa fa-edit'></i></a>"
							var deleterow = "<a class='delete' onclick='deleteCity("+ orderObj.id+ ")'><i style='color: red;' class='fa fa-trash'></i></a>"
							serviceUnitArray[orderObj.id] = orderObj;
							var tblRow = "<tr >"
 									+ "<td title='"+orderObj.stateName+"'>" + orderObj.stateName + "</td>"
									+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
									+ "<td title='"+orderObj.city_code+"'>" + orderObj.city_code + "</td>"
									+ "<td style='text-align: center;'>" + edit + "&nbsp;|&nbsp;" + deleterow + "</td>" 
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
 function editCity(id) {
		$("#id").val(serviceUnitArray[id].id);
		$("#name").val(serviceUnitArray[id].name);
		$("#city_code").val(serviceUnitArray[id].city_code);
		$("#state").val(serviceUnitArray[id].state);
//		$(window).scrollTop($('#addForm').offset().top);
		}
 function deleteCity(id){
		var checkstr =  confirm('Are you sure you want to delete this?');
		if(checkstr == true){
		var formData = new FormData();
	     formData.append('id', id);
		$.fn.makeMultipartRequest('POST', 'deleteCity', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			alert(jsonobj.message);
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata);
		});
		}
		
	}
 
 $(".catalog2").addClass("active");
 $(".city").addClass("active"); 
</script>
</body>


<!-- Mirrored from www.eakroko.de/flat/forms-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 18 Sep 2017 09:43:06 GMT -->
</html>

