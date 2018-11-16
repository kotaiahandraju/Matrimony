function resetPassword(id){
	 var userObj = serviceUnitArray[id];
	 var firstName = userObj.firstName;
	 var lastName = userObj.lastName;
	 var username = userObj.username;
	 var email = userObj.email;
		var formData = new FormData();
	    formData.append('id', id);
	    formData.append('firstName', firstName);
	    formData.append('lastName', lastName);
	    formData.append('username', username);
	    formData.append('email', email);
	    //return false;
	    $.fn.makeMultipartRequest('POST', 'resetPassword', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			alert(jsonobj.message);
		});
 }

/*function profileStatusChange(id,statusId,statusName){
	var checkstr =  confirm('Are you sure you want to do this?');
	if(checkstr == true){
	var formData = new FormData();
     formData.append('status', statusId);
     formData.append('id', id);
     formData.append('statusName', statusName);
	$.fn.makeMultipartRequest('POST', 'updateStatus', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		alert(jsonobj.message);
		
		var alldata = jsonobj.allOrders1;
		console.log(jsonobj.allOrders1);
		displayTable(alldata);
	});
	}
	
}*/

function moveToHidden(id,statusName){
	var checkstr =  confirm('Are you sure you want to Hide this profile?');
	if(checkstr == true){
	var formData = new FormData();
     formData.append('id', id);
     formData.append('status', 3);
     formData.append('statusName', statusName);
	$.fn.makeMultipartRequest('POST', 'updateStatus', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		alert(jsonobj.message);
		
		var alldata = jsonobj.allOrders1;
		console.log(jsonobj.allOrders1);
		displayTable(alldata);
	});
	}
}

function updateUserName(cityId){
	var id = 'username';
	var value=cityId;
	var constant ='u';
	var formData = new FormData();
    formData.append('id', id);
    formData.append('value', value);
    formData.append('constant', constant);
	$.fn.makeMultipartRequest('POST', 'updateUserName', false,
			formData, false, 'text', function(data){
		
	});
}

function displayMatches_messages(listOrders,divId,roleId,listType) {
	serviceUnitArray = {};
	var divElem = "#"+divId;
	var element = $(divElem);
	if(listOrders==""){
		var tblRow = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No requests found..!</h6></div>';
		//var tblRow = "No data available";
		$(tblRow).appendTo("#"+divId);
		$("#table_footer").prop("hidden",true);
		$("#paginator").prop("hidden",true);
	}
	$.each(listOrders,function(i, orderObj) 
	{
		serviceUnitArray[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}

		if(orderObj.firstName !=null)
		{
			var login_user_role_id = roleId; 
			var insert_str = '';
			var mobile_no__str = '';
			var more_details_str = '';
			var expressed = orderObj.expressedInterest;
			var firstname = 'xxxxxx',lastname='xxxxxx';
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14) || (login_user_role_id == 15)){ //means premium,premium_plus,aarna premium users
			
				firstname = orderObj.firstName;
				lastname = orderObj.lastName;
			}
			var occName = orderObj.occupationName;
			if(occName==null)
				occName = "";
			var ageStr = orderObj.age;
			var age = ageStr.split(".")[0];
			var options = "";
			var acceptOptions = "";
				//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				if(expressed==0){
					insert_str = '<button id="expInterest'+orderObj.id+'" type="button" class="btn btn-primary btn-block" onclick="expressInterest('+orderObj.id+')">Yes I\'m interested</button>';
				}else if(expressed>0){
					insert_str = '<button class="btn btn-primary btn-block">Expressed Interest</button>';
				}
				var mobNumViewed = orderObj.mobileNumViewed;
				var mobile_num_Str = "";
				if(mobNumViewed==0){
					mobile_num_Str = '<span ><a href="#" type="button" class="btn btn-primary btn-block" onclick="displayMobileNum_messages('+orderObj.id+',\'preferences\','+orderObj.requestId+')">View Mobile Number</a></span>';
				}else if(mobNumViewed>0){
					mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
				}
				//////////
				if(listType == "pendingRequests"){
					options =  '<div class="col-md-3">'
		            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
		            	+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum_messages('+orderObj.id+',\'preferences\,'+orderObj.requestId+')">View Mobile Number</button>'
		            	+ '<div class="clearfix"></div>'
		            	+ '</div>'
				}else if(listType == "sentRequests"){
					options =  '<div class="col-md-3">'
		            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
		            	+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum_messages('+orderObj.id+',\'preferences\,'+orderObj.requestId+')">View Mobile Number</button>'
		            	+ '<div class="clearfix"></div>'
		            	+ '</div>'
				}else if(listType == "receivedRequests"){
					options =  '<div class="col-md-3">'
		            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br>'
		            	+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
		            	+ '<div class="clearfix"></div>'
		            	+ '</div>'
		           acceptOptions = "<tr><td title=''><div id='accept"+orderObj.requestId+"'><a href='#' onclick='acceptRequest("+orderObj.requestId+",\"1\")'>Accept</a>&nbsp;|&nbsp;<a id='reject"+orderObj.requestId+"' href='#' onclick='rejectRequest("+orderObj.requestId+" \"0\")'>Ignore</a></td><tr>";
				}else if(listType == "acceptedRequests"){
					options =  '<div class="col-md-3">'
		            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br>'
		            	+ '<button class="btn1 btn btn-info" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
		            	+ '<div class="clearfix"></div>'
		            	+ '</div>'
				} else if(listType == "myProfileViews"){
					options =  '<div class="col-md-3">'
		            	+ '<button class="btn btn-danger btn-block" onclick="fullProfile('+orderObj.id+')">View Full Profile</button>'
		            	+ '<button class="btn btn-danger btn-block" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button>'
		            	+ '<div class="clearfix"></div>'
		            	+ '</div>'
				} 
			//}
			
			
				var tblRow = '<div class="panel panel-default">'
					+ '<div class="panel-heading">'
					+ '<h5 class="panel-title">'
					+ '<div class="form-check">'

					+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+firstname+' '+lastname+'&nbsp;('+orderObj.username+')</label>'
					+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'
					//+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+orderObj.firstName+' '+orderObj.lastName+'</label>'
//	 				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'

					+ '</div>'
					+ '</h5>'
					+ '</div>'
					+ '<div class="panel-body">'
					+ '<div class="col-md-2">'
					+ '<a href="#"> <img src='+image+' class="img img-responsive thumbnail watermark_text" style="margin-bottom:0;height: 60px;width: 60px;"></a>'
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
	            	+ '<tr><td id="mobileTD'+orderObj.requestId+'">'+mobile_num_Str+'</td><td></td></tr>'
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
	            	+ '    	<span class="more" style="color: #0087AF;cursor: pointer;"><a href="#" >read more </a></span><i style="cursor: pointer;" class="fa fa-angle-down"></i>'
	            	+ '    </div>'
	            	+ '</div>' */
	            	+ '<div class="col-md-4">'
	            	+ '<h4 style="margin-bottom:20px;">Like this Profile?</h4>'
	            	+ insert_str
					//+ '<button class="btn btn-danger btn-block btn-md" onclick="fullProfile('+orderObj.id+')">View Full Profile</button><br><br><br><br><br>'
					+ '<a href="#" class="btn btn-danger btn-block btn-md" onclick="fullProfile('+orderObj.id+')">View Full Profile</a><br>'
					+ '<a href="#" type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="shortList('+orderObj.id+')">Shortlist</a> '
					+ '<div class="clearfix"></div>'
	            	+ '</div>'
	            	+ '</div>'
	            	+ '</div>';
			$(tblRow).appendTo("#"+divId);
		}
	});
}
function getFilteredStates(id){
	if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
		 $("#currentState").attr("readonly", true);
		$("#currentState").attr("disabled" ,"disabled");
		$("#currentState").empty();
		//$("#currentState").val(""); 
	}else{
		$("#currentState").removeAttr("disabled");
		$("#currentState").removeAttr("readonly");
		var countryIds =$("#"+id).val();
		var formData = new FormData();
	     formData.append('country_ids', countryIds);
	     //return false;
		$.fn.makeMultipartRequest('POST', 'getFilteredStates', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var statesList = jsonobj.states_list;
         $("#currentState").empty();
			$("#currentState").append("<option value='' >-- Choose State --</option>");
			
			$.each(statesList, function(i, state) {
				$("#currentState").append("<option value="+state.id+" >"+ state.name+"</option>");
			});
			
		});
		
	}
}

function getFilteredStatesMultiSelect(id){
	if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
		$("#"+id).select2({
		    placeholder: "-- Choose Country --"
		});
		$("#rState").empty();
		$("#rState").select2({
    	    placeholder: "-- Choose State --"
    	});
		$("#rState").trigger('change.select2');
	}else{
		var countryIds =$("#"+id).val();
		var formData = new FormData();
	     formData.append('country_ids', countryIds);
	     
	    $.fn.makeMultipartRequest('POST', 'getFilteredStates', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var statesList = jsonobj.states_list;
         $("#rState").empty();
			//$("#rState").append("<option value='' >-- Choose State --</option>");
			
			$.each(statesList, function(i, state) {
				$("#rState").append("<option value="+state.id+" >"+ state.name+"</option>");
			});
			$("#rState").trigger('change.select2');
			var selected_values = "${partnerProfile.rState}";
		    if(selected_values == "" || selected_values==null){
		    	$("#rState").select2({
		    	    placeholder: "-- Choose State --"
		    	});
		    }else{
		    	
		        $("#rState").val(selected_values.split(","));
		    }
		    $("#rState").trigger('change.select2');
			
		});
		
	}
}

   
function getFilteredCitiesMultiSelect(id) {
	if ($("#" + id).val() == null || $('#' + id).val() == ""
			|| $('#' + id).val() == "undefined") {
		$("#" + id).select2({
			placeholder : "-- Choose State --"
		});
		$("#rCity").empty();
		$("#rCity").select2({
    	    placeholder: "-- Choose City --"
    	});
		/* $("#rState").select2({
			placeholder : "-- Choose State --"
		}); */
	} else {
		var stateIds = $("#" + id).val();
		var formData = new FormData();
		formData.append('state_ids', stateIds);
		$.fn
				.makeMultipartRequest(
						'POST',
						'getFilteredCities',
						false,
						formData,
						false,
						'text',
						function(data) {
							var jsonobj = $.parseJSON(data);
							var citiesList = jsonobj.city_list;
							$("#rCity").empty();
							/* $("#rState")
									.append(
											"<option value='' >-- Choose State --</option>"); */

							$.each(citiesList,
									function(i, city) {
										$("#rCity").append(
												"<option value="+city.id+" >"
														+ city.name
														+ "</option>");
									});
							$("#rCity").trigger('change.select2');
							var selected_values = "${partnerProfile.rCity}";
						    if(selected_values == "" || selected_values==null){
						    	$("#rCity").select2({
						    	    placeholder: "-- Choose City --"
						    	});
						    }else{
						    	
						        $("#rCity").val(selected_values.split(","));
						    }
						    $("#rCity").trigger('change.select2');
						});

	}
}

function getCitys(id){
	
	if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
		$("#currentCity").attr("readonly", true);
		$("#currentCity").attr("disabled" ,"disabled");
		$("#currentCity").val("");
	}else{
		$("#currentCity").removeAttr("disabled");
		$("#currentCity").removeAttr("readonly");
		var stateIds =$("#"+id).val();
		var formData = new FormData();
	     formData.append('state_ids', stateIds);
		$.fn.makeMultipartRequest('POST', 'getCitys', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.citys;
// 			alert(alldata);
         $("#currentCity").empty();
			$("#currentCity").append("<option value='' >-- Choose City --</option>");
			
			$.each(alldata, function(i, tests) {
				$("#currentCity").append("<option value="+tests.id+" >"+ tests.name+"</option>");
			});
			
		});
		
	}
}

function getCitysMultiSelect(id){
	
	if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
		$("#"+id).select2({
		    placeholder: "-- Choose State --"
		});
	}else{
		var stateIds =$("#"+id).val();
		var formData = new FormData();
	     formData.append('state_ids', stateIds);
		$.fn.makeMultipartRequest('POST', 'getCitys', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.citys;
// 			alert(alldata);
         $("#rCity").empty();
			$("#rCity").append("<option value='' >-- Choose City --</option>");
			
			$.each(alldata, function(i, tests) {
				$("#rCity").append("<option value="+tests.id+" >"+ tests.name+"</option>");
			});
			
		});
		
	}
}