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
			<h1>Branch</h1> 
		</div>
	</div>
	<div class="breadcrumbs">
		<ul>
			<li>
				<i class="fa fa-edit"></i>
				<a href="javascript:void(0)" style="color: blue;text-decoration: none;">Catalog 1</a>
				<i class="fa fa-angle-right"></i>&nbsp;
			</li>
			<li>
				&nbsp;<i class="fa fa-file"></i>
				<span style="color: #999;cursor: auto;">Branch</span>
			</li>
		</ul>
		
	</div>
	<div class="col-lg-12">
		<div>
			<div class="portlet" id="yw0">
				<div class="portlet-content w3-animate-zoom">
					<!-- Body Type Form Starts Here-->
					<form:form modelAttribute="branchForm" class="form-horizontal" role="form" id="branch-form" action="addBranch" method="post">								
						<div class="form-group">
							<div class="col-sm-12">
								<div class="errorMessage" id="Height_invalid_em_" >
									<c:if test="${not empty msg}">
										<div class="alert alert-success fadeIn animated">${msg}</div>
									</c:if>
								</div>
								<form:hidden path="id"/>
							</div>
					  	</div>
					  	<div class="row">
					  		<div class="col-lg-4 col-md-4">
					  			<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.branchName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:input path="name" type="text" class="form-control onlyCharacters" autocomplete="off" onblur="validate(this.id);" maxlength="255"/>							
								  		<span class="hasError" id="nameError"></span>
								  		<div><form:errors path="name" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  		<div class="col-lg-4 col-md-4">
					  			<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.prefix" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:input path="prefix" type="text" class="form-control onlyCharacters"  autocomplete="off" onblur="validate1(this.id);" maxlength="255"/>							
								  		<span class="hasError" id="prefixError"></span>
								  		<div><form:errors path="prefix" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  		<div class="col-lg-4 col-md-4">
					  			<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.adminRegNo" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:input path="admin" type="text" class="form-control numericOnly"  autocomplete="off" onblur="validate2(this.id);" maxlength="255"/>							
								  		<span class="hasError" id="adminError"></span>
								  		<div><form:errors path="admin" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  	</div>
					  	<div class="row">
					  		<div class="col-lg-4 col-md-4">
					  			<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.premiumRegNo" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:input path="premium" type="text" class="form-control numericOnly" autocomplete="off" onblur="validate3(this.id);"  maxlength="255"/>							
								  		<span class="hasError" id="premiumError"></span>
								  		<div><form:errors path="premium" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  		<div class="col-lg-4 col-md-4">
					  			<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.freeRegNo" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:input path="free" type="text" class="form-control numericOnly" autocomplete="off" onblur="validate4(this.id);"  maxlength="255"/>							
								  		<span class="hasError" id="freeError"></span>
								  		<div><form:errors path="free" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  		<div class="col-lg-4 col-md-4">
					  			<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.widowRegNo" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:input path="widow" type="text" class="form-control numericOnly"  autocomplete="off" onblur="validate5(this.id);" maxlength="255"/>							
								  		<span class="hasError" id="widowError"></span>
								  		<div><form:errors path="widow" cssClass="error" /></div>										
									</div>
							  	</div>
					  		</div>
					  	</div>
					  	<div class="row">
					  		<div class="col-sm-8 col-offset-sm-4">
					  			<div class="form-group">
									<div class="col-sm-4 col-sm-offset-8"><input class="btn btn btn-primary" type="submit"  id="submit1" name="yt0" value="Add"></div>
							  	</div>
					  		</div>
					  	</div>
					</form:form>
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
					Height's List
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
	    $("#adminError").text(" Admin Cannot Be Blank.");
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





$("#submit1").click(function()
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
		$("#prefix").val(serviceUnitArray[id].prefix);
		$("#admin").val(serviceUnitArray[id].admin);
		$("#premium").val(serviceUnitArray[id].premium);
		$("#free").val(serviceUnitArray[id].free);
		$("#widow").val(serviceUnitArray[id].widow);
		$("#sms_sender").val(serviceUnitArray[id].sms_sender);
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
$(".catalog1").addClass("active");
$(".branch").addClass("active"); 
</script>
</body>


<!-- Mirrored from www.eakroko.de/flat/forms-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 18 Sep 2017 09:43:06 GMT -->
</html>

