<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<div id="main">
	<div class="container-fluid">
		<div class="page-header">
			<div class="pull-left">
				<h1>Updated Profiles </h1> 
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
					<span style="color: #999;cursor: auto;">Updated Profiles</span>
				</li>
			</ul>
		</div>

		<div class="row" id="allProfilesId">
			<div class="col-sm-12">
			<form:form commandName="createProfile" class="form-horizontal" id="searchForm2" name="searchForm2" role="form" method="post">
				<form:hidden path="id"/>
				<div class="box table-responsive">
					<div class="box-title">
						<h3><i class="fa fa-table"></i> Updated Profiles List</h3>
					</div>
					<div class="w3-animate-zoom">
						<div class="" style="float: right;">
							<label>&nbsp;<input style="display: inline-block;" type="search" class="form-control" placeholder="Search..!" name="search" id="search" onkeyup="searchTable();"></label>
						</div>
					<div class="box-content nopadding" id="tableId">
						<table class="table table-hover table-nomargin table-bordered">
							<thead><tr style="border-top: 1.999px solid lightgray;"><th>Username</th><th>Updated On</th></tr></thead>
							<tbody></tbody>
						</table>
					</div>
					<div id="table_footer" style="float: left;line-height: 30px;"></div>
					<div id="paginator" style="float: right;margin: 0;"></div>
					</div>
				</div>
			</form:form>
			</div>
		</div>
	</div>
</div>

<script src="${baseurl}/js/common.js"></script>
<script src="${baseurl}/js/jquery-asPaginator.js"></script>
<link rel="stylesheet" type="text/css" href="${baseurl}/css/asPaginator.css">
<script type="text/javascript">

function searchTable() {
    var input, filter, found, table, tr, td, i, j;
    input = document.getElementById("search");
    filter = input.value.toUpperCase();
    table = document.getElementById("itemContainer");
    tr = table.getElementsByTagName("tr");
    for (i = 1; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                found = true;
            }
        }
        if (found) {
            tr[i].style.display = "";
            found = false;
        } else {
            tr[i].style.display = "none";
        }
    }
}


 var total_items_count = ${total_records};
 var page_size = ${page_size};
 var listOrders1 = ${updatedProfilesList};
	//if (listOrders1 != "") {
		paginationSetup(total_items_count);
		$("#paginator").asPaginator('enable');
		displayTable(listOrders1);
		displayTableFooter(1);
	//}
	
	function paginationSetup(total_items_count) {
		  $('#paginator').asPaginator(total_items_count, {
	          currentPage: 1,
	          visibleNum: {
	            0: 10,
	            480: 3,
	            960: 5
	          },
	          tpl: function() {
	        	  return '<ul>{{prev}}{{altLists}}{{next}}</ul>';
	            //return '<ul>{{first}}{{prev}}{{altLists}}{{next}}{{last}}</ul>';
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
	        	
			$.fn.makeMultipartRequest('POST', 'updatedProfilesPagination', false, formData, false, 'text', function(data){
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
 function displayTable(listOrders) {
		$('#tableId').html('');
	var tableHead = '<table class="table table-hover table-nomargin table-bordered" id="itemContainer">'
		+ '<thead><tr style="border-top: 1.999px solid lightgray;"><th>Username</th><th>Updated On</th></tr></thead><tbody></tbody>'
// 		+ '<tfoot><tr><td id="table_footer"></td><td id="paginator"></td></tr></tfoot>'
		+ '</table>';
		$('#tableId').html(tableHead);
		serviceUnitArray = {};
		if(listOrders==""){
			var tblRow = "<tr><td colspan='2' class='dataTables_empty'>No data available</td></tr>";
			$(tblRow).appendTo("#tableId table tbody");
			$("#table_footer").prop("hidden",true);
			$("#paginator").prop("hidden",true);
		}
		$.each(listOrders,function(i, orderObj) {
							serviceUnitArray[orderObj.id] = orderObj;
							var tblRow = "<tr>"
								+ "<td title='"+orderObj.username+"'><a href='#' onclick='fullProfile("+orderObj.id+")'>" + orderObj.username + "</a></td>"
								+ "<td title='"+orderObj.updatedOn+"'>" + orderObj.updatedOn + "</td>"
								+ "</tr >";
							$(tblRow).appendTo("#tableId table tbody"); 
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
	    document.searchForm2.target = "_blank";	// Open in a new window
	    document.searchForm2.submit();	// Submit the page
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






$(".updatedProfiles").addClass("active");
</script>