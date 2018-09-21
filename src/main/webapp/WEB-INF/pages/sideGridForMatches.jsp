<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="panel">
	<div class="panel-heading">
		<p style="font-weight: bold;">View Similar Profiles</p>
	</div>
	<div class="panel-body" style="padding: 10px 0px;">
		<!--  <div class="col-md-3 col-xs-3" style="padding-right:0px; padding-left:0px;">
            <img src="../nimages/preicon.jpg" style="cursor: pointer;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
   </div><div class="col-md-9 col-xs-9" style="padding-right:0px; padding-left:0px;">   <p><a href="#">T4135943 </a><br>
<a href="#">27 Yrs, 5 Ft 6 In</a><br>
<a href="#">Hyderabad</a><br>



        </div></div>
        <div class="panel-body" style="padding:10px 0px;">
            <div class="col-md-4 col-xs-4" style="padding-right:0px; padding-left:0px;">
            <img src="../nimages/p8.png" style="cursor: pointer;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
   </div><div class="col-md-8 col-xs-8" style="padding-right:0px; padding-left:0px;">   <p><a href="#">T4135943 </a><br>
<a href="#">27 Yrs, 5 Ft 6 In</a><br>
<a href="#">Hyderabad</a><br>



        </div></div>
        <div class="panel-body" style="padding:10px 0px;">
            <div class="col-md-4 col-xs-4" style="padding-right:0px; padding-left:0px;">
            <img src="../nimages/p4.png" style="cursor: pointer;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
   </div><div class="col-md-8 col-xs-8" style="padding-right:0px; padding-left:0px;">   <p><a href="#">T4135943 </a><br>
<a href="#">27 Yrs, 5 Ft 6 In</a><br>
<a href="#">Hyderabad</a><br>



        </div></div>
        </div>
         -->
		<c:forEach var="loc_prof" items="${similar_profiles}">
			<div class="panel-body" style="padding: 10px 0px;">
				<div class="col-md-3 col-xs-3"
					style="padding-right: 0px; padding-left: 0px;">
					<c:if test="${not empty loc_prof.profileImage}">
						<img src="${catalina_base}/${loc_prof.profileImage}"
							style="cursor: pointer; border-radius: 50%; no-repeat; width: 45px; height: 45px; display: block; border: 1px solid #e1e1e1; border-radius: 50%; background-size: 75px 75px;">
					</c:if>
					<c:if test="${empty loc_prof.profileImage}">
						<img src="${baseurl}/img/default.png"
							style="cursor: pointer; border-radius: 50%; no-repeat; width: 45px; height: 45px; display: block; border: 1px solid #e1e1e1; border-radius: 50%; background-size: 75px 75px;">
					</c:if>

				</div>
				<div class="col-md-7 col-xs-7"
					style="padding-right: 0px; padding-left: 0px;">
					<p>
						<a href="#" onclick="fullProfile('${loc_prof.id}')">${loc_prof.username}
						</a><br> <a href="#">${loc_prof.age} Yrs,
							${loc_prof.heightInches}</a><br> <a href="#">${loc_prof.currentCityName}</a><br>
						<a href="#"><img src="../nimages/heart-icon.png" /> Send
							Interest</a>
					</p>
				</div>
				<div class="col-md-1">
					<i class="fa fa-close"></i>
				</div>
			</div>
		</c:forEach>
		<br>
		<a href="#"; onclick="similarProfiles('${profileBean.gender}',${profileBean.religion},${profileBean.caste});">View All </a>
	</div>
</div>
<div class="clearfix"></div>
<div class="panel">
	<div class="panel-heading">
		<p style="font-weight: bold;">Recently Profiles</p>
	</div>
	<div class="panel-body" style="padding: 10px 0px;">
		<div class="col-md-4 col-xs-4"
			style="padding-right: 0px; padding-left: 0px;">
			<img src="../nimages/preicon.jpg"
				style="cursor: pointer; no-repeat; width: 45px; height: 45px; display: block; border: 1px solid #e1e1e1; border-radius: 50%; background-size: 75px 75px;">
		</div>
		<div class="col-md-8 col-xs-8"
			style="padding-right: 0px; padding-left: 0px;">
			<p>
				<a href="#">T4135943 </a><br> <a href="#">27 Yrs, 5 Ft 6 In</a><br>
				<a href="#">Hyderabad</a><br>
		</div>
	</div>
	<div class="panel-body" style="padding: 10px 0px;">
		<div class="col-md-4 col-xs-4"
			style="padding-right: 0px; padding-left: 0px;">
			<img src="../nimages/p8.png"
				style="cursor: pointer; no-repeat; width: 45px; height: 45px; display: block; border: 1px solid #e1e1e1; border-radius: 50%; background-size: 75px 75px;">
		</div>
		<div class="col-md-8 col-xs-8"
			style="padding-right: 0px; padding-left: 0px;">
			<p>
				<a href="#">T4135943 </a><br> <a href="#">27 Yrs, 5 Ft 6 In</a><br>
				<a href="#">Hyderabad</a><br>
		</div>
	</div>
	<div class="panel-body" style="padding: 10px 0px;">
		<div class="col-md-4 col-xs-4"
			style="padding-right: 0px; padding-left: 0px;">
			<img src="../nimages/p4.png"
				style="cursor: pointer; no-repeat; width: 45px; height: 45px; display: block; border: 1px solid #e1e1e1; border-radius: 50%; background-size: 75px 75px;">
		</div>
		<div class="col-md-8 col-xs-8"
			style="padding-right: 0px; padding-left: 0px;">
			<p>
				<a href="#">T4135943 </a><br> <a href="#">27 Yrs, 5 Ft 6 In</a><br>
				<a href="#">Hyderabad</a><br>
		</div>
	</div>
</div>

<script type="text/javascript">

function similarProfiles(gender,religion,caste_val) {
	
	$("#gender").val(gender);
	$("#religion").val(religion);
	$("#caste").val(caste_val);
	
	

	document.searchForm2.action = "similarProfiles";
		document.searchForm2.submit();
	
}


</script>