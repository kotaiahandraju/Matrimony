<%@ include file="userCommonHeader.jsp"%>
<style>
@import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css");
.panel-title > a:before {
    float: right !important;
    font-family: FontAwesome;
    content:"\f068";
    padding-right: 5px;
    font-size: 13px;
    color: #777;
}
.panel-title > a.collapsed:before {
    float: right !important;
    content:"\f067";
}
.panel-title > a:hover, 
.panel-title > a:active, 
.panel-title > a:focus  {
    text-decoration:none;
}
.panel-title {

text-align:left !important;}
.panel-title {
text-align:left;
}
.panel-title > a.collapsed:before {
    float: right !important;
    content: "\f067";
}
.form-horizontal .control-label {
    padding-top: 7px;
    margin-bottom: 0;
    text-align: right;
    font-weight: bold;
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
			<div class="col-md-9 products-grid-left">
            	<div class="panel ">
					<div class="panel-heading"><b>Search Profiles</b></div>
					<div class="panel-body table-responsive">
						<form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form" method="post">
						<form:hidden path="id" />
             			<div class="col-md-12">
							<div id="searchresultsDiv" class="bare">
								<div class="searchresults">
								    <h4> <span style="font-size:18px;">Your Search Results</span> <span class="pull-right"><input type="checkbox" id="selectAllRequest"> Select All &nbsp; <a onclick="requetAllExpressInterest();" href="#">Send Interest to selected</a></span></h4>
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
										<%-- <form:input path="rAgeFrom" class="form-control  numericOnly u1" placeholder="From" /> --%>
										
								<!-- <select id="rAgeFrom" name="rAgeFrom" class="form-control numericOnly u1" > -->
								<form:select path="rAgeFrom" class="form-control numericOnly u1"
								>
									<option value="">--From--</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
									<option value="32">32</option>
									<option value="33">33</option>
									<option value="34">34</option>
									<option value="35">35</option>
									<option value="36">36</option>
									<option value="37">37</option>
									<option value="38">38</option>
									<option value="39">39</option>
									<option value="40">40</option>
									<option value="41">41</option>
									<option value="42">42</option>
									<option value="43">43</option>
									<option value="44">44</option>
									<option value="45">45</option>
									<option value="46">46</option>
									<option value="47">47</option>
									<option value="48">48</option>
									<option value="49">49</option>
									<option value="50">50</option>
									
								</form:select>
									</div>
									<div class="col-md-3">
<%-- 										<form:input path="rAgeTo" class="form-control numericOnly u1" placeholder="To" />
 --%>	
 									<form:select path="rAgeTo" class="form-control numericOnly u1">
									<option value="" selected="">--To--</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
									<option value="32">32</option>
									<option value="33">33</option>
									<option value="34">34</option>
									<option value="35">35</option>
									<option value="36">36</option>
									<option value="37">37</option>
									<option value="38">38</option>
									<option value="39">39</option>
									<option value="40">40</option>
									<option value="41">41</option>
									<option value="42">42</option>
									<option value="43">43</option>
									<option value="44">44</option>
									<option value="45">45</option>
									<option value="46">46</option>
									<option value="47">47</option>
									<option value="48">48</option>
									<option value="49">49</option>
									<option value="50">50</option>
								
								</form:select>
 								</div>
 								<span id="ageMsg" style="color:red;"></span>
								</div>
								<div class="form-group">
									<label class="col-md-4 control-label" for="textinput">Height </label>
									<div class="col-md-3">
										<form:select path="rHeight" class="form-control u1">
											<form:option value="">--From--</form:option>
											<form:options items="${height}"></form:options>
										</form:select>
									</div>
                                    
                                   
                                    
									<div class="col-md-3">
										<form:select path="rHeightTo" class="form-control u1">
											<form:option value="">--To--</form:option>
											<form:options items="${height}"></form:options>
										</form:select>
									</div>
										<span id="heightMsg" style="color:red;"></span>
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
									      	<form:select path="rReligion" onchange="getReliginCastAjax()" class="multiSelect" multiple="true">
												<%-- <form:option value="0">-- Choose Religion --</form:option> --%>
												<form:options items="${religion}"></form:options>
											</form:select>
									      </div>
									    </div>
									
									    <div class="form-group">
									      <label class="col-md-4 control-label" for="textinput">Community</label>  
									      <div class="col-md-6">
									      	<form:select path="rCaste" class="multiSelect" multiple="true">
												<%-- <form:option value="">-- Choose Community --</form:option> --%>
											<%-- 	<form:options items="${cast}"></form:options> --%>
											</form:select>
									      </div>
									    </div>
									
									    <div class="form-group">
									      <label class="col-md-4 control-label" for="textinput">Mother Tongue</label>  
									      <div class="col-md-6">
									      	<form:select path="rMotherTongue" class="multiSelect" multiple="true">
												<%-- <form:option value="">-- Choose Mother Tongue --</form:option> --%>
												<form:options items="${language}"></form:options>
											</form:select>
									      </div>
									    </div>
									    
									    <div class="form-group">
											<label class="col-md-4 control-label required">Country living in </label>
											<div class="col-md-6">
												<form:select path="rCountry" class="multiSelect"  multiple="true" onchange="getFilteredStatesMultiSelect(this.id)">
													<%-- <form:option value="">-- Choose Country --</form:option> --%>
													<form:options items="${countries}"></form:options>
												</form:select>
										  		<div><form:errors path="rCountry" cssClass="error" /></div>
											</div>
									  	</div>
									    <div class="form-group">
											<label class="col-md-4 control-label required">State living in</label>
											<div class="col-md-6">
												<form:select path="rState"  class="multiSelect" multiple="true" onchange="getFilteredCitiesMultiSelect(this.id)">
													<%-- <form:option value="">-- Choose State --</form:option> --%>
													<form:options items="${filtered_states }"></form:options>
													
												</form:select>
												<div><form:errors path="rState" cssClass="error" /></div>
											</div>
									  	</div>
									  	<div class="form-group">
											<label class="col-md-4 control-label required">Residing City</label>
											<div class="col-md-6">
												<form:select path="rCity"  class="multiSelect" multiple="true">
													<%-- <form:option value="">-- Choose State --</form:option> --%>
													<form:options items="${filtered_cities }"></form:options> 
												</form:select>
												<div><form:errors path="rState" cssClass="error" /></div>
											</div>
									  	</div>
									    <div class="form-group">
									      <label class="col-md-4 control-label" for="textinput"></label>  
									      <div class="col-md-6">
									     	<a href="#" type="button" id="searchBtn" class="btn1 btn btn-success" onclick="submitSearch()">Search</a> 
									     	<a href="#" type="button" id="resetBtn" class="btn1 btn btn-danger" onclick="resetBtnfunction()">Reset</a> 
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
} */

function getReliginCastAjax() {
	var religionId = $("#rReligion").val();
	if(religionId==null){
		$("#rCaste").empty();
		$("#rCaste").select2({
    	    placeholder: "-- Choose Community --"
    	});
		$("#caste").empty();
    	$("#caste").select2({
    	    placeholder: "-- Choose Caste --"
    	});
		return true;
	}
		var formData = new FormData();
		formData.append("religionId",religionId);
	$.fn.makeMultipartRequest('POST', '../castesBasedOnReligion', false,
			formData, false, 'text', function(data){
		$("#rCaste").select2('val','');
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		var optionsForClass = "";
		optionsForClass = $("#rCaste").empty();
		var optionsForClass_caste = $("#caste").empty();
		/* optionsForClass.append(new Option("-- Choose Community --", "")); */
		$.each(alldata, function(i, tests) {
			var id=tests.id;
			var casteName=tests.name;
			optionsForClass.append(new Option(casteName, id));
			optionsForClass_caste.append(new Option(casteName, id));
		});
		var selected_values = "${createProfile.rCaste}";
	    if(selected_values == "" || selected_values==null){
	    	$("#rCaste").select2({
	    	    placeholder: "-- Choose Community --"
	    	});
	    	$("#caste").select2({
	    	    placeholder: "-- Choose Caste --"
	    	});
	    }else{
	        $("#rCaste").val(selected_values.split(","));
	        $("#caste").val(selected_values.split(","));
	    }
		$('#rCaste').trigger('change.select2');
		$('#caste').trigger('change.select2');
		
	});
}






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
		  gravity: 'n',
		   opacity: 0.7,
		   margin: 5,
		   outputWidth: 'auto',
		   outputHeight: 'auto'
		 });
  }
var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = "${allowed_profiles_limit}";
if(allowed_limit=="unlimited"){
	allowed_limit = "1";
	allowed_limit = parseInt(allowed_limit);
}
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
			var genderStr = orderObj.gender;
			if(genderStr == "Female"){
				image = "${baseurl}/images/female.png";
			}else if(genderStr == "Male"){
				image = "${baseurl}/images/male.png";
			}
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
			var check_box_str = ' yet-to-send"';
				if(expressed==0){
				 insert_str = '<span id="expInterest'+orderObj.id+'"><a   href="#no" type="button" class="btn btn-success btn-sm"  onclick="expressInterest('+orderObj.id+')">  Yes I\'m interested  </a></span>';
				}else if(expressed>0){
					insert_str = '<span><a type="button" class="btn btn-success btn-sm" disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>';
					check_box_str = '" disabled="true"  checked="checked"';
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
					|| (login_user_role_id == 13) || (login_user_role_id == 14) || (login_user_role_id == 15) || (login_user_role_id == 16)){ //means premium,premium_plus,aarna premium users
			
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
				slider = '<a href="#" onclick="fullProfile('+orderObj.id+')"><img src="'+image+'" class="img img-responsive thumbnail " style="margin-bottom:0;height: auto;width: 100%;" ><div class="watermarkcontent1_profilepic"><span>aarnamatrimony.com</span></div></a>';
				//slider = '<img src="${baseurl}/img/default.png" class="img img-responsive thumbnail " style="margin-bottom:0;height: auto;width: 100%;" >';
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
							+'<a href="#" onclick="fullProfile('+orderObj.id+')"><img src="${catalina_base}/'+photosArray[index]+'" class="img img-responsive thumbnail " style="margin-bottom:0;height: auto;width: 100%;" ><div class="watermarkcontent1_profilepic"><span>aarnamatrimony.com</span></div></a>'
							+'</div>'
				});
				if(photosArray.length>1){
					slider += '<p style="display: table;">'
						+'	<a id="prevBtn'+orderObj.id+'" class="" style="text-decoration: none; margin: 0px 0px 0px 7px;" href="#no" onclick="plusSmallSlides(-1,'+orderObj.id+')">&#10094;</a>'
						//+'	<span>'+(i+1)+' of '+photos_list.length+'</span><br>'
	    			    +'	<a id="nextBtn'+orderObj.id+'" class="" style="text-decoration: none; margin-left: 57px;" href="#no" onclick="plusSmallSlides(1,'+orderObj.id+')">&#10095;</a>'
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
				if(memberRoleId==15){
					 premiumMember = "<span class='premium-member'>Premium Member</span>";
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

				+ '	<label class="form-check-label"> <input type="checkbox" id="chkbox'+orderObj.id+'" class="form-check-input '+check_box_str+'" value="'+orderObj.id+'"> <a href="#" onclick="fullProfile('+orderObj.id+')">'+firstname+' '+lastname+'&nbsp;('+orderObj.username+')</a>&nbsp;'+premiumMember+'</label>'
				+ '	<span class="pull-right">Created for '+orderObj.createProfileFor+'</span>'
				//+ '	<label class="form-check-label"> <input type="checkbox" class="form-check-input"> '+orderObj.firstName+' '+orderObj.lastName+'</label>'
// 				+ '	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span>'

				+ '</div>'
				+ '</h5>'
				+ '</div>'
				+ '<div class="panel-body">'
				+ '<div class="col-md-2">'
				//+ '<a href="#"> <img src='+image+' class="img img-responsive thumbnail watermark_text beir"></a>'
				+ slider
        		+ ' Match Score <button type="button" class="btn btn-primary" style="padding: 0px 1px !important;"><span class="badge"  style="padding: 1px 7px !important;">'+orderObj.match_score+'%</span></button>'
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
	if($('#'+id).val() ==  null || $('#'+id).val() == ""  || $('#'+id).val()=="undefined" ) {
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
	var ageFrom = $("#rAgeFrom").val();
	var ageTo = $("#rAgeTo").val();
	//var ageFrom = $("select[name='rAgeFrom']").val();
	//var ageTo = $("select[name='rAgeTo']").val();
	var heightFrom = $("#rHeight").val();
	if(heightFrom!=""){
		heightFrom = parseInt(heightFrom);
	}
	var heightTo = $("#rHeightTo").val();
	if(heightTo!=""){
		heightTo = parseInt(heightTo);
	}
	var maritalStatus = $("#rMaritalStatus").val();
	var religion = $("#rReligion").val();
	var caste = $("#rCaste").val();
	var motherTongue = $("#rMotherTongue").val();
	var country = $("#rCountry").val();
	var state = $("#rState").val();
	var city = $("#rCity").val();
	if(ageFrom > ageTo){
		alert("Sorry, Invalid Age range");
		return false;
	}else if( parseInt(heightFrom) > parseInt(heightTo)){
		alert("Sorry, Invalid Height range");
		return false;
	}
	if(ageFrom=="" && ageTo=="" && maritalStatus==null && caste==null && motherTongue==null && country==null 
			&& state==null && religion==null && heightFrom=="" && city==null){
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
	
	
		/* var religionId = $("#rReligion").val();
		if(religionId !=null){
			var formData = new FormData();
			formData.append("religionId",religionId);
			
		$.fn.makeMultipartRequest('POST', 'castesBasedOnReligion', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var alldata = jsonobj.allOrders1;
			var optionsForClass = "";
			optionsForClass = $("#rCaste").empty();
			$.each(alldata, function(i, tests) {
				var id=tests.id;
				var casteName=tests.name;
				optionsForClass.append(new Option(casteName, id));
			});
			
		}); 
	}*/
	
	event.preventDefault();
	
	return false;
}

function resetBtnfunction(){
	
	    $("#rAgeFrom").val('');
		$("#rAgeTo").val('');
		$("#rHeight").val('');
		$("#rHeightTo").val('');
		$("#rMaritalStatus").val('');
		$("#haveChildrenId").hide();
		$("#rMaritalStatus").select2("val", "-- Choose MaritalStatus --");
		$("#rReligion").select2("val", "-- Choose Religion --");
		$("#rCaste").select2("val", "-- Choose Community  --");
		$("#rMotherTongue").select2("val", "-- Choose Mother Tongue --");
		$("#rCountry").select2("val", "-- Choose Country --");
		$("#rState").select2("val", "-- Choose State --");
		$("#rCity").select2("val", "-- Choose City --");
		
// 	location.reload();
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

// 	function expressInterest(profile_id) {
// 		var roleId = ${cacheGuest.roleId};
// 		$("#id").val(profile_id);
// 		if (roleId == 4) {
// 			document.searchForm2.action = "memberShipPage"
// 			document.searchForm2.target = "_blank"; // Open in a new window
// 			document.searchForm2.submit();
// 			return true;
// 		} else {
// 			var membershipStatus = ${cacheGuest.membership_status};
// 			if (membershipStatus != "1") {
// 				alert("Your membership validity period is over. Renew your membership plan and get more profiles");
// 				return false;
// 			}
// 			if (allowed_limit <= 0) {
// 				alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
// 				return false;
// 			}
// 			var formData = new FormData();

// 			formData.append('profile_id', profile_id);
// 			jQuery.fn
// 					.makeMultipartRequest(
// 							'POST',
// 							'expressInterestTo',
// 							false,
// 							formData,
// 							false,
// 							'text',
// 							function(data) {
// 								var jsonobj = $.parseJSON(data);
// 								var limit = jsonobj.allowed_limit;
// 								var msg = jsonobj.message;
// 								var profiles = jsonobj.allProfiles;
// 								//if(typeof msg != "undefined" ){
// 								if ("success" == msg) {
// 									alert("Interest request has been sent successfully");
// 									$("#expInterest" + profile_id)
// 											.html(
// 													'<a type="button" class="btn btn-success btn-sm" disabled="true">Expressed Interest</a>');
// 									/* $("#expInterest"+profile_id).prop("disabled",true); */
// 									if(typeof limit != "undefined"){
// 				    					if(limit=="unlimited"){
// 				    						allowed_limit = "1";
// 				    						allowed_limit = parseInt(allowed_limit);
// 				    					}else{
// 				    						allowed_limit = limit;
// 				    					}
// 				    				}
// 								} else if ("failed" == msg
// 										|| "exception" == msg) {
// 									alert("Interest request is not successful. Please try again.");
// 								}
// 								//}
// 								/* if(profiles==""){
// 									$('#countId').html('0');
// 									var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
// 									$('#searchResults').html('');
// 									$(str).appendTo("#searchResults");
// 								}else{
// 									$('#countId').html(profiles.length);
// 									displayMatches(profiles);
// 								} */
// 								/* var filtered_list = jsonobj.filtered_profiles;
// 								$('#countId').html('');
// 								if(filtered_list==""){
// 									$('#countId').html('0');
// 									var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
// 									$('#searchResults').html('');
// 									$(str).appendTo("#searchResults");
// 								}else{
// 									$('#countId').html(filtered_list.length);
// 									displayMatches(filtered_list);
// 								} */

// 							});
// 		}
// 	}

	/* $(".more").click(function(){
	 $(".hideMe").hide();
	 $(".ifMore").show();
	 }); */

	function showMoreDetails(thisObj) {
		//$("#hideMe"+id).prop("hidden",true);
		var isHidden = $(".showMore").prop("hidden");
		if (isHidden) {
			$(".showMore").removeAttr("hidden");
			thisObj.innerHTML = "hide...";
		} else {
			$(".showMore").prop("hidden", true);
			thisObj.innerHTML = "read more...";
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
	
	var clicked_link;
	function paginationSetupForSideGrid(total_items_count) {
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
								var formData = new FormData();
								
								formData.append("rHeight", $("#rHeight").val());
								formData.append("rHeightTo", $("#rHeightTo").val());
								
								formData.append("rMaritalStatus", $(
										"#rMaritalStatus").val());
								formData.append("rReligion", $("#rReligion")
										.val());
								//formData.append("rCaste", $("#rCaste").val());
								formData.append("rMotherTongue", $(
										"#rMotherTongue").val());
								formData.append("rCountry", $("#rCountry")
										.val());
								formData.append("rState", $("#rState").val());
								
								formData.append("rCaste", $("#caste").val());
								formData.append("rCity", $("#city").val());
								formData.append("rAgeFrom", $("#age_from").val());
								formData.append("rAgeTo", $("#age_to").val());
								
								if(clicked_link=="day"){
									formData.append("with_in_day", "true");
								}else if(clicked_link=="week"){
									formData.append("with_in_week", "true");
								}else if(clicked_link=="month"){
									formData.append("with_in_month", "true");
								}else if(clicked_link=="all"){
									formData.append("all", "true");
								}else if(clicked_link=="photo"){
									formData.append("with_photo", "true");
								}
								
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
														paginationSetupForSideGrid(total_items_count);
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
	//displayPagination();
	function displayTableFooter(page) {
		var from_val = ((parseInt(page) - 1) * page_size) + 1;
		var to_val = parseInt(page) * page_size;
		if (to_val > total_items_count) {
			to_val = total_items_count;
		}
		if (from_val > to_val) {
			from_val = to_val;
		}
		$("#table_footer").html(
				"Showing " + from_val + " to " + to_val + " of "
						+ total_items_count + " records");
	}

	function hideChildren() {
		var maritalStatus = $("#rMaritalStatus").val();
		var married_selected = "";
		if (maritalStatus != null) {
			$.each(maritalStatus, function(i) {
				if (maritalStatus[i] == "Married") {
					married_selected = "true";
				}
			});
		}
		if (married_selected == "true") {
			$("#haveChildrenId").show();
		} else {
			$("#haveChildrenId").hide();
			$("#haveChildren").val();
		}
	}

	function getFilteredStatesMultiSelect(id) {
		if ($("#" + id).val() == null || $('#' + id).val() == ""
				|| $('#' + id).val() == "undefined") {
			$("#" + id).select2({
				placeholder : "-- Choose Country --"
			});
			$("#rState").empty();
			$("#rState").select2({
	    	    placeholder: "-- Choose State --"
	    	});
			/* $("#rState").select2({
				placeholder : "-- Choose State --"
			}); */
		} else {
			var countryIds = $("#" + id).val();
			var formData = new FormData();
			formData.append('country_ids', countryIds);
			$.fn
					.makeMultipartRequest(
							'POST',
							'getFilteredStates',
							false,
							formData,
							false,
							'text',
							function(data) {
								var jsonobj = $.parseJSON(data);
								var statesList = jsonobj.states_list;
								$("#rState").empty();
								/* $("#rState")
										.append(
												"<option value='' >-- Choose State --</option>"); */

								$.each(statesList,
										function(i, state) {
											$("#rState").append(
													"<option value="+state.id+" >"
															+ state.name
															+ "</option>");
										});
								$("#rState").trigger('change.select2');
								var selected_values = "${createProfile.rState}";
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
			$("#city").empty();
			$("#rCity").select2({
	    	    placeholder: "-- Choose City --"
	    	});
			$("#city").select2({
	    	    placeholder: "-- Select City --"
	    	});
			//populate city dropdown
	    	var city_map = ${all_cities};
	    	  $.each(city_map,function(key, value) {
	    				$("#city").append("<option value="+key+" >"+ value+ "</option>");
	    			}); 
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
											$("#city").append(
													"<option value="+city.id+" >"
															+ city.name
															+ "</option>");
										});
								$("#rCity").trigger('change.select2');
								var selected_values = "${createProfile.rCity}";
							    if(selected_values == "" || selected_values==null){
							    	$("#rCity").select2({
							    	    placeholder: "-- Choose City --"
							    	});
							    	$("#city").select2({
							    	    placeholder: "-- Select City --"
							    	});
							    	//populate city dropdown
							    	var city_map = ${all_cities};
							    	  $.each(city_map,function(key, value) {
							    				$("#city").append("<option value="+key+" >"+ value+ "</option>");
							    			}); 
							    }else{
							    	
							        $("#rCity").val(selected_values.split(","));
							        $("#city").val(selected_values.split(","));
							    }
							    $("#rCity").trigger('change.select2');
							    $("#city").trigger('change.select2');
							});

		}
	}

	function filterResultsWithPhoto() {
		var page = 1;
		var formData = new FormData();
		
		formData.append("rHeight", $("#rHeight").val());
		formData.append("rHeightTo", $("#rHeightTo").val());
		
		formData.append("rMaritalStatus", $(
				"#rMaritalStatus").val());
		formData.append("rReligion", $("#rReligion")
				.val());
		//formData.append("rCaste", $("#rCaste").val());
		formData.append("rMotherTongue", $(
				"#rMotherTongue").val());
		formData.append("rCountry", $("#rCountry")
				.val());
		formData.append("rState", $("#rState").val());
		
		formData.append("rCaste", $("#caste").val());
		formData.append("rCity", $("#city").val());
		formData.append("rAgeFrom", $("#age_from").val());
		formData.append("rAgeTo", $("#age_to").val());
		
		formData.append("page_no", 1);
		formData.append("request_from", "search");
		formData.append("with_photo", "true");
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
							var jsonobj = $.parseJSON(data);
							var results = jsonobj.results;
							total_items_count = jsonobj.total_records;
							//$('#countId').html('');
							$("#search_criteria").prop("hidden", true);
							$('#searchresultsDiv').removeAttr("hidden");
							if (results == "") {
								$('#countId').html('');
								$('#countId').html('0');
								var str = '<div class="alert alert-danger ban"><h6>No results found..!</h6></div>';
								$('#searchResults').html('');
								$(str).appendTo("#searchResults");
								$("#table_footer").prop("hidden", true);
								$("#altLists").prop("hidden", true);
							} else {
								$('#countId').html('');
								$('#countId').html(total_items_count);
								$("#altLists").asPaginator('destroy');
								paginationSetupForSideGrid(total_items_count);
				    			$("#altLists").asPaginator('enable');
				    			displayMatches(results);
				    			$("#table_footer").removeAttr("hidden");
				    			$("#altLists").removeAttr("hidden");
				    			displayTableFooter(1);
				    			addWaterMark();
							}

						});
	}

	$(document).ready(function() {

		 $("#rReligion").select2({
			placeholder : "-- Choose Religion --"
		});
		$("#rMaritalStatus").select2({
			placeholder : "-- Choose MaritalStatus --"
		});
		$("#rCaste").select2({
			placeholder : "-- Choose Community --"
		});
		$("#caste").select2({
			placeholder : "-- Select Caste --",
			allowClear : true
		});
		$("#rMotherTongue").select2({
			placeholder : "-- Choose Mother Tongue --"
		});
		$("#rCountry").select2({
			placeholder : "-- Choose Country --",
			allowClear : true
		});
		$("#rState").select2({
			placeholder : "-- Choose State --",
			allowClear : true
		});
		
		$("#rCity").select2({
			placeholder : "-- Choose City --",
			allowClear : true
		});
		
		$("#city").select2({
			placeholder : "-- Select City --",
			allowClear : true
		});
		$("#caste").select2({
			placeholder : "-- Select Caste --",
			allowClear : true
		});
		/* $("#rEducation").select2({
			placeholder : "-- Choose Education --"
		}); */ 
		
		$("#rAgeFrom").val("${createProfile.rAgeFrom}");
		$("#rAgeFrom").trigger("chosen:updated");
		// set rAgeTo also
		$('#rAgeFrom').trigger("change");
		$("#rAgeTo").val("${createProfile.rAgeTo}");
		$("#rAgeTo").trigger("chosen:updated");
		
		$("#rHeight").val("${createProfile.rHeight}");
		$("#rHeight").trigger("chosen:updated");
		// set height to also
		$('#rHeight').trigger("change");
		$("#rHeightTo").val("${createProfile.rHeightTo}");
		$("#rHeightTo").trigger("chosen:updated");
		
		var selected_values="";
		selected_values = "${createProfile.rReligion}";
	    if(selected_values == "" || selected_values==null){
	    	$("#rReligion").select2({
	    	    placeholder: "-- Choose Religion --"
	    	});
	    }else{
	    	var tt = selected_values.split(",");
	        $("#rReligion").val(selected_values.split(","));
	    }
	    
	    selected_values = "${createProfile.rCountry}";
	    if(selected_values == "" || selected_values==null){
	    	$("#rCountry").select2({
	    	    placeholder: "-- Choose Country --"
	    	});
	    }else{
	    	var tt = selected_values.split(",");
	        $("#rCountry").val(selected_values.split(","));
	    }
	    //$('#rCountry').trigger('change.select2');
	    
	    selected_values = "${createProfile.rState}";
	    if(selected_values == "" || selected_values==null){
	    	$("#rState").select2({
	    	    placeholder: "-- Choose State --"
	    	});
	    }else{
	    	
	    	var tt = selected_values.split(",");
	        $("#rState").val(selected_values.split(","));
	    }
	    //$("#rState").trigger('change.select2');
	    
	    selected_values = "${createProfile.rCity}";
	    if(selected_values == "" || selected_values==null){
	    	$("#rCity").select2({
	    	    placeholder: "-- Choose City --"
	    	});
	    	/* $("#city").select2({
	    	    placeholder: "-- Select City --"
	    	}); */
	    	//populate city dropdown
	    	var city_map = ${all_cities};
	    	  $.each(city_map,function(key, value) {
	    				$("#city").append("<option value="+key+" >"+ value+ "</option>");
	    			}); 
	    }else{
	    	var tt = selected_values.split(",");
	        $("#rCity").val(selected_values.split(","));
	        $("#city").val(selected_values.split(","));
	    }
	    //$('#rCity').trigger('change.select2');
	    //$('#city').trigger('change.select2');
	    
	    selected_values = "${createProfile.rMaritalStatus}";
	    if(selected_values == "" || selected_values==null){
	    	$("#rMaritalStatus").select2({
	    	    placeholder: "-- Choose Marital Status --"
	    	});
	    }else{
	    	var tt = selected_values.split(",");
	        $("#rMaritalStatus").val(selected_values.split(","));
	    }
	    
	    selected_values = "${createProfile.rMotherTongue}";
	    if(selected_values == "" || selected_values==null){
	    	$("#rMotherTongue").select2({
	    	    placeholder: "-- Choose Mothertongue --"
	    	});
	    }else{
	    	var tt = selected_values.split(",");
	        $("#rMotherTongue").val(selected_values.split(","));
	    }
	    
	    $('.multiSelect').trigger('change.select2');
	    // set caste also
		selected_values="";
		selected_values = "${createProfile.rCaste}";
	    if(selected_values == "" || selected_values==null){
	    	$("#rCaste").select2({
	    	    placeholder: "-- Choose Community --"
	    	});
	    	var castes_map = ${all_castes};
	    	  $.each(castes_map,function(key, value) {
	    				$("#caste").append("<option value="+key+" >"+ value+ "</option>");
	    			}); 
	    }else{
	    	var tt = selected_values.split(",");
	        $("#rCaste").val(selected_values.split(","));
	        $("#caste").val(selected_values.split(","));
	    }
		$('#rCaste').trigger('change.select2');
		
		// set side grid values based on the selected criteria
		$("#age_from").val("${createProfile.rAgeFrom}");
		$("#age_from").trigger("chosen:updated");
		$("#age_to").val("${createProfile.rAgeTo}");
		$("#age_to").trigger("chosen:updated");
		
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
	
	function submitMore(option_str){
		var ageFrom = $("#age_from").val();
		var ageTo = $("#age_to").val();
		if(ageFrom > ageTo){
			alert("Sorry, Invalid Age range");
			return false;
		}
		var page = 1;
			var formData = new FormData();
			
			formData.append("rHeight", $("#rHeight").val());
			formData.append("rHeightTo", $("#rHeightTo").val());
			
			formData.append("rMaritalStatus", $(
					"#rMaritalStatus").val());
			formData.append("rReligion", $("#rReligion")
					.val());
			//formData.append("rCaste", $("#rCaste").val());
			formData.append("rMotherTongue", $(
					"#rMotherTongue").val());
			formData.append("rCountry", $("#rCountry")
					.val());
			formData.append("rState", $("#rState").val());
			
			formData.append("page_no", page);
			formData.append("request_from", "search");
			
			formData.append("rCaste", $("#caste").val());
			formData.append("rCity", $("#city").val());
			formData.append("rAgeFrom", $("#age_from").val());
			formData.append("rAgeTo", $("#age_to").val());
			
			if(option_str=="day"){
				formData.append("with_in_day", "true");
				clicked_link = "day";
			}else if(option_str=="week"){
				formData.append("with_in_week", "true");
				clicked_link = "week";
			}else if(option_str=="month"){
				formData.append("with_in_month", "true");
				clicked_link = "month";
			}else if(option_str=="all"){
				formData.append("all", "true");
				clicked_link = "all";
			}else if(option_str=="photo"){
				formData.append("with_photo", "true");
				clicked_link = "photo";
			}
			
			
			jQuery.fn.makeMultipartRequest('POST', 'displayPage', false,
					formData, false, 'text', function(data){
						var jsonobj = $.parseJSON(data);
						var results = jsonobj.results;
						total_items_count = jsonobj.total_records;
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
							$('#countId').html('');
							$('#countId').html(total_items_count);
							$("#altLists").asPaginator('destroy');
							paginationSetupForSideGrid(total_items_count);
			    			$("#altLists").asPaginator('enable');
			    			displayMatches(results);
			    			$("#table_footer").removeAttr("hidden");
			    			$("#altLists").removeAttr("hidden");
			    			displayTableFooter(1);
			    			addWaterMark();
						}
			});
	}

	$(".searchPage").addClass("active");

	/* $("#rHeight").change(function(){
	 $('#rHeightTo').val('');
	 var val_from = $(this).val();
	 var val_to   = $("#rHeight option:last").val();
	 $('#rHeightTo option').hide();
	 if(val_from!=''){
	 val_from = (val_from-0)+1;
	 for(var i=val_from;i<=val_to;i++)
	 {
	 $('#rHeightTo option[value='+ i +']').show();
	 }		
	 }
	 });

	 $('#rAgeFrom').change(function() {
	 $('#rAgeFromTo').val('');
	 var val = $(this).val();
	 $('#rAgeTo').find('option').not(':first').remove();
	 if(val!=''){
	 val=(val-0)+1;
	 for (var i = val; i <= 50; i++) {
	 $("#rAgeTo").append('<option>' + i + '</option>');
	 }
	 }
	 });
	 */
	/* /* $('#formId').onchange(finction(){
	 $('#rAgeTo').hide();
	
	 });


	 */
	 $("#selectAllRequest").on("click", function() {
			
// 		 $(".form-check-input").attr('checked', this.checked);
		 
		 if ($(this).prop("checked")==true) {
         $('.yet-to-send').prop('checked', true);
       } else {
         $('.yet-to-send').prop('checked', false);
       }
	});
</script>

<%@ include file="userFooter.jsp"%>