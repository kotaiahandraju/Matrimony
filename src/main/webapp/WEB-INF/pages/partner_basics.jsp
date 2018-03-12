<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="row">
	<div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Age From</label>  
      <div class="col-md-3">
      	<form:input path="rAgeFrom" class="form-control numericOnly u1" placeholder="Enter Age From" />
      </div>
      <label class="col-md-1 control-label" style="text-align: -webkit-center;" for="textinput">To</label>  
      <div class="col-md-3">
      	<form:input path="rAgeTo" class="form-control numericOnly u1" placeholder="Enter Age To" />
      </div>
    </div>
 </div>
<div class="row">
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
			<form:options items="${height}"></form:options>
		</form:select>
      </div>
    </div>
 </div>
 
<div class="row">
    <div class="form-group" >
      <label class="col-md-4 control-label" for="textinput">Marital Status</label>  
      <div class="col-md-7">
      	<form:select path="rMaritalStatus" class="multiSelect" multiple="true" >
			<form:option value="any">Doesn't Matter</form:option>
			<form:option value="Married">Married</form:option>
			<form:option value="Unmarried">Unmarried</form:option>
			<form:option value="Widow/Divorced">Widow/Divorced</form:option>
		</form:select>
      </div>
    </div>
</div>
<div class="row">
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
</div>
<div class="row">
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Religion</label>  
      <div class="col-md-7">
      	<form:select path="rReligion" class="multiSelect" multiple="true">
			<form:options items="${religion}"></form:options>
		</form:select>
      </div>
    </div>
</div>
<div class="row">
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Community</label>  
      <div class="col-md-7">
      	<form:select path="rCaste" class="multiSelect" multiple="true">
			<form:options items="${cast}"></form:options>
		</form:select>
      </div>
    </div>
</div>
<div class="row">
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Mother Tongue</label>  
      <div class="col-md-7">
      	<form:select path="rMotherTongue" class="multiSelect"  multiple="true">
			<form:options items="${language}"></form:options>
		</form:select>
      </div>
    </div>
</div>
<div class="row">
    <div class="form-group">
      <label class="col-md-4 control-label" for="textinput">Eating Habits</label>  
      <div class="col-md-7">
      	<form:select path="rDiet" class="multiSelect" multiple="true">
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
				<input class="btn btn btn-primary" style="padding: 8px 24px;" type="button" id="partner_basic_submit" name="yt0" value="Save" onclick="saveChanges('partner_basic');">
				<input class="btn btn btn-success" style="padding: 8px 24px;" type="button" id="partner_basic_cancel" name="yt1" value="Cancel" onclick="toggleDiv('partner_basic');">
		</div>
	</div>
</div>