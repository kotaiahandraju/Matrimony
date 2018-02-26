<%@ include file="userHeader.jsp"%>

			<div class="col-md-8 products-grid-left">
            	<div class="panel panel-success">
					<div class="panel-heading">Pending Requests</div>
					<div class="panel-body table-responsive">
						<form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form" method="post">
						<form:hidden path="id" />
							<div class="col-md-12">
							<div id="searchresultsDiv" style="font-size: 12px;">
								   <div id="pending_requests">
										

									</div>       
							    <div id="table_footer"></div>
								<div id="altLists"></div>
							</div>
							<div class="clearfix"></div>
							
							</div>
						</form:form>
				</div></div>
                         
					</div>
			
			
<script src="js/common.js"></script>
<script type="text/javascript">

var total_items_count = ${total_records};
var page_size = ${page_size};
var roleid = ${cacheGuest.roleId};
var allowed_limit = ${allowed_profiles_limit};
 var listOrders1 = ${pendingRequests};
 
if (listOrders1 != "" && listOrders1 != null) {
	paginationSetup(total_items_count);
	$("#altLists").asPaginator('enable');
	displayMatches_messages(listOrders1,"pending_requests",roleid,"pendingRequests");
	displayTableFooter(1);
}else if (listOrders1 == null) {
	$('#search_criteria').removeAttr("hidden");
	$('#searchResults').html('');
	$("#searchresultsDiv").prop("hidden",true);
}else{
	$('#countId').html('0');
	var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
	$('#searchResults').html('');
	$(str).appendTo("#searchResults");
	$('#search_criteria').prop("hidden",true);
	$("#searchresultsDiv").removeAttr("hidden");
}


function updateProfilesList(){
	var castVals = [];
	var religionVals = [];
	var educationVals = [];
    $("#castdiv :checked").each(function () {
    	castVals.push($(this).val());
    });
    $("#religiondiv :checked").each(function () {
    	religionVals.push($(this).val());
    });
    $("#educationdiv :checked").each(function () {
    	educationVals.push($(this).val());
    });
   // if(allVals!=""){
    	//alert(allVals);
    	var formData = new FormData();

    	formData.append('selected_casts',castVals);
    	formData.append('selected_religions',religionVals);
    	formData.append('selected_educations',educationVals);
    	jQuery.fn.makeMultipartRequest('POST', 'updateProfilesList', false,
    			formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var filtered_profiles = jsonobj.filtered_profiles;
	    		var total_count = jsonobj.total_records;
	    		$('#countId').html('');
	    		$("#search_criteria").prop("hidden",true);
	    		$('#searchresultsDiv').removeAttr("hidden");
	    		if(filtered_profiles==""){
	    			$('#countId').html('0');
	    			var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    			$("#table_footer").prop("hidden",true);
	    			$("#altLists").prop("hidden",true);
	    		}else{
	    			$('#countId').html(total_count);
	    			total_items_count = total_count;
	    			paginationSetup(total_items_count);
	    			$("#altLists").asPaginator('enable');
	    			displayMatches_messages(filtered_profiles);
	    			displayTableFooter(1);
	    			$("#table_footer").removeAttr("hidden");
	    			$("#altLists").removeAttr("hidden");
	    		}
    			
    		});
}
   

function submitSearch(){
	var formData = new FormData();
	formData.append("username",$("#username").val());
	$.fn.makeMultipartRequest('POST', 'searchByIdAction', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var results = jsonobj.results;
		total_items_count = jsonobj.total_records;
		$("#search_criteria").prop("hidden",true);
		$('#searchresultsDiv').removeAttr("hidden");
		if(results==""){
			$('#countId').html('0');
			var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
			$('#searchResults').html('');
			$(str).appendTo("#searchResults");
			$("#table_footer").prop("hidden",true);
			$("#altLists").prop("hidden",true);
		}else{
			$('#countId').html('');
			$('#countId').html(total_items_count);
			paginationSetup(total_items_count);
			$("#altLists").asPaginator('enable');
			displayMatches_messages(results);
			$("#table_footer").removeAttr("hidden");
			$("#altLists").removeAttr("hidden");
			displayTableFooter(1);
		}
		
	});
}
	//$("#searchForm2").submit();
	
//}

   


function acceptRequest(requestId){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(requestId);
	 if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		 /* if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		}  */ 
		var formData = new FormData();
	
		formData.append('requestId',requestId);
		formData.append('accept_flag','1');
		
		jQuery.fn.makeMultipartRequest('POST', 'acceptRequest', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var limit = jsonobj.allowed_limit;
	    		var msg = jsonobj.message;
	    		var profiles = jsonobj.allProfiles;
	    		//if(typeof msg != "undefined" ){
	    			if("success"==msg){
	    				alert("Accepted successfully");
	    				$("#expInterest"+requestId).html('Accepted');
	    				$("#expInterest"+requestId).removeAttr("href");
	    				$("#expInterest"+requestId).removeAttr("onclick");
	    				$("#expInterest"+requestId).attr("disabled",true);
	    				$("#rejSpan"+requestId).html('');
	    				
	    				allowed_limit = limit;
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Some problem occured. Please try again.");
	    			}
	    		//}
	    		
				
			});
	}
}

function rejectRequest(requestId){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(requestId);
	 if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		} 
		var formData = new FormData();
	
		formData.append('requestId',requestId);
		formData.append('accept_flag','0');
		
		jQuery.fn.makeMultipartRequest('POST', 'acceptRequest', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var limit = jsonobj.allowed_limit;
	    		var msg = jsonobj.message;
	    		var profiles = jsonobj.allProfiles;
	    		//if(typeof msg != "undefined" ){
	    			if("success"==msg){
	    				alert("Rejected successfully");
	    				$("#rejInterest"+requestId).html('Rejected');
	    				$("#rejInterest"+requestId).removeAttr("href");
	    				$("#rejInterest"+requestId).removeAttr("onclick");
	    				$("#rejInterest"+requestId).attr("disabled",true);
	    				$("#accSpan"+requestId).html('');
	    				allowed_limit = limit;
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Some problem occured. Please try again.");
	    			}
	    		//}
	    		
				
			});
	}
}



function fullProfile(profile_id){
	$("#id").val(profile_id);
	document.searchForm2.action = "fullProfile"
    document.searchForm2.target = "_blank";    // Open in a new window
    document.searchForm2.submit();             // Submit the page
    return true;
}


function paginationSetup(total_items_count) {
	  $('#altLists').asPaginator(total_items_count, {
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
             //$("#page_no").val(page);
             //var search_form = $("#searchForm2");
        	 //var formData = $("#searchForm2 :input").serialize();
        	 //var t = $("#rAgeFrom").val();
        	 //var formData = $("#searchForm2").serialize();
        	 var castVals = [];
			var religionVals = [];
			var educationVals = [];
		    $("#castdiv :checked").each(function () {
		    	castVals.push($(this).val());
		    });
		    $("#religiondiv :checked").each(function () {
		    	religionVals.push($(this).val());
		    });
		    $("#educationdiv :checked").each(function () {
		    	educationVals.push($(this).val());
		    });
        	 var formData = new FormData();
        	 formData.append("username",$("#username").val());
        	 /* formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val()); */
        	 formData.append("page_no",page);
        	 //var tempData = $("#searchForm2").serialize();
    		$.fn.makeMultipartRequest('POST', 'displayPage', false,
    				formData, false, 'text', function(data){
    			var jsonobj = $.parseJSON(data);
    			var results = jsonobj.results;
    			//$('#countId').html('');
	    		$("#search_criteria").prop("hidden",true);
	    		$('#searchresultsDiv').removeAttr("hidden");
	    		if(results==""){
	    			$('#countId').html('');
	    			$('#countId').html('0');
	    			var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    			$("#table_footer").prop("hidden",true);
	    			$("#altLists").prop("hidden",true);
	    		}else{
	    			paginationSetup(total_items_count);
	    			$("#altLists").asPaginator('enable');
	    			displayMatches_messages(results);
	    			$("#table_footer").removeAttr("hidden");
	    			$("#altLists").removeAttr("hidden");
	    			displayTableFooter(page);
	    		}
    			
    		});
            
          }
        });
}
//displayPagination();
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

function hideChildren() {
	 var maritalStatus=$("#rMaritalStatus").val();
	 if(maritalStatus == "Unmarried"){
		 $("#haveChildrenId").hide();
		 $("#haveChildren").val();
	 }else{
		 $("#haveChildrenId").show();
	 }
	}
$(document).ready(function(){
	var selected_values = "${createProfile.rMaritalStatus}";
    $("#rMaritalStatus").val(selected_values.split(","));
    
    selected_values="";
    selected_values = "${createProfile.rCaste}";
    $("#rCaste").val(selected_values.split(","));
    
    selected_values="";
    selected_values = "${createProfile.rState}";
    $("#rState").val(selected_values.split(","));
    
    selected_values="";
    selected_values = "${createProfile.rEducation}";
    $("#rEducation").val(selected_values.split(","));
    
    selected_values="";
	selected_values = "${createProfile.rReligion}";
	$("#rReligion").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rMotherTongue}";
	$("#rMotherTongue").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rCountry}";
	$("#rCountry").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rWorkingWith}";
	$("#rWorkingWith").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rOccupation}";
	$("#rOccupation").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rDiet}";
	$("#rDiet").val(selected_values.split(","));
});

$(".messages").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>