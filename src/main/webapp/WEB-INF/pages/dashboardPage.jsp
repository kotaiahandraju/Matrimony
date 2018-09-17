<%@ include file="userHeader.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
.mobilenum {
display: -webkit-inline-box;
}
.media-carousel {
margin-top:15px !important;}
@import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css");
.panel-title > a:before {
    float: right !important;
    font-family: FontAwesome;
    content:"\f068";
    padding-right: 5px;
    font-size: 13px;
    color: #777;
}
.panel-title > a.collapsed:before {
    float: right !important;
    content:"\f067";
}
.panel-title > a:hover, 
.panel-title > a:active, 
.panel-title > a:focus  {
    text-decoration:none;
}
.panel-title {

text-align:left !important;}
.carousel-inner > .active.left {
    left: 2%;
}
.carousel-inner > .active.right {
    right: 2%;
}
b, strong {
    font-weight: bold;
    color: #000;
}
.grademember {
background:#2da3de;
color:#fff;
padding:8px;
font-size:19px;
border-top-left-radius: 33px;
    border-top-right-radius: 33px;
}
#newmodal .modal-header .close {
    margin-top: -2px;
    margin: 10px;
    color: #fff;
    opacity: 1;
}
.newbody {
background:#2da3de;
color:#fff;
border-bottom-left-radius: 33px;
    border-bottom-right-radius: 33px;
}
#pending_count {
padding-bottom:5px;
}
</style>

		<style>
/* #slider {
  width: 500px;
  height: 300px;
  margin: 0 auto 10px;
  overflow: hidden;
  position: relative;
}
#slider ul {
  overflow: hidden;
  *zoom: 1;
}
#slider ul li {
  font-size: 1.5em;
  color: #fff;
  text-align: center;
  float: left;
  width: 560px;
  height: 300px;
  line-height: 300px;
}
#slider a {
  display: block;
  position: absolute;
  color: #fff;
  font-size: 2em;
  top: 50%;
  width: 30px;
  height: 30px;
  line-height: 30px;
  text-align: center;
  margin-top: -15px;
  text-decoration: none;
  background: #000;
}
#slider a#sliderNext {
  right: 0;
}
#slider a:hover {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=50);
  opacity: 0.5;
}

#pager {
  text-align: center;
}
#pager a {
  display: inline-block;
  vertical-align: middle;
  *vertical-align: auto;
  *zoom: 1;
  *display: inline;
  cursor: pointer;
  -moz-transition-property: opacity;
  -o-transition-property: opacity;
  -webkit-transition-property: opacity;
  transition-property: opacity;
  -moz-transition-duration: 0.2s;
  -o-transition-duration: 0.2s;
  -webkit-transition-duration: 0.2s;
  transition-duration: 0.2s;
  -moz-transition-timing-function: ease-in;
  -o-transition-timing-function: ease-in;
  -webkit-transition-timing-function: ease-in;
  transition-timing-function: ease-in;
}
#pager a:hover, #pager a.active {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=50);
  opacity: 0.5;
}
.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 50px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 50%;
  position: relative;
  transition: all 5s ease-in-out;
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family:  Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 0px;
  right: 10px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}
.popup .close:hover {
  color: #06D85F;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
} */
@media  (min-width: 320px) and (max-width:640px) {
.col-xs-2 {
    width: 16.66666667% !important;
    padding-right:0px !important;
}
.prightc {
margin:117px 0px 0px 13px !important;
color:green;
}
.pleftc {
margin:117px 98px 0px 0px !important;
color:green;
}

}
 .modal-backdrop {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 1040;
    background-color: #000;
}
.modal-backdrop.in {
  
    opacity: .5;
}   
.modal
{
background: none !important;
}

/* add pendingrequest new */
.pendingre {
padding:20px;
border:1px solid #dedede;
background:#fff;
}
.pleftc {
margin:51px 98px 0px 0px;
color:green;
}
.prightc {
margin:51px 0px 0px 98px;
color:green;
}
.bgc {
background:none !important;
}
.neewpendingr {
padding-left:0px;
padding-right:0px;
}
.pendingre p{
font-size:13px;
color:#000;
}
.preprofile {
    width: 120px;
    height: 43px;
    overflow: hidden;
    padding-top: 3px;
    padding-bottom: 3px;
    margin-bottom: 4px;
}
@media only screen and (max-width: 640px) and (min-width: 320px) {
.pendingre {
    padding: 20px;
    border: 1px solid #dedede;
    background: #fff;
    margin-top: 8px;
}
.preprofile {
    width: 68px;
    height: 43px;
    overflow: hidden;
    padding-top: 3px;
    padding-bottom: 3px;
    margin-bottom: 4px;
}
}
/* add pendingrequest new */
.products-grid-left {
padding-left:0px;
padding-right:0px;
}
</style>	


 





			<div class="col-md-9 products-grid-left">
			<div class="col-md-8">                                                                           
			<div class="col-md-12 neewpendingr">
			<div id="myCarousel" data-interval="false" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
   <!--  <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
 -->
    <!-- Wrapper for slides -->
    <c:if test="${not empty pending_reqs}">
    <div id="pending_req_div"  class="carousel-inner pendingre">
    		<span id="pending_count"><span id="pend_req_count_span">${pending_reqs_count}</span> requests pending</span><br>
    		<c:set value="${0}" var="count" />
    		<c:set value="${0}" var="counter" scope="page" />
    		<c:set value="" var="reqId" scope="page" />
			<c:forEach items="${pending_reqs}" var="pend_req">
				<c:if test="${count == 0}">
					<div class="item active" style="padding-top:5px;" id="pending_div${pend_req.requestId}">
				</c:if>
				<c:if test="${count != 0}">
					<div class="item" id="pending_div${pend_req.requestId}">
				</c:if>
					<c:set value="${pend_req.requestId}" var="reqId" />
			        <div class="col-md-2">
			        	<c:if test="${not empty pend_req.profileImage}">
			        		<img class="thumbnail img-responsive" src="${catalina_base}/${pend_req.profileImage}"/>
			        	</c:if>
			        	<c:if test="${empty pend_req.profileImage}">
			        		<img class="thumbnail img-responsive" src="${baseurl}/img/default.png"/>
			        	</c:if>
			        </div>
			         <div class="col-md-7">
			      <p><b>
			      		<c:if test="${cacheGuest.roleId == '4'}">
			      			<a href="inboxAction?tab_type=inbox&list_type=pending_requests">xxxxxxx</a>
			      		</c:if> 
			      		<c:if test="${cacheGuest.roleId != '4'}">
			      			<a href="inboxAction?tab_type=inbox&list_type=pending_requests"><c:out value="${pend_req.firstName}" />  <c:out value="${pend_req.lastName}" /></a>
			      		</c:if> 
			      	</b>,<br> 
			      	<c:out value="${pend_req.age}" /> yrs, <c:out value="${pend_req.inches}" /><br>
			      	 <c:out value="${pend_req.casteName}" />, <c:out value="${pend_req.currentCountryName}" /> 
			      	 <br>
			 			Do you like this profile?</p>
			       </div>

			       <div class="col-md-3"><span>
			       		<c:if test="${not empty pend_req.activity_content}">
			       			<a href="#" onclick="acceptMessage_pendingReq(${pend_req.requestId},'1')"><i class="fa fa-check-circle" style="font-size:25px;color:green"></i></a> &nbsp; <a href="#" onclick="acceptMessage_pendingReq(${pend_req.requestId},'0')"><i class="fa fa-times-circle-o" aria-hidden="true"  style="font-size:25px;color:red"></i></a>
			       		</c:if>
			       		<c:if test="${empty pend_req.activity_content}">
				       		<a href="#" onclick="acceptRequest_pendingReq(${pend_req.requestId},'1')"><i class="fa fa-check-circle" style="font-size:25px;color:green"></i></a> &nbsp; <a href="#" onclick="acceptRequest_pendingReq(${pend_req.requestId},'0')"><i class="fa fa-times-circle-o" aria-hidden="true"  style="font-size:25px;color:red"></i></a>
			       		</c:if>
			       </span></div>

			       <%-- <div class="col-md-2">
			       		<span>
			       			<a href="#" onclick="acceptRequest_pendingReq(${pend_req.requestId},'1')"><i class="fa fa-check-circle" style="font-size:25px;color:green"></i></a> &nbsp; <a href="#" onclick="acceptRequest_pendingReq(${pend_req.requestId},'0')"><i class="fa fa-times-circle-o" aria-hidden="true"  style="font-size:25px;color:red"></i></a>
			       		</span>
			       		
			       	</div> --%>
			      </div>
			      <c:set value="${count+1}" var="count" />
			</c:forEach>
      

    <!-- Left and right controls -->
    <a class="left carousel-control bgc active" href="#myCarousel" data-slide="prev" id="pending_prev" onclick="prevBtnClicked();">
      <span class="fa fa-chevron-left pleftc" > </span>
      <span class="sr-only">Previous</span>
    </a>
    <c:if test="${count>1}">
	    <a class="right carousel-control bgc" href="#myCarousel" data-slide="next" id="pending_next" onclick="nextBtnClicked();">
	      <span class="fa fa-chevron-right prightc" ></span>
	      <span class="sr-only">Next</span>
	    </a>
    </c:if>
  </div>
	</c:if>
</div><div class="clearfix"></div><br>
				<div class="panel panel-default col-md-12">
					<div class="panel-body">
						<c:if test="${profile_filled_status != '100'}">
							Complete the Remaining Profile
						</c:if>
						
						<div class="progress" style="width:300px;">
							<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${profile_filled_status}%;">
								<%= session.getAttribute("profile_filled_status") %>% Complete 
							</div>
						</div>
						<c:if test="${emailverify == '0'}">
						
						<p><span class="glyphicon glyphicon-envelope"></span> Verify your Email <a href="#no" onclick="verifyEmail()"><u>Verify Email Address</u></a></p>
						</c:if>
						
					</div>

				</div><div class="clearfix"></div>
				<div class="panel" id="preferred_div">
					<div class="panel-heading"><b>Preferred Profiles</b> </div>
		            <form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
	             		<form:hidden path="id" />
	             			<div class="panel-body" id="matches" style="overflow-y:scroll; max-height: 350px">
	             		
							
							</div>
							<div class=""panel-footer" id="preferred_viewall">	<div align="center" style="padding:5px;"><a class="btn btn-primary" href="allPreferredProfiles">View all</a></div></div>
						</form:form>
				</div>
				<!-- <div id="pagination_div" style="font-size: 12px; margin-bottom:8px;">
					<div id="altLists"></div>
					<div id="table_footer"></div>
				
				</div> -->
				<div class="panel col-md-12">
					<div class="panel-heading"><b>New Matches</b></div>
		            <div class="panel-body"> 
					  <div class='row'>
					    <div class='col-md-12' style="padding-left:0px; padding-right:0px;">
					      <div class="carousel slide media-carousel" id="media">
					        <div class="carousel-inner" id="new_matches">
						    	
					    	</div>
					    	<a data-slide="prev" href="#media" class="left carousel-control"> <i style="margin-top:8px;" class="fa fa-chevron-left"></i></a>
        					<a data-slide="next" href="#media" class="right carousel-control"> <i  style="margin-top:8px;" class="fa fa-chevron-right"></i></a>
        					<br><div align="center"><a class="btn btn-primary" href="newMatches">View all</a></div>
					    </div>
					</div></div></div></div>
					</div></div><div class="col-md-2"><div class="products-grid-right">
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
        <c:forEach var="loc_prof" items="${pref_loc_profiles}">
	        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne" style="">
	            <div class="panel-body" style="padding:10px 0px;">
	            <div class="col-md-3 col-xs-3" style="padding-right:0px; padding-left:0px;">
	            <c:if test="${not empty cacheGuest.profileImage}">
	            	<img src="${catalina_base}/${loc_prof.profileImage}" style="cursor: pointer;border-radius: 50%;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
	            </c:if>
	            <c:if test="${empty cacheGuest.profileImage}">
	            	<img src="${baseurl}/img/default.png" style="cursor: pointer;border-radius: 50%;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
	            </c:if>
	            
				   </div><div class="col-md-7 col-xs-7" style="padding-right:0px; padding-left:0px;">   <p><a href="#">${loc_prof.username} </a><br>
				<a href="#">${loc_prof.age} Yrs, ${loc_prof.heightInches}</a><br>
				<a href="#">${loc_prof.currentCityName}</a><br>
				<a href="#"><img src="../nimages/heart-icon.png" /> Send Interest</a></p></div>
				<div class="col-md-1"><i class="fa fa-close"></i></div>
	        </div></div>
        </c:forEach>
        <br><a href="preferredLocation">View All (${pref_loc_profiles_size})</a>
    </div><div class="clearfix"></div><hr>
    <div class="panel ">
        <div class="panel-heading" role="tab" id="headingTwo">
             <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
       Preferred Profession
        </a>
      </h4>

        </div>
        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" style="height: 0px;">
<div class="panel-body" style="padding:10px 0px;">
            <div class="col-md-3" style="padding-right:0px; padding-left:0px;">
            <img src="../nimages/preicon.jpg" style="cursor: pointer;border-radius: 50%;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
   </div><div class="col-md-7" style="padding-right:0px; padding-left:0px;">   <p><a href="#">T4135943 </a><br>
<a href="#">27 Yrs, 5 Ft 6 In</a><br>
<a href="#">Hyderabad</a><br>
<a href="#"><img src="..//nimages/heart-icon.png">Send Interest</a></p></div><div class="col-md-1"><i class="fa fa-close"></i></div>
        </div>        </div>
    </div>
    <div class="panel ">
        <div class="panel-heading" role="tab" id="headingThree">
             <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
      Preferred Education        </a>
      </h4>

        </div>
        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
<div class="panel-body" style="padding:10px 0px;">
            <div class="col-md-3" style="padding-right:0px; padding-left:0px;">
            <img src="../nimages/preicon.jpg" style="cursor: pointer;border-radius: 50%;no-repeat;width: 45px;height: 45px;display: block;border: 1px solid #e1e1e1;border-radius: 50%;background-size: 75px 75px;">
   </div><div class="col-md-7" style="padding-right:0px; padding-left:0px;">   <p><a href="#">T4135943 </a><br>
<a href="#">27 Yrs, 5 Ft 6 In</a><br>
<a href="#">Hyderabad</a><br>
<a href="#"><img src="../nimages/heart-icon.png">Send Interest</a></p></div>
<div class="col-md-1"><i class="fa fa-close"></i></div>
        </div>        </div>
        
       
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
    
<div class="panel " style="width: 250px;">
<div class="panel-heading"><b>Add Photos Now</b></div>
        <div class="panel-body table-responsive">
            <div class="col-md-3" style="width: 232px; display: -webkit-box;">
         <a href="myPhotos" style="display: -webkit-inline-box;"><img src="http://localhost:8080/NBD/user/images/add-photo-edit-avatar.png" width="40" style="margin: 0px 0px 0px -25px;">
    <p style="margin-left: 10px;">Photos are the first things members look for in a profile.</p></a></div>
        </div>
    </div>
    <div class="panel " style="width: 250px;">
    <img src="../nimages/couple.jpg" class="img-responsive"/>
    </div>
</div></div><div class="clearfix"></div>
				<% 
				UsersBean userSessionBean = (UsersBean)session.getAttribute("cacheGuest");
				 String packageId= userSessionBean.getPackageId();
				 String msg_flag = (String)session.getAttribute("upgrade_msg_flag");
				if(packageId==null && msg_flag.equals("1")){
					%>
					
					<div id="newmodal" class="modal fade">
    		<div class="modal-dialog">
        <div class="modal-content" style="margin-top:50px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title grademember">Upgrade Membership</h2>
            </div>
            <div class="modal-body newbody col-md-12">
				<div class="col-md-4"><img src="${baseurl}/images/up.png" class="img-responsive"/></div>
				<div class="col-md-8">
				<p style="color:#b7f528;">Start Contacting Matches</p>
				<p><img style="color:#fff;" src="../images/icon1.png"/> Get Unlimited Profiles</p>
				<!-- <p> <i class="fa fa-comment"></i> Chat Instantly</p> -->
				 <div class="clearfix"></div>
				 <p><img src="../images/icon2.png"/> Send Unlimited Personalized Messages</p>
				 <p><img src="../images/profiletag.png"/> Valid Till Marriage</p>
<!-- 				 <p style="padding:3px; font-size:15px;"> &nbsp; &nbsp; &nbsp;  <span class="fa fa-inr"></span> 999</p> -->
				<!--  <p> &nbsp; &nbsp; &nbsp; On Classic Packages</p><br> --><br>
				 <span class="btn btn-warning" align="center" h><a href="memberShipPage"  style="color:#fff;">Upgrade Now </a><i class="fa fa-chevron-right"></i></span>
				<span class="pull-right"><img style="margin-top:-15px; height:65px;" src="../images/999.png"/></span>
				 </div>
            </div>
        </div>
    		</div>
				</div>
				<script type="text/javascript">

  $(document).ready(function() {
	  
	  $('#newmodal').modal();
 });
  </script>
				<% }
				session.setAttribute("upgrade_msg_flag","0");
				%>


           
            <!-- <div class="col-md-3">
           <div class="panel panel-success">
					<div class="panel-heading">Search</div>
		            <div class="panel-body"> 
		            
		            <form action="">
      <input type="text" class="search0" placeholder="Search.." name="search">
      <button type="submit" class="searchh"><i class="fa fa-search"></i></button>
    </form>
            
           </div>
            </div>
        
            
            </div> -->
			
			
	<!-- Modal Starts here-->
	

<!-- //footer -->
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<script src="${baseurl}/js/ajax.js"></script>
<script src="${baseurl}/js/jquery-asPaginator.js"></script>
<script src="${baseurl}/js/jquery.watermark.js"></script>


<script type="text/javascript">


function getReliginCastAjaxSearch() {
   	var religionId = $("#religionId").val();
   		var formData = new FormData();
   		formData.append("religionId",religionId);
   	$.fn.makeMultipartRequest('POST', '../castesBasedOnReligion', false,
   			formData, false, 'text', function(data){
   		var jsonobj = $.parseJSON(data);
   		var alldata = jsonobj.allOrders1;
   		/* if(alldata == "" ){
   		$("#rCaste").select2('val','');
   	} */
   		var optionsForClass = "";
   		optionsForClass = $("#castId").empty();
   		optionsForClass.append(new Option("of Caste....", ""));
   		$.each(alldata, function(i, tests) {
   			var id=tests.id;
   			var casteName=tests.name;
   			optionsForClass.append(new Option(casteName, id));
   		});
   		
   	});
   }

function searchResult(){
	var ageFrom = $("#rAgeFrom").val();
	var ageTo = $("#rAgeTo").val();
	var maritalStatus = $("#rMaritalStatus").val();
	var religion = $("#rReligion").val();
	var caste = $("#rCaste").val();
	if(ageFrom > ageTo){
		alert("Sorry, Invalid Age range");
		return false;
	}
	else{
		document.quickSearchForm.action = "SearchResults";
	    document.quickSearchForm.submit();            
	    return true;
	}
	
}
/* $(window).load(function() {
	$('#myModal').modal();
});
  */
  $(document).ready(function() {
	  $('#media').carousel({
	    //pause: true,
	    interval: false
	  });
 });
  $(function(){
		 //add text water mark;	
	  addWaterMark();
  });
  function addWaterMark(){
	  $('.watermark_text').watermark({
		  text: 'aarnamatrimony.com',
		  textWidth: 700,
		  textSize: 70,
		  textColor: 'white',
		  gravity: 'w',
		   opacity: 0.8,
		   //margin: 0,
		   outputWidth: 'auto',
		   outputHeight: 'auto'
		 });
  }
var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = "${allowed_profiles_limit}";
if(allowed_limit=="unlimited"){
	allowed_limit = "1";
	allowed_limit = parseInt(allowed_limit);
}
var listOrders1 = ${allOrders1};
var newMatches = ${new_matches};

//if (listOrders1 != "") {
	displayMatches(listOrders1);
	displayNewMatches(newMatches);
//}
function displayMatches(listOrders) {
	$('#matches').html('');
	serviceUnitArray = {};
	if(listOrders==""){
		//var tblRow = '<div>No matches found.</div>';
		//$(tblRow).appendTo("#matches"); 
		$("#preferred_div").prop("hidden",true);
		$("#pagination_div").prop("hidden",true);
		$("#preferred_viewall").prop("hidden",true);
	}
	$.each(listOrders,function(i, orderObj) 
	{
		$("#preferred_div").removeAttr("hidden");
		$("#preferred_viewall").removeAttr("hidden");
		paginationSetup(total_items_count);
		$("#altLists").asPaginator('enable');
		$("#pagination_div").removeAttr("hidden");
		displayTableFooter(1);
		serviceUnitArray[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			image = "${catalina_base}/img/default.png";
		}
		/* else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
			});
		} */
		
			var login_user_role_id = ${cacheGuest.roleId};
			var firstname = '<img src="${baseurl}/images/blurr.png"/>',lastname='';
			var ageStr = orderObj.age;
			var age = ageStr.split(".")[0];
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14) || (login_user_role_id == 15)){ //means premium,premium_plus,aarna premium users
			
				firstname = orderObj.firstName;
				lastname = orderObj.lastName;
				//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				//more_details_str = '<tr><td><span><a href="#no" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#no" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
			}
			var premiumMember = "";
			var memberRoleId = orderObj.role_id;
			if(memberRoleId!=null && memberRoleId!="" && (typeof memberRoleId != "undefined")){
				if(memberRoleId==12){
					 premiumMember = "<span class='premium-member'>Classic Member</span>";
				}
				if(memberRoleId==13){
					 premiumMember = "<span class='premium-member'>Classic Advantage Member</span>";
				}
				if(memberRoleId==6){
					 premiumMember = "<span class='premium-member'>Premium Member</span>";
				}
				if(memberRoleId==11){
					 premiumMember = "<span class='premium-member'>Premium Plus Member</span>";
				}
				if(memberRoleId==14){
					 premiumMember = "<span class='premium-member'>Aarna Family Member</span>";
				}
				if(memberRoleId==15){
					 premiumMember = "<span class='premium-member'>Premium Member</span>";
				}
			}
			var shortListedStr = '<span id="shortlistTD'+orderObj.id+'"><a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="shortList_dashboard('+orderObj.id+')"> Shortlist</a></span>';
			if(orderObj.short_listed == "1"){
				shortListedStr = "<span>Shortlisted</span>";
			}
			var expressed = orderObj.expressedInterest;
			var interestStr = "";
			if(expressed==0){
				interestStr = '<span id="expInterest'+orderObj.id+'"><a   href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="expressInterest_dashboard('+orderObj.id+')">  Express Interest  </a></span>';
			}else if(expressed>0){
				interestStr = '<span>Expressed Interest</span>';
			}
			var message_sent_status = orderObj.message_sent_status;
			var messageStr = "";
			if(message_sent_status>0){
				messageStr = 'You sent an email to this member.';
			}
			var mobNumViewed = orderObj.mobileNumViewed;
			var mobile_num_Str = "";
			if(mobNumViewed=="1" || expressed=="1" || message_sent_status=="1"){
				mobile_num_Str = '<span class="mobilenum" style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
				
			}else{
				mobile_num_Str = '<span ><a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="displayMobileNum('+orderObj.id+')"> View Mobile No..</a></span>';
			}
			var tblRow = '<div class="row">'
				+ '<div class=" col-md-3 col-xs-3 preprofile" >'
	            + 	"<img src='${catalina_base}/"+image+"' class='watermark_text img-responsive thumbnail ' >"
	            + '</div>'
	            + '<div class="col-md-9 col-xs-9">'
	            + ' <p>'+firstname+'&nbsp;'+lastname+'|'+orderObj.username+'&nbsp;'+premiumMember+'&nbsp; '+age+' yrs,&nbsp; '+orderObj.religionName+', '+orderObj.casteName+','+orderObj.inches+' , '+orderObj.occupationName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'. </p> '
	            + ' <p> '+interestStr+'| <a href="#no" type="button" class="btn" style="padding:; color:blue; border-radius:5px;" id="sendMail'+orderObj.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a> | <a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="fullProfile('+orderObj.id+')"> Full Profile</a> '
	            + ' | <span id="mobileTD'+orderObj.id+'">'+mobile_num_Str+'</span> | '+shortListedStr+'</p> '
	            
	            + '</div>'
	            + '<div class="clearfix" style="border-bottom:1px solid #f1f11;margin-bottom:5px;"></div>'
	            + '<hr>'
	          
	            + '</div>';
	        /* var login_user_role_id = ${cacheGuest.roleId};
	        if(login_user_role_id==4){ // means free user
	        	$("#mobileBtn"+orderObj.id).prop("disabled",true);
	        } */
			$(tblRow).appendTo("#matches"); 
		
	});
}

function displayNewMatches(listOrders) {
	$('#new_matches').html('');
	serviceUnitArray2 = {};
	if(listOrders==""){
		var tblRow = '<div>No matches found.</div>';
		$(tblRow).appendTo("#new_matches"); 
		$("#pagination_div").prop("hidden",true);
	}
	var count = 1;
	var rowStr = '';
	var	itemStart = '<div class="item"><div class="row"> ';
	var	activeItem = '<div class="item active"><div class="row"> ';
	var	itemEnd = '</div></div>';
	var len = listOrders.length;
	if(9<len){
		len = 9;
	}
	$.each(listOrders,function(i, orderObj) 
			{
				/* paginationSetup(total_items_count);
				$("#altLists").asPaginator('enable');
				$("#pagination_div").removeAttr("hidden");
				displayTableFooter(1); */
		serviceUnitArray2[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		console.log(image);
		/* else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
			});
		} */
		
			var login_user_role_id = ${cacheGuest.roleId};
			var firstname = '<img src="${baseurl}/images/blurr.png"/>',lastname='';
			var ageStr = orderObj.age;
			var age = ageStr.split(".")[0];
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14) || (login_user_role_id == 15)){ //means premium,premium_plus,aarna premium users
			
				firstname = orderObj.firstName;
				lastname = orderObj.lastName;
				//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				//more_details_str = '<tr><td><span><a href="#no" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#no" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
			}
			
			var item = '';
			 if(count==1){
				if(i==0){
					item = activeItem;
				}else{
					item = itemStart ;
				} 
			} 
			 var expressed = orderObj.expressedInterest;
			var interestStr = "";
			if(expressed==0){
				interestStr = '<p  align="center" style="margin: 11px 0px 10px 0px;" id="expInterest'+orderObj.id+'"><a  href="#no" type="button" class="btn btn-warning  btn-sm"  onclick="expressInterest_dashboardnewmatches('+orderObj.id+')">Send Interest</a></p>';
			}else if(expressed>0){
				interestStr = '<p align="center" style="margin: 11px 0px 10px 0px;"><a   type="button" disabled="true"  class="btn btn-warning btn-sm "  >Request Sent</a></p>';
			}
			 item =     item + ' 	<div class="col-md-4 thumbnailgal">'
				         +' 		<div class="thumbnailmain">	<a class="thumbnail thumbimg" href="#no" style="margin: 0px 0px 0px 0px; width:100%; height:auto;"><img alt="" src="${catalina_base}/'+image+'" class="watermark_text"></a></div>'
				         +' 			<p align="center" class="ptransition" style="margin: 10px 0px 0px 0px;"><span  class="ptransition" href="#no" onclick="fullProfile('+orderObj.id+')" style="transition: 0; padding:5px; color:blue; border-radius:5px;">'+orderObj.username+'</span></p>'
				         +' 			<p align="center" style="margin: px 0px 0px -3px;">'+age+' yrs, '+orderObj.inches+'</p>'
				         + 			    interestStr
				         +'			</div>';
	
	
			        
		    if(count==3){
			 count = 1;
			 //item = item + itemEnd;
			 //rowStr = rowStr + item;
			 rowStr = rowStr + item + itemEnd ;
			$(rowStr).appendTo("#new_matches");
			rowStr = '';
		 }else{
			 count++;
			 rowStr = rowStr + item; 
		 }  
		 if(i==(len-1)){
			 return;
		 }
	});
	//if(len>12){
		//display viewall link
		//var view_all_link = '<a href="newMatches">View all</a>';
		//$(view_all_link).appendTo("#new_matches");
	//}
	 /* if(count<=3){
		rowStr = rowStr + itemEnd ;
		$(rowStr).appendTo("#new_matches");
	}  */ 
	
}
	
	
function expressInterest_dashboard(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		var membershipStatus = ${cacheGuest.membership_status};
		if(membershipStatus!="1"){
			alert("Your membership validity period is over. Renew your membership plan and get more profiles");
			return false;
		} 
		if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		}
		var profileObj = serviceUnitArray[profile_id];

		var formData = new FormData();
		formData.append('profile_id',profile_id);
		jQuery.fn.makeMultipartRequest('POST', 'expressInterestTo', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var limit = jsonobj.allowed_limit;
	    		var msg = jsonobj.message;
	    		var profiles = jsonobj.allProfiles;
	    		//if(typeof msg != "undefined" ){
	    			if("success"==msg){
	    				alert("Interest request has been sent successfully");
	    				$("#expInterest"+profile_id).html('Expressed Interest');
	    				$("#expInterest"+profile_id).prop("disabled",true);
	    				$("#mobileTD"+profile_id).html('<span style="background:url(${baseurl}/user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+profileObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>');
	    				if(typeof limit != "undefined"){
	    					if(limit=="unlimited"){
	    						allowed_limit = "1";
	    						allowed_limit = parseInt(allowed_limit);
	    					}else{
	    						allowed_limit = limit;
	    					}
	    				}
	    				
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Interest request is not successful. Please try again.");
	    			}
	    		//}
	    		/* if(profiles==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(profiles.length);
	    			displayMatches(profiles);
	    		} */
	    		/* var filtered_list = jsonobj.filtered_profiles;
	    		$('#countId').html('');
	    		if(filtered_list==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(filtered_list.length);
	    			displayMatches(filtered_list);
	    		} */
				
			});
	}
}

function expressInterest_dashboardnewmatches(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		var membershipStatus = ${cacheGuest.membership_status};
		if(membershipStatus!="1"){
			alert("Your membership validity period is over. Renew your membership plan and get more profiles");
			return false;
		}
		if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		}
		var profileObj = serviceUnitArray[profile_id];

		var formData = new FormData();
		formData.append('profile_id',profile_id);
		jQuery.fn.makeMultipartRequest('POST', 'expressInterestTo', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var limit = jsonobj.allowed_limit;
	    		var msg = jsonobj.message;
	    		var profiles = jsonobj.allProfiles;
	    		//if(typeof msg != "undefined" ){
	    			if("success"==msg){
	    				alert("Interest request has been sent successfully");
	    				$("#expInterest"+profile_id).html('<a   type="button" disabled="true"  class="btn btn-warning "  >Request Sent</a>');
	    				$("#expInterest"+profile_id).prop("disabled",true);
	    				if(typeof limit != "undefined"){
	    					if(limit=="unlimited"){
	    						allowed_limit = "1";
	    						allowed_limit = parseInt(allowed_limit);
	    					}else{
	    						allowed_limit = limit;
	    					}
	    				}
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Interest request is not successful. Please try again.");
	    			}
	    		//}
	    		/* if(profiles==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(profiles.length);
	    			displayMatches(profiles);
	    		} */
	    		/* var filtered_list = jsonobj.filtered_profiles;
	    		$('#countId').html('');
	    		if(filtered_list==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(filtered_list.length);
	    			displayMatches(filtered_list);
	    		} */
				
			});
	}
}
function shortList_dashboard(profileId){
	$("#id").val(profileId);
	var profileObj = serviceUnitArray[profileId];
	var formData = new FormData();
	formData.append('profile_id',profileId);
	jQuery.fn.makeMultipartRequest('POST', 'shortList', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var msg = jsonobj.message;
    		if(typeof msg != "undefined"){
    			if(msg=="success"){
    				$("#shortlistTD"+profileId).html('Shortlisted');
    				//$("#shortlistTD"+profileId).removeAttr("href");
    				//$("#shortlistTD"+profileId).attr("disabled");
    			}else{
    				alert("Some problem occured. Please try again.");
    			}
    		}
    		
	});
}

/* function displayMobileNum(profileId,listType){
	 var profileObj = serviceUnitArray[profileId];
	var formData = new FormData();
	formData.append('profile_id',profileId);
	formData.append('list_type',listType);
	jQuery.fn.makeMultipartRequest('POST', 'viewedMobileNumber', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var msg = jsonobj.message;
    		if(typeof msg != "undefined"){
    			if(msg=="success"){
    				$("#row"+profileId).html('<td>'+profileObj.mobile+'</td>');
    			}else{
    				alert("Some problem occured. Please try again.");
    			}
    		}
    		
	}); 
	
} */




	
	


function fullProfile(profile_id){
	/* var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
	}else{
		document.searchForm2.action = "fullProfile"
	} */
	$("#id").val(profile_id);
	document.searchForm2.action = "fullProfile"
    document.searchForm2.target = "_blank";    // Open in a new window
    document.searchForm2.submit();             // Submit the page
    return true;
	
}
function displayTableFooter(page){
	var from_val = ((parseInt(page)-1)*page_size)+1;
	var to_val = parseInt(page)*page_size;
	if(to_val > total_items_count){
		to_val = total_items_count;
	}
	if(from_val>to_val){
		from_val = to_val;
	}
	$("#table_footer").html("Showing "+from_val+" to "+to_val+" of "+total_items_count+" records");
}
function paginationSetup(total_items_count) {
	$('#altLists').asPaginator(total_items_count, {
        currentPage: 1,
        visibleNum: {
          0: 5,
          480: 3,
          960: 5
        },
        tpl: function() {
          return '<ul>{{first}}{{prev}}{{altLists}}{{next}}{{last}}</ul> ' ;
        },
        components: {
          first: true,
          prev: true,
          next: true,
          last: true,
          altLists: true
        },
        onChange: function(page) {
           
      	 var formData = new FormData();
      	formData.append("page_no",page);
      	formData.append("request_from","dashboard");
  		$.fn.makeMultipartRequest('POST', 'displayPage', false,
  				formData, false, 'text', function(data){
  			var jsonobj = $.parseJSON(data);
  			var results = jsonobj.results;
  				if(results==""){
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#matches').html('');
	    			$(str).appendTo("#matches");
	    			$("#table_footer").prop("hidden",true);
	    			$("#altLists").prop("hidden",true);
	    		}else{
	    			paginationSetup(total_items_count);
	    			$("#altLists").asPaginator('enable');
	    			displayMatches(results);
	    			displayTableFooter(page);
	    			addWaterMark();
	    		}
  			
  		});
          
        }
      });
}


function acceptMessage_pendingReq(requestId,flag){
	
	
	 var roleId = ${cacheGuest.roleId};
	$("#id").val(requestId);
	 if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		 /* if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		}  */ 
		var membershipStatus = ${cacheGuest.membership_status};
		if(membershipStatus!="1"){
			alert("Your membership validity period is over. Renew your membership plan and get more profiles");
			return false;
		}
		var formData = new FormData();
	
		formData.append("requestId",requestId);
		formData.append("accept_flag",flag);
		
		
		
		 jQuery.fn.makeMultipartRequest('POST', 'acceptMessage', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var msg = jsonobj.message;
	    		
	    			if("success"==msg){
	    				//var pend_count = parseInt($("#pend_req_count_span").html());
	    				total_item_count = total_item_count-1;
	    				if(flag==1){
	    					alert("Message Accepted.");
	    					$("#pending_div"+requestId).remove();
	    					//pend_count = pend_count-1;
	    					
	    					
	    					
	    				}else{
	    					alert("Message Rejected.");
	    					$("#pending_div"+requestId).remove();
	    					//$("#pending_next").trigger("click");
	    				}
	    				if(total_item_count==0){
	    					$("#myCarousel").remove();
   					}else{
   						$("#pend_req_count_span").html(total_item_count);
   						if(item_count>total_item_count){
   							item_count = total_item_count;
   							$("#pending_prev").trigger("click");
   						}else{
   							$("#pending_next").trigger("click");
   						}
	    					
   					}
	    				/* var req_count = jsonobj.req_count;
	    				if(req_count=="0"){
	    					$("#pending_req_div").remove();
	    				}else{
	    					$("#pending_count").html('');
		    				$("#pending_count").html(req_count+" requests pending.");
	    				} */
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Some problem occured. Please try again.");
	    			}
	    		
	    		
				
			}); 
	} 
}

function acceptRequest_pendingReq(requestId,flag){
	
	
	 var roleId = ${cacheGuest.roleId};
	$("#id").val(requestId);
	 if(roleId==4){
		document.searchForm2.action = "memberShipPage"
		document.searchForm2.submit();
		return true;
	}else{
		 /* if(allowed_limit<=0){
			alert("Exceeded allowed profiles limit. Renew your membership plan and get more profiles");
			return false;
		}  */ 
		var membershipStatus = ${cacheGuest.membership_status};
		if(membershipStatus!="1"){
			alert("Your membership validity period is over. Renew your membership plan and get more profiles");
			return false;
		}
		var formData = new FormData();
	
		formData.append("requestId",requestId);
		formData.append("accept_flag",flag);
		
		
		
		 jQuery.fn.makeMultipartRequest('POST', 'acceptRequest', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var msg = jsonobj.message;
	    		
	    			if("success"==msg){
	    				//var pend_count = parseInt($("#pend_req_count_span").html());
	    				total_item_count = total_item_count-1;
	    				if(flag==1){
	    					alert("Request Accepted.");
	    					$("#pending_div"+requestId).remove();
	    					//pend_count = pend_count-1;
	    					
	    					
	    					
	    				}else{
	    					alert("Request Rejected.");
	    					$("#pending_div"+requestId).remove();
	    					//$("#pending_next").trigger("click");
	    				}
	    				if(total_item_count==0){
	    					$("#myCarousel").remove();
    					}else{
    						$("#pend_req_count_span").html(total_item_count);
    						if(item_count>total_item_count){
    							item_count = total_item_count;
    							$("#pending_prev").trigger("click");
    						}else{
    							$("#pending_next").trigger("click");
    						}
	    					
    					}
	    				/* var req_count = jsonobj.req_count;
	    				if(req_count=="0"){
	    					$("#pending_req_div").remove();
	    				}else{
	    					$("#pending_count").html('');
		    				$("#pending_count").html(req_count+" requests pending.");
	    				} */
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Some problem occured. Please try again.");
	    			}
	    		
	    		
				
			}); 
	} 
}
/* function getNewMatches(){
	document.searchForm2.action = "newMatches";
    document.searchForm2.submit();            
    return true;
} */

function verifyEmail(){
	 var formData = new FormData();
  
		$.fn.makeMultipartRequest('POST', 'verifyEmail', false,	formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			alert(jsonobj.msg);
			
		});
}


	 
$(".dashboard").addClass("active");
</script>
<script>
$(function(){
	var slider = $('#slider');
	var sliderWrap = $('#slider ul');
	var sliderImg = $('#slider ul li');
	var prevBtm = $('#sliderPrev');
	var nextBtm = $('#sliderNext');
	var length = sliderImg.length;
	var width = sliderImg.width();
	var thumbWidth = width/length;

	sliderWrap.width(width*(length+2));

	//Set up
	slider.after('<div id="' + 'pager' + '"></div>');
	var dataVal = 1;
	sliderImg.each(
		function(){
			$(this).attr('data-img',dataVal);
			$('#pager').append('<a data-img="' + dataVal + '"><img src="${baseurl}/' + $('img', this).attr('src') + '"  width="' + thumbWidth + '"></a>');
		dataVal++;
	});
	
	//Copy 2 images and put them in the front and at the end
	$('#slider ul li:first-child').clone().appendTo('#slider ul');
	$('#slider ul li:nth-child(' + length + ')').clone().prependTo('#slider ul');

	sliderWrap.css('margin-left', - width);
	$('#slider ul li:nth-child(2)').addClass('active');

	var imgPos = pagerPos = $('#slider ul li.active').attr('data-img');
	$('#pager a:nth-child(' +pagerPos+ ')').addClass('active');


	//Click on Pager  
	$('#pager a').on('click', function() {
		pagerPos = $(this).attr('data-img');
		$('#pager a.active').removeClass('active');
		$(this).addClass('active');

		if (pagerPos > imgPos) {
			var movePx = width * (pagerPos - imgPos);
			moveNext(movePx);
		}

		if (pagerPos < imgPos) {
			var movePx = width * (imgPos - pagerPos);
			movePrev(movePx);
		}
		return false;
	});

	//Click on Buttons
	nextBtm.on('click', function(){
		moveNext(width);
		return false;
	});

	prevBtm.on('click', function(){
		movePrev(width);
		return false;
	});

	//Function for pager active motion
	function pagerActive() {
		pagerPos = imgPos;
		$('#pager a.active').removeClass('active');
		$('#pager a[data-img="' + pagerPos + '"]').addClass('active');
	}

	//Function for moveNext Button
	function moveNext(moveWidth) {
		sliderWrap.animate({
    		'margin-left': '-=' + moveWidth
  			}, 500, function() {
  				if (imgPos==length) {
  					imgPos=1;
  					sliderWrap.css('margin-left', - width);
  				}
  				else if (pagerPos > imgPos) {
  					imgPos = pagerPos;
  				} 
  				else {
  					imgPos++;
  				}
  				pagerActive();
  		});
	}

	//Function for movePrev Button
	function movePrev(moveWidth) {
		sliderWrap.animate({
    		'margin-left': '+=' + moveWidth
  			}, 500, function() {
  				if (imgPos==1) {
  					imgPos=length;
  					sliderWrap.css('margin-left', -(width*length));
  				}
  				else if (pagerPos < imgPos) {
  					imgPos = pagerPos;
  				} 
  				else {
  					imgPos--;
  				}
  				pagerActive();
  		});
	}

}); 
var item_count = 1;
var total_item_count = ${pending_reqs_count};
function nextBtnClicked(){
	item_count = item_count +1;
	$("#pending_next").addClass('active');
	$("#pending_prev").addClass('active');
	if(total_item_count>1){
		if(item_count==1){
			$("#pending_next").removeClass('active');
		}else if(item_count==total_item_count){
			$("#pending_prev").removeClass('active');
		}else{
			$("#pending_next").removeClass('active');
			$("#pending_prev").removeClass('active');
		}
	}
}

function prevBtnClicked(){
	item_count = item_count-1;
	/* if(item_count==1){
		$("#pending_next").removeClass('active');
		if(total_item_count==1){
			$("#pending_prev").addClass('active');
		}else{
			$("#pending_prev").removeClass('active');
		}
		
		//$("#pending_div13").addClass('active');
	} */
	$("#pending_next").addClass('active');
	$("#pending_prev").addClass('active');
	if(total_item_count>1){
		if(item_count==1){
			$("#pending_next").removeClass('active');
		}else if(item_count==total_item_count){
			$("#pending_prev").removeClass('active');
		}else{
			$("#pending_next").removeClass('active');
			$("#pending_prev").removeClass('active');
		}
	}
}

</script>
<script>

</script>
<%@ include file="userFooter.jsp"%>
