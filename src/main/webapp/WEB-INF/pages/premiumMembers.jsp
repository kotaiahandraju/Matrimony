<%@ include file="userCommonHeader.jsp"%>
<style>
.panel-title {
text-align:left;
}
.form-control {
width:187px;
border-radius:0px;
margin-bottom:15px;}
</style>
<div class="products">
	<div class="container" style="background: #FFF;">
		<div class="mid-grids">
			<jsp:include page="sideGridForResults.jsp" />
			 <h3>Premium Members Profiles</h3>
					<form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form" method="post">
 					<form:hidden path="id" />
             			<div class="col-md-9">
							<div id="searchresultsDiv" class="bare">
								<div class="searchresults">
								    
									<div id="searchResults"></div></div></div></div>
										
					</form:form>
									</div> 
			</div></div>	
	<script type="text/javascript">	
	
var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = ${allowed_profiles_limit};
 var listOrders1 = ${allOrders1};
 
if (listOrders1 != "" && listOrders1 != null) {
	/* $('#countId').html('');
	$('#countId').html(total_items_count); */
	displayMatches(listOrders1);
	paginationSetup(total_items_count);
}





function paginationSetup(total_items_count) {
	$('#altLists')
			.asPaginator(
					total_items_count,
					{
						currentPage : 1,
						visibleNum : {
							0 : 10,
							480 : 3,
							960 : 5
						},
						tpl : function() {
							return '<ul>{{first}}{{prev}}{{altLists}}{{next}}{{last}}</ul>';
						},
						components : {
							first : true,
							prev : true,
							next : true,
							last : true,
							altLists : true
						},
						onChange : function(page) {
							//$("#page_no").val(page);
							//var search_form = $("#searchForm2");
							//var formData = $("#searchForm2 :input").serialize();
							//var t = $("#rAgeFrom").val();
							//var formData = $("#searchForm2").serialize();
							var castVals = [];
							var religionVals = [];
							var educationVals = [];
							$("#castdiv :checked").each(function() {
								castVals.push($(this).val());
							});
							$("#religiondiv :checked").each(function() {
								religionVals.push($(this).val());
							});
							$("#educationdiv :checked").each(function() {
								educationVals.push($(this).val());
							});
							var formData = new FormData();
							formData.append('selected_casts', castVals);
							formData.append('selected_religions',
									religionVals);
							formData.append('selected_educations',
									educationVals);
							formData.append("rAgeFrom", $(
									"select[name='rAgeFrom'] :selected")
									.val());
							formData.append("rAgeTo", $(
									"select[name='rAgeTo'] :selected")
									.val());
							formData.append("rHeight", $("#rHeight").val());
							formData.append("rHeightTo", $("#rHeightTo")
									.val());
							var t1 = $("#rMaritalStatus").val();
							var t2 = $("#rCaste").val();
							var t3 = $("#rReligion").val();
							formData.append("rMaritalStatus", $(
									"#rMaritalStatus").val());
							formData.append("rReligion", $("#rReligion")
									.val());
							formData.append("rCaste", $("#rCaste").val());
							formData.append("rMotherTongue", $(
									"#rMotherTongue").val());
							formData.append("rCountry", $("#rCountry")
									.val());
							formData.append("rState", $("#rState").val());
							formData.append("rCity", $("#rCity").val());
							/* formData.append("rAgeFrom",$("#rAgeFrom").val());
							formData.append("rAgeFrom",$("#rAgeFrom").val());
							formData.append("rAgeFrom",$("#rAgeFrom").val());
							formData.append("rAgeFrom",$("#rAgeFrom").val());
							formData.append("rAgeFrom",$("#rAgeFrom").val()); */
							formData.append("page_no", page);
							formData.append("request_from", "search");
							//var tempData = $("#searchForm2").serialize();
							$.fn
									.makeMultipartRequest(
											'POST',
											'displayPage',
											false,
											formData,
											false,
											'text',
											function(data) {
												var jsonobj = $
														.parseJSON(data);
												var results = jsonobj.results;
												//$('#countId').html('');
												$("#search_criteria").prop(
														"hidden", true);
												$('#searchresultsDiv')
														.removeAttr(
																"hidden");
												if (results == "") {
													$('#countId').html('');
													$('#countId').html('0');
													var str = '<div class="alert alert-danger ban"><h6>No results found..!</h6></div>';
													$('#searchResults')
															.html('');
													$(str)
															.appendTo(
																	"#searchResults");
													$("#table_footer")
															.prop("hidden",
																	true);
													$("#altLists").prop(
															"hidden", true);
												} else {
													paginationSetup(total_items_count);
													$("#altLists")
															.asPaginator(
																	'enable');
													displayMatches(results);
													$("#table_footer")
															.removeAttr(
																	"hidden");
													$("#altLists")
															.removeAttr(
																	"hidden");
													displayTableFooter(page);
													addWaterMark();
												}

											});

						}
					});
}
// 	$("#altLists").asPaginator('enable');
	
// 	displayTableFooter(1);
// }else if (listOrders1 == null) {
// 	$('#search_criteria').removeAttr("hidden");
// 	$('#searchResults').html('');
// 	$("#searchresultsDiv").prop("hidden",true);
// }else{
// 	$('#countId').html('0');
// 	var str = '<div class="alert alert-danger nixi"><h6>No results found..!</h6></div>';
// 	$('#searchResults').html('');
// 	$(str).appendTo("#searchResults");
// 	$('#search_criteria').prop("hidden",true);
// 	$("#searchresultsDiv").removeAttr("hidden");
// }

function displayMatches(listOrders) {
	/* $('#searchResults').html('');
	$("#search_criteria").prop("hidden",true);
	$('#searchresultsDiv').removeAttr("hidden"); */
	serviceUnitArray = {};
	/* var r_age_from = "${r_age_from}";
	var r_age_to = "${r_age_to}";
	$("#rAgeFrom").val(r_age_from);
	$("#rAgeTo").val(r_age_to);  */
	$.each(listOrders,function(i, orderObj) 
	{
		serviceUnitArray[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			image = "${baseurl}/img/default.png";
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
			var firstname = '<img src="${baseurl}/images/blurr.png"/>',lastname='';
			mobile_no__str = '<tr id="row'+orderObj.id+'"><td><a href="#" type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</a></td></tr>';
// 			mobile_no__str = '<tr id="row'+orderObj.id+'"><td><a href="#" type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</a></td></tr>';
// 			insert_str = '<a href="#" id="expInterest'+orderObj.id+'" type="button" class="btn btn-success btn-sm" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</a>';
			 if(expressed==0){
				 insert_str = '<span id="expInterest'+orderObj.id+'"><a   href="#no" type="button" class="btn btn-success btn-sm"  onclick="expressInterest('+orderObj.id+')">  Yes I\'m interested  </a></span>';
				}else if(expressed>0){
					insert_str = '<span><a type="button" class="btn btn-success btn-sm" disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>';
				}
			 
			 var shortListedStr = '<span id="shortlistTD'+orderObj.id+'"><a href="#no" type="button" class="btn btn-warning btn-sm" onclick="shortList('+orderObj.id+')"> Shortlist</a></span>';
				if(orderObj.short_listed == "1"){
					shortListedStr = '<span><a type="button" class="btn btn-warning btn-sm" disabled="true"> Shortlisted</a></span>';
				}
				/* var mobNumViewed = orderObj.mobileNumViewed;
				var mobile_num_Str = "";
				if(mobNumViewed=="1" || expressed=="1" || message_sent_status=="1"){
					mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;float:left;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;float:left;color:#4baa26;">Verified </span>)</font></span>';
				}else{
					mobile_num_Str = '<span ><a href="#no" type="button" class="btn btn-info btn-sm" onclick="displayMobileNum('+orderObj.id+')">View Mobile Number</a></span>';
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
			
			var photos_list = orderObj.photosList;
			var slider = "", displayStyle = ' ';
			if(photos_list == "" || typeof photos_list == "undefined"){
				slider = '<a href="#" onclick="fullProfile('+orderObj.id+')"><img src="img/default.png" class="img img-responsive thumbnail " style="margin-bottom:0;height: auto;width: 100%;" ></a>';
				slider = '<a href="#" onclick="fullProfile('+orderObj.id+')"><img src="${baseurl}/img/default.png" class="img img-responsive thumbnail " style="margin-bottom:0;height: auto;width: 100%;" ></a>';
			}else{
				smallerSlideIndex[orderObj.id] = 0;
				var slider = "", displayStyle = ' ';
				var photosArray = photos_list.split(",");
				$.each(photosArray,function(index){
					if(photosArray[index]==orderObj.profileImage){
						displayStyle = ' style="display:block;" '
					}else{
						displayStyle = ' style="display:none;" ';
					}
					slider += '<div class="picstyle smallSlides'+orderObj.id+'" '+displayStyle+'>'
							+'<a href="#" onclick="fullProfile('+orderObj.id+')"><img src="${baseurl}/'+photosArray[index]+'" class="img img-responsive thumbnail watermark_text" style="margin-bottom:0;height: auto;width: 100%;" ></a>'
							+'</div>'
				});
				if(photosArray.length>1){
					slider += '<p style="display: table;">'
						+'	<a id="prevBtn'+orderObj.id+'" class="" style="text-decoration: none; margin: 0px 0px 0px 7px;" href="#no" onclick="plusSmallSlides(-1,'+orderObj.id+')">&#10094;</a>'
						//+'	<span>'+(i+1)+' of '+photos_list.length+'</span><br>'
	    			    +'	<a id="nextBtn'+orderObj.id+'" class="" style="text-decoration: none; margin-left: 41px;" href="#no" onclick="plusSmallSlides(1,'+orderObj.id+')">&#10095;</a>'
						+'</p>'
				}
				
			}
			
			var premiumMember = "";
			var memberRoleId = orderObj.role_id;
			if(memberRoleId!=null && memberRoleId!="" && (typeof memberRoleId != "undefined")){
				if(memberRoleId==12){
					 premiumMember = "<span class='premium-member'>Classic Member</span>";
				}
				if(memberRoleId==13){
					 premiumMember = "<span class='premium-member'>Classic Advantage Member</span>";
				}
				if(memberRoleId==6){
					 premiumMember = "<span class='premium-member'>Premium Member</span>";
				}
				if(memberRoleId==11){
					 premiumMember = "<span class='premium-member'>Premium Plus Member</span>";
				}
				if(memberRoleId==14){
					 premiumMember = "<span class='premium-member'>Aarna Family Member</span>";
				}
				
			}
			
			var profile_highlisht_str = '<div class="panel panel-default">';
			var highlight_option = orderObj.profile_highlighter;
			if(typeof highlight_option != "undefined" && highlight_option=='1'){
				profile_highlisht_str = '<div class="panel panel-default" style="background-color:skyblue">';
			}
			
			var tblRow = profile_highlisht_str
				+ '<div class="panel-heading">'
				+ '<h5 class="panel-title">'
				+ '<div class="form-check">'

				+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> <a href="#" onclick="fullProfile('+orderObj.id+')">'+firstname+' '+lastname+'&nbsp;('+orderObj.username+')</a>&nbsp;'+premiumMember+'</label>'
				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'
				//+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+orderObj.firstName+' '+orderObj.lastName+'</label>'
// 				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'

				+ '</div>'
				+ '</h5>'
				+ '</div>'
				+ '<div class="panel-body">'
				+ '<div class="col-md-2">'
				//+ '<a href="#"> <img src='+image+' class="img img-responsive thumbnail watermark_text beir"></a>'
				+ slider
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
            	+ mobile_no__str
            	
//             	+ '	<tr><td><span>: '+mobile_num_Str+'</span></td></tr>'
//             	+ '<tr><td id="mobiletd'+orderObj.id+'"><a href="#" type="button" class="btn1 btn-sm btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</a></td><td></td></tr>'
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
				+ '<a href="#" class="btn btn-primary  btn-sm" onclick="fullProfile('+orderObj.id+')">View Full Profile</a>'
				+ shortListedStr
				+ '<a href="#no" type="button" class="btn btn-danger btn-sm" id="sendMail'+orderObj.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a>'
// 				+ '<a href="#" type="button" class="btn1 btn btn-primary btn-sm"  id="mobileBtn'+orderObj.id+'" onclick="shortList('+orderObj.id+')">Shortlist</a> '
				+ '<div class="clearfix"></div>'
            	+ '</div>'
            	+ '</div>'
            	+ '</div>';
			$(tblRow).appendTo("#searchResults");
		
	});
}
/* function shortList(profileId){
	$("#id").val(profileId);
	//var profileObj = serviceUnitArray[profileId];
	var formData = new FormData();
	formData.append('profile_id',profileId);
	jQuery.fn.makeMultipartRequest('POST', 'shortList', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var msg = jsonobj.message;
    		if(typeof msg != "undefined"){
    			if(msg=="success"){
    				alert("Shortlist request has been sent successfully");
    				$("#shortlistTD"+profileId).html('');
    				$("#shortlistTD"+profileId).html('<a type="button" class="btn btn-warning btn-sm" disabled="true"> Shortlisted</a>');
    				//$("#shortlistTD"+profileId).removeAttr("href");
    				//$("#shortlistTD"+profileId).attr("disabled");
    			}else{
    				alert("Some problem occured. Please try again.");
    			}
    		}
    		
	});
}
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
 */
function fullProfile(profile_id) {
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
	document.searchForm2.target = "_blank"; // Open in a new window
	document.searchForm2.submit(); // Submit the page
	return true;
}
$(".premiumMembers").addClass("active");
</script>
<%@ include file="userFooter.jsp"%>