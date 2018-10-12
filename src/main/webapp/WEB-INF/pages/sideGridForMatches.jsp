<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="panel">
	<div class="panel-heading">
		<b style="font-weight: bold;">View Similar Profiles</b>
	</div>
	<div class="panel-body" style="padding: 10px 0px;">
		
		<c:forEach var="loc_prof" items="${similar_profiles}">
			<div class="panel-body" style="">
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
						<a href="#"  onclick="fullProfile('${loc_prof.id}')">${loc_prof.username}</a><br> 
						<a href="#">${loc_prof.age} Yrs, ${loc_prof.heightInches}</a><br>
						<a href="#">${loc_prof.currentCityName}</a><br>
                <img src="../nimages/heart-icon.png" />
				<c:if test="${loc_prof.expressedInterest==0}">
				  <span id="expIntFullProfile${loc_prof.id}"><a   href="#no" type="button"   onclick="expressInterest_SidegridFullProfile('${loc_prof.id}')"> Send Interest  </a></span>
				</c:if>
				<c:if test="${loc_prof.expressedInterest > 0}">
				<span><a type="button"  disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>
				</c:if>					</p>
				</div>
				<div class="col-md-1">
					<i class="fa fa-close"></i>
				</div>
			</div>
		</c:forEach>
		
		<center><a href="#" style="padding-left:15px;" class="btn btn-info" onclick="similarProfiles('${profileBean.gender}',${profileBean.religion},${profileBean.caste})";>View All </a>
</center>	</div>
</div>
<div class="clearfix"></div>
<div class="panel">
	<div class="panel-heading">
		<b style="font-weight: bold;">Recently Profiles</b>
	</div>
	<div class="panel-body" style="padding: 10px 0px;">
		
		<c:forEach var="rec_prof" items="${recently_profiles}">
			<div class="panel-body" style="">
				<div class="col-md-3 col-xs-3"
					style="padding-right: 0px; padding-left: 0px;">
					<c:if test="${not empty rec_prof.profileImage}">
						<img src="${catalina_base}/${rec_prof.profileImage}"
							style="cursor: pointer; border-radius: 50%; no-repeat; width: 45px; height: 45px; display: block; border: 1px solid #e1e1e1; border-radius: 50%; background-size: 75px 75px;">
					</c:if>
					<c:if test="${empty rec_prof.profileImage}">
						<img src="${baseurl}/img/default.png"
							style="cursor: pointer; border-radius: 50%; no-repeat; width: 45px; height: 45px; display: block; border: 1px solid #e1e1e1; border-radius: 50%; background-size: 75px 75px;">
					</c:if>

				</div>
				<div class="col-md-7 col-xs-7"
					style="padding-right: 0px; padding-left: 0px;">
					<p>
						<a href="#"  onclick="fullProfile('${rec_prof.id}')">${rec_prof.username}</a><br> 
						<a href="#">${rec_prof.age} Yrs, ${rec_prof.heightInches}</a><br>
						<a href="#">${rec_prof.currentCityName}</a><br>
                <img src="../nimages/heart-icon.png" />
				<c:if test="${rec_prof.expressedInterest==0}">
				  <span id="expIntFullProfile${rec_prof.id}"><a   href="#no" type="button"   onclick="expressInterest_SidegridFullProfile('${rec_prof.id}')"> Send Interest  </a></span>
				</c:if>
				<c:if test="${rec_prof.expressedInterest > 0}">
				<span><a type="button"  disabled="true" style="text-size-adjust:auto">Expressed Interest</a></span>
				</c:if>					</p>
				</div>
				<div class="col-md-1">
					<i class="fa fa-close"></i>
				</div>
			</div>
		</c:forEach>
		
				<center><a href="recentlyViewedProfiles" style="padding-left:15px;" class="btn btn-info">View All </a></center>	</div>
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