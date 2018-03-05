<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-5 control-label required">Religion <span
				style="color: red;">*</span></label>
			<div class="col-md-7">
				<form:select path="religion" onfocus="removeBorder(this.id)"
					onblur="validate(this.id,'');" class="form-control u">
					<form:option value="">-- Choose Religion --</form:option>
					<form:options items="${religion}"></form:options>
				</form:select>
				<div>
					<form:errors path="religion" cssClass="error" />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-5 control-label required">Community <span
				style="color: red;">*</span></label>
			<div class="col-md-7">
				<form:select path="caste" class="form-control u"
					onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
					<form:option value="">-- Choose Community --</form:option>
					<form:options items="${cast}"></form:options>
				</form:select>
				<div>
					<form:errors path="caste" cssClass="error" />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-5 control-label required">Gotram </label>
			<div class="col-md-7">
				<form:input path="gotram" type="text"
					class="form-control onlyCharacters u" placeholder="Enter Gotram"
					maxlength="255" />
				<div>
					<form:errors path="gotram" cssClass="error" />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-5 control-label required">Star </label>
			<div class="col-md-7">
				<form:select path="star" class="form-control u">
					<form:option value="">-- Choose Star/Rassi --</form:option>
					<form:options items="${star}"></form:options>
				</form:select>
				<div>
					<form:errors path="star" cssClass="error" />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="col-md-5 control-label required">Dosham </label>
			<div class="col-md-7">
				<form:select path="dosam" class="form-control">
					<form:option value="">-- Dosham --</form:option>
					<form:option value="Yes">Yes</form:option>
					<form:option value="No">No</form:option>
					<form:option value="Don't Know">Don't Know</form:option>
				</form:select>
				<div>
					<form:errors path="dosam" cssClass="error" />
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-4 pull-right">
		<div class="form-group">
				<input class="btn btn btn-primary" style="padding: 8px 24px;" type="button" id="religion_info_submit" name="yt0" value="Save" onclick="saveChanges('religion_info');">
				<input class="btn btn btn-success" type="button" style="padding: 8px 24px;" id="religion_info_cancel" name="yt1" value="Cancel" onclick="toggleDiv('religion_info');">
		</div>
	</div>
</div>