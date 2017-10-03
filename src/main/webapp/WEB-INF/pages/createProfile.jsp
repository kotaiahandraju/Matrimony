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
								  		<form:input path="created_by" type="text" class="form-control" maxlength="255"/>						
								  		<div><form:errors path="created_by" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.executiveName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:input path="executiveName" type="text" class="form-control" maxlength="255"/>	
									
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
								  		<form:select path="cast"  class="form-control">
														<form:option value="">-- Choose Department Head --</form:option>
														<form:options items="${cast}"></form:options>
										</form:select>
								  		<div><form:errors path="cast" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.subCaste" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
									<form:input path="subCaste" type="text" class="form-control" maxlength="255"/>	
								  		<%-- <form:select path="subCaste" class="form-control" tabindex="2" onchange="classNameFilter()" required="true">
											<form:option value="" >-- Choose Board --</form:option>
										</form:select>
								  		<div><form:errors path="subCaste" cssClass="error" /></div> --%>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.surName" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="sname" type="text" class="form-control" maxlength="255"/>						
								  		<div><form:errors path="sname" cssClass="error" /></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.name" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="name" type="text" class="form-control" maxlength="255"/>						
								  		<div><form:errors path="name" cssClass="error" /></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.gender" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-4">
								  		<form:select path="gender" class="form-control" style="width:200px;" required="true">
											<form:option value="">-- Choose Gender --</form:option>
											<form:option value="Male">Male</form:option>
											<form:option value="Female">Female</form:option>
										</form:select>
								  		<div><form:errors path="gender" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.dob" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="dob" type="text" class="form-control" maxlength="255"/>						
								  		<div><form:errors path="dob" cssClass="error" /></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 col-xs-12 control-label required"><spring:message code="label.tob" text="default text" /></label>
									<div class="col-sm-8">
										<form:input path="tob" type="text" class="form-control" maxlength="255"/>						
								  		<div><form:errors path="tob" cssClass="error" /></div>
									</div>
									
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.pob" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-8">
										<form:input path="pob" type="text" class="form-control" maxlength="255"/>						
								  		<div><form:errors path="pob" cssClass="error" /></div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.height" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-4">
										<form:select path="height"  class="form-control">
														<form:option value="">-- Choose Department Head --</form:option>
														<form:options items="${height}"></form:options>
										</form:select>
								  		<%-- <form:select path="height" class="form-control" style="width:200px;" required="true">
											<form:option value="">-- Choose Height --</form:option>
										</form:select>
								  		<div><form:errors path="height" cssClass="error" /></div> --%>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.complexion" text="default text" /> <span style="color:red;">*</span></label>
									<div class="col-sm-4">
								  		<form:select path="complexion" class="form-control" style="width:200px;" required="true">
											<form:option value="">-- Choose Complexion --</form:option>
											<form:options items="${complexion}"></form:options>
										</form:select>
								  		<div><form:errors path="complexion" cssClass="error" /></div>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.raasi" text="default text" /></label>
									<div class="col-sm-4">
										<form:select path="raasi" class="form-control" style="width:200px;" required="true">
											<form:option value="">-- Choose raasi --</form:option>
											<form:options items="${raasi}"></form:options>
										</form:select>
									</div>
							  	</div>
							  	<div class="form-group">
									<label class="col-sm-4 control-label required"><spring:message code="label.star" text="default text" /></label>
									<div class="col-sm-4">
										<form:select path="star" class="form-control" style="width:200px;" required="true">
											<form:option value="">-- Choose raasi --</form:option>
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
										<form:input path="gotram" type="text" class="form-control" maxlength="255"/>	
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

