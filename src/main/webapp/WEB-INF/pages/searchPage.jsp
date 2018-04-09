<%@ include file="userHeader.jsp"%>
<style>
.panel-title {
text-align:left;
}
</style>
			<div class="col-md-9 products-grid-left">
            	<div class="panel panel-default">
					<div class="panel-heading">Search Profiles</div>
					<div class="panel-body table-responsive">
						<form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form" method="post">
						<form:hidden path="id" />
             			<div class="col-md-12">
							<div id="searchresultsDiv" class="bare">
								<div class="searchresults">
								    <h3>Your Search Results</h3>
								    <p><span id="countId">${count}</span> Profiles found <a href="" onclick="modifySearch(event);" style="float:right; font-size:12px; color:#006699;">Modify Search</a></p>
									<div id="searchResults">
										

									</div>
								</div>           
							    <div id="table_footer"></div>
								<div id="altLists"></div>
							</div>
							<div class="clearfix"></div>
							
							<div id="search_criteria">
								<div class="form-group">
									<label class="col-md-4 control-label" for="textinput">Age</label>  
									<div class="col-md-3">
										<form:input path="rAgeFrom" class="form-control  numericOnly u1" placeholder="From" />
									</div>
									<div class="col-md-3">
										<form:input path="rAgeTo" class="form-control numericOnly u1" placeholder="To" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-4 control-label" for="textinput">Height </label>
									<div class="col-md-3">
										<form:select path="rHeight" class="form-control u1">
											<form:option value="">From</form:option>
											<form:options items="${height}"></form:options>
										</form:select>
									</div>
                                    
                                   
                                    
									<div class="col-md-3">
										<form:select path="rHeightTo" class="form-control u1">
											<form:option value="">To</form:option>
											<form:options items="${height}"></form:options>
										</form:select>
									</div>
                                    </div>
                                    
									<div class="form-group prfic">
									      <label class="col-md-4 control-label" for="textinput">Marital Status</label>  
									      <div class="col-md-6">
									      	<form:select path="rMaritalStatus" class="multiSelect" onchange="hideChildren();" multiple="true" >
												<form:option value="">Doesn't Matter</form:option>
												<form:option value="Married">Married</form:option>
												<form:option value="Unmarried">Unmarried</form:option>
												<form:option value="Widow/Divorced">Widow/Divorced</form:option>
											</form:select>
									      </div>
									    </div>
									
									    <div class="form-group prific" id="haveChildrenId">
									      <label class="col-md-4 control-label" for="textinput" >Have Children</label>  
									      <div class="col-md-6">
									      	<form:select path="rhaveChildren" class="form-control u1">
												<form:option value="">Doesn't Matter</form:option>
												<form:option value="1">1</form:option>
												<form:option value="2">2</form:option>
												<form:option value="No Children">No Children</form:option>
											</form:select>
									      </div>
									    </div>
									
									    <div class="form-group">
									      <label class="col-md-4 control-label" for="textinput">Religion</label>  
									      <div class="col-md-6">
									      	<form:select path="rReligion" class="multiSelect" multiple="true">
												<form:option value="">-- Choose Religion --</form:option>
												<form:options items="${religion}"></form:options>
											</form:select>
									      </div>
									    </div>
									
									    <div class="form-group">
									      <label class="col-md-4 control-label" for="textinput">Community</label>  
									      <div class="col-md-6">
									      	<form:select path="rCaste" class="multiSelect" multiple="true">
												<form:option value="">-- Choose Community --</form:option>
												<form:options items="${cast}"></form:options>
											</form:select>
									      </div>
									    </div>
									
									    <div class="form-group">
									      <label class="col-md-4 control-label" for="textinput">Mother Tongue</label>  
									      <div class="col-md-6">
									      	<form:select path="rMotherTongue" class="multiSelect" multiple="true">
												<form:option value="">-- Choose Mother Tongue --</form:option>
												<form:options items="${language}"></form:options>
											</form:select>
									      </div>
									    </div>
									    
									    <div class="form-group">
											<label class="col-md-4 control-label required">Country living in </label>
											<div class="col-md-6">
												<form:select path="rCountry" class="multiSelect"  multiple="true" onchange="getFilteredStatesMultiSelect(this.id)">
													<form:option value="">-- Choose Country --</form:option>
													<form:options items="${countries}"></form:options>
												</form:select>
										  		<div><form:errors path="rCountry" cssClass="error" /></div>
											</div>
									  	</div>
									    <div class="form-group">
											<label class="col-md-4 control-label required">State living in</label>
											<div class="col-md-6">
												<form:select path="rState"  class="multiSelect" multiple="true">
													<form:option value="">-- Choose State --</form:option>
													<form:options items="${states }"></form:options>
												</form:select>
												<div><form:errors path="rState" cssClass="error" /></div>
											</div>
									  	</div>
									    <div class="form-group">
									      <label class="col-md-4 control-label" for="textinput"></label>  
									      <div class="col-md-6">
									     	<a href="#" type="button" id="searchBtn" class="btn1 btn btn-success" onclick="submitSearch()">Search</a> 
									     	<a href="#" type="button" id="resetBtn" class="btn1 btn btn-danger" onclick="">Reset</a> 
									      <!-- 	<a href="savePartnerProfile" class="btn1 btn btn-info">Save & Continue</a> -->
									      </div>
									    </div>
								</div>

							</div>
						</form:form>
					</div>
				</div></div>
             
                         
					</div>
			
			
			

<script type="text/javascript">
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
 
if (listOrders1 != "" && listOrders1 != null) {
	$('#countId').html('');
	$('#countId').html(total_items_count);
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
	var str = '<div class="alert alert-danger nixi"><h6>No results found..!</h6></div>';
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
			var insert_str = '';
			var mobile_no__str = '';
			var more_details_str = '';
			var expressed = orderObj.expressedInterest;
			var firstname = '<img src="images/blurr.png"/>',lastname='';
			mobile_no__str = '<tr id="row'+orderObj.id+'"><td><a href="#" type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</a></td></tr>';
			insert_str = '<a href="#" id="expInterest'+orderObj.id+'" type="button" class="btn btn-success btn-sm" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</a>';
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
					|| (login_user_role_id == 13) || (login_user_role_id == 14)){ //means premium,premium_plus,aarna premium users
			
				firstname = orderObj.firstName;
				lastname = orderObj.lastName;
			}
			var occName = orderObj.occupationName;
			if(occName==null)
				occName = "";
			var ageStr = orderObj.age;
			var age = ageStr.split(".")[0];
			var tblRow = '<div class="panel panel-default">'
				+ '<div class="panel-heading">'
				+ '<h5 class="panel-title">'
				+ '<div class="form-check">'

				+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+firstname+' '+lastname+'&nbsp;('+orderObj.username+')</label>'
				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'
				//+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+orderObj.firstName+' '+orderObj.lastName+'</label>'
// 				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'

				+ '</div>'
				+ '</h5>'
				+ '</div>'
				+ '<div class="panel-body">'
				+ '<div class="col-md-2">'
				+ '<a href="#"> <img src='+image+' class="img img-responsive thumbnail watermark_text beir"></a>'
            	+ '</div>'
            	+ '<div class="col-md-6">'
            	+ '<table>'
            	+ '	<tr><td>Age/Height</td><td><span>: '+age+', '+orderObj.inches+'</span></td></tr>'
            	+ '	<tr><td>Religion</td><td><span>: '+orderObj.religionName+'</span></td></tr>'
            	+ '	<tr><td>Mother Tongue</td><td><span>: '+orderObj.motherTongueName+'</span></td></tr>'
            	+ '	<tr><td>Community</td><td><span>: '+orderObj.casteName+'</span></td></tr>'
            	+ '	<tr><td>Location</td><td><span>: '+orderObj.currentCityName+'</span></td></tr>'
            	+ '	<tr><td>Education</td><td><span>: '+orderObj.educationName+'</span></td></tr>'
            	+ '	<tr><td>Profession</td><td><span>: '+occName+'</span></td></tr>'
            	+ '<tr><td id="mobiletd'+orderObj.id+'"><a href="#" type="button" class="btn1 btn-sm btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</a></td><td></td></tr>'
            	//+ '<td id="shortlisttd'+orderObj.id+'"><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">Shortlist</button></td></tr>'
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
            	+ '    	<span class="more mire"><a href="#" >read more </a></span><i class="fa fa-angle-down dim"></i>'
            	+ '    </div>'
            	+ '</div>' */
            	+ '<div class="col-md-4">'
            	+ '<h4 class="bin">Like this Profile?</h4>'
            	+ insert_str
				//+ '<button class="btn btn-danger btn-block btn-md" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br><br><br><br><br>'
				+ '<a href="#" class="btn btn-warning  btn-sm" onclick="fullProfile('+orderObj.id+')">View Full Profile</a>'
				+ '<a href="#" type="button" class="btn1 btn btn-primary btn-sm"  id="mobileBtn'+orderObj.id+'" onclick="shortList('+orderObj.id+')">Shortlist</a> '
				+ '<div class="clearfix"></div>'
            	+ '</div>'
            	+ '</div>'
            	+ '</div>';
			$(tblRow).appendTo("#searchResults");
		
	});
}
/* function updateList(){
	var allVals = [];
    $("#castdiv :checked").each(function () {
        allVals.push($(this).val());
    });
    if(allVals!=""){
    	//alert(allVals);
    	var formData = new FormData();

    	formData.append('selected_casts',allVals);
    	jQuery.fn.makeMultipartRequest('POST', 'updateProfilesList', false,
    			formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var filtered_list = jsonobj.filtered_profiles;
	    		$('#countId').html('');
	    		if(filtered_list==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(filtered_list.length);
	    			displayMatches(filtered_list);
	    		}
    			
    		});
    }
	
}
$(function () {
    $("#castdiv input[name='caste']").click(updateList);
    updateList();
}); */
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
	    			var str = '<div class="alert alert-danger ban" ><h6>No results found..!</h6></div>';
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
   
$("#castdiv input[name='caste']").click(updateProfilesList);   
$("#religiondiv input[name='religion']").click(updateProfilesList);
$("#educationdiv input[name='education']").click(updateProfilesList);

function validateInput(id, errorMessage)
{
	var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
	if($('#'+id).val().trim() ==  null || $('#'+id).val().trim() == ""  || $('#'+id).val().trim()=="undefined" ) {
		$('style').append(styleBlock);
		$('#'+id).css('border-color','#cc0000');
		$('#'+id).css('color','#cc0000');
		$('#'+id).val('');
		$('#'+id).attr('placeholder',errorMessage);
		$('#'+id).addClass('placeholder-style your-class');
		return false;
//			$('#'+id).css('color','#cc0000');
//			$('#'+id+'Error').text(errorMessage);
	}else{
		$('#'+id).css('border-color','');
		$('#'+id).removeClass('placeholder-style your-class');
		$('#'+id).attr('placeholder','');
		return true;
//			$('#'+id).css('color','');
//			$('#'+id+'Error').text("");
	}
	
}

function submitSearch(){
	var ageFrom = $("#rAgeFrom").val().trim();
	var ageTo = $("#rAgeTo").val().trim();
	var heightFrom = $("#rHeight").val();
	var heightTo = $("#rHeightTo").val();
	var maritalStatus = $("#rMaritalStatus").val();
	var religion = $("#rReligion").val();
	var caste = $("#rCaste").val();
	var motherTongue = $("#rMotherTongue").val();
	var country = $("#rCountry").val();
	var state = $("#rState").val();
	if(ageFrom=="" && ageTo=="" && maritalStatus==null && caste==null && motherTongue==null && country==null 
			&& state==null && religion==null && heightFrom==""){
		alert("Enter any input");
		return false;
	}else{
		document.searchForm2.action = "SearchResults"
	    document.searchForm2.submit();            
	    return true;
	}
	
}
function modifySearch(event){
	$('#search_criteria').removeAttr("hidden");
	$('#searchResults').html('');
	$("#searchresultsDiv").prop("hidden",true);
	event.preventDefault();
	return false;
}
	//$("#searchForm2").submit();
	
//}

   
/* $("#castdiv input[name='caste']").click(function(){
	var allVals = [];
    $("#castdiv :checked").each(function () {
        allVals.push($(this).val());
    });
   // if(allVals!=""){
    	//alert(allVals);
    	var formData = new FormData();

    	formData.append('selected_casts',allVals);
    	jQuery.fn.makeMultipartRequest('POST', 'updateProfilesList', false,
    			formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var filtered_list = jsonobj.filtered_profiles;
	    		$('#countId').html('');
	    		if(filtered_list==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(filtered_list.length);
	    			displayMatches(filtered_list);
	    		}
    			
    		});
   // }
}); */

function expressInterest(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.target = "_blank";    // Open in a new window
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
	    				allowed_limit = limit;
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Interest request is not successful. Please try again.");
	    			}
	    		//}
	    		/* if(profiles==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
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
	    			var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(filtered_list.length);
	    			displayMatches(filtered_list);
	    		} */
				
			});
	}
}

/* $(".more").click(function(){
	$(".hideMe").hide();
	$(".ifMore").show();
}); */

function showMoreDetails(thisObj){
	//$("#hideMe"+id).prop("hidden",true);
	var isHidden = $(".showMore").prop("hidden");
	if(isHidden){
		$(".showMore").removeAttr("hidden");
		thisObj.innerHTML="hide...";
	}else{
		$(".showMore").prop("hidden",true);
		thisObj.innerHTML="read more...";
	}
	
	
}

/* function viewMobileNumber(profile_id){
	var formData = new FormData();
	formData.append('profile_id',profile_id);
	jQuery.fn.makeMultipartRequest('POST', 'viewMobileNumber', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		
    		
	});
} */

function displayMobileNum(profileId,listType){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profileId);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.target = "_blank";    // Open in a new window
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
	    				allowed_limit = limit;
	    			}else{
	    				alert("Some problem occured. Please try again.");
	    			}
	    		}
	    		
		});
	}
	
}

function fullProfile(profile_id){
	/* var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
	}else{
		document.searchForm2.id = profile_id;
		document.searchForm2.action = "fullProfile";
	} */
	
	$("#id").val(profile_id);
	document.searchForm2.action = "fullProfile"
    document.searchForm2.target = "_blank";   // Open in a new window
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
        	 formData.append('selected_casts',castVals);
         	formData.append('selected_religions',religionVals);
         	formData.append('selected_educations',educationVals);
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeTo",$("#rAgeTo").val());
        	 formData.append("rHeight",$("#rHeight").val());
        	 formData.append("rHeightTo",$("#rHeightTo").val());
        	 var t1 = $("#rMaritalStatus").val();
        	 var t2 = $("#rCaste").val();
        	 var t3 = $("#rReligion").val();
        	 formData.append("rMaritalStatus",$("#rMaritalStatus").val());
        	 formData.append("rReligion",$("#rReligion").val());
        	 formData.append("rCaste",$("#rCaste").val());
        	 formData.append("rMotherTongue",$("#rMotherTongue").val());
        	 formData.append("rCountry",$("#rCountry").val());
        	 formData.append("rState",$("#rState").val());
        	 /* formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val()); */
        	 formData.append("page_no",page);
        	 formData.append("request_from","search");
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
	    			var str = '<div class="alert alert-danger ban"><h6>No results found..!</h6></div>';
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
	    			addWaterMark();
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
	var married_selected = "";
	if(maritalStatus!=null){
		$.each(maritalStatus,function(i){
			if(maritalStatus[i]=="Married"){
				married_selected = "true";
			}
		});
	}
	if(married_selected == "true"){
		$("#haveChildrenId").show();
	}else{
		$("#haveChildrenId").hide();
		$("#haveChildren").val();
	}
}
	
function getFilteredStatesMultiSelect(id){
	if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
		$("#"+id).select2({
		    placeholder: "-- Choose Country --"
		});
		
	}else{
		var countryIds =$("#"+id).val();
		var formData = new FormData();
	     formData.append('country_ids', countryIds);
	    $.fn.makeMultipartRequest('POST', 'getFilteredStates', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var statesList = jsonobj.states_list;
         $("#rState").empty();
			$("#rState").append("<option value='' >-- Choose State --</option>");
			
			$.each(statesList, function(i, state) {
				$("#rState").append("<option value="+state.id+" >"+ state.name+"</option>");
			});
			
		});
		
	}
}

$(document).ready(function(){
	
	$("#rReligion").select2({
	    placeholder: "-- Choose Religion --"
	});
	$("#rMaritalStatus").select2({
	    placeholder: "-- Choose MaritalStatus --"
	});
	$("#rCaste").select2({
	    placeholder: "-- Choose Community --"
	});
	$("#rMotherTongue").select2({
	    placeholder: "-- Choose Mother Tongue --"
	});
	$("#rCountry").select2({
	    placeholder: "-- Choose Country --",
	    allowClear: true
	});
	$("#rState").select2({
	    placeholder: "-- Choose State --",
	    allowClear: true
	});
	$("#rEducation").select2({
	    placeholder: "-- Choose Education --"
	});
	/* var selected_values = "${createProfile.rMaritalStatus}";
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
	$("#rDiet").val(selected_values.split(",")); */
});

$(".searchPage").addClass("active");
</script>

<%@ include file="userFooter.jsp"%>