<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="row">
<div class="col-md-6">
	<div class="form-group">
		<label class="col-md-5 control-label required">Country <span
			style="color: red;">*</span></label>
		<div class="col-md-7">
			<form:select path="currentCountry" onfocus="removeBorder(this.id)"
				onblur="validate(this.id,'');" onchange="getFilteredStates(this.id)"
				class="form-control u">
				<form:option value="">-- Choose Country --</form:option>
				<form:options items="${countries}"></form:options>
			</form:select>
			<div>
				<form:errors path="currentCountry" cssClass="error" />
			</div>
		</div>
	</div>
	</div>

<div class="col-md-6">
	<div class="form-group">
		<label class="col-md-5 control-label required">State <span
			style="color: red;">*</span></label>
		<div class="col-md-7">
			<form:select path="currentState" onfocus="removeBorder(this.id)"
				onchange="getCitys(this.id)" onblur="validate(this.id,'');"
				class="form-control u">
				<form:option value="">-- Choose State --</form:option>
				<form:options items="${states }"></form:options>
			</form:select>
			<div>
				<form:errors path="currentState" cssClass="error" />
			</div>
		</div>
	</div>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label class="col-md-5 control-label required">City <span
			style="color: red;">*</span></label>
		<div class="col-md-7">
			<form:select path="currentCity" onfocus="removeBorder(this.id)"
				class="form-control">
				<form:option value="">-- Choose City --</form:option>
				<form:options items="${citys }"></form:options>
			</form:select>
			<div>
				<form:errors path="currentCity" cssClass="error" />
			</div>
		</div>
	</div>
	</div>
</div>


<div class="row">
	<div class="col-md-4 pull-right">
		<div class="form-group" style="display: flex;">
				<input class="btn  btn-success"  type="button" id="location_submit" name="yt0" value="Save" onclick="saveChanges('location');">
				&nbsp;&nbsp;<input class="btn  btn-danger" type="button" id="location_cancel" name="yt1" value="Cancel" onclick="toggleDiv('location');">
		</div>
	</div>
</div>