<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

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
			<h1>Dashboard </h1> 
		</div>
	</div>
	
	


<div id="dial1"></div>

<div class="row" id="allProfilesId">
	<form:form commandName="dashboardForm"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
	<form:hidden path="id"/>
	<div class="col-sm-6">
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-table"></i>
					Classic Expired Profiles
				</h3>
			</div>
			<div id="tableIdClassic">
			</div>
			<div id="paginatorClassic"></div>
			<div id="table_footer_Classic"></div>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-table"></i>
					Classic Plus Expired Profiles
				</h3>
			</div>
			<div id="tableId1">
			</div>
			<div id="paginator1"></div>
			<div id="table_footer1"></div>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-table"></i>
					Premium Expired Profiles
				</h3>
			</div>
			<div id="tableId">
			</div>
			<div id="paginator"></div>
			<div id="table_footer"></div>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-table"></i>
					Premium Plus Expired Profiles
				</h3>
			</div>
			<div id="tableIdPremiumPlus">
			</div>
			<div id="paginatorPremiumPlus"></div>
			<div id="table_footer_PremiumPlus"></div>
		</div>
	</div>
	<div class="col-sm-6">
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-table"></i>
					Arna Premium Expired Profiles
				</h3>
			</div>
			<div id="tableIdArnaPremium">
			</div>
			<div id="paginatorArnaPremium"></div>
			<div id="table_footer_ArnaPremium"></div>
		</div>
	</div>
	</form:form>
</div>




</div>
</div>
<div class="container-fluid" id="tableId2"></div>
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
<script src="${baseurl}/js/jquery-asPaginator.js"></script>
<link rel="stylesheet" type="text/css" href="${baseurl}/css/asPaginator.css">
<script type="text/javascript">

 var total_items_count = ${total_records};
 var page_size = ${page_size};
 var listOrders1 = ${premiumExpiredProfiles};
	//if (listOrders1 != "") {
		//paginationSetup(total_items_count);
		//$("#paginator").asPaginator('enable');
		displayTable(listOrders1,"tableId");
		//displayTableFooter(1);
	//}
var listOrders2 = ${classicPlusExpiredProfiles};
//if (listOrders1 != "") {
	//paginationSetup(total_items_count);
	//$("#paginator").asPaginator('enable');
	displayTable(listOrders2,"tableId1");
	//displayTableFooter(1);	
	
	
	 var listOrders3 = ${PremiumPlusExpiredProfiles};
	displayTable(listOrders3,"tableIdPremiumPlus");
	
	var listOrders4 = ${classicExpiredProfiles};
	displayTable(listOrders4,"tableIdClassic");
	
	var listOrders5 = ${ArnaPremiumExpiredProfiles};
	displayTable(listOrders5,"tableIdArnaPremium");	 
	
	function paginationSetup(total_items_count) {
		  $('#paginator').asPaginator(total_items_count, {
	          currentPage: 1,
	          visibleNum: {
	            0: 10,
	            480: 3,
	            960: 5
	          },
	          tpl: function() {
	            return '<ul>{{first}}{{prev}}{{altLists}}{{next}}{{last}}</ul>';
	          },
	          components: {
	            first: true,
	            prev: true,
	            next: true,
	            last: true,
	            altLists: true
	          },
	          onChange: function(page) {
	             var formData = new FormData();
	        	 formData.append("page_no",page);
	        	
	    		$.fn.makeMultipartRequest('POST', 'updatedProfilesPagination', false,
	    				formData, false, 'text', function(data){
	    			var jsonobj = $.parseJSON(data);
	    			var profiles = jsonobj.updatedProfilesList;
	    			if(profiles==""){
		    		/* 	$('#countId').html('');
		    			$('#countId').html('0');
		    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
		    			$('#searchResults').html('');
		    			$(str).appendTo("#searchResults");
		    		 */	
		    		 	var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
		    		 	$('#tableId').html('');
		    		 	$('#tableId').html(str);
		    		 	$("#table_footer").prop("hidden",true);
		    			$("#paginator").prop("hidden",true);
		    		}else{
		    			paginationSetup(total_items_count);
		    			$("#paginator").asPaginator('enable');
		    			displayTable(profiles);
		    			$("#table_footer").removeAttr("hidden");
		    			$("#paginator").removeAttr("hidden");
		    			displayTableFooter(page);
		    		}
	    			
	    		});
	            
	          }
	        });
	}
 function displayTable(listOrders,tableId) {
		$('#'+tableId).html('');
		var tableHead = '<table class="table table-hover table-nomargin table-bordered" >'
			+ '<thead><tr><th>UserName</th><th>Joined On</th><th>Mobile No.</th></tr></thead><tbody></tbody></table>';
		$('#'+tableId).html(tableHead);
		serviceUnitArray = {};
		if(listOrders==""){
			var tblRow = "<tr><td colspan='3' class='dataTables_empty'>No data available</td></tr>";
			$(tblRow).appendTo("#"+tableId+" table tbody");
			$("#table_footer").prop("hidden",true);
			$("#paginator").prop("hidden",true);
		}
		$.each(listOrders,function(i, orderObj) {
							serviceUnitArray[orderObj.id] = orderObj;
							var tblRow = "<tr>"
								+ "<td title='"+orderObj.username+"'><a href='#' onclick='fullProfile("+orderObj.id+")'>" + orderObj.username + "</a></td>"
								+ "<td title='"+orderObj.package_joined_date+"'>" + orderObj.package_joined_date + "</td>"
								+ "<td title='"+orderObj.mobile+"'>" + orderObj.mobile + "</td>"
								+ "</tr >";
							$(tblRow).appendTo("#"+tableId+" table tbody"); 
							//$(tblRow).appendTo("#tableId1 table tbody");
						});
		
	}
 function displayTableFooter(page){
		var from_val = ((parseInt(page)-1)*page_size)+1;
		var to_val = parseInt(page)*page_size;
		if(to_val > total_items_count){
			to_val = total_items_count;
		}
		if(from_val>to_val){
			from_val = to_val;
		}
		$("#table_footer").html("Showing "+from_val+" to "+to_val+" of "+total_items_count+" records");
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
 
 var listOfOrders1 = ${listOfOrders};
 displayTable3(listOfOrders1);
 function displayTable3(listOfOrders1) {
		$('#tableId2').html('');
		var tableHead = '<table class="table table-hover table-nomargin table-bordered" >'
			+ '<thead><tr><th>Package Name</th><th>Members Count</th></tr></thead><tbody></tbody></table>';
		$('#tableId2').html(tableHead);
		if(listOfOrders1!=""){
			
		$.each(listOfOrders1,function(i, orderObj) {
							var tblRow = "<tr>"
								+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
								+ "<td title='"+orderObj.count+"'>" + orderObj.count + "</td>"
								+ "</tr >";
							$(tblRow).appendTo("#tableId2 table tbody"); 
						});
		}
	}
  var freeusersCount  = ${freeusersCount};
  $.each(freeusersCount,function(i, orderObj) {
		var tblRow = "<tr>"
			
			+ "<td title='"+orderObj.package+"'>" + orderObj.package + "</td>"
			+ "<td title='"+orderObj.totalcount+"'>" + orderObj.totalcount + "</td>"
			+ "</tr >";
		$(tblRow).appendTo("#tableId2 table tbody"); 
	});
  
 $(".dashboard").addClass("active");
</script>