<%@ include file="userHeader.jsp"%>
                
                
                <div class="col-md-9 products-grid-left">
					<div class="panel panel-success">
			            <div class="panel-heading">
			            	Sent Interest Requests
			            </div>
			            <form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
		             		<form:hidden path="id" />
							<div class="panel-body" id="sent_requests">
								
							</div>
							<div id="paginator"></div>
							<div id="table_footer"></div>
							
						</form:form>
					</div>
            
		
				</div>
                
                
                
                
                
              
			</div>  
            
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
<!-- //products -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 footer-grid">
				<h6>About us</h6>
				<p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel tincidunt elementum, nunc urna tristique nisi, in interdum libero magna .</p>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>Search</h6>
				<ul>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Terms &amp; Conditions</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>My Account</h6>
				<ul>
					<li><a href="#">My Account</a></li>
					<li><a href="#">My Profile</a></li>
					<li><a href="#">My Interest</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>Extras</h6>
				<ul>
					<li><a href="#">Login</a></li>
					<li><a href="#">Register</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="footer-copy">
		<p>© 2017. All rights reserved.</p>
	</div>

<!-- //footer -->
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<script src="js/ajax.js"></script>
<script src="js/common.js"></script>
<script src="js/jquery-asPaginator.js"></script>
<link rel="stylesheet" type="text/css" href="css/asPaginator.css">
<script type="text/javascript">
var total_items_count = ${total_records};
var page_size = ${page_size};
var roleid = ${cacheGuest.roleId};
var allowed_limit = ${allowed_profiles_limit};
var listOrders1 = ${sentRequests};
		paginationSetup(total_items_count);
		$("#paginator").asPaginator('enable');
		displayMatches_messages(listOrders1,"sent_requests",roleid,"sentRequests");
		displayTableFooter(1);
function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table class="table table-hover table-nomargin table-bordered" >'
		+ '<thead><tr><th>UserName</th><th>Sent On</th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	if(listOrders==""){
		var tblRow = "<tr><td colspan='3' class='dataTables_empty'>No data available</td></tr>";
		$(tblRow).appendTo("#tableId table tbody");
		$("#table_footer").prop("hidden",true);
		$("#paginator").prop("hidden",true);
	}
	$.each(listOrders,function(i, orderObj) {
						serviceUnitArray[orderObj.id] = orderObj;
						var tblRow = "<tr>"
							+ "<td title='"+orderObj.username+"'><a href='#' onclick='fullProfile("+orderObj.id+")'>" + orderObj.username + "</a></td>"
							+ "<td title='"+orderObj.sentOn+"'>" + orderObj.sentOn + "</td>"
							+ "</tr >";
						$(tblRow).appendTo("#tableId table tbody"); 
					});
	/* $('#DataTables_Table_0').DataTable({
		dom: 'lBfrtip',
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
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	//if(roleId==4){
	//	document.searchForm2.action = "memberShipPage"
	//}else{
		document.searchForm2.action = "fullProfile"
	//}
	//document.searchForm2.id = profile_id;
	
    document.searchForm2.target = "_blank";    // Open in a new window
    document.searchForm2.submit();             // Submit the page
    return true;
	
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
          	formData.append("request_from","sentrequests");
          	
      		$.fn.makeMultipartRequest('POST', 'displayPage', false,
      				formData, false, 'text', function(data){
      			var jsonobj = $.parseJSON(data);
      			var results = jsonobj.results;
      			if(results==""){
      				var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No requests found..!</h6></div>';
        			$('#sent_requests').html('');
        			$(str).appendTo("#sent_requests");
        			$("#table_footer").prop("hidden",true);
        			$("#paginator").prop("hidden",true);
        		}else{
        			paginationSetup(total_items_count);
        			$("#paginator").asPaginator('enable');
        			displayMatches_messages(results,"sent_requests",roleid,"sentRequests");
        			$("#table_footer").removeAttr("hidden");
        			$("#paginator").removeAttr("hidden");
        			displayTableFooter(page);
        		}
  			
  		});
          
        }
      });
}

function acceptRequest(requestId,flag){
	var formData = new FormData();
	formData.append("requestId",requestId);
	formData.append("accept_flag",flag);
	$.fn.makeMultipartRequest('POST', 'acceptRequest', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		if(typeof msg != "undefined" ){
			if("success"==msg){
				if(flag==1){
					alert("Request accepted successfully");
					$("#accept"+requestId).html('');
					$("#accept"+requestId).html("Accepted");
				}else{
					alert("Request rejected successfully");
					$("#accept"+requestId).html('');
					$("#accept"+requestId).html("Rejected");
				}
				
				
			}else if("failed"==msg || "exception"==msg){
				alert("Some problem occured. Please try again.");
			}
		}
				
	});
}

</script>

</body>
</html>