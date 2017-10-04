<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<c:set var = "activePage" scope = "session" value = "createProfileActive"/>
<style>
 .error {
        color: red; font-weight: bold;
    }
</style>
<%-- <% pages1 = "createprofile"; %> --%>
<div id="main">
<div class="container-fluid">
	<div class="page-header">
		<div class="pull-left">
			<h1>Create Profile</h1> 
		</div>
	</div>
	<div class="breadcrumbs">
		<ul>
			<li>
				<i class="fa fa-laptop"></i>
				<a href="javascript:void(0)" style="color: blue;text-decoration: none;">Profiles</a>
				<i class="fa fa-angle-right"></i>&nbsp;
			</li>
			<li>
				&nbsp;<i class="fa fa-user"></i>
				<span style="color: #999;cursor: auto;">Create Profile</span>
			</li>
		</ul>
		
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="portlet" id="yw0">
				<div class="portlet-content w3-animate-zoom">
					<!-- Create Profile Form Starts Here-->
					<form:form modelAttribute="createProfile" class="form-horizontal" role="form" id="creteProfile-form" action="addProfile" method="post">
					<form:hidden path="id"/>
					<form:hidden path="userdetailsId"/>
						<div class="form-group">
							<div class="col-sm-12">
								<div class="errorMessage" id="Create Profile_invalid_em_" >
									<c:if test="${not empty msg}">
										<div class="alert alert-success fadeIn animated">${msg}</div>
									</c:if>
								</div>
								<form:hidden path="id"/>
							</div>
					  	</div>
						
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.createdByName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:input path="created_by" type="text" class="form-control numericOnly"  autocomplete="off" onblur="validate(this.id);" maxlength="255"/>						
								  		<span class="hasError" id="created_byError"></span>
								  		<div><form:errors path="created_by" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.executiveName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:input path="executiveName" type="text" class="form-control onlyCharacters" autocomplete="off" onblur="validate1(this.id);"  maxlength="255"/>	
									<span class="hasError" id="executiveNameError"></span>
									<div><form:errors path="executiveName" cssClass="error" /></div>
									</div>
								</div>
							</div>
							<div class="col-md-3"></div>
						</div>
						
						<div class="row">
							<div class="col-lg-6">
								<legend>Basic Information</legend>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.casteName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-4">
								  		<form:select path="cast"  class="form-control" onblur="validate2(this.id);">
														<form:option value="">-- Choose Cast --</form:option>
														<form:options items="${cast}"></form:options>
										</form:select>
								  		<span class="hasError" id="castError"></span>
								  		<div><form:errors path="cast" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.subCaste" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:input path="subCaste" type="text" class="form-control onlyCharacters" autocomplete="off" onblur="validate3(this.id);"  maxlength="255"/>	
								  		<%-- <form:select path="subCaste" class="form-control" tabindex="2" onchange="classNameFilter()" required="true">
											<form:option value="" >-- Choose Board --</form:option>
										</form:select>
								  		<div><form:errors path="subCaste" cssClass="error" /></div> --%>
									<span class="hasError" id="subCasteError"></span>
								  		<div><form:errors path="subCaste" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.surName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="sname" type="text" class="form-control onlyCharacters" autocomplete="off" onblur="validate4(this.id);"  maxlength="255"/>						
								  		<span class="hasError" id="snameError"></span>
								  		<div><form:errors path="sname" cssClass="error" /></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.name" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="name" type="text" class="form-control onlyCharacters"  autocomplete="off" onblur="validate5(this.id);" maxlength="255"/>						
								  		<span class="hasError" id="nameError"></span>
								  		<div><form:errors path="name" cssClass="error" /></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.gender" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-4">
								  		<form:select path="gender" class="form-control" style="width:200px;" onblur="validate6(this.id);"  required="true">
											<form:option value="">-- Choose Gender --</form:option>
											<form:option value="Male">Male</form:option>
											<form:option value="Female">Female</form:option>
										</form:select>
								  		<span class="hasError" id="genderError"></span>
								  		<div><form:errors path="gender" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.dob" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="dob" type="text" class="form-control"  autocomplete="off" onblur="validate7(this.id);" maxlength="255"/>						
								  		<span class="hasError" id="dobError"></span>
								  		<div><form:errors path="dob" cssClass="error" /></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-xs-12 control-label required"><spring:message code="label.tob" text="default text" /></label>
									<div class="col-sm-8">
										<form:input path="tob" type="text" class="form-control"  autocomplete="off" onblur="validate8(this.id);" maxlength="255"/>						
								  		<span class="hasError" id="tobError"></span>
								  		<div><form:errors path="tob" cssClass="error" /></div>
									</div>
									
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.pob" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="pob" type="text" class="form-control" autocomplete="off" onblur="validate8(this.id);" maxlength="255"/>						
								  		<span class="hasError" id="pobError"></span>
								  		<div><form:errors path="pob" cssClass="error" /></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.height" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-4">
										<form:select path="height"  class="form-control" onblur="validate9(this.id);">
														<form:option value="">-- Choose Height --</form:option>
														<form:options items="${height}"></form:options>
										</form:select>
								  		<%-- <form:select path="height" class="form-control" style="width:200px;" required="true">
											<form:option value="">-- Choose Height --</form:option>
										</form:select>
								  		<div><form:errors path="height" cssClass="error" /></div> --%>
									<span class="hasError" id="heightError"></span>
								  		<div><form:errors path="height" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.complexion" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-4">
								  		<form:select path="complexion" class="form-control"  onblur="validate10(this.id);" style="width:200px;" required="true">
											<form:option value="">-- Choose Complexion --</form:option>
											<form:options items="${complexion}"></form:options>
										</form:select>
								  		<span class="hasError" id="complexionError"></span>
								  		<div><form:errors path="complexion" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.raasi" text="default text" /></label>
									<div class="col-sm-4">
										<form:select path="raasi" class="form-control" style="width:200px;" required="true">
											<form:option value="">-- Choose Raasi --</form:option>
											<form:options items="${raasi}"></form:options>
										</form:select>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.star" text="default text" /></label>
									<div class="col-sm-4">
										<form:select path="star" class="form-control" style="width:200px;" required="true">
											<form:option value="">-- Choose Star --</form:option>
											<form:options items="${star}"></form:options>
										</form:select>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.padam" text="default text" /></label>
									<div class="col-sm-8">
										<form:input path="padam" type="text" class="form-control" maxlength="255"/>	
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.gothram" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="gotram" type="text" class="form-control onlyCharacters" autocomplete="off" onblur="validate11(this.id);"  maxlength="255"/>	
									<span class="hasError" id="gotramError"></span>
									<div><form:errors path="gotram" cssClass="error" /></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.maritalStatus" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<span id="Users_mstatus">
											<input class="mstatus_valid" onchange="check_mstatus()" id="Users_mstatus_0" value="Unmarried" checked="checked" type="radio" name="maritalStatus"> <label for="Users_mstatus_0">Unmarried</label> 
											<input class="mstatus_valid" onchange="check_mstatus()" id="Users_mstatus_1" value="Widower" type="radio" name="maritalStatus"> <label for="Users_mstatus_1">Widower</label> 
											<input class="mstatus_valid" onchange="check_mstatus()" id="Users_mstatus_2" value="Divorcee" type="radio" name="maritalStatus"> <label for="Users_mstatus_2">Divorcee</label>
										</span>
									</div>
								</div>
								
								<div class="widow_divorcee_details">		
									<legend>Widow / Divorcee Detail </legend>						
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message code="label.defendentName" text="default text" /></label>
										<div class="col-sm-8">
							  				<input class="form-control" name="Users[defendent_name]" id="Users_defendent_name" type="text">
							  			</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message code="label.sOrD" text="default text" /></label>
										<div class="col-sm-8">
							  				<input class="form-control" name="Users[son_of]" id="Users_son_of" type="text">
							  			</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 col-xs-12 control-label required"><spring:message code="label.marriedOn" text="default text" /></label>
										<div class="col-sm-2 col-xs-4">
											<select class="form-control" name="Users[wm_dd]" id="Users_wm_dd">
												<option value="">Day</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
												<option value="31">31</option>
											</select>
										</div>
										<div class="col-sm-3 col-xs-4">
											<select class="form-control" name="Users[wm_mm]" id="Users_wm_mm">
												<option value="">Month</option>
												<option value="1">Jan</option>
												<option value="2">Feb</option>
												<option value="3">Mar</option>
												<option value="4">Apr</option>
												<option value="5">May</option>
												<option value="6">Jun</option>
												<option value="7">Jul</option>
												<option value="8">Aug</option>
												<option value="9">Sep</option>
												<option value="10">Oct</option>
												<option value="11">Nov</option>
												<option value="12">Dec</option>
											</select>
										</div>
										<div class="col-sm-3 col-xs-4">
											<select class="form-control" name="Users[wm_yy]" id="Users_wm_yy">
												<option value="">Year</option>
												<option value="1999">1999</option>
												<option value="1998">1998</option>
												<option value="1997">1997</option>
												<option value="1996">1996</option>
												<option value="1995">1995</option>
												<option value="1994">1994</option>
												<option value="1993">1993</option>
												<option value="1992">1992</option>
												<option value="1991">1991</option>
												<option value="1990">1990</option>
												<option value="1989">1989</option>
												<option value="1988">1988</option>
												<option value="1987">1987</option>
												<option value="1986">1986</option>
												<option value="1985">1985</option>
												<option value="1984">1984</option>
												<option value="1983">1983</option>
												<option value="1982">1982</option>
												<option value="1981">1981</option>
												<option value="1980">1980</option>
												<option value="1979">1979</option>
												<option value="1978">1978</option>
												<option value="1977">1977</option>
												<option value="1976">1976</option>
												<option value="1975">1975</option>
												<option value="1974">1974</option>
												<option value="1973">1973</option>
												<option value="1972">1972</option>
												<option value="1971">1971</option>
												<option value="1970">1970</option>
												<option value="1969">1969</option>
												<option value="1968">1968</option>
												<option value="1967">1967</option>
												<option value="1966">1966</option>
												<option value="1965">1965</option>
												<option value="1964">1964</option>
												<option value="1963">1963</option>
												<option value="1962">1962</option>
												<option value="1961">1961</option>
												<option value="1960">1960</option>
												<option value="1959">1959</option>
												<option value="1958">1958</option>
												<option value="1957">1957</option>
												<option value="1956">1956</option>
												<option value="1955">1955</option>
												<option value="1954">1954</option>
												<option value="1953">1953</option>
												<option value="1952">1952</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 col-xs-12 control-label required"><spring:message code="label.dateOfSeparation" text="default text" /></label>
										<div class="col-sm-2 col-xs-4">
											<select class="form-control" name="Users[ws_dd]" id="Users_ws_dd">
												<option value="">Day</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
												<option value="31">31</option>
											</select>
										</div>
										<div class="col-sm-3 col-xs-4">
											<select class="form-control" name="Users[ws_mm]" id="Users_ws_mm">
												<option value="">Month</option>
												<option value="1">Jan</option>
												<option value="2">Feb</option>
												<option value="3">Mar</option>
												<option value="4">Apr</option>
												<option value="5">May</option>
												<option value="6">Jun</option>
												<option value="7">Jul</option>
												<option value="8">Aug</option>
												<option value="9">Sep</option>
												<option value="10">Oct</option>
												<option value="11">Nov</option>
												<option value="12">Dec</option>
											</select>
										</div>
										<div class="col-sm-3 col-xs-4">
											<select class="form-control" name="Users[ws_yy]" id="Users_ws_yy">
												<option value="">Year</option>
												<option value="1999">1999</option>
												<option value="1998">1998</option>
												<option value="1997">1997</option>
												<option value="1996">1996</option>
												<option value="1995">1995</option>
												<option value="1994">1994</option>
												<option value="1993">1993</option>
												<option value="1992">1992</option>
												<option value="1991">1991</option>
												<option value="1990">1990</option>
												<option value="1989">1989</option>
												<option value="1988">1988</option>
												<option value="1987">1987</option>
												<option value="1986">1986</option>
												<option value="1985">1985</option>
												<option value="1984">1984</option>
												<option value="1983">1983</option>
												<option value="1982">1982</option>
												<option value="1981">1981</option>
												<option value="1980">1980</option>
												<option value="1979">1979</option>
												<option value="1978">1978</option>
												<option value="1977">1977</option>
												<option value="1976">1976</option>
												<option value="1975">1975</option>
												<option value="1974">1974</option>
												<option value="1973">1973</option>
												<option value="1972">1972</option>
												<option value="1971">1971</option>
												<option value="1970">1970</option>
												<option value="1969">1969</option>
												<option value="1968">1968</option>
												<option value="1967">1967</option>
												<option value="1966">1966</option>
												<option value="1965">1965</option>
												<option value="1964">1964</option>
												<option value="1963">1963</option>
												<option value="1962">1962</option>
												<option value="1961">1961</option>
												<option value="1960">1960</option>
												<option value="1959">1959</option>
												<option value="1958">1958</option>
												<option value="1957">1957</option>
												<option value="1956">1956</option>
												<option value="1955">1955</option>
												<option value="1954">1954</option>
												<option value="1953">1953</option>
												<option value="1952">1952</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message code="label.courtCase" text="default text" /></label>
										<div class="col-sm-8">
							  				<input class="form-control" name="Users[court]" id="Users_court" type="text">
							  			</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message code="label.reason" text="default text" /></label>
										<div class="col-sm-8">
							  				<input class="form-control" name="Users[wm_reason]" id="Users_wm_reason" type="text">
							  			</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message code="label.maleChildrens" text="default text" /></label>
										<div class="col-sm-8">
							  				<input class="form-control" name="Users[male_childrens]" id="Users_male_childrens" type="text">
							  			</div>
									</div>
									<div class="form-group">
										<label class="col-sm-4 control-label required"><spring:message code="label.femaleChildrens" text="default text" /></label>
										<div class="col-sm-8">
							  				<input class="form-control" name="Users[female_childrens]" id="Users_female_childrens" type="text">
							  			</div>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.religion" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-4">
										<form:select path="religion" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose religion --</form:option>
											<form:options items="${religion}"></form:options>
										</form:select>
									</div>
							  	</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.motherTongue" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="mtongue"  class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.spokenLanguages" text="default text" /></label>
									<div class="col-sm-4">
										<form:select path="sLanguages" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose religion --</form:option>
											<form:options items="${language}"></form:options>
										</form:select>
									</div>
							  	</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.aboutYourself" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:textarea path="aboutYourself" class="form-control"/>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<legend>About My Family</legend>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.fatherName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:input path="fname"  class="form-control" />
							  		</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.fatherEducation" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="feducation" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose religion --</form:option>
											<form:options items="${education}"></form:options>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.fatherOccupation" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="foccupation" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose occupation --</form:option>
											<form:options items="${occupation}"></form:options>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.fatherOccupationDetails" text="default text" /></label>
									<div class="col-sm-8">
									<form:input path="foDetails"  class="form-control" />
							  			
								  	</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.fathersFatherName" text="default text" /></label>
									<div class="col-sm-8">
									<form:input path="ffName"  class="form-control" />
							  		</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.fatherNativeAddress" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:textarea path="fnativeAddress"  class="form-control" />
								  	</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.presentAddress" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:textarea path="presentAddress"  class="form-control" />
							  		</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.contactPhNo" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:input path="phone1"  class="form-control" />
							  		</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.contactPhNo2" text="default text" /></label>
									<div class="col-sm-8">
							  				<form:input path="phone2"  class="form-control" />
							  		</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.landLine" text="default text" /></label>
									<div class="col-sm-8">
							  				<form:input path="landLine"  class="form-control" />
							  		</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.email" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
							  			<form:input path="email"  class="form-control" />
							  		</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.email2" text="default text" /></label>
									<div class="col-sm-8">
							  			<form:input path="email2"  class="form-control" />
							  		</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.motherName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
							  			<form:input path="mname"  class="form-control" />
							  		</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.motherEducation" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="meducation" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose occupation --</form:option>
											<form:options items="${education}"></form:options>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.motherOccupation" text="default text" /></label>
									<div class="col-sm-8">
										<form:select path="moccupation" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose occupation --</form:option>
											<form:options items="${occupation}"></form:options>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.motherOccupationDetails" text="default text" /></label>
									<div class="col-sm-8">
							  			<form:input path="moDetails"  class="form-control" />
								  	</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.mothersFatherName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
							  			<form:input path="mfName"  class="form-control" />
							  		</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.motherNativeAddress" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:textarea path="mnativeAddress"  class="form-control" />
								  	</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.siblings" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  		<form:input path="sibilings"  class="form-control" />
								  	</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.property" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
								  	     <form:input path="property"  class="form-control" />
								  	</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.aboutFamily" text="default text" /></label>
									<div class="col-sm-8">
								  		<form:textarea path="aboutFamily"  class="form-control" />
								  	</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.selectNearestBranch" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="branch" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose branch --</form:option>
											<form:options items="${branch}"></form:options>
										</form:select>								
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-lg-6">
								<legend>Education &amp; Job information</legend>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.education" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-md-4">
										<form:select path="education" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose education --</form:option>
											<form:options items="${education}"></form:options>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.educationDetails" text="default text" /></label>
									<div class="col-sm-8">
										 <form:input path="educationDetails"  class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.educationInfo" text="default text" /></label>
									<div class="col-sm-8">
										 <form:input path="educationInfo"  class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.occupation" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-md-4">
										<form:select path="occupation" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose education --</form:option>
											<form:options items="${occupation}"></form:options>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.occupationDetails" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										 <form:input path="occupationDetails"  class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.sinceWorking" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										 <form:input path="sinceWorking"  class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.salaryPerMonth" text="default text" /></label>
									<div class="col-sm-8">
										 <form:input path="salaryperMonth"  class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.salaryPerYear" text="default text" /></label>
									<div class="col-sm-8">
										 <form:input path="salaryperyear"  class="form-control" />
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<legend>for NRI - Visa Details</legend>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.citizenOf" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-md-4">
										<form:select path="ncitizenOf" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose education --</form:option>
											<form:options items="${countries}"></form:options>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.currentResidenceCountry" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-md-4">
										<form:select path="crCountry" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose education --</form:option>
											<form:options items="${countries}"></form:options>
										</form:select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.visaType" text="default text" /></label>
									<div class="col-sm-8">
										 <form:input path="visaType"  class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.stayingSince" text="default text" /></label>
									<div class="col-md-8">
										<form:input path="stayingSince"  class="form-control" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.visaValidity" text="default text" /></label>
									<div class="col-sm-8">
											<form:input path="visaValidity"  class="form-control" />
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<legend align="center">Requirment</legend>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.ageGap" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="ageGap"  class="form-control" />
										<div class="errorMessage" id="Users_req_age_em_" style="display:none"></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.heightFrom" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-3">
										<form:select path="rHeightFrom" class="form-control" >
											<form:option value="">-- Choose height --</form:option>
											<form:options items="${height}"></form:options>
										</form:select>
										<%-- <form:select path="heightFrom" class="form-control" tabindex="2" required="true">
											<form:option value="" >-- Choose Height --</form:option>
										</form:select>
								  		<div><form:errors path="heightFrom" cssClass="error" /></div> --%>
									</div>
									<label class="col-sm-2 control-label required" style="text-align: center;"><spring:message code="label.to" text="default text"/></label>
									<div class="col-sm-3">
										<form:select path="rHeightTo" class="form-control">
											<form:option value="">-- Choose height --</form:option>
											<form:options items="${height}"></form:options>
										</form:select>
										<%-- <form:select path="heightTo" class="form-control" tabindex="2" required="true">
											<form:option value="" >-- Choose Height --</form:option>
										</form:select>
								  		<div><form:errors path="heightTo" cssClass="error" /></div> --%>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.complexion" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="rComplexion" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose height --</form:option>
											<form:options items="${complexion}"></form:options>
										</form:select>						
								  		<div><form:errors path="complexion" cssClass="error" /></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.profession" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:select path="rprofession" class="form-control" style="width:200px;" >
											<form:option value="">-- Choose education --</form:option>
											<form:options items="${occupation}"></form:options>
										</form:select>
										<%-- <form:input path="profession" type="text" class="form-control" maxlength="255"/>						
								  		<div><form:errors path="profession" cssClass="error" /></div> --%>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-8 col-sm-offset-4">
									<form:checkbox path="showall" value="1"/>
<!-- 										<input value="1" checked="checked" name="profile_pic_status" id="profile_pic_status" type="checkbox" style="cursor: pointer;"> -->
										<label class="control-label" for="profile_pic_status" style="cursor: pointer;">Show Profile photo to all</label>					
									</div>
			 					</div>
			 					<div class="form-group">
									<div class="col-sm-8 col-sm-offset-4">
									
										<input value="1" checked="checked" name="Users[profile_pic_status]" id="Users_terms" type="checkbox" style="cursor: pointer;">
										<label class="control-label" for="Users_terms" style="cursor: pointer;">I accept the terms & conditions <span style="color:red;">*</span></label>					
									</div>
			 					</div>
							</div>
							<div class="col-md-3"></div>
						</div>
						<div class="col-sm-6 col-sm-offset-4">
							<div class="form-group">
								<div class="col-sm-8 col-sm-offset-2"><input class="btn btn btn-primary" type="submit" name="yt0" value="Register"></div>
							</div>
						</div>
					</form:form>
					<!-- Create Profile Form Ends Here-->
				</div>
			</div>
		</div>
	</div>

</div>
</div>

<!-- <script type="text/javascript" src="js/custom.js"></script>		 -->
<script type="text/javascript">

$("#dob").datepicker({
    dateFormat: "dd-MM-yy",
    changeDate : true,
	changeMonth : true,
	changeYear : true,
	maxDate :0
});

$("#pob").datepicker({
    dateFormat: "dd-MM-yy",
    changeDate : true,
	changeMonth : true,
	changeYear : true,
	maxDate :0
});
$("#tob").datepicker({
    dateFormat: "dd-MM-yy",
    changeDate : true,
	changeMonth : true,
	changeYear : true,
	maxDate :0
});




function validate(id){
	if($('#created_by').val() ==  null || $('#created_by').val() == ""  || $('#created_by').val()=="undefined" ) {
		$('#created_byError').css('color','red');
	    $("#created_byError").text("Created By cannot be blank.");
	}else{
		$("#nameError").text("");
	}
	}
function validate1(id){
	if($('#executiveName').val() ==  null || $('#executiveName').val() == ""  || $('#executiveName').val()=="undefined" ) {
		$('#executiveNameError').css('color','red');
	    $("#executiveNameError").text("Executive Name cannot be blank.");
	}else{
		$("#executiveNameError").text("");
	}
	}
function validate2(id){
	if($('#cast').val() ==  null || $('#cast').val() == ""  || $('#cast').val()=="undefined" ) {
		$('#castError').css('color','red');
	    $("#castError").text("cast cannot be blank.");
	}else{
		$("#castError").text("");
	}
	}
function validate3(id){
	if($('#subCaste').val() ==  null || $('#subCaste').val() == ""  || $('#subCaste').val()=="undefined" ) {
		$('#subCasteError').css('color','red');
	    $("#subCasteError").text("subCaste cannot be blank.");
	}else{
		$("#subCasteError").text("");
	}
	}
function validate4(id){
	if($('#sname').val() ==  null || $('#sname').val() == ""  || $('#sname').val()=="undefined" ) {
		$('#snameError').css('color','red');
	    $("#snameError").text("SurName cannot be blank.");
	}else{
		$("#snameError").text("");
	}
	}
function validate5(id){
	if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" ) {
		$('#nameError').css('color','red');
	    $("#nameError").text("Name cannot be blank.");
	}else{
		$("#nameError").text("");
	}
	}
function validate6(id){
	if($('#gender').val() ==  null || $('#gender').val() == ""  || $('#gender').val()=="undefined" ) {
		$('#genderError').css('color','red');
	    $("#genderError").text("Gender cannot be blank.");
	}else{
		$("#genderError").text("");
	}
	}
function validate7(id){
	if($('#dob').val() ==  null || $('#dob').val() == ""  || $('#dob').val()=="undefined" ) {
		$('#dobError').css('color','red');
	    $("#dobError").text("Date of Brith cannot be blank.");
	}else{
		$("#dobError").text("");
	}
	}
function validate8(id){
	if($('#pob').val() ==  null || $('#pob').val() == ""  || $('#pob').val()=="undefined" ) {
		$('#pobError').css('color','red');
	    $("#pobError").text("Place of Brith cannot be blank.");
	}else{
		$("#pobError").text("");
	}
	}
function validate9(id){
	if($('#height').val() ==  null || $('#height').val() == ""  || $('#height').val()=="undefined" ) {
		$('#heightError').css('color','red');
	    $("#heightError").text(" Height cannot be blank.");
	}else{
		$("#heightError").text("");
	}
	}
function validate10(id){
	if($('#complexion').val() ==  null || $('#complexion').val() == ""  || $('#complexion').val()=="undefined" ) {
		$('#complexionError').css('color','red');
	    $("#complexionError").text(" Complexion cannot be blank.");
	}else{
	}
	}
function validate11(id){
	if($('#gotram').val() ==  null || $('#gotram').val() == ""  || $('#gotram').val()=="undefined" ) {
		$('#gotramError').css('color','red');
	    $("#gotramError").text(" Gotram cannot be blank.");
	}else{
	}
	}
function validate12(id){
	if($('#religion').val() ==  null || $('#religion').val() == ""  || $('#religion').val()=="undefined" ) {
		$('#religionError').css('color','red');
	    $("#religionError").text(" Religion cannot be blank.");
	}else{
	}
	}
function validate13(id){
	if($('#mtongue').val() ==  null || $('#mtongue').val() == ""  || $('#mtongue').val()=="undefined" ) {
		$('#mtongueError').css('color','red');
	    $("#mtongueError").text(" Mtongue cannot be blank.");
	}else{
	}
	}
function validate13(id){
	if($('#mtongue').val() ==  null || $('#mtongue').val() == ""  || $('#mtongue').val()=="undefined" ) {
		$('#mtongueError').css('color','red');
	    $("#mtongueError").text(" Mtongue cannot be blank.");
	}else{
	}
	}
function validate14(id){
	if($('#aboutYourself').val() ==  null || $('#aboutYourself').val() == ""  || $('#aboutYourself').val()=="undefined" ) {
		$('#aboutYourselfError').css('color','red');
	    $("#aboutYourselfError").text(" AboutYourself cannot be blank.");
	}else{
	}
	}
function validate15(id){
	if($('#fname').val() ==  null || $('#fname').val() == ""  || $('#fname').val()=="undefined" ) {
		$('#fnameError').css('color','red');
	    $("#fnameError").text(" Father Name cannot be blank.");
	}else{
	}
	}
function validate16(id){
	if($('#feducation').val() ==  null || $('#feducation').val() == ""  || $('#feducation').val()=="undefined" ) {
		$('#feducationError').css('color','red');
	    $("#feducationError").text(" Father Education cannot be blank.");
	}else{
	}
	}
function validate17(id){
	if($('#foccupation').val() ==  null || $('#foccupation').val() == ""  || $('#foccupation').val()=="undefined" ) {
		$('#foccupationError').css('color','red');
	    $("#foccupationError").text(" Father Occupation cannot be blank.");
	}else{
	}
	}
function validate18(id){
	if($('#fnativeAddress').val() ==  null || $('#fnativeAddress').val() == ""  || $('#fnativeAddress').val()=="undefined" ) {
		$('#fnativeAddressError').css('color','red');
	    $("#fnativeAddressError").text(" Father Native Address cannot be blank.");
	}else{
	}
	}
function validate19(id){
	if($('#presentAddress').val() ==  null || $('#presentAddress').val() == ""  || $('#presentAddress').val()=="undefined" ) {
		$('#presentAddressError').css('color','red');
	    $("#presentAddressError").text(" Present Address cannot be blank.");
	}else{
	}
	}
function validate20(id){
	if($('#phone1').val() ==  null || $('#phone1').val() == ""  || $('#phone1').val()=="undefined" ) {
		$('#phone1Error').css('color','red');
	    $("#phone1Error").text(" Mobile cannot be blank.");
	}else{
	}
	}
function validate21(id){
	if($('#email').val() ==  null || $('#email').val() == ""  || $('#email').val()=="undefined" ) {
		$('#emailError').css('color','red');
	    $("#emailError").text(" Email cannot be blank.");
	}else{
	}
	}
function validate22(id){
	if($('#mname').val() ==  null || $('#mname').val() == ""  || $('#mname').val()=="undefined" ) {
		$('#mnameError').css('color','red');
	    $("#mnameError").text("Mother Name cannot be blank.");
	}else{
	}
	}
function validate23(id){
	if($('#meducation').val() ==  null || $('#meducation').val() == ""  || $('#meducation').val()=="undefined" ) {
		$('#meducationError').css('color','red');
	    $("#meducationError").text(" Mother Education cannot be blank.");
	}else{
	}
	}
function validate24(id){
	if($('#mfName').val() ==  null || $('#mfName').val() == ""  || $('#mfName').val()=="undefined" ) {
		$('#mfNameError').css('color','red');
	    $("#mfNameError").text(" Mother Father's cannot be blank.");
	}else{
	}
	}
function validate25(id){
	if($('#mnativeAddress').val() ==  null || $('#mnativeAddress').val() == ""  || $('#mnativeAddress').val()=="undefined" ) {
		$('#mnativeAddressError').css('color','red');
	    $("#mnativeAddressError").text(" Mother Native Address cannot be blank.");
	}else{
	}
	}
function validate26(id){
	if($('#sibilings').val() ==  null || $('#sibilings').val() == ""  || $('#sibilings').val()=="undefined" ) {
		$('#sibilingsError').css('color','red');
	    $("#sibilingsError").text("Sibilings cannot be blank.");
	}else{
	}
	}
function validate27(id){
	if($('#property').val() ==  null || $('#property').val() == ""  || $('#property').val()=="undefined" ) {
		$('#propertyError').css('color','red');
	    $("#propertyError").text(" Property cannot be blank.");
	}else{
	}
	}
function validate28(id){
	if($('#branch').val() ==  null || $('#branch').val() == ""  || $('#branch').val()=="undefined" ) {
		$('#branchError').css('color','red');
	    $("#branchError").text(" Branch cannot be blank.");
	}else{
	}
	}
function validate29(id){
	if($('#education').val() ==  null || $('#education').val() == ""  || $('#education').val()=="undefined" ) {
		$('#educationError').css('color','red');
	    $("#educationError").text(" Education cannot be blank.");
	}else{
	}
	}
function validate30(id){
	if($('#occupation').val() ==  null || $('#occupation').val() == ""  || $('#occupation').val()=="undefined" ) {
		$('#occupationError').css('color','red');
	    $("#occupationError").text(" Occupation cannot be blank.");
	}else{
	}
	}
function validate31(id){
	if($('#occupationDetails').val() ==  null || $('#occupationDetails').val() == ""  || $('#occupationDetails').val()=="undefined" ) {
		$('#occupationDetailsError').css('color','red');
	    $("#occupationDetailsError").text(" Occupation Details cannot be blank.");
	}else{
	}
	}
function validate32(id){
	if($('#sinceWorking').val() ==  null || $('#sinceWorking').val() == ""  || $('#sinceWorking').val()=="undefined" ) {
		$('#sinceWorkingError').css('color','red');
	    $("#sinceWorkingError").text(" Since Working cannot be blank.");
	}else{
	}
	}
function validate33(id){
	if($('#ncitizenOf').val() ==  null || $('#ncitizenOf').val() == ""  || $('#ncitizenOf').val()=="undefined" ) {
		$('#ncitizenOfError').css('color','red');
	    $("#ncitizenOfError").text(" CitizenOf cannot be blank.");
	}else{
	}
	}
function validate34(id){
	if($('#crCountry').val() ==  null || $('#crCountry').val() == ""  || $('#crCountry').val()=="undefined" ) {
		$('#crCountryError').css('color','red');
	    $("#crCountryError").text(" Country cannot be blank.");
	}else{
	}
	}
function validate35(id){
	if($('#ageGap').val() ==  null || $('#ageGap').val() == ""  || $('#ageGap').val()=="undefined" ) {
		$('#ageGapError').css('color','red');
	    $("#ageGapError").text(" Age Gap cannot be blank.");
	}else{
	}
	}
function validate36(id){
	if($('#rHeightFrom').val() ==  null || $('#rHeightFrom').val() == ""  || $('#rHeightFrom').val()=="undefined" ) {
		$('#rHeightFromError').css('color','red');
	    $("#rHeightFromError").text("Height From cannot be blank.");
	}else{
	}
	}
function validate37(id){
	if($('#rHeightTo').val() ==  null || $('#rHeightTo').val() == ""  || $('#rHeightTo').val()=="undefined" ) {
		$('#rHeightToError').css('color','red');
	    $("#rHeightToError").text(" Height To cannot be blank.");
	}else{
	}
	}
function validate38(id){
	if($('#rComplexion').val() ==  null || $('#rComplexion').val() == ""  || $('#rComplexion').val()=="undefined" ) {
		$('#rComplexionError').css('color','red');
	    $("#rComplexionError").text(" Complexion cannot be blank.");
	}else{
	}
	}
function validate39(id){
	if($('#rprofession').val() ==  null || $('#rprofession').val() == ""  || $('#rprofession').val()=="undefined" ) {
		$('#rprofessionError').css('color','red');
	    $("#rprofessionError").text(" Profession cannot be blank.");
	}else{
	}
	}
function validate40(id){
	if($('#Users_terms').prop("checked") == false || $('#Users_terms').val() != 1 || $('#Users_terms').val()=="undefined") {
		$('#Users_termsError').css('color','red');
	    $("#Users_termsError").text("Please check the terms & conditions.");
	}else if($('#Users_terms').prop("checked") == true){$('#Users_termsError').text("");}
	} 
	
	
	
	
	
	
	
	
	
	
	
	
$("#submit1").click(function()
		{			
			if($('#created_by').val() ==  null || $('#created_by').val() == ""  || $('#created_by').val()=="undefined")
			{
				if($('#created_by').val() ==  null || $('#created_by').val() == ""  || $('#created_by').val()=="undefined" ) 
				{			    
				    $('#created_byError').css('color','red');
				    $("#created_byError").text("Created By cannot be blank.");
			    }
				if($('#executiveName').val() ==  null || $('#executiveName').val() == ""  || $('#executiveName').val()=="undefined" ) 
				{			    
				    $('#executiveNameError').css('color','red');
				    $("#executiveNameError").text("ExecutiveName cannot be blank.");
			    }
				if($('#cast').val() ==  null || $('#cast').val() == ""  || $('#cast').val()=="undefined" ) 
				{			    
				    $('#castError').css('color','red');
				    $("#castError").text("cast cannot be blank.");
			    }
				if($('#subCaste').val() ==  null || $('#subCaste').val() == ""  || $('#subCaste').val()=="undefined" ) 
				{			    
				    $('#subCasteError').css('color','red');
				    $("#subCasteError").text("subCaste cannot be blank.");
			    }
				if($('#sname').val() ==  null || $('#sname').val() == ""  || $('#sname').val()=="undefined" ) 
				{			    
				    $('#snameError').css('color','red');
				    $("#snameError").text("SurName cannot be blank.");
			    }
				if($('#name').val() ==  null || $('#name').val() == ""  || $('#name').val()=="undefined" ) 
				{			    
				    $('#nameError').css('color','red');
				    $("#nameError").text("Name cannot be blank.");
			    }
				if($('#gender').val() ==  null || $('#gender').val() == ""  || $('#gender').val()=="undefined" ) 
				{			    
				    $('#genderError').css('color','red');
				    $("#genderError").text("Gender cannot be blank.");
			    }
				if($('#dob').val() ==  null || $('#dob').val() == ""  || $('#dob').val()=="undefined" ) 
				{			    
				    $('#dobError').css('color','red');
				    $("#dobError").text("Date OF Brith cannot be blank.");
			    }
				if($('#pob').val() ==  null || $('#pob').val() == ""  || $('#pob').val()=="undefined" ) 
				{			    
				    $('#pobError').css('color','red');
				    $("#pobError").text("Place OF Brith cannot be blank.");
			    }
				if($('#height').val() ==  null || $('#height').val() == ""  || $('#height').val()=="undefined" ) 
				{			    
				    $('#heightError').css('color','red');
				    $("#heightError").text("Height  cannot be blank.");
			    }
				if($('#complexion').val() ==  null || $('#complexion').val() == ""  || $('#complexion').val()=="undefined" ) 
				{			    
				    $('#complexiontError').css('color','red');
				    $("#complexionError").text("Complexion  cannot be blank.");
			    }
				if($('#gotram').val() ==  null || $('#gotram').val() == ""  || $('#gotram').val()=="undefined" ) 
				{			    
				    $('#gotramError').css('color','red');
				    $("#gotramError").text("Gotram  cannot be blank.");
			    }
				if($('#religion').val() ==  null || $('#religion').val() == ""  || $('#religion').val()=="undefined" ) 
				{			    
				    $('#religionError').css('color','red');
				    $("#religionError").text("Religion  cannot be blank.");
			    }
				if($('#mtongue').val() ==  null || $('#mtongue').val() == ""  || $('#mtongue').val()=="undefined" ) 
				{			    
				    $('#mtongueError').css('color','red');
				    $("#mtongueError").text("MTongue  cannot be blank.");
			    }
				if($('#mtongue').val() ==  null || $('#mtongue').val() == ""  || $('#mtongue').val()=="undefined" ) 
				{			    
				    $('#mtongueError').css('color','red');
				    $("#mtongueError").text("MTongue  cannot be blank.");
			    }
				if($('#aboutYourself').val() ==  null || $('#aboutYourself').val() == ""  || $('#aboutYourself').val()=="undefined" ) 
				{			    
				    $('#aboutYourselfError').css('color','red');
				    $("#aboutYourselfError").text("AboutYourself  cannot be blank.");
			    }
				if($('#fname').val() ==  null || $('#fname').val() == ""  || $('#fname').val()=="undefined" ) 
				{			    
				    $('#fnameError').css('color','red');
				    $("#fnameError").text("Father Name  cannot be blank.");
			    }
				if($('#feducation').val() ==  null || $('#feducation').val() == ""  || $('#feducation').val()=="undefined" ) 
				{			    
				    $('#feducationError').css('color','red');
				    $("#feducationError").text("Father Education  cannot be blank.");
			    }
				if($('#foccupation').val() ==  null || $('#foccupation').val() == ""  || $('#foccupation').val()=="undefined" ) 
				{			    
				    $('#foccupationError').css('color','red');
				    $("#foccupationError").text("Father Occupation  cannot be blank.");
			    }
				if($('#fnativeAddress').val() ==  null || $('#fnativeAddress').val() == ""  || $('#fnativeAddress').val()=="undefined" ) 
				{			    
				    $('#fnativeAddressError').css('color','red');
				    $("#fnativeAddressError").text("Father Native Address  cannot be blank.");
			    }
				if($('#presentAddress').val() ==  null || $('#presentAddress').val() == ""  || $('#presentAddress').val()=="undefined" ) 
				{			    
				    $('#presentAddressError').css('color','red');
				    $("#presentAddressError").text("Present Address  cannot be blank.");
			    }
				if($('#phone1').val() ==  null || $('#phone1').val() == ""  || $('#phone1').val()=="undefined" ) 
				{			    
				    $('#phone1Error').css('color','red');
				    $("#phone1Error").text("Mobile  cannot be blank.");
			    }
				if($('#email').val() ==  null || $('#email').val() == ""  || $('#email').val()=="undefined" ) 
				{			    
				    $('#emailError').css('color','red');
				    $("#emailError").text("Email  cannot be blank.");
			    }
				if($('#mname').val() ==  null || $('#mname').val() == ""  || $('#mname').val()=="undefined" ) 
				{			    
				    $('#mnameError').css('color','red');
				    $("#mnameError").text("Mother Name  cannot be blank.");
			    }
				if($('#meducation').val() ==  null || $('#meducation').val() == ""  || $('#meducation').val()=="undefined" ) 
				{			    
				    $('#meducationError').css('color','red');
				    $("#meducationError").text("Mother Education  cannot be blank.");
			    }
				if($('#mfName').val() ==  null || $('#mfName').val() == ""  || $('#mfName').val()=="undefined" ) 
				{			    
				    $('#mfNameError').css('color','red');
				    $("#mfNameError").text("Mother Father's  cannot be blank.");
			    }
				if($('#mnativeAddress').val() ==  null || $('#mnativeAddress').val() == ""  || $('#mnativeAddress').val()=="undefined" ) 
				{			    
				    $('#mnativeAddressError').css('color','red');
				    $("#mnativeAddressError").text("Mother Native Address  cannot be blank.");
			    }
				if($('#sibilings').val() ==  null || $('#sibilings').val() == ""  || $('#sibilings').val()=="undefined" ) 
				{			    
				    $('#sibilingsError').css('color','red');
				    $("#sibilingsError").text("Sibilings  cannot be blank.");
			    }
				if($('#property').val() ==  null || $('#property').val() == ""  || $('#property').val()=="undefined" ) 
				{			    
				    $('#propertyError').css('color','red');
				    $("#propertyError").text("Property  cannot be blank.");
			    }
				if($('#branch').val() ==  null || $('#branch').val() == ""  || $('#branch').val()=="undefined" ) 
				{			    
				    $('#branchError').css('color','red');
				    $("#branchError").text("Branch  cannot be blank.");
			    }
				if($('#education').val() ==  null || $('#education').val() == ""  || $('#education').val()=="undefined" ) 
				{			    
				    $('#educationError').css('color','red');
				    $("#educationError").text("Education  cannot be blank.");
			    }
				if($('#occupation').val() ==  null || $('#occupation').val() == ""  || $('#occupation').val()=="undefined" ) 
				{			    
				    $('#occupationError').css('color','red');
				    $("#occupationError").text("occupation  cannot be blank.");
			    }
				if($('#occupationDetails').val() ==  null || $('#occupationDetails').val() == ""  || $('#occupationDetails').val()=="undefined" ) 
				{			    
				    $('#occupationDetailsError').css('color','red');
				    $("#occupationDetailsError").text("occupation Details  cannot be blank.");
			    }
				if($('#sinceWorking').val() ==  null || $('#sinceWorking').val() == ""  || $('#sinceWorking').val()=="undefined" ) 
				{			    
				    $('#sinceWorkingError').css('color','red');
				    $("#sinceWorkingError").text("Since Working  cannot be blank.");
			    }
				if($('#ncitizenOf').val() ==  null || $('#ncitizenOf').val() == ""  || $('#ncitizenOf').val()=="undefined" ) 
				{			    
				    $('#ncitizenOfError').css('color','red');
				    $("#ncitizenOfError").text("CitizenOf  cannot be blank.");
			    }
				if($('#crCountry').val() ==  null || $('#crCountry').val() == ""  || $('#crCountry').val()=="undefined" ) 
				{			    
				    $('#crCountryError').css('color','red');
				    $("#crCountryError").text("Country  cannot be blank.");
			    }
				if($('#ageGap').val() ==  null || $('#ageGap').val() == ""  || $('#ageGap').val()=="undefined" ) 
				{			    
				    $('#ageGapError').css('color','red');
				    $("#ageGapError").text("AgeGap  cannot be blank.");
			    }
				if($('#rHeightFrom').val() ==  null || $('#rHeightFrom').val() == ""  || $('#rHeightFrom').val()=="undefined" ) 
				{			    
				    $('#rHeightFromError').css('color','red');
				    $("#rHeightFromError").text("HeightFrom  cannot be blank.");
			    }
				if($('#rHeightTo').val() ==  null || $('#rHeightTo').val() == ""  || $('#rHeightTo').val()=="undefined" ) 
				{			    
				    $('#rHeightToError').css('color','red');
				    $("#rHeightToError").text("HeightTo  cannot be blank.");
			    }
				if($('#rComplexion').val() ==  null || $('#rComplexion').val() == ""  || $('#rComplexion').val()=="undefined" ) 
				{			    
				    $('#rComplexionError').css('color','red');
				    $("#rComplexionError").text("Complexion  cannot be blank.");
			    }
				if($('#rprofession').val() ==  null || $('#rprofession').val() == ""  || $('#rprofession').val()=="undefined" ) 
				{			    
				    $('#rprofessionError').css('color','red');
				    $("#rprofessionError").text("Profession  cannot be blank.");
			    }
				if(!this.form.Users_terms.checked || $('#Users_terms').val() != 1 || $('#Users_terms').val()=="undefined" ) {
					$('#Users_termsError').css('color','red');
				    $("#Users_termsError").text("Please check the terms & conditions.");
				}else if(this.form.Users_terms.checked){$('#Users_termsError').text("");}

				return false;
				 $("#creteProfile-form").submit();
			}
			});









$('.widow_divorcee_details').hide();
function check_mstatus()
{
	var checked = $('input[name="maritalStatus"]:checked').val();

	if(checked!='Unmarried')
		$('.widow_divorcee_details').show();
	else
		$('.widow_divorcee_details').hide();
}

$(".profiles").addClass("active");
$(".createProfile").addClass("active");
</script>
</body>

</html>

