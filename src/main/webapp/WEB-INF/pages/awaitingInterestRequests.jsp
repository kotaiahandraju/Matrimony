<%@ include file="userCommonHeader.jsp"%>
 	<link href="css/fSelect.css" rel="stylesheet">
<script src="js/fSelect.js"></script>
<script>
(function($) {
    $(function() {
        $('.mult-select-dd-opt-gtp').fSelect();
    });
})(jQuery);
</script>
		<script>
			/* $(document).ready(function() {
				$('.nav-tabs > li > a').click(function(event){
					event.preventDefault();//stop browser to take action for clicked anchor
					
					//get displaying tab content jQuery selector
					var active_tab_selector = $('.nav-tabs > li.active > a').attr('href');					
					
					//find actived navigation and remove 'active' css
					var actived_nav = $('.nav-tabs > li.active');
					actived_nav.removeClass('active');
					
					//add 'active' css into clicked navigation
					$(this).parents('li').addClass('active');
					
					//hide displaying tab content
					$(active_tab_selector).removeClass('active');
					$(active_tab_selector).addClass('hide');
					
					//show target tab content
					var target_tab_selector = $(this).attr('href');
					$(target_tab_selector).removeClass('hide');
					$(target_tab_selector).addClass('active');
				});
			}); */
		</script>
		<style>
			/** Start: to style navigation tab **/
			.nav {
			  margin-left: 0;
			  list-style: none;
			}

			.nav > li > a {
			  display: block;
			}
			
			.nav-tabs{
			  *zoom: 1;
			}

			.nav-tabs:before,
			.nav-tabs:after {
			  display: table;
			  content: "";
			}

			.nav-tabs:after {
			  clear: both;
			}

			.nav-tabs > li {
			  float: left;
			}

			.nav-tabs > li > a {
			  padding-right: 12px;
			  padding-left: 12px;
			  margin-right: 2px;
			  line-height: 14px;
			}

			.nav-tabs {
			  border-bottom: 1px solid #ddd;
			}

			.nav-tabs > li {
			  margin-bottom: -1px;
			}

			.nav-tabs > li > a {
			  padding-top: 8px;
			  padding-bottom: 8px;
			  line-height: 18px;
			  border: 1px solid transparent;
			  -webkit-border-radius: 4px 4px 0 0;
				 -moz-border-radius: 4px 4px 0 0;
					  border-radius: 4px 4px 0 0;
			}

			.nav-tabs > li > a:hover {
			  border-color: #eeeeee #eeeeee #dddddd;
			}

			.nav-tabs > .active > a,
			.nav-tabs > .active > a:hover {
			  color: #555555;
			  cursor: default;
			  background-color: #ffffff;
			  border: 1px solid #ddd;
			  border-bottom-color: transparent;
			}
			
			li {
			  line-height: 18px;
			}
			
			.tab-content.active{
				display: block;
			}
			
			.tab-content.hide{
				display: none;
			}
			
			
			/** End: to style navigation tab **/
		</style>
<div class="products">
	<div class="container" style="background: #FFF;">
		<div class="mid-grids">
			<jsp:include page="sideGrid1.jsp" />
			<div class="col-md-9 products-grid-left">
			<form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
<div id="inbox_div" class="tabcontent">
  					<div>
						<ul class="nav nav-tabs">
							<li id="pending_requests_tab" class="active">
								<a href="#" onclick="displayBlock('inbox','pending_requests');">Pending</a>
							</li>
							<li id="accepted_requests_tab">
								<a href="#" onclick="displayBlock('inbox','accepted_requests');">Accepted</a>
							</li>
							<li id="rejected_requests_tab">
								<a href="#" onclick="displayBlock('inbox','rejected_requests');">Declined</a>
							</li>
							<li class="pull-right"><select class="mult-select-dd-opt-gtp" multiple="multiple">
        <optgroup label="Read Status">
            <option value="Read" >Read</option>
            <option value="Unread" >Un Read</option>
        </optgroup>
        <optgroup label="Communication Type">
            <option value="All" >All</option>
            <option value="CSS">Interests</option>
            <option value="Messages">Messages</option>
            <option value="Photo Requests">Photo Requests</option>
            <option value="Horoscope Requests" >Horoscope Requests</option>
            <option value="Phone Numbers Viewed">Phone Numbers Viewed</option>
            <option value="Other Requests">Other Requests</option>

        </optgroup>
    </select></li>
						</ul>	
					</div>
		<section id="pending_requests_section" class="tab-content_inbox active">
			<div >
				
				
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">You are yet to respond to the following requests. </div>
		            
	             		<form:hidden path="id" />
						<div class="panel-body" id="pending_requests">
							
						</div>
					
				</div>
				

				
			
			</div>
		</section>
		<section id="accepted_requests_section" class="tab-content_inbox hide">
			<div>
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">You accepted the following requests. </div>
		            
	             		<form:hidden path="id" />
						<div class="panel-body" id="accepted_requests">
							
						</div>
					
				</div>
				
				
			</div>
		</section>
		<section id="rejected_requests_section" class="tab-content_inbox hide">
			<div>
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">You rejected the following requests. </div>
		            
	             		<form:hidden path="id" />
						<div class="panel-body" id="rejected_requests">
							
						</div>
					
				</div>
				
			</div>
		</section>
</div>

<div id="sent_div" class="tabcontent" hidden="true">
  					<div>
						<ul class="nav nav-tabs">
							<li id="sent_requests_tab" class="active">
								<a href="#" onclick="displayBlock('sent','sent_requests');">All Sent</a>
							</li>
							<li id="awaiting_requests_tab">
								<a href="#" onclick="displayBlock('sent','awaiting_requests');">Awaiting Reply</a>
							</li>
							<!-- <li id="accepted_me_requests_tab">
								<a href="#" onclick="displayBlock('sent','accepted_me_requests');">Accepted Me</a>
							</li>
							<li id="rejected_me_requests_tab">
								<a href="#" onclick="displayBlock('sent','rejected_me_requests');">Rejected Me</a>
							</li> -->
							
						</ul>	
					</div>
		<section id="sent_requests_section" class="tab-content_inbox active">
			<div >
				
				
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">You sent the following requests. </div>
		            
	             		<form:hidden path="id" />
						<div class="panel-body" id="sent_requests">
							
						</div>
					
				</div>
				

				
			
			</div>
		</section>
		<section id="awaiting_requests_section" class="tab-content_inbox hide">
			<div>
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">Awaiting response for the following requests. </div>
		            
	             		<form:hidden path="id" />
						<div class="panel-body" id="awaiting_requests">
							
						</div>
					
				</div>
				
				
			</div>
		</section>
		<section id="accepted_me_requests_section" class="tab-content_inbox hide">
			<div>
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">Following members accepted your requests. </div>
		            
	             		<form:hidden path="id" />
						<div class="panel-body" id="accepted_me_requests">
							
						</div>
					
				</div>
				
				
			</div>
		</section>
		<section id="rejected_me_requests_section" class="tab-content_inbox hide">
			<div>
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">Following members rejected your requests. </div>
		            
	             		<form:hidden path="id" />
						<div class="panel-body" id="rejected_me_requests">
							
						</div>
					
				</div>
				
				
			</div>
		</section>
		
</div>
<div id="filtered_div" class="tabcontent">
  					<div>
						<ul class="nav nav-tabs">
							<li id="filtered_requests_tab">
								<a href="#" onclick="displayBlock('filtered','filtered_requests');">Filtered Requests</a>
							</li>
						</ul>	
					</div>
		<section id="filtered_requests_section" class="tab-content_inbox active">
			<div >
				
				
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">You are yet to respond to the following filtered requests. </div>
		            
	             		<form:hidden path="id" />
						<div class="panel-body" id="filtered_requests">
							
						</div>
					
				</div>
				

				
			
			</div>
		</section>
</div>
<div id="inbox_div" class="tabcontent">
  					<div>
						<ul class="nav nav-tabs">
							<li id="profile_views_tab" class="active">
								<a href="#" onclick="displayBlock('','profile_views');">Following members viewed your profile</a>
							</li>
<!-- 							<li id="accepted_requests_tab">
								<a href="#" onclick="displayBlock('inbox','accepted_requests');">Accepted</a>
							</li>
							<li id="rejected_requests_tab">
								<a href="#" onclick="displayBlock('inbox','rejected_requests');">Declined</a>
							</li>
 -->						</ul>	
					</div>
		<section id="profile_views_section" class="tab-content_inbox active">
			<div >
				
				
				<div class="panel panel-success">
					
		            
	             		<form:hidden path="id" />
						<div class="panel-body" id="profile_views">
							
						</div>
					
				</div>
				

				
			
			</div>
		</section>
		
</div>

			<div id="pagination_div" style="font-size: 12px;">
					<div id="altLists"></div>
					<div id="table_footer"></div>
				</div>


				

			</form:form>	
			</div>
			<div id="dial1"></div>
			<%-- <div class="col-md-8 products-grid-left">
			
				<div id="London" class="tabcontent">
  <div>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#tab1" onclick="getSentRequests();">All Sent (${cacheGuest.sentInterestCount})</a>
				</li>
				<li>
					<a href="#tab2">Awaiting Reply (${cacheGuest.awaitingInterestCount})</a>
				</li>
				<!-- <li>
					<a href="#tab3">Show Tab 3</a>
				</li> -->
			</ul>	
		</div>
		<section id="tab1" class="tab-content active">
			<div>
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">You sent requests to the following members</div>
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
		</section>
		<section id="tab2" class="tab-content hide">
			<div>
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">Awaiting response from the following members</div>
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
		</section>
		<section id="tab3" class="tab-content hide">
			<div>
				Content in tab 3
			</div>
		</section>
</div>

<div id="Paris" class="tabcontent">
  <h3>Paris</h3>
  <p>Paris is the capital of France.</p> 
</div>

<div id="Tokyo" class="tabcontent">
  <h3>Tokyo</h3>
  <p>Tokyo is the capital of Japan.</p>
</div>


				<div id="pagination_div" style="font-size: 12px;">
					<div id="altLists"></div>
					<div id="table_footer"></div>
				</div>

				
			</div> --%>
       <script>

</script>
<script type="text/javascript">
var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = ${allowed_profiles_limit};
var listOrders1 = ${inbox_requests};
displayMatches_inbox(listOrders1,"${listType}","${tabType}");
paginationSetup(total_items_count);
if(listOrders1 != null && listOrders1 != ""){
	$("#pagination_div").removeAttr("hidden");
	$("#table_footer").removeAttr("hidden");
	$("#altLists").removeAttr("hidden");
	displayTableFooter(1);
}

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
/* function paginationSetup(total_items_count) {
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
      	formData.append("request_from","dashboard");
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
	    			displayMatches_myhome(results);
	    			$("#altLists").asPaginator('enable');
	    			$("#table_footer").removeAttr("hidden");
	    			$("#altLists").removeAttr("hidden");
	    			displayTableFooter(page);
	    		}
  			
  		});
          
        }
      });
} */

function paginationSetup(total_items_count) {
	  $('#altLists').asPaginator(total_items_count, {
        currentPage: 1,
        itemsPerPage: 10,
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
      	 
      	 formData.append("page_no",page);
      	 formData.append("request_from","inbox");
      	
      	//var active_tab_selector = $('.nav-tabs > li.active > a').attr('href');
      	var tabType = "", listType = "";
      	var active_tab_selector = $('section.active').attr('id');
      	if(active_tab_selector.startsWith("pending_requests")){
      		tabType = "inbox";
      		listType = "pending_requests";
      	}else if(active_tab_selector.startsWith("accepted_requests")){
      		tabType = "inbox";
      		listType = "accepted_requests";
      	}else if(active_tab_selector.startsWith("rejected_requests")){
      		tabType = "inbox";
      		listType = "rejected_requests";
      	}else if(active_tab_selector.startsWith("sent_requests")){
      		tabType = "sent";
      		listType = "sent_requests";
      	}else if(active_tab_selector.startsWith("awaiting_requests")){
      		tabType = "sent";
      		listType = "awaiting_requests";
      	}
      	formData.append("tab_type",tabType);
      	formData.append("list_type",listType);
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
	    			displayMatches_inbox(results,listType,tabType);
	    			$("#table_footer").removeAttr("hidden");
	    			$("#altLists").removeAttr("hidden");
	    			displayTableFooter(page);
	    		}
  			
  		});
          
        }
      });
}
$(".messages").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>