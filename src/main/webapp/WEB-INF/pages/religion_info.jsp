<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label required">Religion <span
				style="color: red;">*</span></label>
			
				<form:select path="religion" onchange="getReliginCastAjax1()" onfocus="removeBorder(this.id)"
					 class="form-control u">
					<form:option value="">-- Choose Religion --</form:option>
					<form:options items="${religion}"></form:options>
				</form:select>
				<div>
					<form:errors path="religion" cssClass="error" />
				</div>
		</div>
	</div>



	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label required">Community <span
				style="color: red;">*</span></label>
				<form:select path="caste" class="form-control u" >
					<form:option value="">-- Choose Community --</form:option>
					<%-- <form:options items="${cast}"></form:options> --%>
				</form:select>
				<div>
<%-- 					<form:errors path="caste" cssClass="error" /> --%>
				</div>
		</div>
	</div>



	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label required">Gotram </label>
			
				<form:input path="gotram" type="text"
					class="form-control onlyCharacters u" placeholder="Enter Gotram"
					maxlength="255" />
				<div>
					<form:errors path="gotram" cssClass="error" />
				</div>
		</div>
	</div>



	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label required">Star </label>
			
				<form:select path="star" class="form-control u">
					<form:option value="">-- Choose Star/Rassi --</form:option>
					<form:options items="${star}"></form:options>
				</form:select>
				<div>
					<form:errors path="star" cssClass="error" />
				</div>
		</div>
	</div>



	<div class="col-md-6">
		<div class="form-group">
			<label class="control-label required">Dosham </label>
			
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


<div class='row'>
	<div class="col-md-4 pull-right">
		<div class="form-group">
				<input class="btn  btn-success" type="button" id="religion_info_submit" name="yt0" value="Save" onclick="saveChanges('religion_info');">
				<input class="btn btn-danger" type="button"  id="religion_info_cancel" name="yt1" value="Cancel" onclick="toggleDiv('religion_info');">
		</div>
	</div>
</div>
<script>
function getReliginCastAjax1() {
	var religionId = $("#religion").val();
		var formData = new FormData();
		formData.append("religionId",religionId);
		$('#caste').find('option').not(':first').remove();
	$.fn.makeMultipartRequest('POST', 'castesBasedOnReligion', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var alldata = jsonobj.allOrders1;
		var optionsForClass = "";
		optionsForClass = $("#caste").empty();
		optionsForClass.append(new Option("-- Choose Community --", ""));
		$.each(alldata, function(i, tests) {
			var id=tests.id;
			var casteName=tests.name;
			optionsForClass.append(new Option(casteName, id));
		});
		
	});
}

/* function (id){
	var religionId = $("#religion").val();
	if(religionId.length !=0){
		$('#loadAjax').show();
	$.ajax({
		type : "POST",
		url : "castesBasedOnReligion.json",
		data : "religionId=" + religionId,
		dataType : "json",
		success : function(response) {
			 alert(response); 
			
			$('#loadAjax').hide();
			$('#caste').trigger("chosen:updated");
		},
		error : function(e) {
			$('#loadAjax').hide();
		},
		statusCode : {
			406 : function() {
				$('#loadAjax').hide();
		
			}
		}
	});
	$('#loadAjax').hide();

	}
} 
 */


</script>