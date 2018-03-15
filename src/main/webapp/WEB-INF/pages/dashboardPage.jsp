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
						<c:if test="${emailverify == '0'}">
						
						<p><span class="glyphicon glyphicon-envelope"></span> Verify your Email <a href="#" onclick="verifyEmail()"><u>Verify Email Address</u></a></p>
						</c:if>
						
					</div>

				</div>
				<div class="panel panel-success">
					<div class="panel-heading">Preferred Profiles </div>
		            <form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
	             		<form:hidden path="id" />
	             			<div class="panel-body" id="matches" style="overflow-y:scroll; max-height: 350px">
	             		
							
							</div>
						</form:form>
				</div>
				<div id="pagination_div" style="font-size: 12px;">
					<div id="altLists"></div>
					<div id="table_footer"></div>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">New Matches</div>
		            <div class="panel-body"> <div class="panel-body"> 
					  <div class='row'>
					    <div class='col-md-12'>
					      <div class="carousel slide media-carousel" id="media">
					        <div class="carousel-inner" id="new_matches">
						    	
					    	</div>
					    	<a data-slide="prev" href="#media" class="left carousel-control">(</a>
        					<a data-slide="next" href="#media" class="right carousel-control">)</a>
					    </div>
					</div></div></div></div></div>
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
  $(document).ready(function() {
	  $('#media').carousel({
	    pause: true,
	    interval: false,
	  });
 });
  $(function(){
		 //add text water mark;	
	  addWaterMark();
  });
  function addWaterMark(){
	  $('.watermark_text').watermark({
		  text: 'aarnamatrimony.com',
		  textWidth: 700,
		  textSize: 70,
		  textColor: 'white',
		  gravity: 'w',
		   opacity: 0.8,
		   //margin: 0,
		   outputWidth: 'auto',
		   outputHeight: 'auto'
		 });
  }
var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = ${allowed_profiles_limit};
var listOrders1 = ${allOrders1};
var newMatches = ${new_matches};

//if (listOrders1 != "") {
	displayMatches(listOrders1);
	displayNewMatches(newMatches);
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
			var premiumMember = "";
			var memberRoleId = orderObj.role_id;
			if(memberRoleId!=null && memberRoleId!="" && (memberRoleId==6 || memberRoleId==11 ||
					memberRoleId==12 || memberRoleId==13 || memberRoleId==14)){
				premiumMember = "<span class='premium-member'>Premium Member</span>";
			}
			var shortListedStr = '<span id="shortlistTD'+orderObj.id+'"><a href="#" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="shortList_dashboard('+orderObj.id+')"> Shortlist</a></span>';
			if(orderObj.short_listed == "1"){
				shortListedStr = "<span>Shortlisted</span>";
			}
			var expressed = orderObj.expressedInterest;
			var interestStr = "";
			if(expressed==0){
				interestStr = '<span id="expInterest'+orderObj.id+'"><a   href="#" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="expressInterest_dashboard('+orderObj.id+')">  Express Interest  </a></span>';
			}else if(expressed>0){
				interestStr = '<span>Expressed Interest</span>';
			}
			var message_sent_status = orderObj.message_sent_status;
			var messageStr = "";
			if(message_sent_status>0){
				messageStr = 'You sent an email to this member.';
			}
			var mobNumViewed = orderObj.mobileNumViewed;
			var mobile_num_Str = "";
			if(mobNumViewed==1 || expressed==1 || message_sent_status==1){
				mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
				
			}else{
				mobile_num_Str = '<span ><a href="#" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="displayMobileNum('+orderObj.id+')"> View mobile no.</a></span>';
			}
			var tblRow = '<div class="row">'
				+ '<div class="col-md-2" >'
	            + 	"<img src="+image+" class='watermark_text img-responsive thumbnail ' style='max-height:70px;'>"
	            + '</div>'
	            + '<div class="col-md-10">'
	            + ' <p>'+firstname+'&nbsp;'+lastname+'|'+orderObj.username+'&nbsp;'+premiumMember+'&nbsp; '+age+' yrs,&nbsp; '+orderObj.religionName+', '+orderObj.casteName+','+orderObj.inches+' , '+orderObj.occupationName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'. </p> '
	            + ' <p> '+interestStr+'| <a href="#" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="fullProfile('+orderObj.id+')"> Full Profile</a> '
	            + ' | <span id="mobileTD'+orderObj.id+'">'+mobile_num_Str+'</span> | '+shortListedStr+'</p> '
	            
	            + '</div>'
	            + '<div class="clearfix" style="border-bottom:1px solid #f1f11;margin-bottom:5px;"></div>'
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
	serviceUnitArray2 = {};
	if(listOrders==""){
		var tblRow = '<div>No matches found.</div>';
		$(tblRow).appendTo("#new_matches"); 
		$("#pagination_div").prop("hidden",true);
	}
	var count = 1;
	var rowStr = '';
	var	itemStart = '<div class="item"><div class="row"> ';
	var	activeItem = '<div class="item active"><div class="row"> ';
	var	itemEnd = '</div></div>';
	var len = listOrders.length;
	if(9<len){
		len = 9;
	}
	$.each(listOrders,function(i, orderObj) 
			{
				/* paginationSetup(total_items_count);
				$("#altLists").asPaginator('enable');
				$("#pagination_div").removeAttr("hidden");
				displayTableFooter(1); */
		serviceUnitArray2[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		console.log(image);
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
			
			var item = '';
			 if(count==1){
				if(i==0){
					item = activeItem;
				}else{
					item = itemStart ;
				} 
			} 
			 var expressed = orderObj.expressedInterest;
			var interestStr = "";
			if(expressed==0){
				interestStr = '<p  align="center" style="margin: 11px 0px 0px 0px;"><a  id="expInterest'+orderObj.id+'" href="#" type="button" class="btn btn-primary btn-block btn-md"  onclick="expressInterest('+orderObj.id+')">Send Interest</a></p>';
			}else if(expressed>0){
				interestStr = '<p align="center" style="margin: 11px 0px 0px 0px;"><a   type="button" disabled="true"  class="btn btn-primary btn-block btn-md"  >You Expressed Interest</a></p>';
			}
			 item =     item + ' 	<div class="col-md-4">'
				         +' 			<a class="thumbnail" href="#" style="margin: 0px 0px 0px 47px;"><img alt="" src="'+image+'"></a>'
				         +' 			<p align="center" style="margin: 130px 0px 0px 0px;"><a href="#" onclick="fullProfile('+orderObj.id+')" style="padding:5px; color:blue; border-radius:5px;">'+orderObj.username+'</a></p>'
				         +' 			<p align="center" style="margin: 4px 0px 0px -3px;">'+age+' yrs, '+orderObj.inches+'</p>'
				         + 			    interestStr
				         +'			</div>';
	
	
			        
		    if(count==3){
			 count = 1;
			 //item = item + itemEnd;
			 //rowStr = rowStr + item;
			 rowStr = rowStr + item + itemEnd ;
			$(rowStr).appendTo("#new_matches");
			rowStr = '';
		 }else{
			 count++;
			 rowStr = rowStr + item; 
		 }  
		 if(i==(len-1)){
			 return;
		 }
	});
	
	 /* if(count<=3){
		rowStr = rowStr + itemEnd ;
		$(rowStr).appendTo("#new_matches");
	}  */ 
	
}
	
	
function expressInterest_dashboard(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		var membershipStatus = ${cacheGuest.membership_status};
		if(membershipStatus!="1"){
			alert("Your membership validity period is over. Renew your membership plan and get more profiles");
			return false;
		}
		if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		}
		var profileObj = serviceUnitArray[profile_id];

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
	    				$("#mobileTD"+profile_id).html('<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+profileObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>');
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

function shortList_dashboard(profileId){
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
    				$("#shortlistTD"+profileId).html('Shortlisted');
    				//$("#shortlistTD"+profileId).removeAttr("href");
    				//$("#shortlistTD"+profileId).attr("disabled");
    			}else{
    				alert("Some problem occured. Please try again.");
    			}
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
/* function getNewMatches(){
	document.searchForm2.action = "newMatches";
    document.searchForm2.submit();            
    return true;
} */

function verifyEmail(){
	 var formData = new FormData();
  
		$.fn.makeMultipartRequest('POST', 'verifyEmail', false,	formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			alert(jsonobj.msg);
			
		});
}


	 
$(".dashboard").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>
