<%@ include file="userHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!-- products -->
<div class="products">
	<div class="container" style="background: #FFF;">
		<div class="mid-grids">
			<div class="col-md-12">
				<h4>Hello <%= userBean.getFirstName() %>. <%= userBean.getLastName() %><span>(<%= userBean.getUsername() %>)</span></h4>
			</div>   
			<div class="col-md-3 products-grid-right">
				<div class="well">
					<div class="row">
						<div class="col-md-5">
							<c:if test="${not empty cacheGuest.profileImage}">
								<img src="${cacheGuest.profileImage}" class="img-responsive thumbnail" style="margin-bottom:0;height: 85px;">
							</c:if>
							<c:if test="${empty cacheGuest.profileImage}">
								<img src="img/default.png" class="img-responsive thumbnail" style="margin-bottom:0;">
							</c:if>
						</div>	
						<div class="col-md-7" style="padding-left:0;" >
							<div class="profiletable">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr><td><a href="EditUserProfile">Edit Profile</a></td></tr>
									<tr><td><a href="#">Manage Profile</a></td></tr>
									<tr><td><a href="#">Edit Preferences</a></td></tr>
									<tr><td><a href="#">Privacy Options</a></td></tr>
								</table>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				
				<div class="panel panel-success">
					<div class="panel-body">
						<h4><strong>Messages</strong></h4>
						<div class="tabbable" id="tabs-343694">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#inbox" data-toggle="tab"><strong>INBOX</strong></a></li>
								<li><a href="#sent" data-toggle="tab"><strong>SENT</strong></a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="inbox">
									<table width="100%">
										<tr>
											<td height="30"><a href="receivedRequests">Invitations</a></td>
											<td><span class="badge pull-right">${cacheGuest.receivedInterestCount}</span></td>
										</tr>
										<tr>
											<td height="30"><a href="#">Members</a></td>
											<td><span class="badge pull-right">${cacheGuest.acceptedInterestCount}</span></td>
										</tr>
										<tr>
											<td height="30"><a href="profileViewedMembers">Profile Viewed</a></td>
											<td><span class="badge pull-right">${cacheGuest.profileViewedCount}</span></td>
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
				</div>
			</div>
			
			<div class="col-md-6 products-grid-left">
				<div class="panel panel-default">
					<div class="panel-body">
						Complete the remaining Profile
						<div class="progress">
							<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${profile_filled_status}%;">
								<%= session.getAttribute("profile_filled_status") %>% Complete 
							</div>
						</div>
						<p><span class="glyphicon glyphicon-envelope"></span> Verify your Email <a href="#"><u>Verify Email Address</u></a></p>
					</div>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">Preferred Profiles </div>
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

			<div class="col-md-3 products-grid-right">
				<%-- <div class="panel panel-warning">
					<div class="panel-heading">
						<h4 class="panel-title">Partner Search</h4>
					</div>
					<div class="panel-body">
						<form:form commandName="createProfile" action="searchProfiles" method="post" class="form-horizontal">
							<div class="form-group">
								<label class="col-md-3 control-label" for="textinput">Age</label>  
								<div class="col-md-5">
									<input type="number" min="20" max="55" name="ageFrom" placeholder="from" class="form-control"/>
								</div>
								<div class="col-md-4">
									<input type="number" min="20" max="55" name="ageTo" placeholder="to" class="form-control"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="textinput">Education</label>  
								<div class="col-md-9">
									<form:select path="rEducation" class="form-control">
										<form:option value="">-- Education --</form:option>
										<form:options items="${education}"></form:options>
									</form:select>
								</div>
							</div>
							<div class="form-group">
							  <label class="col-md-3 control-label" for="textinput">Location</label>  
							  <div class="col-md-9">
							  	<form:select path="currentCity" class="form-control">
									<form:option value="">-- Location --</form:option>
									<form:options items="${citys}"></form:options>
								</form:select>
							    
							  </div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label" for="singlebutton"></label>
								<div class="col-md-9">
									<button id="singlebutton" name="singlebutton" class="btn btn-primary" type="submit">Search</button>
								</div>
							</div>
						</form:form>
					</div>
				</div> --%>
            </div>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- //products -->

	<!-- Modal Starts here-->
	<div class="modal" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content table-responsive">
				<table class="table table-responsive">
	    			<thead style="background: #4CAF50;color: white;">
	    				<tr>
	    					<th>Services</th><th>Duration<br>(Months)</th><th>Amount<br>(INR)</th><th>Messages</th><th>Profiles</th>
	    					<th>Highlight<br>Profile</th><th>Chat</th><th>Horoscope<br>View</th><th>Astrology<br>Match</th>
	    				</tr>
	    			</thead>
	    			<tbody>
	    				<tr>
	    					<th>Classic</th><td>3</td><td>1299</td><td><i style="color: red;" class="fa fa-times"></i></td><td>25</td>
	    					<td><i style="color: red;" class="fa fa-times"></i></td><td><i style="color: red;" class="fa fa-times"></i></td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    				</tr>
	    				<tr>
	    					<th>Classic Plus</th><td>6</td><td>2499</td><td><i style="color: red;" class="fa fa-times"></i></td><td>45</td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    				</tr>
	    				<tr>
	    					<th>Premium</th><td>6</td><td>5299</td><td>Unlimited</td><td>65</td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    				</tr>
	    				<tr>
	    					<th>Premium Plus</th><td>6</td><td>7499</td><td>Unlimited</td><td>85</td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    					<td><i style="color: green;" class="fa fa-check"></i></td><td><i style="color: green;" class="fa fa-check"></i></td>
	    				</tr>
	    				<tr style="background: #ff8080;color: white;">
	    					<th>Aarna Premium</th><td>Till Marry</td><td>14999</td>
	    					<td>Premium Benefits</td><td>Meet Ups</td><td>High priority</td>
	    					<td colspan="3">Quick Response</td>
	    				</tr>
	    			</tbody>
	    			<tfoot>
	    				<tr>
	    					<th colspan="7" style="text-align: right;"><a href="memberShipPage" class="btn1 btn btn-info">Upgrade</a></th>
	    					<th colspan="2"><a href="myProfile" class="btn1 btn btn-info">My Account</a></th>
	    				</tr>
	    			</tfoot>
    			</table>
			</div>
		</div>
	</div>
	<!-- Modal Ends here-->


<input type="hidden" name="loc" id="loc" value="${baseurl }" />

<script type="text/javascript">
/* $(window).load(function() {
	$('#myModal').modal();
}); */

var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = ${allowed_profiles_limit};
var listOrders1 = ${allOrders1};

if (listOrders1 != "") {
	displayMatches(listOrders1);
}

function displayMatches(listOrders) {
	$('#matches').html('');
	serviceUnitArray = {};
	if(listOrders == ""){
		var tblRow = '<div>No matches found.</div>';
		$(tblRow).appendTo("#matches");
		$("#pagination_div").prop("hidden",true);
	}
	$.each(listOrders,function(i, orderObj) 
	{
		paginationSetup(total_items_count);
		$("#altLists").asPaginator('enable');
		$("#pagination_div").removeAttr("hidden");
		displayTableFooter(1);
		serviceUnitArray[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.image;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
			});
		}
		if(orderObj.firstName !=null)
		{
			var login_user_role_id = ${cacheGuest.roleId};
			var mobile_no__str = '';
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14)){ //means premium,premium_plus,aarna premium users
				mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				//more_details_str = '<tr><td><span><a href="#" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
			}
			var tblRow = '<div class="row container-fluid">'
				+ '<div class="col-md-2" style="margin-right:0; padding-right:0;">'
	            + 	"<img src="+image+" class='img-responsive thumbnail' style='margin-bottom: 0px;'>"
	            + '</div>'
	            + '<div class="col-md-9">'
	            + 	'<div class="profilesimilar">'
	            + 		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
	            + 			'<tr><td><h4>'+orderObj.firstName+'&nbsp;'+orderObj.lastName+'</h4></td></tr>'
	            + 			'<tr><td><p>'+orderObj.dobString+', '+orderObj.religionName+', '+orderObj.casteName+',</p></td></tr>'
	            + 			'<tr><td><p>'+orderObj.age+'&nbsp'+orderObj.occupationName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'.</p></td></tr>'
	            +			mobile_no__str
	            + 			'<tr><td><span><a href="#" onclick="fullProfile('+orderObj.id+')">Full Profile</span> </td></tr>'
	            + 		'</table>'
	            + 	'</div>'
	            + '</div>'
	            + '<div class="clearfix"></div>'
	            + '<hr>'
	            + '</div>';
	        /* var login_user_role_id = ${cacheGuest.roleId};
	        if(login_user_role_id==4){ // means free user
	        	$("#mobileBtn"+orderObj.id).prop("disabled",true);
	        } */
			$(tblRow).appendTo("#matches"); 
		}
	});
}

/* function displayMobileNum(profileId,listType){
	 var profileObj = serviceUnitArray[profileId];
	var formData = new FormData();
	formData.append('profile_id',profileId);
	formData.append('list_type',listType);
	jQuery.fn.makeMultipartRequest('POST', 'viewedMobileNumber', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var msg = jsonobj.message;
    		if(typeof msg != "undefined"){
    			if(msg=="success"){
    				$("#row"+profileId).html('<td>'+profileObj.mobile+'</td>');
    			}else{
    				alert("Some problem occured. Please try again.");
    			}
    		}
    		
	}); 
	
} */

function displayMobileNum(profileId,listType){
	if(allowed_limit<=0){
		alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
		return false;
	}
	var profileObj = serviceUnitArray[profileId];
	var formData = new FormData();
	formData.append('profile_id',profileId);
	formData.append('list_type',listType);
	jQuery.fn.makeMultipartRequest('POST', 'viewedMobileNumber', false, formData, false, 'text', function(data){
   		var jsonobj = $.parseJSON(data);
   		var limit = jsonobj.allowed_limit;
   		var msg = jsonobj.message;
   		if(typeof msg != "undefined"){
   			if(msg == "success"){
   				$("#row"+profileId).html('<td>'+profileObj.mobile+'</td>');
   				allowed_limit = limit;
   			}else{
   				alert("Some problem occured. Please try again.");
   			}
   		}
	});
}

function fullProfile(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
	}else{
		document.searchForm2.action = "fullProfile"
	}
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
		    			displayMatches(results);
		    			displayTableFooter(page);
		    		}
	  		});
        }
	});
}
</script>

<%@ include file="userFooter.jsp"%>