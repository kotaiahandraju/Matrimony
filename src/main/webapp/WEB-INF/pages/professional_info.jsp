<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label required">Education <span
				style="color: red;">*</span></label>
			
				<form:select path="education" class="form-control u"
					onblur="validate(this.id,'');" onfocus="removeBorder(this.id)">
					<form:option value="">-- Choose Education --</form:option>
					 <form:option value="any">Doesn't Matter</form:option>
					<form:options items="${education}"></form:options>
				</form:select>
				<div>
					<form:errors path="education" cssClass="error" />
				</div>
	</div>
	</div>

	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label required">Employed in </label>
			
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


	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label required">Occupation </label>
			
				<form:select path="occupation" class="form-control u">
					<form:option value="">-- Choose Occupation --</form:option>
					 <form:option value="">Doesn't Matter</form:option>
					<form:options items="${occupation}"></form:options>
				</form:select>
				<div>
					<form:errors path="occupation" cssClass="error" />
				</div>
		</div>
	</div>

	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label required">Annual Income </label>
				<form:select path="annualIncome" class="form-control u" onfocus="removeBorder(this.id)">
											<form:option value="">-- Annual Income --</form:option>
											<form:option value="Not Working">Not Working</form:option>
											<form:option value="Upto INR 1 Lakh">Upto INR 1 Lakh</form:option>
											<form:option value="INR 2 Lakh to 4 Lakh">INR 2 Lakh to 4 Lakh</form:option>
											<form:option value="INR 5 Lakh to 7 Lakh">INR 5 Lakh to 7 Lakh</form:option>
											<form:option value="INR 8 Lakh to 10 Lakh">INR 8 Lakh to 10 Lakh</form:option>
											<form:option value="INR 11 Lakh to 15 Lakh">INR 11 Lakh to 15 Lakh</form:option>
											<form:option value="INR 16 Lakh to 20 Lakh">INR 16 Lakh to 20 Lakh</form:option>
											<form:option value="INR 21 Lakh to 25 Lakh">INR 21 Lakh to 25 Lakh</form:option>
											<form:option value="Above INR 25 Lakh">Above INR 25 Lakh</form:option>
										</form:select>
				<div>
					<form:errors path="annualIncome" cssClass="error" />
				</div>
		</div>
	</div></div>
<div class="row">
	<div class="col-md-4 pull-right">
		<div class="form-group" style="display: ;">
				<input class="btn  btn-success"  type="button" id="professional_info_submit" name="yt0" value="Save" onclick="saveChanges('professional_info');">
				&nbsp;&nbsp;<input class="btn  btn-danger"  type="button" id="professional_info_cancel" name="yt1" value="Cancel" onclick="toggleDiv('professional_info');">
		</div>
	</div>
</div>