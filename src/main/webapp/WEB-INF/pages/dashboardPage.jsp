<%@ include file="userHeader.jsp"%>
			
			<div class="col-md-8 products-grid-left">
				<div class="panel panel-default">
					<div class="panel-body">
						<c:if test="${profile_filled_status != '100'}">
							Complete the remaining Profile
						</c:if>
						
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
	             			<div class="panel-body" id="matches" style="overflow-y:scroll; height:350px;">
	             		
							
							</div>
						</form:form>
				</div>
				<div id="pagination_div" style="font-size: 12px;">
					<div id="altLists"></div>
					<div id="table_footer"></div>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">New Matches</div>
		            <div class="panel-body">
				      <div class="carousel slide media-carousel" id="media">
				        <div class="carousel-inner" id="new_matches">
				          
					    </div>
					  </div>
					</div>
					
				</div>
            
            
            
			

			
	<!-- Modal Starts here-->
	

<!-- //footer -->
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<script src="js/ajax.js"></script>
<script src="js/jquery-asPaginator.js"></script>
<script src="js/jquery.watermark.js"></script>


<script type="text/javascript">
/* $(window).load(function() {
	$('#myModal').modal();
});
  */
  $(function(){
		 //add text water mark;	
	  addWaterMark();
  });
  function addWaterMark(){
	  $('.watermark_text').watermark({
		  text: 'aarnamatrimony.com',
		  textWidth: 500,
		  textSize: 50,
		  textColor: 'white',
		  gravity: 'w',
		   opacity: 0.7,
		   margin: 5,
		   outputWidth: 'auto',
		   outputHeight: 'auto'
		 });
  }
var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = ${allowed_profiles_limit};
var listOrders1 = ${allOrders1};

//if (listOrders1 != "") {
	displayMatches(listOrders1);
	//displayNewMatches(listOrders1);
//}
function displayMatches(listOrders) {
	$('#matches').html('');
	serviceUnitArray = {};
	if(listOrders==""){
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
		
		var image = null; image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		/* else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
			});
		} */
		
			var login_user_role_id = ${cacheGuest.roleId};
			var firstname = 'xxxxxx',lastname='xxxxxx';
			var ageStr = orderObj.age;
			var age = ageStr.split(".")[0];
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14)){ //means premium,premium_plus,aarna premium users
			
				firstname = orderObj.firstName;
				lastname = orderObj.lastName;
				//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				//more_details_str = '<tr><td><span><a href="#" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
			}
			var tblRow = '<div class="row">'
				+ '<div class="col-md-2" >'
	            + 	"<img src="+image+" class='watermark_text img-responsive thumbnail ' style='max-height:70px;'>"
	            + '</div>'
	            + '<div class="col-md-10">'
	            + 	'<div class="profilesimilar">'
	            + 		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
	            + 			'<tr><td><h4>'+firstname+'&nbsp;'+lastname+'</h4>&nbsp;('+orderObj.username+')</td></tr>'
	            + 			'<tr><td><p>'+age+' yrs, '+orderObj.religionName+', '+orderObj.casteName+',</p></td></tr>'
	            + 			'<tr><td><p>'+orderObj.inches+'&nbsp'+orderObj.occupationName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'.</p></td></tr>'
	            //+			mobile_no__str
	            //+ 			'<tr><td><span><a href="#" onclick="fullProfile('+orderObj.id+')">Full Profile</span> </td></tr>'
	            + 		'</table>'
	            + 	'</div>'
	            + '</div>'
	            + '<div class="col-md-3" style="margin-right:0; padding-right:0;">'
	            +  '<h4 style="margin-bottom:20px;">Like this Profile?</h4>'
	            + 	'<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button><br><br>'
	            + 	'<button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
	            //+   '<button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
	            + '</div>'
	            + '<div class="row container-fluid">'
	            + 	'<div class="col-md-7" style="margin-right:0; padding-right:0;">'
	            +		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
	            + 			'<tr>'
	            //+				'<td><button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button></td>'
	            //+ 				'<td>&nbsp;</td><td><button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>'
	            //+				'<td><a href="#" onclick="fullProfile('+orderObj.id+')">View Full Profile</a></td>'
	            + 				'<td id="mobileTD'+orderObj.id+'"><a href="#"   type="button" class="btn" onclick="displayMobileNum('+orderObj.id+')">View Mobile Number</a></td>'
	            + 				'<td id="shortlistTD'+orderObj.id+'"><a href="#"   type="button" class="btn" onclick="shortList('+orderObj.id+')">Shortlist</a></td></tr>'
	            + 		'</table>'
	            //+ 		'<button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
	            //+   	'<button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
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
		
	});
}

function displayNewMatches(listOrders) {
	$('#new_matches').html('');
	serviceUnitArray = {};
	if(listOrders==""){
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
		
		var image = null; image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		/* else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
			});
		} */
		
			var login_user_role_id = ${cacheGuest.roleId};
			var firstname = 'xxxxxx',lastname='xxxxxx';
			var ageStr = orderObj.age;
			var age = ageStr.split(".")[0];
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14)){ //means premium,premium_plus,aarna premium users
			
				firstname = orderObj.firstName;
				lastname = orderObj.lastName;
				//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				//more_details_str = '<tr><td><span><a href="#" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
			}
			var tblRow = '<div class="item "><div class="row">'
				+ '<div class="col-md-4" >'
	            + 	"<img src="+image+" class='watermark_text img-responsive thumbnail ' style='max-height:70px;'>"
	            + '</div>'
	            + '<div class="col-md-10">'
	            + 	'<div class="profilesimilar">'
	            + 		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
	            + 			'<tr><td><h4>'+firstname+'&nbsp;'+lastname+'</h4>&nbsp;('+orderObj.username+')</td></tr>'
	            + 			'<tr><td><p>'+age+' yrs, '+orderObj.religionName+', '+orderObj.casteName+',</p></td></tr>'
	            + 			'<tr><td><p>'+orderObj.inches+'&nbsp'+orderObj.occupationName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'.</p></td></tr>'
	            //+			mobile_no__str
	            //+ 			'<tr><td><span><a href="#" onclick="fullProfile('+orderObj.id+')">Full Profile</span> </td></tr>'
	            + 		'</table>'
	            + 	'</div>'
	            + '</div>'
	            + '<div class="col-md-3" style="margin-right:0; padding-right:0;">'
	            +  '<h4 style="margin-bottom:20px;">Like this Profile?</h4>'
	            + 	'<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button><br><br>'
	            + 	'<button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
	            //+   '<button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
	            + '</div>'
	            + '<div class="row container-fluid">'
	            + 	'<div class="col-md-7" style="margin-right:0; padding-right:0;">'
	            +		'<table width="100%" border="0" cellspacing="0" cellpadding="0">'
	            + 			'<tr>'
	            //+				'<td><button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button></td>'
	            //+ 				'<td>&nbsp;</td><td><button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>'
	            //+				'<td><a href="#" onclick="fullProfile('+orderObj.id+')">View Full Profile</a></td>'
	            + 				'<td id="mobileTD'+orderObj.id+'"><a href="#"   type="button" class="btn" onclick="displayMobileNum('+orderObj.id+')">View Mobile Number</a></td>'
	            + 				'<td id="shortlistTD'+orderObj.id+'"><a href="#"   type="button" class="btn" onclick="shortList('+orderObj.id+')">Shortlist</a></td></tr>'
	            + 		'</table>'
	            //+ 		'<button  type="button" class="btn btn-primary btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
	            //+   	'<button id="mobileBtn'+orderObj.id+'" type="button" class="btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
	            + 	'</div>'
	            + '</div>'
	            + '</div>'
	            + '<hr>'
	            + '</div>';
	        /* var login_user_role_id = ${cacheGuest.roleId};
	        if(login_user_role_id==4){ // means free user
	        	$("#mobileBtn"+orderObj.id).prop("disabled",true);
	        } */
	        $(tblRow).appendTo("#new_matches");
	        var str = '<a data-slide="prev" href="#media" class="left carousel-control">\<</a>'
	        		+'<a data-slide="next" href="#media" class="right carousel-control">\></a>';
	        $(str).appendTo("#new_matches");
	        $('aaassss').appendTo("#new_matches");
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

function displayMobileNum(profileId){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profileId);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		}
		var profileObj = serviceUnitArray[profileId];
		var formData = new FormData();
		formData.append('profile_id',profileId);
		jQuery.fn.makeMultipartRequest('POST', 'viewedMobileNumber', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var limit = jsonobj.allowed_limit;
	    		var msg = jsonobj.message;
	    		if(typeof msg != "undefined"){
	    			if(msg=="success"){
	    				$("#mobileTD"+profileId).html(profileObj.mobile);
	    				allowed_limit = limit;
	    			}else{
	    				alert("Some problem occured. Please try again.");
	    			}
	    		}
	    		
		});
	}
	
	
}

function shortList(profileId){
		$("#id").val(profileId);
		var profileObj = serviceUnitArray[profileId];
		var formData = new FormData();
		formData.append('profile_id',profileId);
		jQuery.fn.makeMultipartRequest('POST', 'shortList', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var msg = jsonobj.message;
	    		if(typeof msg != "undefined"){
	    			if(msg=="success"){
	    				$("#shortlistTD"+profileId).html("Shortlisted");
	    			}else{
	    				alert("Some problem occured. Please try again.");
	    			}
	    		}
	    		
		});
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
	    			addWaterMark();
	    		}
  			
  		});
          
        }
      });
}
function getNewMatches(){
	document.searchForm2.action = "newMatches";
    document.searchForm2.submit();            
    return true;
}

function expressInterest(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
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
	
		formData.append('profile_id',profile_id);
		jQuery.fn.makeMultipartRequest('POST', 'expressInterestTo', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var limit = jsonobj.allowed_limit;
	    		var msg = jsonobj.message;
	    		var profiles = jsonobj.allProfiles;
	    		//if(typeof msg != "undefined" ){
	    			if("success"==msg){
	    				alert("Interest request has been sent successfully");
	    				$("#expInterest"+profile_id).html('Expressed Interest');
	    				$("#expInterest"+profile_id).prop("disabled",true);
	    				allowed_limit = limit;
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Interest request is not successful. Please try again.");
	    			}
	    		//}
	    		/* if(profiles==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(profiles.length);
	    			displayMatches(profiles);
	    		} */
	    		/* var filtered_list = jsonobj.filtered_profiles;
	    		$('#countId').html('');
	    		if(filtered_list==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(filtered_list.length);
	    			displayMatches(filtered_list);
	    		} */
				
			});
	}
}


	 
$(".dashboard").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>
</html>