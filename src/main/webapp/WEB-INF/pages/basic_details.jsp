<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row">
<div class="form-group">
	<label class="col-md-3 control-label" for="textinput">Create Profile for: <span class='manditory'>*</span></label>  
	<div class="col-md-6">
		<form:select path="createProfileFor" class="form-control" onfocus="removeBorder(this.id)">
			<form:option value="">Select</form:option>
		<form:option value="Self">Self</form:option>
		<form:option value="Son">Son</form:option>
		<form:option value="Daughter">Daughter</form:option>
		<form:option value="Brother">Brother</form:option>
		<form:option value="Sister">Sister</form:option>
		<form:option value="Friend">Friend</form:option>
		<form:option value="Relative">Relative</form:option>
		</form:select>
	</div>
</div>
</div>
<br>
<div class="row">
<div class="form-group">
	<label class="col-md-4 control-label required">Gender</label>
	<div class="col-md-6">
		
									 <input	name="gender"   value="Male" type="radio"  /> Male 
									
									
									 <input name="gender"  value="Female" type="radio" /> Female
									

	</div>
</div>
</div>
<br>
<div class="row">
			<div class="col-md-6">
                  <div class="form-group">
                     <label for="" >First Name</label>
					 
					  	<form:input path="firstName" onkeydown="removeBorder(this.id)" class="form-control onlyCharacters" id="firstName" placeholder="First Name"/>
					  
					  </div>
			</div>
			<div class="col-md-6">
                  <div class="form-group">
					  <label for=""  >Last Name</label>
					  
					  	<form:input path="lastName" onkeydown="removeBorder(this.id)" class="form-control onlyCharacters" id="lastName" placeholder="Last Name" />
					  
				  </div>
			</div>
					  <div class="clearfix"></div>
   

<div class="col-md-6">
	<div class="form-group">
	
			<label for="">Date of Birth</label>
			<form:input type="text"  path="dob" onclick="removeBorder(this.id)" class="form-control"  placeholder="Enter Date of Birth" readonly="true"/>
	 	 
	 </div>
</div>

<div class="col-md-6">
<div class="form-group">
    <label for="textinput">Height <span class='manditory'>*</span></label>  
    
    <form:select path="height" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
		<form:option value="">-- Choose Height --</form:option>
		<form:options items="${height}"></form:options>
	</form:select>
</div>
</div>
<div class="col-md-6">
<div class="form-group">
	<label for="textinput">Your Marital Status <span class='manditory'>*</span></label>  
	
		<form:select path="maritalStatus" class="form-control u" onchange="hideChildren();" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
			<form:option value="">-- Marital Status --</form:option>
			<form:option value="Married">Married</form:option>
			<form:option value="Unmarried">Unmarried</form:option>
			<form:option value="Widow/Divorced">Widow/Divorced</form:option>
		</form:select>
	
</div>
</div>
<div class="col-md-6">
<div class="form-group">
    <label for="textinput">Body Type</label>  
   
    	<form:select path="bodyType" class="form-control u">
	<form:option value="">-- Choose Body Type --</form:option>
	<form:options items="${bodyType}"></form:options>
</form:select>
   
</div>
</div>
<div class="col-md-6">
<div class="form-group">
   <label for="textinput">Skin tone</label>  
  
   	<form:select path="complexion" class="form-control u">
<form:option value="">-- Choose Skin tone --</form:option>
<form:options items="${complexion}"></form:options>
</form:select>
    
</div>
</div>
<div class="col-md-6">
<div class="form-group">
    <label for="textinput">Any Disability?</label>  
    
    	<form:select path="disability" class="form-control u">
	<form:option value="">-- Choose Disability --</form:option>
	<form:option value="None">None</form:option>
	<form:option value="Physical Disability">Physical Disability</form:option>
</form:select>
   
</div>
</div>
<div class="col-md-6">

	<label for="" >Mother Tongue</label>
	<form:select path="motherTongue" onfocus="removeBorder(this.id)"  class="form-control" >
	<form:option value="">-- Choose Mother Tongue --</form:option>
	<form:options items="${language}"></form:options>
	</form:select>
</div>

<div class="col-md-6">
<div class="form-group">
    <label for="textinput">What's your diet?</label>  
    
    	<form:select path="diet" class="form-control u" >
	<form:option value="">-- Select Diet--</form:option>
	<form:option value="Veg">Veg</form:option>
	<form:option value="Non-Veg">Non-Veg</form:option>
	<form:option value="Occasionally Non-Veg">Occasionally Non-Veg</form:option>
	<form:option value="Eggetarian">Eggetarian</form:option>
	<form:option value="Jain">Jain</form:option>
	<form:option value="Vegan">Vegan</form:option>
</form:select>
    
</div>
</div>
<div class="col-md-6">
<div class="form-group">
    <label for="textinput">Do you smoke? <span class='manditory'>*</span></label>  
    
    	<form:select path="smoking" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
	<form:option value="">-- Do you Smoke --</form:option>
	<form:option value="No">No</form:option>
	<form:option value="Occasionally">Occasionally</form:option>
	<form:option value="Yes">Yes</form:option>
</form:select>
    
  </div>
</div>
<div class="col-md-6">
<div class="form-group">
    <labelfor="textinput">Drink? <span class='manditory'>*</span></label>  
    
    	<form:select path="drinking" class="form-control u" onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
	<form:option value="">-- Do you Drink --</form:option>
	<form:option value="No">No</form:option>
	<form:option value="Occasionally">Occasionally</form:option>
	<form:option value="Yes">Yes</form:option>
</form:select>
    
</div>
</div>
<br><div class="row">
	<div class="col-md-4 pull-right">
		<div class="form-group">
				<input class="btn  btn-success"  type="button" id="basic_details_submit" name="yt0" value="Save" onclick="saveChanges('basic_details');">
				<input class="btn  btn-danger" type="button" id="basic_details_cancel" name="yt1" value="Cancel" onclick="toggleDiv('basic_details');">
		</div>
		</div>
	</div>
</div>

<script>

$('#firstName').on('keydown', function(e) {
    if (e.which === 32 &&  e.target.selectionStart === 0) {
      return false;
    }  
  });
$('#lastName').on('keydown', function(e) {
    if (e.which === 32 &&  e.target.selectionStart === 0) {
      return false;
    }  
  });
</script>