<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>


</style>

			<div class="row>">
						<div class="col-md-6">
						<div class="form-group">
					      <label class="control-label" for="textinput">Father Name</label> 
					      
					      	<form:input path="fatherName" class="form-control onlyCharacters" placeholder="Enter Father Name"/>
					      </div>
					    </div>
					    
					    <div class="col-md-6">
					    <div class="form-group">
					      <label class="control-label" for="textinput">Mother Name</label>  
					      
					      	<form:input path="motherName" class="form-control onlyCharacters" placeholder="Enter Mother Name"/>
					      </div>
					    </div>
					    
					    <div class="col-md-6">
					    <div class="form-group">
					      <label class="control-label" for="textinput">Father's Occupation</label>  
					     
					      	<form:select path="fOccupation" class="form-control u1" >
						<form:options items="${maleOccupation}"></form:options>
							</form:select>
					      </div>
					    </div>
					    
					    <div class="col-md-6">
					    <div class="form-group">
					      <label class="control-label" for="textinput">Mother's Occupation</label>  
					      
					      	<form:select path="mOccupation" class="form-control u1" >
					      	<form:options items="${occupation}"></form:options>
							</form:select>
					      </div>
					    </div>
					
						<div class="col-md-6">
					    <div class="form-group">
					      <label class="control-label" for="textinput">No. of Brothers</label>  					      
					      	<form:select path="noOfBrothers" class="form-control u1">
								<form:option value="">-- Select --</form:option>
								<form:option value="None">None</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					      </div>
					      </div>
					      
					      <div class="col-md-6">
					      <div class="form-group">
					      <label class="control-label" for="textinput">of whom Are married</label>
					      	<form:select path="noOfBrothersMarried" class="form-control u1">
								<form:option value="">-- Select --</form:option>
								<form:option value="None">None</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					    </div>
					    </div>
					    
					    <div class="col-md-6">
					    <div class="form-group">
					      <label class="control-label" for="textinput">No. of Sisters</label>  
					      
					      	<form:select path="noOfSisters" class="form-control u1">
								<form:option value="">-- Select --</form:option>
								<form:option value="None">None</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					      </div>
					      </div>
					      
					      <div class="col-md-6">
					      <div class="form-group">
					      <label class="control-label" for="textinput">of whom Are married </label>
					      
					      	<form:select path="noOfSistersMarried" class="form-control u1">
								<form:option value="">-- Select --</form:option>
								<form:option value="None">None</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					    </div>
					    </div>
					    </div>
<br>
<div class="row">
	<div class="col-md-4 pull-right">
		<div class="form-group" style="display: ;">
				<input class="btn  btn-success"   type="button" id="family_details_submit" name="yt0" value="Save" onclick="saveChanges('family_details');">
				<input class="btn  btn-danger"   type="button" id="family_details_cancel" name="yt1" value="Cancel" onclick="toggleDiv('family_details');">
		</div>
	</div>
</div>