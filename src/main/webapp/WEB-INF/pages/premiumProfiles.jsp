<%@ include file="userHeader.jsp"%>

			<div class="col-md-8 products-grid-left">
            	<div class="panel panel-success">
					<div class="panel-heading">Premium Profiles</div>
					<div class="panel-body table-responsive">
						<form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form" method="post">
							<div class="col-md-12">
							<div id="searchresultsDiv" style="font-size: 12px;">
								   <div id="searchResults">
										

									</div>       
							    <div id="table_footer"></div>
								<div id="altLists"></div>
							</div>
							<div class="clearfix"></div>
							
							</div>
						</form:form>
				</div></div>
                         
					</div>
			
			

<script type="text/javascript">

var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = "${allowed_profiles_limit}";
if(allowed_limit=="unlimited"){
	allowed_limit = "1";
	allowed_limit = parseInt(allowed_limit);
}
 var listOrders1 = ${allOrders1};
 
if (listOrders1 != "" && listOrders1 != null) {
	paginationSetup(total_items_count);
	$("#altLists").asPaginator('enable');
	displayMatches(listOrders1);
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

function displayMatches(listOrders) {
	$('#searchResults').html('');
	$("#search_criteria").prop("hidden",true);
	$('#searchresultsDiv').removeAttr("hidden");
	serviceUnitArray = {};
	$.each(listOrders,function(i, orderObj) 
	{
		serviceUnitArray[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			var genderStr = orderObj.gender;
			if(genderStr == "Female"){
				image = "${baseurl}/images/female.png";
			}else if(genderStr == "Male"){
				image = "${baseurl}/images/male.png";
			}
		}else{
			image = "${catalina_base}/"+image;
		}
		/* else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
			});
		} */
		
			var login_user_role_id = ${cacheGuest.roleId};
			var insert_str = '';
			var mobile_no__str = '';
			var more_details_str = '';
			var expressed = orderObj.expressedInterest;
			var firstname = '<img src="images/blurr.png"/>',lastname='';
			mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
			insert_str = '<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button>';
			/* if(expressed==0){
				insert_str = '<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button>';
			}else if(expressed>0){
				insert_str = '<button class="btn btn-primary btn-block">Expressed Interest</button>';
			} */
			/* if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 14)){ //means premium user
				mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				//more_details_str = '<tr><td><span><a href="#" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
				if(expressed==0){
					insert_str = '<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button>';
				}else if(expressed>0){
					insert_str = '<button class="btn btn-primary btn-block">Expressed Interest</button>';
				}
			} */
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14) || (login_user_role_id == 15) || (login_user_role_id == 16)){ //means premium,premium_plus,aarna premium users
			
				firstname = orderObj.firstName;
				lastname = orderObj.lastName;
			}
			var tblRow = '<div class="panel panel-default">'
				+ '<div class="panel-heading">'
				+ '<h5 class="panel-title">'
				+ '<div class="form-check">'

				+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+firstname+' '+lastname+'&nbsp;('+orderObj.username+')</label>'
				+ '	<span class="pull-right">Created for '+orderObj.createProfileFor+'</span>'
				//+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+orderObj.firstName+' '+orderObj.lastName+'</label>'
// 				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'

				+ '</div>'
				+ '</h5>'
				+ '</div>'
				+ '<div class="panel-body">'
				+ '<div class="col-md-2">'
				+ '<a href="#"> <img src='+image+' class="img img-responsive thumbnail" style="margin-bottom:0;height: 60px;width: 60px;"></a>'
            	+ '</div>'
            	+ '<div class="col-md-6">'
            	+ '<table>'
            	+ '	<tr><td>Age/Height</td><td><span>: '+orderObj.age+', '+orderObj.inches+'</span></td></tr>'
            	+ '	<tr><td>Religion</td><td><span>: '+orderObj.religionName+'</span></td></tr>'
            	+ '	<tr><td>Mother Tongue</td><td><span>: '+orderObj.motherTongueName+'</span></td></tr>'
            	+ '	<tr><td>Community</td><td><span>: '+orderObj.casteName+'</span></td></tr>'
            	+ '	<tr><td>Location</td><td><span>: '+orderObj.currentCityName+'</span></td></tr>'
            	+ '	<tr><td>Education</td><td><span>: '+orderObj.educationName+'</span></td></tr>'
            	+ '	<tr><td>Profession</td><td><span>: '+orderObj.occupationName+'</span></td></tr>'
            	+ mobile_no__str
            	
            	//+ '	<tr><td>Age</td><td><span>: '+orderObj.age+'</span></td></tr>'
            	//+ '	<tr><td colspan="2">'+orderObj.aboutMyself+'... <a href="#" onclick="showMore('+orderObj.id+')"> read more..</a> </td></tr>'
            	//+  more_details_str
            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#" > read more..</a> </td></tr>'
            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#" > more detailssss</a> </td></tr>'
            	//+ '	<tr class="showMore" hidden="true"><td colspan="2">'+orderObj.aboutMyself+'... <a href="#" > more detailssss</a> </td></tr>'
            	+ '</table>'
            	+ '</div>'
            	/* + '<div id="hideMe'+orderObj.id+'" class="form-group hideMe">'
            	+ '    <label class="col-md-4 control-label" for="textinput"></label>'  
            	+ '    <div class="col-md-6 text-center">'
            	+ '    	<span class="more" style="color: #0087AF;cursor: pointer;"><a href="#" >read more </a></span><i style="cursor: pointer;" class="fa fa-angle-down"></i>'
            	+ '    </div>'
            	+ '</div>' */
            	+ '<div class="col-md-4">'
            	+ '<h4 style="margin-bottom:20px;">Like this Profile?</h4>'
            	//+ '<c:if test="${(cacheGuest.roleId == 6)}">'
            	+ insert_str
				//+ '</c:if>	 '
				+ '<button class="btn btn-danger btn-block btn-md" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
            	+ '<div class="clearfix"></div>'
            	+ '</div>'
            	+ '</div>'
            	+ '</div>';
			$(tblRow).appendTo("#searchResults");
		
	});
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
	    			displayMatches(filtered_profiles);
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
			displayMatches(results);
			$("#table_footer").removeAttr("hidden");
			$("#altLists").removeAttr("hidden");
			displayTableFooter(1);
		}
		
	});
}
	//$("#searchForm2").submit();
	
//}

   


function expressInterest(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profileId);
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
	    				if(typeof limit != "undefined"){
	    					if(limit=="unlimited"){
	    						allowed_limit = "1";
	    						allowed_limit = parseInt(allowed_limit);
	    					}else{
	    						allowed_limit = limit;
	    					}
	    				}
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Interest request is not successful. Please try again.");
	    			}
	    		//}
	    		
				
			});
	}
}

function displayMobileNum(profileId,listType){
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
		formData.append('list_type',listType);
		jQuery.fn.makeMultipartRequest('POST', 'viewedMobileNumber', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var limit = jsonobj.allowed_limit;
	    		var msg = jsonobj.message;
	    		if(typeof msg != "undefined"){
	    			if(msg=="success"){
	    				$("#row"+profileId).html('<td>'+profileObj.mobile+'</td>');
	    				if(typeof limit != "undefined"){
	    					if(limit=="unlimited"){
	    						allowed_limit = "1";
	    						allowed_limit = parseInt(allowed_limit);
	    					}else{
	    						allowed_limit = limit;
	    					}
	    				}
	    			}else{
	    				alert("Some problem occured. Please try again.");
	    			}
	    		}
	    		
		});
	}
	
}

function fullProfile(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
	}else{
		document.searchForm2.id = profile_id;
		document.searchForm2.action = "fullProfile";
	}
	//document.searchForm2.id = profile_id;
	
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
	    			displayMatches(results);
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

$(".matches").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>