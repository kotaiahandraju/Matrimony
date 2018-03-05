<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-5 control-label required">Education <span
				style="color: red;">*</span></label>
			<div class="col-md-7">
				<form:select path="education" class="form-control u"
					onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
					<form:option value="">-- Choose Education --</form:option>
					<form:options items="${education}"></form:options>
				</form:select>
				<div>
					<form:errors path="education" cssClass="error" />
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-5 control-label required">Employed in </label>
			<div class="col-md-7">
				<form:select path="workingWith" class="form-control u">
					<form:option value="">-- Select --</form:option>
					<form:option value="Private Company">Private Company</form:option>
					<form:option value="Government/Public Sector">Government/Public Sector</form:option>
					<form:option value="Defense/Civil Services">Defense/Civil Services</form:option>
					<form:option value="Not Working">Not Working</form:option>
				</form:select>
				<div>
					<form:errors path="workingWith" cssClass="error" />
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-5 control-label required">Occupation </label>
			<div class="col-md-7">
				<form:select path="occupation" class="form-control u">
					<form:option value="">-- Choose Occupation --</form:option>
					<form:options items="${occupation}"></form:options>
				</form:select>
				<div>
					<form:errors path="occupation" cssClass="error" />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-4 pull-right">
		<div class="form-group">
				<input class="btn btn btn-primary" style="padding: 8px 24px; type="button" id="professional_info_submit" name="yt0" value="Save" onclick="saveChanges('professional_info');">
				<input class="btn btn btn-success" style="padding: 8px 24px; type="button" id="professional_info_cancel" name="yt1" value="Cancel" onclick="toggleDiv('professional_info');">
		</div>
	</div>
</div>