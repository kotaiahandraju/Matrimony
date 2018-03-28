<%@ include file="userStepsHeader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

            <div class="col-md-5 col-sm-12"></div>
			<div  class="clearfix"></div>    
		</div>
	</div>
	<div class="row">
		<div class="midcontnet">
			<div class="col-md-8">
				<form:form commandName="familyDetails" action="saveImproveFamilyDetails" class="form-horizontal" id="saveImproveFamilyDetails"  method="post">
					<!-- 2nd Step starts here-->
					<div id="secondForm">
					    <div class="col-md-12">
					      <h3>Please share some details about Cvbc's Family</h3>
					    </div>
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
					      	<form:select path="noOfBrothers" class="form-control u1">
								<form:option value="">-- Select --</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					      </div>
					      <label class="col-md-2">of whom</label>
					      <div class="col-md-2">
					      	<form:select path="noOfBrothersMarried" class="form-control u1">
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
					      	<form:select path="noOfSisters" class="form-control u1">
								<form:option value="">-- Select --</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					      </div>
					      <label class="col-md-2">of whom</label>
					      <div class="col-md-2">
					      	<form:select path="noOfSistersMarried" class="form-control u1">
								<form:option value="">-- Select --</form:option>
								<form:option value="1">1</form:option>
								<form:option value="2">2</form:option>
								<form:option value="3">3</form:option>
							</form:select>
					      </div>
					      <label class="col-md-2">are married</label>
					    </div>
					    
					
					    <div class="form-group">
					      <label class="col-md-4 control-label" for="textinput"></label>  
					      <div class="col-md-6">
					    	<button type="button" id="secondButton" class="btn2 btn btn-info" onclick="submitForm()">Continue</button>
					<!--     	<button type="button" id="skipsecondButton" class="btn2 btn btn-info" onclick="skip()">Skip</button> -->
					    	<a  class="btn btn-success " href="${baseurl}/uploadPhotos">&nbsp;&nbsp;Skip</a>
					      </div>
					    </div>
					</div>
					<!-- 2nd Step ends here-->
				</form:form>
			</div>

<script type="text/javascript">
function submitForm(){
	$("#saveImproveFamilyDetails").submit();
}
 
function skip(){
	var location = "${baseurl}";
	window.location.href =location+"/uploadPhotos";
}
</script>

<%@ include file="userStepsFooter.jsp"%>