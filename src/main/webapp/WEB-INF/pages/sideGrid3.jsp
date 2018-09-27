

<div class="col-md-3 products-grid-right" style="padding-left:0px;">
			<p style="width:250px; font-weight:bold; padding-bottom:4px;color:#000;">Discover Matches</p>
					<div class="panel" style="width:250px;">
<div class="panel-body" style="padding:10px 5px;">
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    <div class="panel ">
        <div class="panel-heading" role="tab" id="headingOne">
             <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="collapsed">
          Preferred Location
        </a>
      </h4>

        </div>
	        <div id="collapseOne" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingOne" style="">
       
        <c:forEach var="loc_prof" items="${pref_loc_profiles}">
	            <div class="panel-body" style="padding:10px 0px;">
	            <div class="col-md-3 col-xs-3" style="padding-right:0px; padding-left:0px;">
	            <c:if test="${not empty loc_prof.profileImage}">
	            	<img src="${catalina_base}/${loc_prof.profileImage}" style="cursor: pointer;border-radius: 50%;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
	            </c:if>
	            <c:if test="${empty loc_prof.profileImage}">
	            	<img src="${baseurl}/img/default.png" style="cursor: pointer;border-radius: 50%;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
	            </c:if>
	            
				   </div><div class="col-md-7 col-xs-7" style="padding-right:0px; padding-left:0px;">   <p><a href="#"  onclick="fullProfile('${loc_prof.id}')">${loc_prof.username} </a><br>
				<a href="#">${loc_prof.age} Yrs, ${loc_prof.heightInches}</a><br>
				<a href="#">${loc_prof.currentCityName}</a><br>
				<c:if test="${loc_prof.expressedInterest==0}">
				  <span id="expInterest'+orderObj.id+'" name="expInterest[]"><a   href="#no" type="button"   onclick="expressInterest('${loc_prof.id}')"><img src="../nimages/heart-icon.png" />  Send Interest  </a></span>
				</c:if>
				<c:if test="${loc_prof.expressedInterest > 0}">
				<span><a type="button"  disabled="true" style="text-size-adjust:auto"><img src="../nimages/heart-icon.png" /> Expressed Interestd</a></span>
				</c:if>
				<!-- <a href="#"><img src="../nimages/heart-icon.png" /> Send Interest</a> --></p></div>
				<div class="col-md-1"><i class="fa fa-close"></i></div>
	        </div>
        </c:forEach>
        <center><a href="preferredLocation" class="btn btn-info">View All (${pref_loc_profiles_size})</a></center>
    </div></div><div class="clearfix"></div><hr>
    <div class="panel ">
        <div class="panel-heading" role="tab" id="headingTwo">
             <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
       Preferred Profession
        </a>
      </h4>

        </div>
        <c:forEach var="pref_prof" items="${pref_prof_profiles}">
	        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" style="height: 0px;">
	<div class="panel-body" style="padding:10px 0px;">
	            <div class="col-md-3" style="padding-right:0px; padding-left:0px;">
	            <c:if test="${not empty pref_prof.profileImage}">
	            	<img src="${catalina_base}/${pref_prof.profileImage}" style="cursor: pointer;border-radius: 50%;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
            	</c:if>
            	<c:if test="${empty pref_prof.profileImage}">
	            	<img src="${baseurl}/img/default.png" style="cursor: pointer;border-radius: 50%;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
	            </c:if>
	   </div><div class="col-md-7" style="padding-right:0px; padding-left:0px;">   <p><a href="#" onclick="fullProfile('${pref_prof.id}')">${pref_prof.username} </a><br>
	<a href="#">${pref_prof.age} Yrs, ${pref_prof.heightInches}</a><br>
	<a href="#">${pref_prof.currentCityName}</a><br>
	<c:if test="${pref_prof.expressedInterest==0}">
				  <span id="expInterest'+orderObj.id+'" name="expInterest[]"><a   href="#no" type="button" onclick="expressInterest('${pref_prof.id}')"> <img src="../nimages/heart-icon.png" /> Send Interest  </a></span>
				</c:if>
				<c:if test="${pref_prof.expressedInterest > 0}">
				<span><a type="button" disabled="true" style="text-size-adjust:auto"><img src="../nimages/heart-icon.png" /> Expressed Interestd</a></span>
				</c:if>
	<!-- <a href="#"><img src="../nimages/heart-icon.png"> Send Interest</a> --></p></div><!-- <div class="col-md-1"><i class="fa fa-close"></i></div> -->
	        </div>  <center><a href="preferredProfession" class="btn btn-info">View All (${pref_prof_profiles_size})</a> </center>      </div>
        </c:forEach>
        
    </div><div class="clearfix"></div>
    <div class="panel ">
        <div class="panel-heading" role="tab" id="headingThree">
             <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
      Preferred Education        </a>
      </h4>

        </div>
        <c:forEach var="pref_edu" items="${pref_edu_profiles}">
	        <div id="collapseThree" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingThree">
			<div class="panel-body" style="padding:10px 0px;">
	            <div class="col-md-3" style="padding-right:0px; padding-left:0px;">
	            <c:if test="${not empty pref_edu.profileImage}">
	            	<img src="${catalina_base}/${pref_edu.profileImage}" style="cursor: pointer;border-radius: 50%;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
	            </c:if>
	            <c:if test="${empty pref_edu.profileImage}">
	            	<img src="${baseurl}/img/default.png" style="cursor: pointer;border-radius: 50%;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
	            </c:if>
	   </div><div class="col-md-7" style="padding-right:0px; padding-left:0px;">   <p><a href="#" onclick="fullProfile('${pref_edu.id}')">${pref_edu.username} </a><br>
	<a href="#">${pref_edu.age} Yrs, ${pref_edu.heightInches}</a><br>
	<a href="#">${pref_edu.currentCityName}</a><br>
	<c:if test="${pref_edu.expressedInterest==0}">
				  <span id="expInterest'+orderObj.id+'" name="expInterest[]"><a   href="#no" type="button" onclick="expressInterest('${pref_edu.id}')"><img src="../nimages/heart-icon.png" />  Send Interest  </a></span>
				</c:if>
				<c:if test="${pref_edu.expressedInterest > 0}">
				<span><a type="button" disabled="true" style="text-size-adjust:auto"><img src="../nimages/heart-icon.png" /> Expressed Interestd</a></span>
				</c:if>
	<!-- <a href="#"><img src="../nimages/heart-icon.png"> Send Interest</a> --></p></div>
	<div class="col-md-1"><i class="fa fa-close"></i></div>
	        </div>  <center><a href="preferredEducation" class="btn btn-info">View All (${pref_edu_profiles_size})</a></center>      </div>
        </c:forEach>
       
    </div>
    
     
     
</div>
</div></div>

	<div class="panel " style="width: 250px;">
<div class="panel-heading"><b>Search</b></div>
        <div class="panel-body table-responsive">
            <!-- <h4> I am Looking for</h4>
            <select  style="margin-bottom:5px;" id="rPeople" class="custom-select col-md-12 form-control">
								<option value="FeMale" id="id1">Bride</option>
								<option value="Male" id="id2">Groom</option>
							</select> -->
							<form:form commandName="createProfile"  class="form-horizontal" id="quickSearchForm" name="quickSearchForm" role="form" method="post">
						<form:hidden path="id" />
							<h4>Aged  </h4>   
       <span>From </span> <form:select path="rAgeFrom"    class="for-control"  style="width:60px;">
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
									<option value="32">32</option>
									<option value="33">33</option>
									<option value="34">34</option>
									<option value="35">35</option>
									<option value="36">36</option>
									<option value="37">37</option>
									<option value="38">38</option>
									<option value="39">39</option>
									<option value="40">40</option>
									<option value="41">41</option>
									<option value="42">42</option>
									<option value="43">43</option>
									<option value="44">44</option>
									<option value="45">45</option>
									<option value="46">46</option>
									<option value="47">47</option>
									<option value="48">48</option>
									<option value="49">49</option>
									<option value="50">50</option>					
					</form:select>
					<span>To </span>
					<form:select path="rAgeTo"  class="formcontrol" style="width:60px;">
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
									<option value="32">32</option>
									<option value="33">33</option>
									<option value="34">34</option>
									<option value="35">35</option>
									<option value="36">36</option>
									<option value="37">37</option>
									<option value="38">38</option>
									<option value="39">39</option>
									<option value="40">40</option>
									<option value="41">41</option>
									<option value="42">42</option>
									<option value="43">43</option>
									<option value="44">44</option>
									<option value="45">45</option>
									<option value="46">46</option>
									<option value="47">47</option>
									<option value="48">48</option>
									<option value="49">49</option>
									<option value="50">50</option> 					
					</form:select>
					<h4> Religion </h4> 
          <form:select path="religion" id="religionId" onchange="getReliginCastAjaxSearch();" class=" form-control" >
<%-- 								<form:option value="">of Religion.... &nbsp;&nbsp;</form:option> --%>
								<form:options items="${religion}"></form:options>
							</form:select>
							
							<h4> Caste </h4>
					 <form:select path="rCaste" id="castId" class="custom-select col-md-12 form-control">
								<form:option value="">of Caste.... &nbsp;&nbsp;</form:option>
<%-- 								<form:options items="${cast}"></form:options> --%>
							</form:select>
							</form:form>
							<h4>&nbsp;</h4> <button type="button" id="submit12" class="btn btn-primary" onclick="searchResult();">Search</button>
							
        </div>
    </div>
				 
			</div>
			
			