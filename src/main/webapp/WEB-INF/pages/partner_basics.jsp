<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="row">

	
	<div class="col-md-6">    
	<div class="form-group">
      <label class="control-label" for="textinput">Age From</label>  
     <form:select path="rAgeFrom" class="form-control numericOnly u1" style='width: 188px; float: right; display: inline-flex;'>
			<form:option value="">-- Select Age From --</form:option>
							
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
 <%--      	<form:input path="rAgeFrom" class="form-control numericOnly u1" placeholder="Enter Age From" style='width: 188px; float: right; display: inline-flex;' />
  --%>   
    </div>
      </div>
      
      <div class="col-md-6">
      <div class="form-group">
      <label class="control-label" style="text-align: -webkit-center;" for="textinput">To</label>  
     
      	<form:select path="rAgeTo" class="form-control numericOnly u1" placeholder="Enter Age To" style='width: 188px; float: right; display: inline-flex;'>
      		 <option value="" selected="">--Select Age To--</option>
      	</form:select>
      </div>
    	</div>
    
   
    <div class="col-md-6">
    <div class="form-group">
      <label class="control-label" for="textinput">Height From</label>  
      
      	<form:select path="rHeight" class="form-control u1" style='width: 188px; float: right; display: inline-flex;'>
			<form:option value="">-- Choose Height --</form:option>
			<form:options items="${height}"></form:options>
		</form:select>
      </div>
      </div>
      
      <div class="col-md-6">
      <div class="form-group">
      <label class="control-label" style="text-align: -webkit-center;" for="textinput">To</label>
      
      	<form:select path="rHeightTo" class="form-control u1" style='width: 188px; float: right; display: inline-flex;'>
			<form:option value="">-- Choose Height --</form:option>
			<form:options style="display:none" items="${height}"></form:options>
		</form:select>
      </div>
      </div>
    
    <br>
    
    <div class="col-md-6">
    <div class="form-group">
      <label class="control-label" for="textinput">Marital Status</label>      
      	<form:select path="rMaritalStatus" class="multiSelect pull-right" multiple="true" >
			<form:option value="any">Doesn't Matter</form:option>
			<form:option value="Married">Married</form:option>
			<form:option value="Unmarried">Unmarried</form:option>
			<form:option value="Widow/Divorced">Widow/Divorced</form:option>
		</form:select>
    </div>
    </div>
    
    
    <%-- <div class="col-md-6">
    <div class="form-group" id="haveChildrenId">
      <label class="control-label" for="textinput" >If Children</label>  
      
      	<form:select path="rhaveChildren" class="form-control u1" style='width: 188px; float: right; display: inline-flex;'>
			<form:option value="">Doesn't Matter</form:option>
			<form:option value="1">1</form:option>
			<form:option value="2">2</form:option>
			<form:option value="No Children">No Children</form:option>
		</form:select>
    </div>
    </div> --%>
    
    <br>
    <div class="col-md-6">
    <div class="form-group">
      <label class="control-label" for="textinput">Religion</label>       
      	<form:select path="rReligion" class="multiSelect pull-right" multiple="true">
			<form:options items="${religion}"></form:options>
		</form:select>
    </div>
    </div>
    
    <div class="col-md-6">
    <div class="form-group">
      <label class="control-label" for="textinput">Community</label>  
      
      	<form:select path="rCaste" class="multiSelect pull-right" multiple="true">
			<form:options items="${cast}"></form:options>
		</form:select>
    </div>
    </div>
    <br>
   <div class="col-md-6">
    <div class="form-group">
      <label class="control-label" for="textinput">Mother Tongue</label>  
      
      	<form:select path="rMotherTongue" class="multiSelect pull-right"  multiple="true">
			<form:options items="${language}"></form:options>
		</form:select>
    </div>
    </div>
    
    <div class="col-md-6">
    <div class="form-group">
    
      <label class="control-label" for="textinput">Eating Habits</label>  
     
      	<form:select path="rDiet" class="multiSelect pull-right pull-right" multiple="true">
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

<br>
<div class="row">
	<div class="col-md-4 pull-right">
		<div class="form-group">
				<input class="btn  btn-success"  type="button" id="partner_basic_submit" name="yt0" value="Save" onclick="saveChanges('partner_basic');">
				<input class="btn  btn-danger"  type="button" id="partner_basic_cancel" name="yt1" value="Cancel" onclick="toggleDiv('partner_basic');">
		</div>
	</div>
</div>
<script>$("#rHeight").change(function(){
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