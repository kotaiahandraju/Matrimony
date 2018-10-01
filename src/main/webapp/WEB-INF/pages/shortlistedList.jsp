<%@ include file="userCommonHeader.jsp"%>
<style>
.btn-sm {
width:130px;
}
</style>
<div class="products">
	<div class="container" style="background: #FFF;">
		<div class="mid-grids">
			
			<jsp:include page="sideGrid2.jsp" />
			<div id="dial1"></div>
			<div class="col-md-9 products-grid-left" style="min-height:500px;">
				
				<div class="panel panel-success">
					<div class="panel-heading"> 
						<c:if test="${list_type == 'shortListedMe'}">
							Members who shortlisted my profile
						</c:if>
						<c:if test="${list_type == 'shortListedByMe'}">
							Profiles shortlisted by me
						</c:if>
					</div>
		            <form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
	             		<form:hidden path="id" />
						<div class="panel-body" id="matches">
							
						</div>
					</form:form>
				</div>
				<div id="pagination_div" style="font-size: 12px;">
					<div id="altLists"></div>
					<div id="table_footer"></div>
				</div>

				
			</div>
         
<script type="text/javascript">
var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = "${allowed_profiles_limit}";
if(allowed_limit=="unlimited"){
	allowed_limit = "1";
	allowed_limit = parseInt(allowed_limit);
}
var listOrders1 = ${shortlistedList};

displayMatches_myhome(listOrders1);


function fullProfile(profile_id){
	/* var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
	}else{
		document.searchForm2.action = "fullProfile"
	} */
	$("#id").val(profile_id);
	document.searchForm2.action = "fullProfile"
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
	$('#altLists').asPaginator(total_items_count, {
        currentPage: 1,
        visibleNum: {
          0: 5,
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
      	formData.append("request_from","shortlisted");
      	var listType = "${list_type}";
      	formData.append("list_type",listType);
      	
  		$.fn.makeMultipartRequest('POST', 'displayPage', false,
  				formData, false, 'text', function(data){
  			var jsonobj = $.parseJSON(data);
  			var results = jsonobj.results;
  				if(results==""){
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#matches').html('');
	    			$(str).appendTo("#matches");
	    			$("#table_footer").prop("hidden",true);
	    			$("#altLists").prop("hidden",true);
	    		}else{
	    			paginationSetup(total_items_count);
	    			$("#altLists").asPaginator('enable');
	    			displayMatches_myhome(results);
	    			displayTableFooter(page);
	    		}
  			
  		});
          
        }
      });
}


$(".dashboard").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>