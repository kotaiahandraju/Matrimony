<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<style>
.select2-container {
width:100%;
}
</style>
<div class="row">
						<div class="col-md-12">
								<legend>Life Partner Requirements</legend>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Age From </label>
			<div class="col-sm-8">
				<form:select path="rAgeFrom" class="form-control u1"
					placeholder="Enter Age From">
					<option value="">--Select Age From--</option>
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
				<div>
					<form:errors path="rAgeFrom" cssClass="error" />
				</div>
			</div>
		</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Age To </label>
									
									<div class="col-sm-8">
										<form:select path="rAgeTo" class="form-control u1" placeholder="Enter Age To">
										<option value="" selected="">--Select Age To---</option>
										</form:select>
								  		<div><form:errors path="rAgeTo" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Height From</label>
									<div class="col-sm-8">
										<form:select path="rHeight" class="form-control u" >
											<form:option value="">-- Choose Height --</form:option>
											<form:options items="${height}"></form:options>
										</form:select>
										<div><form:errors path="rHeight" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							
						</div>
						<div class="clearfix"></div><br>
						<div class="row">
						<div class="col-md-4">
							  	<div class="form-group">
							      <label class="col-md-4 control-label" for="textinput">Height To</label>  
							      <div class="col-md-8">
							      	<form:select path="rHeightTo" class="form-control u1">
										<form:option value="">-- Choose Height --</form:option>
										<form:options style="display:none" items="${height}"></form:options>
									</form:select>
							      </div>
							    </div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Marital Status </label>
									<div class="col-sm-8">

										<form:select path="rMaritalStatus" class="multiSelect"  multiple="true" >
											<form:option value="any">Doesn't Matter</form:option>
											<form:option value="Married">Married</form:option>
											<form:option value="Unmarried">Unmarried</form:option>
											<form:option value="Widow/Divorced">Widow/Divorced</form:option>
										</form:select>
								  		<div><form:errors path="rMaritalStatus" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Religion </label>
									<div class="col-sm-8">
										<form:select path="rReligion" onchange="getReliginCastAjax1()" class="multiSelect" multiple="true">
											<form:options items="${religion}"></form:options>
										</form:select>
								  		<div><form:errors path="rReligion" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							
						</div>
						<div class="clearfix"></div><br>
						<div class="row">
						<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Community</label>
									<div class="col-sm-8">
										<form:select path="rCaste" class="multiSelect" multiple="true" >
											<form:options items="${castes_list}"></form:options>
										</form:select>
										<div><form:errors path="rCaste" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Mother Tongue </label>
									<div class="col-sm-8">
										<form:select path="rMotherTongue" onfocus="removeBorder(this.id)" class="multiSelect" multiple="true">
											<form:options items="${language}"></form:options>
										</form:select>
								  		<div><form:errors path="rMotherTongue" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Country living in </label>
									<div class="col-sm-8">
										<form:select path="rCountry" class="multiSelect" multiple="true" onchange="getFilteredStatesMultiSelect(this.id)">
											<form:options items="${countries}"></form:options>
										</form:select>
								  		<div><form:errors path="rCountry" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							
						</div>
						<div class="clearfix"></div><br>
						<div class="row">
						<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">State living in</label>
									<div class="col-sm-8">
										<form:select path="rState" class="multiSelect" multiple="true"  onchange="getFilteredCitiesMultiSelect(this.id)">
<%-- 											<form:options items="${states }"></form:options> --%>
											<form:options items="${filtered_states }"></form:options>
										</form:select>
										<div><form:errors path="rState" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							   <div class="col-md-4">
							       <div class="form-group">
											<label class="col-md-4 control-label required">Residing City</label>
											<div class="col-md-8">
												<form:select path="rCity"  class="multiSelect" multiple="true" style="max-height:27px; border-radious:8px;">
													<%-- <form:option value="">-- Choose State --</form:option> --%>
													<form:options items="${filtered_cities }"></form:options> 
												</form:select>
												<div><form:errors path="rCity" cssClass="error" /></div>
											</div>
								 	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Education </label>
									<div class="col-sm-8">
										<form:select path="rEducation" class="multiSelect" multiple="true" >
											<form:option value="">Doesn't Matter</form:option>
											<form:options items="${education}"></form:options>
										</form:select>
								  		<div><form:errors path="rEducation" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div><div class="clearfix"></div><br>
							<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Working With </label>
									<div class="col-sm-8">
										<form:select path="rWorkingWith" class=" u1">
											<form:option value="">Doesn't Matter</form:option>
											<form:option value="Private Company">Private Company</form:option>
											<form:option value="Government/Public Sector">Government/Public Sector</form:option>
											<form:option value="Defense/Civil Services">Defense/Civil Services</form:option>
											<form:option value="Not Working">Not Working</form:option>
										</form:select>
								  		<div><form:errors path="rWorkingWith" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							
<!-- 						<div class="clearfix"></div> -->
	
<script>


function getReliginCastAjax1() {
	var religionId = $("#rReligion").val();
		var formData = new FormData();
		formData.append("religionId",religionId);
// 		$('#rCaste').find('option').not(':first').remove();
	$.fn.makeMultipartRequest('POST', '${baseurl }/admin/castesBasedOnReligion', false,
			formData, false, 'text', function(data){
		$("#rCaste").select2('val','');
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		var optionsForClass = "";
		optionsForClass = $("#rCaste").empty();
		$.each(alldata, function(i, tests) {
			var id=tests.id;
			var casteName=tests.name;
			optionsForClass.append(new Option(casteName, id));
		});
		var selected_vals = "${createProfile.rCaste}";
	    if(selected_vals == "" || selected_vals==null){
	    	$("#rCaste").select2({
	    	    placeholder: "-- Choose Community --"
	    	});
	    }else{
	        $("#rCaste").val(selected_vals.split(","));
	    }
	    $("#rCaste").trigger('change.select2');
	});
}


$(document).ready(function(){
	$(".incomeBlock").hide();
	
    $(".incomeRange").click(function(){
    	$(".incomeBlock").show();
    });
    $(".incomeMatter").click(function(){
    	$(".incomeBlock").hide();
    });
    /* $(".more").click(function(){
        $(".ifMore").collapse('toggle');
    });
    $(".more").click(function(){
        $(".ifMore").collapse('hide');
    }); */
    
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
	$("#rCity").select2({
	    placeholder: "-- Choose City --",
	    allowClear: true
	});
	$("#rEducation").select2({
	    placeholder: "-- Choose Education --"
	});
	$("#rWorkingWith").select2({
	    placeholder: "-- Choose Working With --"
	});
	$("#rOccupation").select2({
	    placeholder: "-- Choose Profession Area --"
	});
	$("#rDiet").select2({
	    placeholder: "-- Choose Diet --"
	});
	//selected_values="";
	
	  var selected_values = "${createProfile.rMaritalStatus}";
	 if(selected_values!="")
	$("#rMaritalStatus").select2('val',selected_values.split(","));
	
	selected_values = "${createProfile.rReligion}";
	if(selected_values!="")
	$("#rReligion").select2('val',selected_values.split(","));
	
	selected_values = "${createProfile.rCaste}";
	if(selected_values!="")
	$("#rCaste").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rCountry}";
	if(selected_values!="")
	$("#rCountry").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rState}";
	if(selected_values!="")
	$("#rState").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rCity}";
	if(selected_values!="")
	$("#rCity").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rEducation}";
	if(selected_values!="")
	$("#rEducation").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rReligion}";
	if(selected_values!="")
	$("#rReligion").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rMotherTongue}";
	if(selected_values!="")
	$("#rMotherTongue").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rCountry}";
	if(selected_values!="")
	$("#rCountry").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rWorkingWith}";
	if(selected_values!="")
	$("#rWorkingWith").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rOccupation}";
	if(selected_values!="")
	$("#rOccupation").select2('val',selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rDiet}";
	if(selected_values!="")
	$("#rDiet").select2('val',selected_values.split(","));  
    
	$('.multiSelect').trigger('change.select2');
});


$("#rHeight").change(function(){
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
</script>   						
</script>   				
					
						<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Profession area</label>
									<div class="col-sm-8">
										<form:select path="rOccupation" class="u">
											<form:option value="">Doesn't Matter</form:option>
											<form:options items="${occupation}"></form:options>
										</form:select>
										<div><form:errors path="rOccupation" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Diet</label>
									<div class="col-sm-8">
										<form:select path="rDiet" class=" u" >
											<form:option value="">-- Select Diet--</form:option>
											<form:option value="Veg">Veg</form:option>
											<form:option value="Non-Veg">Non-Veg</form:option>
											<form:option value="Occasionally Non-Veg">Occasionally Non-Veg</form:option>
											<form:option value="Eggetarian">Eggetarian</form:option>
											<form:option value="Jain">Jain</form:option>
											<form:option value="Vegan">Vegan</form:option>
										</form:select>
										<div><form:errors path="rDiet" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
							</div><div class="clearfix"></div><br>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Annual Income </label>
									<div class="col-sm-8">
										<!-- <label class="radio-inline" for="ai1">
											<input name="annualIncome" class="incomeMatter" id="ai1" value="" type="radio"> Doesn't Matter
										</label>
										<label class="radio-inline" for="ai2"> 
											<input name="annualIncome" class="incomeRange" id="ai2" value="Specify an income range" type="radio"> Specify Income
										</label> -->
										<form:select path="rAnnualIncome" class="form-control u1">
											<form:option value="">-- Annual Income --</form:option>
											<form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
											<form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
											<form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
											<form:option value="INR 8 Lakh to 10 Lakh">INR 8 Lakh to 10 Lakh</form:option>
											<form:option value="INR 11 Lakh to 15 Lakh">INR 11 Lakh to 15 Lakh</form:option>
											<form:option value="INR 16 Lakh to 20 Lakh">INR 16 Lakh to 20 Lakh</form:option>
											<form:option value="INR 21 Lakh to 25 Lakh">INR 21 Lakh to 25 Lakh</form:option>
											<form:option value="Above INR 25 Lakh">Above INR 25 Lakh</form:option>
										</form:select>
									</div>
							  	</div>
							</div>
							<div class="col-md-4">
								<div class="form-group incomeBlock">
									<div class="col-md-offset-4 col-sm-8">
										<%-- <form:select path="rAnnualIncome" class="form-control u1">
											<form:option value="">-- Annual Income --</form:option>
											<form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
											<form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
											<form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
											<form:option value="Above INR 7 Lakh">Above INR 7 Lakh</form:option>
										</form:select> --%>
								  		<div><form:errors path="rAnnualIncome" cssClass="error" /></div>
									</div>
							  	</div>
							</div>
						</div>
						<div class="clearfix"></div>
	<br>
						<div class="row">
							<%-- <div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label required">Profile Created by </label>
									<div class="col-sm-8">
										<form:select path="rCreateProfileFor" onfocus="removeBorder(this.id)" class="form-control">
											<form:option value="">-- Select --</form:option>
											<form:option value="Self">Self</form:option>
											<form:option value="Son">Son</form:option>
											<form:option value="Daughter">Daughter</form:option>
											<form:option value="Brother">Brother</form:option>
											<form:option value="Sister">Sister</form:option>
											<form:option value="Friend">Friend</form:option>
											<form:option value="Relative">Relative</form:option>
										</form:select>
								  		<div><form:errors path="rCreateProfileFor" cssClass="error" /></div>
									</div>
							  	</div>
							</div> --%>
							
						</div>