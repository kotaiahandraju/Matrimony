<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<style>
.form-control {
width:190px !important;
}
 @media only screen and (max-width: 600px) and (min-width: 320px) {
.form-control, .select2-container {
 width:100% !important;
 }
 }
</style>
            <div class="col-md-5 col-sm-12">
            	<!-- <div class="stepwizard">
				    <div class="stepwizard-row">
				        <div class="stepwizard-step">
				            <button type="button" id="step1" class="btn btn-default btn-circle">1</button>
				            <p>Cart</p>
				        </div>
				        <div class="stepwizard-step">
				            <button type="button" id="step2" class="btn btn-default btn-circle">2</button>
				            <p>Shipping</p>
				        </div>
				        <div class="stepwizard-step">
				            <button type="button" id="step3" class="btn btn-default btn-circle">3</button>
				            <p>Shipping</p>
				        </div>
				        <div class="stepwizard-step">
				            <button type="button"  id="step4" class="btn btn-default btn-circle" >4</button>
				            <p>Payment</p>
				        </div> 
				    </div>
				</div> -->
            </div>
            <div  class="clearfix"></div>    
    		</div>
     </div>
     
	<div class="row">
		<div class="midcontnet">
			<div class="col-md-8">
				<form:form commandName="partnerProfile" action="savePartnerProfile" class="form-horizontal" id="savePartnerProfile" method="post">
			   	<form:hidden path="userrequirementId"/>
				<!-- 1st Step starts here-->
				<div id="firstForm">
				    <div class="col-md-12">
				      <h3>Tell us what you are looking for in a life partner</h3>
				    </div>
				    <!-- Text input-->
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">Age From</label>  
				      <div class="col-md-3">
							<form:select path="rAgeFrom" class="form-control numericOnly u1"
								placeholder="Enter Age From">
								<option value="" selected="">--Select Age From--</option>

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
				      <label class="col-md-1 control-label" style="text-align: -webkit-center;" for="textinput">To</label>  
				      <div class="col-md-3">
				      	<form:select path="rAgeTo" class="form-control numericOnly u1" placeholder="Enter Age To" >
				      					 <option value="" selected="">--Select Age To--</option>
				      	</form:select>
				      </div>
				    </div>
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">Height From</label>  
				      <div class="col-md-3">
				      	<form:select path="rHeight" class="form-control u1">
							<form:option value="">-- Choose Height --</form:option>
							<form:options items="${height}"></form:options>
						</form:select>
				      </div>
				      <label class="col-md-1 control-label" style="text-align: -webkit-center;" for="textinput">To</label>
				      <div class="col-md-3">
				      	<form:select path="rHeightTo" class="form-control u1">
							<form:option value="">-- Choose Height --</form:option>
							<form:options style="display:none" items="${height}"></form:options>
						</form:select>
				      </div>
				    </div>
				
				    <div class="form-group" >
				      <label class="col-md-4 control-label" for="textinput">Marital Status</label>  
				      <div class="col-md-7">
				      	<form:select path="rMaritalStatus" class="multiSelect" onchange="hideChildren();" multiple="true" >
							<form:option value="any">Doesn't Matter</form:option>
							<form:option value="Married">Married</form:option>
							<form:option value="Unmarried">Unmarried</form:option>
							<form:option value="Widow/Divorced">Widow/Divorced</form:option>
						</form:select>
				      </div>
				    </div>
				
				    <div class="form-group" id="haveChildrenId" style="display: none">
				      <label class="col-md-4 control-label" for="textinput" >Have Children</label>  
				      <div class="col-md-7">
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
				      <div class="col-md-7">
				      	<form:select path="rReligion" onchange="getReliginCastAjax()" class="multiSelect" multiple="true">
							<form:options items="${religion}"></form:options>
						</form:select>
				      </div>
				    </div>
				
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">Community</label>  
				      <div class="col-md-7">
				      	<form:select path="rCaste" class="multiSelect" multiple="true">
				      		<form:option value="" selected="">-- Choose Community --</form:option>
<%-- 							<form:options items="${cast}"></form:options> --%>
						</form:select>
				      </div>
				    </div>
				
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">Mother Tongue</label>  
				      <div class="col-md-7">
				      	<form:select path="rMotherTongue" class="multiSelect"  multiple="true">
							<form:options items="${language}"></form:options>
						</form:select>
				      </div>
				    </div>
				  
				    <div class="form-group hideMe">
				      <label class="col-md-4 control-label" for="textinput"></label>  
				      <div class="col-md-7 text-center">
				      	<span class="more" style="color: #0087AF;cursor: pointer;">MORE <i style="cursor: pointer;" class="fa fa-angle-down"></i></span>
				      </div>
				    </div>
				    
				<div class="ifMore" id="ifMore">
				    
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput"></label>
				      <div class="col-md-7">Location Details</div>
				    </div>
				   
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">Country living in</label>  
				      <div class="col-md-7">
				      	<form:select path="rCountry" class="multiSelect" multiple="true" onchange="getFilteredStatesMultiSelect(this.id)">
							<form:options items="${countries}"></form:options>
							
						</form:select>
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">State living in</label>  
				      <div class="col-md-7">
				      	<form:select path="rState" class="multiSelect" multiple="true">
							<form:options items="${states }"></form:options>
						</form:select>
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput"></label>
				      <div class="col-md-7">Education & Profession Details</div>
				    </div>
				<!--      rCountry,rState,rEducation,rWorkingWith,rOccupation,rAnnualIncome,rCreateProfileFor,rDiet -->
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">Education</label>  
				      <div class="col-md-7">
				      	<form:select path="rEducation" class="multiSelect" multiple="true">
							<form:option value="any">Doesn't Matter</form:option>
							<form:options items="${education}"></form:options>
						</form:select>
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">Working with</label>  
				      <div class="col-md-7">
				      	<form:select path="rWorkingWith" class="multiSelect" multiple="true">
							<form:option value="any">Doesn't Matter</form:option>
							<form:option value="Private Company">Private Company</form:option>
							<form:option value="Government/Public Sector">Government/Public Sector</form:option>
							<form:option value="Defense/Civil Services">Defense/Civil Services</form:option>
							<form:option value="Not Working">Not Working</form:option>
						</form:select>
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">Profession area</label>  
				      <div class="col-md-7">
				      	<form:select path="rOccupation" class="multiSelect" multiple="true">
							<form:option value="any">Doesn't Matter</form:option>
							<form:options items="${occupation}"></form:options>
						</form:select>
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">Annual Income</label>  
				      <div class="col-md-7">
				      <!-- 	<input type="radio" name="annualIncome" class="incomeMatter" id="ai1" value=""> <label for="ai1">Doesn't Matter</label>
				      	<input type="radio" name="annualIncome" class="incomeRange" id="ai2" value="Specify an income range"> <label for="ai2">Specify an income range</label> -->
				      	<%-- <form:select path="education" class="form-control u">
							<form:option value="">Doesn't Matter</form:option>
							<form:option value="Specify an income range">Specify an income range</form:option>
						</form:select> --%>
						<form:select path="rAnnualIncome" class="form-control u1" style="width:190px;">
							<form:option value="">-- Annual Income --</form:option>
							<form:option value="Doesn't Matter">Doesn't Matter</form:option>
							<form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
							<form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
							<form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
							<form:option value="Above INR 7 Lakh">Above INR 7 Lakh</form:option>
						</form:select>
				      </div>
				    </div>
				    
				    <div class="form-group incomeBlock">
				      <label class="col-md-4 control-label" for="textinput"></label>  
				      <div class="col-md-7">
				      	
				      </div>
				    </div>
				    
				    <div class="form-group incomeBlock">
				      <label class="col-md-4 control-label" for="textinput"></label>  
				      <div class="col-md-7">
				      	<!-- <input type="checkbox" name="includeProfiles" id="includeProfiles"> -->
				      	<%-- <form:checkbox path="specifiedIncome" value="specifiedIncome" placeholder="Enter Height"/>
				      	Include Profiles who have not specified their income --%>
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput"></label>
				      <div class="col-md-7">Other Details</div>
				    </div>
				    
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput">Diet</label>  
				      <div class="col-md-7">
				      	<form:select path="rDiet" class="multiSelect"  multiple="true">
							<form:option value="Veg">Veg</form:option>
							<form:option value="Non-Veg">Non-Veg</form:option>
							<form:option value="Occasionally Non-Veg">Occasionally Non-Veg</form:option>
							<form:option value="Eggetarian">Eggetarian</form:option>
							<form:option value="Jain">Jain</form:option>
							<form:option value="Vegan">Vegan</form:option>
						</form:select>
				      </div>
				    </div>
				    
				</div>
				
				    <div class="form-group">
				      <label class="col-md-4 control-label" for="textinput"></label>  
				      <div class="col-md-7 text-center">
				     	<button type="button" id="firstButton" class="btn1 btn btn-info" onclick="submitForm()">Save & Continue</button> 
				<!--      	<button type="button" id="skipfirstButton" class="btn1 btn btn-info" onclick="skip()">Skip</button> -->
				      	<a class="btn btn-success " href="${baseurl}/sendOtp">&nbsp;&nbsp;Skip</a>
				      </div>
				    </div>
				</div>
				<!-- 1st Step ends here-->
				</form:form>
			</div>


<script src="js/plugins/select2/select2.min.js"></script>

<script type="text/javascript">

function getReliginCastAjax() {
	var religionId = $("#rReligion").val();
		var formData = new FormData();
		formData.append("religionId",religionId);
	
	$.fn.makeMultipartRequest('POST', 'castesBasedOnReligion', false,
			formData, false, 'text', function(data){
		$("#rCaste").select2('val','');
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		var optionsForClass = "";
		optionsForClass = $("#rCaste").empty();
		/* optionsForClass.append(new Option("-- Choose Community --", "")); */
		$.each(alldata, function(i, tests) {
			var id=tests.id;
			var casteName=tests.name;
			optionsForClass.append(new Option(casteName, id));
		});
		
	});
}

$(document).ready(function(){
	$('.multiSelect').select2();
	
	$(".ifMore").hide();
	$(".incomeBlock").hide();
	
    $(".more").click(function(){
    	$(".hideMe").hide();
    	$(".ifMore").show();
    });
    
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
    
    /* $("#rMaritalStatus").select2({
	    placeholder: "-- Choose MaritalStatus --"
	});
    $("#rReligion").select2({
	    placeholder: "-- Choose Religion --"
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
	$("#rWorkingWith").select2({
	    placeholder: "-- Choose Working With --"
	});
	$("#rOccupation").select2({
	    placeholder: "-- Choose Profession Area --"
	});
	$("#rDiet").select2({
	    placeholder: "-- Choose Diet --"
	}); */
	
    
     var selected_values = "";
	selected_values = "${partnerProfile.rMaritalStatus}";
    if(selected_values == "" || selected_values==null){
    	$("#rMaritalStatus").select2({
    	    placeholder: "-- Choose MaritalStatus --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rMaritalStatus").val(selected_values.split(","));
    } 
    
    selected_values="";
    selected_values = "${partnerProfile.rCaste}";
    if(selected_values == "" || selected_values==null){
    	$("#rCaste").select2({
    	    placeholder: "-- Choose Community --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rCaste").val(selected_values.split(","));
    }
    /* selected_values="";
    selected_values = "${partnerProfile.rCaste}";
    $("#rCaste").val(selected_values.split(",")); */
    
    selected_values="";
    selected_values = "${partnerProfile.rState}";
    if(selected_values == "" || selected_values==null){
    	$("#rState").select2({
    	    placeholder: "-- Choose State --"
    	});
    }else{
    	var tt = selected_values.split(",");
    	$("#rState").val(selected_values.split(","));
    } 
    
    
    selected_values="";
    selected_values = "${partnerProfile.rEducation}";
    if(selected_values == "" || selected_values==null){
    	$("#rEducation").select2({
    	    placeholder: "-- Choose Education --"
    	});
    }else{
    	var tt = selected_values.split(",");
    	$("#rEducation").val(selected_values.split(","));
    } 
    
    
    selected_values="";
	selected_values = "${partnerProfile.rReligion}";
    if(selected_values == "" || selected_values==null){
    	$("#rReligion").select2({
    	    placeholder: "-- Choose Religion --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rReligion").val(selected_values.split(","));
    }
    /* selected_values="";
	selected_values = "${partnerProfile.rReligion}";
	$("#rReligion").val(selected_values.split(",")); */
	
	selected_values="";
	selected_values = "${partnerProfile.rMotherTongue}";
	if(selected_values == "" || selected_values==null){
    	$("#rMotherTongue").select2({
    	    placeholder: "-- Choose MotherTongue --"
    	});
    }else{
    	var tt = selected_values.split(",");
        $("#rMotherTongue").val(selected_values.split(","));
    }
	//$("#rMotherTongue").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${partnerProfile.rCountry}";
	if(selected_values == "" || selected_values==null){
    	$("#rCountry").select2({
    	    placeholder: "-- Choose Country --"
    	});
    }else{
    	var tt = selected_values.split(",");
    	$("#rCountry").val(selected_values.split(","));
    } 
	
	
	selected_values="";
	selected_values = "${partnerProfile.rWorkingWith}";
	if(selected_values == "" || selected_values==null){
    	$("#rWorkingWith").select2({
    	    placeholder: "-- Choose Working With --"
    	});
    }else{
    	var tt = selected_values.split(",");
    	$("#rWorkingWith").val(selected_values.split(","));
    } 
	
	
	selected_values="";
	selected_values = "${partnerProfile.rOccupation}";
	if(selected_values == "" || selected_values==null){
    	$("#rOccupation").select2({
    	    placeholder: "-- Choose Profession --"
    	});
    }else{
    	var tt = selected_values.split(",");
    	$("#rOccupation").val(selected_values.split(","));
    } 
	
	
	selected_values="";
	selected_values = "${partnerProfile.rDiet}";
	if(selected_values == "" || selected_values==null){
    	$("#rDiet").select2({
    	    placeholder: "-- Choose Diet --"
    	});
    }else{
    	var tt = selected_values.split(",");
    	$("#rDiet").val(selected_values.split(","));
    }
	
	$("#rAgeFrom").val("${partnerProfile.rAgeFrom}");
	$("#rAgeFrom").trigger("chosen:updated");
	// set rAgeTo also
	$('#rAgeFrom').trigger("change");
	$("#rAgeTo").val("${partnerProfile.rAgeTo}");
	$("#rAgeTo").trigger("chosen:updated");
	$("#rHeight").val("${partnerProfile.rHeight}");
	$("#rHeight").trigger("chosen:updated");
	// set height to also
	$('#rHeight').trigger("change");
	$("#rHeightTo").val("${partnerProfile.rHeightTo}");
	$("#rHeightTo").trigger("chosen:updated");
	
	$('.multiSelect').trigger('change.select2'); 
});

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
	/* if(maritalStatus == "Unmarried"){
		$("#haveChildrenId").hide();
		$("#haveChildren").val();
	}else{
		$("#haveChildrenId").show();
	} */
}
	
function submitForm(){
	
	var ageFrom = $("select[name='rAgeFrom']").val();
	var ageTo = $("select[name='rAgeTo']").val();
	var heightFrom = $("#rHeight").val();
	var heightTo = $("#rHeightTo").val();
	if(ageFrom > ageTo){
		alert("Sorry, Invalid Age range");
		return false;
	}else if(heightFrom > heightTo){
		alert("Sorry, Invalid Height range");
		return false;
	}
	$("#savePartnerProfile").submit();
	}

function skip(){
	var location = "${baseurl}";
	window.location.href =location+"/sendOtp";
}	

$("#rHeight").change(function(){
	$('#rHeightTo').val('');
	var val_from = $(this).val();
	var val_to   = $("#rHeight option:last").val();
// 	$('#rHeightTo option').hide();
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

<%@ include file="userStepsFooter.jsp"%>