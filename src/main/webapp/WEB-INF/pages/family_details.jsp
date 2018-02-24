<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="form-group">
					      <label class="col-md-4 control-label" for="textinput">Father Name</label>			  
					      <div class="col-md-8">
					      	<form:input path="fatherName" class="form-control onlyCharacters" placeholder="Enter Father Name"/>
					      </div>
					    </div>
					    <div class="form-group">
					      <label class="col-md-4 control-label" for="textinput">Mother Name</label>  
					      <div class="col-md-8">
					      	<form:input path="motherName" class="form-control onlyCharacters" placeholder="Enter Mother Name"/>
					      </div>
					    </div>
					    <div class="form-group">
					      <label class="col-md-4 control-label" for="textinput">Father's Occupation</label>  
					      <div class="col-md-8">
					      	<form:select path="fOccupation" class="form-control u1" >
						<form:options items="${maleOccupation}"></form:options>
							</form:select>
					      </div>
					    </div>
					    
					    <div class="form-group">
					      <label class="col-md-4 control-label" for="textinput">Mother's Occupation</label>  
					      <div class="col-md-8">
					      	<form:select path="mOccupation" class="form-control u1" >
					      	<form:options items="${occupation}"></form:options>
							</form:select>
					      </div>
					    </div>
					<!--     fatherName, motherName, fOccupation, mOccupation, noOfBrothers, noOfSisters, noOfBrothersMarried, noOfSistersMarried -->
					    <div class="form-group">
					      <label class="col-md-4 control-label" for="textinput">No. of Brothers</label>  
					      <div class="col-md-2">
					      	<form:select path="noOfBrothers" class="form-control u1" style='width: 114px;'>
								<form:option value="">-- Select --</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					      </div>
					      <label class="col-md-2">of whom</label>
					      <div class="col-md-2">
					      	<form:select path="noOfBrothersMarried" class="form-control u1" style='width: 114px;'>
								<form:option value="">-- Select --</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					      </div>
					      <label class="col-md-2">are married</label>
					    </div>
					    
					    <div class="form-group">
					      <label class="col-md-4 control-label" for="textinput">No. of Sisters</label>  
					      <div class="col-md-2">
					      	<form:select path="noOfSisters" class="form-control u1" style='width: 114px;'>
								<form:option value="">-- Select --</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					      </div>
					      <label class="col-md-2">of whom</label>
					      <div class="col-md-2">
					      	<form:select path="noOfSistersMarried" class="form-control u1" style='width: 114px;'>
								<form:option value="">-- Select --</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					      </div>
					      <label class="col-md-2">are married</label>
					    </div>
<br>
<div class="row">
	<div class="col-md-4 pull-right">
		<div class="form-group">
				<input class="btn btn btn-primary" style="padding: 8px 24px; type="button" id="family_details_submit" name="yt0" value="Save" onclick="saveChanges('family_details');">
				&nbsp;<input class="btn btn btn-success" style="padding: 8px 24px; type="button" id="family_details_cancel" name="yt1" value="Cancel" onclick="toggleDiv('family_details');">
		</div>
	</div>
</div>