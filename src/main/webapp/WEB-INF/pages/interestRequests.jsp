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
<script type="text/javascript">
$( document ).ready(function() {
    $("#editProfile").hide();
});
</script>
<link href="${baseurl }/css/datepicker1.css" rel="stylesheet" type="text/css" />
<script src="${baseurl }/js/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />

	
<!-- 	<script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/themes/black-tie/jquery-ui.css"> -->
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.js"></script> -->
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<div id="main">
<div class="container-fluid">
	<div class="page-header">
		<div class="pull-left">
			<h1>Interest Requests</h1> 
		</div>
	</div>
	<div class="breadcrumbs">
		<ul>
			<li>
				<i class="fa fa-edit"></i>
				<a href="javascript:void(0)" style="color: blue;text-decoration: none;">Admin </a>
				<i class="fa fa-angle-right"></i>&nbsp;
			</li>
			<li>
				&nbsp;<i class="fa fa-file"></i>
				<span style="color: #999;cursor: auto;">Interest Requests</span>
			</li>
		</ul>
		
	</div>

<div id="dial1"></div>

<div class="row" id="allProfilesId">
	<form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
	<form:hidden path="id"/>
	<div class="col-sm-12">
		<div class="box">
			<div class="box-title">
				<h3><i class="fa fa-table"></i>Interest Requests List</h3>
			</div>
			<div class="box-content nopadding table-responsive w3-animate-zoom" id="tableId">
				<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,text,text,null">
					<thead>
					<tr>
						<th>Interest From</th><th>Interest To</th><th>Sent on</th><th></th>
					</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
	</form:form>
</div>
</div>
</div>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Image Upload</h4>
        </div>
        <div class="modal-body">
         <input type="hidden" name="profileId" id="profileId">
        <input id="imageName" type="file" value="" name="imageName" >
          <button type="button" onclick="imageAjax()" class="btn btn-default" >upload</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
<script src="${baseurl}/js/common.js"></script>	
<script type="text/javascript">
/* var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-38620714-4']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script');
ga.type = 'text/javascript';
ga.async = true;
ga.src = ('https:' == document.k.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0];
s.parentNode.insertBefore(ga, s);
})();
 */
 var listOrders1 = ${requestsList};
	if (listOrders1 != "") {
		displayTable(listOrders1);
	}
 function displayTable(listOrders) {
		$('#tableId').html('');
		var tableHead = '<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,text,text,null">'
			+ '<thead><tr><th>Interest From</th><th>Interest To</th><th>Sent on</th><th></th></tr></thead><tbody></tbody></table>';
		$('#tableId').html(tableHead);
		serviceUnitArray = {};
		$.each(listOrders,function(i, orderObj) {
							serviceUnitArray[orderObj.id] = orderObj;
							var subStr = "";
							if(orderObj.status >= 1){
								subStr = "Forwarded";
							}else{
								subStr = "<a id='forward"+orderObj.id+"' href='#' onclick='forwardRequest("+orderObj.id+")'>forward</a>";
							}
							var tblRow = "<tr >"
								+ "<td title='"+orderObj.fromName+"'><a href='#' onclick='fullProfile("+orderObj.user_id+")'>" + orderObj.fromName + "</a></td>"
								+ "<td title='"+orderObj.toName+"'><a href='#' onclick='fullProfile("+orderObj.profile_id+")'>" + orderObj.toName + "</td>"
								+ "<td title='"+orderObj.sentOn+"'>" + orderObj.sentOn + "</td>"
								+ "<td title=''>"+subStr+"</td>"
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
 function fullProfile(profile_id){
		$("#id").val(profile_id);
		//document.searchForm2.id = profile_id;
		document.searchForm2.action = "fullProfile"
	    document.searchForm2.target = "_blank";    // Open in a new window
	    document.searchForm2.submit();             // Submit the page
	    return true;
		/* jQuery.fn.makeMultipartRequest('POST', 'fullProfile', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var msg = jsonobj.message;
	    		if(typeof msg != "undefined"){
	    			if(msg=="success"){
	    				;
	    			}else{
	    				alert("Some problem occured. Please try again.");
	    			}
	    		}
	    		
		}); */
	}
function forwardRequest(requestId){
	var formData = new FormData();
	formData.append("requestId",requestId);
	$.fn.makeMultipartRequest('POST', 'forwardInterestRequests', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		if(typeof msg != "undefined" ){
			if("success"==msg){
				alert("Forwarded successfully");
				$("#forward"+requestId).html('');
				$("#forward"+requestId).html("Forwarded");
			}else if("failed"==msg || "exception"==msg){
				alert("Some problem occured. Please try again.");
			}
		}
				
	});
}
 $(".interestRequests").addClass("active");
</script>