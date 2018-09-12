<%@ include file="userCommonHeader.jsp"%>
 	<!-- <link href="css/fSelect.css" rel="stylesheet">
<script src="js/fSelect.js"></script> -->
<script>
(function($) {
    $(function() {
        //$('.mult-select-dd-opt-gtp').fSelect();
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
.allsubmitc {
margin-right:5px;
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
			.allcommunicationli li a {
			padding:4px 8px !important;
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
	<div class="container" style="background: #FFF; min-height:500px;">
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
							
							<li class="dropdown pull-right" >
    <button class="btn  dropdown-toggle" id="menu1" type="button" data-toggle="dropdown"> All Communications &nbsp;
    <span class="caret"> </span></button>
    <ul class="dropdown-menu allcommunicationli" role="menu" aria-labelledby="menu1">
    <div class="done_by_divs" id="accepted_by_div" hidden="true">
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label>Accepted
	    </label></a></li>
	    	<li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="accepted_by_me" value="read">Accepted by me
	    	</label></a></li>
	    	<li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="accepted_by_others" value="read">Accepted by others
	    	</label></a></li>
    </div>
    <div class="done_by_divs" id="rejected_by_div" hidden="true">
	    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label>Declined
	    </label></a></li>
	    	<li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="rejected_by_me" value="">Declined by me
	    	</label></a></li>
	    	<li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="rejected_by_others" value="">Declined by others
	    	</label></a></li>
    </div>
    <!-- <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label>Read Status
	    </label></a></li>
	<li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="read" value="read">Read
    </label></a></li>
	<li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="un_read" value="un_read">Un Read 
    </label></a></li> -->
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label>Communication Type
    </label></a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="all" value="all" onclick="selectAll();">All
    </label></a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="interests" value="interests">Interests
    </label></a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="messages" value="messages">Messages
    </label></a></li>
    <!-- <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" value="">Photo Requests
    </label></a></li> -->
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="mobile_no_viewed" value="mobile_no_viewed">Phone Number Viewed
    </label></a></li>
    <!-- <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> <label class="checkbox-inline"><input type="checkbox" id="other" value="other">Other Requets
    </label></a></li> -->
    <br>
    <span id="filterSubmitDiv"><a role="menuitem" tabindex="-1" href="#" class="btn btn-warning pull-right allsubmitc" onclick="displayFilterRequestsBlock();" id="filterSubmitBtn"> Submit </a></span>
    </ul>
  

					</li>
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
var allowed_limit = "${allowed_profiles_limit}";
if(allowed_limit=="unlimited"){
	allowed_limit = "1";
	allowed_limit = parseInt(allowed_limit);
}
var listOrders1 = ${inbox_requests};
displayMatches_inbox(listOrders1,"${listType}","${tabType}");
paginationSetup(total_items_count);
if(listOrders1 != null && listOrders1 != ""){
	$("#pagination_div").removeAttr("hidden");
	$("#table_footer").removeAttr("hidden");
	$("#altLists").removeAttr("hidden");
	displayTableFooter(1);
}
chnageAllCommunications();
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

function selectAll(){
	var checked = $("#all").prop("checked");
	if(checked){
		$("#interests").prop("checked",true);
		$("#messages").prop("checked",true);
		$("#mobile_no_viewed").prop("checked",true);
		$("#other").prop("checked",true);
	}else{
		$("#interests").prop("checked",false);
		$("#messages").prop("checked",false);
		$("#mobile_no_viewed").prop("checked",false);
		$("#other").prop("checked",false);
	}
	
}

$(".checkbox-inline").click(function(){
	var all_check_boxes = $(".allcommunicationli :checked");
	if(all_check_boxes.length==0){
		$("#filterSubmitDiv").attr("hidden",true);
	}else{
		$("#filterSubmitDiv").removeAttr("hidden");
	}
});

function chnageAllCommunications(){
	var active_tab_selector = $('section.active').attr('id');
	if(active_tab_selector.startsWith("pending_requests")){
  		$(".done_by_divs").attr("hidden",true);
  	}else if(active_tab_selector.startsWith("accepted_requests")){
  		$(".done_by_divs").attr("hidden",true);
  		$("#accepted_by_div").removeAttr("hidden");
  	}else if(active_tab_selector.startsWith("rejected_requests")){
  		$(".done_by_divs").attr("hidden",true);
  		$("#rejected_by_div").removeAttr("hidden");
  	}
}

var filter_requests_flag = false;
function displayFilterRequestsBlock(){
	var tabType = "", listType = "";
	var active_tab_selector = $('section.active').attr('id');
	var by_me = false, by_others = false;
  	if(active_tab_selector.startsWith("pending_requests")){
  		tabType = "inbox";
  		listType = "pending_requests";
  	}else if(active_tab_selector.startsWith("accepted_requests")){
  		tabType = "inbox";
  		listType = "accepted_requests";
  		by_me = $("#accepted_by_me").prop("checked");
  		by_others = $("#accepted_by_others").prop("checked");
  	}else if(active_tab_selector.startsWith("rejected_requests")){
  		tabType = "inbox";
  		listType = "rejected_requests";
  		by_me = $("#rejected_by_me").prop("checked");
  		by_others = $("#rejected_by_others").prop("checked");
  	}else if(active_tab_selector.startsWith("sent_requests")){
  		tabType = "sent";
  		listType = "sent_requests";
  	}else if(active_tab_selector.startsWith("awaiting_requests")){
  		tabType = "sent";
  		listType = "awaiting_requests";
  	}else if(active_tab_selector.startsWith("filtered_requests")){
  		tabType = "filtered";
  		listType = "filtered_requests";
  	}

  	var read = $("#read").prop("checked");
  	var un_read = $("#un_read").prop("checked");
  	
  	var all = $("#all").prop("checked");
  	var interests = $("#interests").prop("checked");
  	var messages = $("#messages").prop("checked");
  	var mobile_no_viewed = $("#mobile_no_viewed").prop("checked");

	
	var formData = new FormData();
  	formData.append("tab_type",tabType);
  	formData.append("list_type",listType);
  	
  	formData.append("by_me",by_me);
  	formData.append("by_others",by_others);
  	formData.append("read",read);
  	formData.append("un_read",un_read);
  	formData.append("all",all);
  	formData.append("interests",interests);
  	formData.append("messages",messages);
  	formData.append("mobile_no_viewed",mobile_no_viewed);
  	
  	formData.append("filter_requests","true");
  	
		$.fn.makeMultipartRequest('POST', 'inboxAjaxAction', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var inboxRequests = jsonobj.inbox_requests;
			var listType = jsonobj.listType;
			var tabType = jsonobj.tabType;
				total_items_count = jsonobj.total_records;
				$("#"+listType).html('');
				if(inboxRequests==""){
					var tblRow = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No requests found..!</h6></div>';
					//var tblRow = "No data available";
					$(tblRow).appendTo("#"+listType);
					$("#table_footer").attr("hidden",true);
	    			$("#altLists").attr("hidden",true);
				}else{
					filter_requests_flag = true;
					$("#altLists").asPaginator('destroy');
	    			paginationSetup(total_items_count);
	    			$("#altLists").asPaginator('enable');
	    			displayMatches_inbox(inboxRequests,listType,tabType);
	    			//$("#table_footer").removeAttr("hidden");
	    			//$("#altLists").removeAttr("hidden");
	    			$("#pagination_div").removeAttr("hidden");
	    			$("#table_footer").removeAttr("hidden");
	    			$("#altLists").removeAttr("hidden");
	    			displayTableFooter(1);
				}
				
    		
			
		});
}

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
      	}else if(active_tab_selector.startsWith("filtered_requests")){
      		tabType = "filtered";
      		listType = "filtered_requests";
      	}
      	formData.append("tab_type",tabType);
      	formData.append("list_type",listType);
      	
      	formData.append("filter_requests_flag",filter_requests_flag);
      	if(filter_requests_flag){
      		var by_me = $("#by_me").prop("checked");
      		var by_others = $("#by_others").prop("checked");
      		var read = $("#read").prop("checked");
      	  	var un_read = $("#un_read").prop("checked");
      	  	
      	  	var all = $("#all").prop("checked");
      	  	var interests = $("#interests").prop("checked");
      	  	var messages = $("#messages").prop("checked");
      	  	var mobile_no_viewed = $("#mobile_no_viewed").prop("checked");
      	  	
      	  	formData.append("by_me",by_me);
        	formData.append("by_others",by_others);
        	formData.append("read",read);
        	formData.append("un_read",un_read);
        	formData.append("all",all);
        	formData.append("interests",interests);
        	formData.append("messages",messages);
        	formData.append("mobile_no_viewed",mobile_no_viewed);
      	}
      	
      	
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