<%@ include file="userCommonHeader.jsp"%>
 	
		<script>
			$(document).ready(function() {
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
			});
		</script>
		<style>
			/** Start: to style navigation tab **/
			.nav {
			  margin-bottom: 18px;
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
			
			<div class="col-md-3 products-grid-right">
				<div class="panel panel-success">
					<div class="panel-body">
						<h4><strong>Activity</strong></h4>
						<div class="tabbable" id="tabs-343694">
							
							<div class="tab-content">
								<div class="tab" id="inbox">
									<table width="100%">
										<tr style="border-bottom:1px dotted;">
											<td height="30"><a class="tablinks" onclick="openCity(event, 'London')" id="defaultOpen">Inbox</a></td>
											
										</tr>
										<tr style="border-bottom:1px dotted;">
											<td height="30"><a href="#" class="tablinks" onclick="openCity(event, 'Paris')">Sent</a></td>
											
										</tr>
										<tr style="border-bottom:1px dotted;">
											<td height="30"><a href="#">Profiles I have blocked</a></td>
											<td><span class="badge pull-right">${cacheGuest.acceptedInterestCount}</span></td>
										</tr>
									</table>
									<h4><strong>Profile Views</strong></h4>
									<table width="100%">
										<tr style="border-bottom:1px dotted;">
											<td height="30"><a href="receivedRequests">Members viewed my profile</a></td>
											
										</tr>
										<tr style="border-bottom:1px dotted;">
											<td height="30"><a href="#">Members shortlisted my profile</a></td>
											
										</tr>
									</table>
									<h4><strong>SMS</strong></h4>
									<table width="100%">
										<tr style="border-bottom:1px dotted;">
											<td height="30"><a href="receivedRequests">SMS Received</a></td>
											
										</tr>
										<tr style="border-bottom:1px dotted;">
											<td height="30"><a href="#">SMS Sent</a></td>
											
										</tr>
									</table>
								</div>
								<div class="tab-pane" id="sent">
									<table width="100%">
										<tr>
											<td height="30"><a href="sentRequests">Invitations</a></td>
											<td><span class="badge pull-right">${cacheGuest.sentInterestCount}</span></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div><div class="panel-group" id="accordion">
    <div class="panel panel-default">
        <div class="panel-heading">
             <h4 class="panel-title">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel1"><i class="glyphicon glyphicon-minus"></i>Panel 1</a>
            </h4>

        </div>
        <div id="panel1" class="panel-collapse collapse in">
            <div class="panel-body">Contents panel 1</div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
             <h4 class="panel-title">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel2"><i class="glyphicon glyphicon-plus"></i>Panel 2</a>
            </h4>

        </div>
        <div id="panel2" class="panel-collapse collapse">
            <div class="panel-body">Contents panel 2</div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
             <h4 class="panel-title">
                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#panel3"><i class="glyphicon glyphicon-plus"></i>Panel 3</a>
            </h4>

        </div>
        <div id="panel3" class="panel-collapse collapse">
            <div class="panel-body">Contents panel 3</div>
        </div>
    </div>
</div>
			</div>
			<div id="dial1"></div>
			<div class="col-md-8 products-grid-left">
			
				<div id="London" class="tabcontent">
  <div>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#tab1">Mobile No.s viewed by me</a>
				</li>
				<!-- <li>
					<a href="#tab2">Show Tab 2</a>
				</li>
				<li>
					<a href="#tab3">Show Tab 3</a>
				</li> -->
			</ul>	
		</div>
		<section id="tab1" class="tab-content active">
			<div>
				<div class="panel panel-success">
					<div class="panel-heading" id="tbl_header">You viewed mobiles no.s of following members. </div>
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
				Content in tab 2
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

				
			</div>
       <script>
function openCity(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
<script type="text/javascript">
var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = ${allowed_profiles_limit};
var listOrders1 = ${pendingRequests};
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