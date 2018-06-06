<%@ include file="userHeader.jsp"%>
<style>
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
/* add pendingrequest new */
</style>	


 





			<div class="col-md-9 products-grid-left">
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
    <div class="carousel-inner pendingre">
    		<c:set value="${0}" var="count" />
			<c:forEach items="${pending_reqs}" var="pend_req">
				<c:if test="${count == 0}">
					<div class="item active" id="pending_div${pend_req.requestId}">
				</c:if>
				<c:if test="${count != 0}">
					<div class="item" id="pending_div${pend_req.requestId}">
				</c:if>
			        <div class="col-md-2">
			        	<c:if test="${not empty pend_req.profileImage}">
			        		<img class="thumbnail img-responsive" src="${pend_req.profileImage}"/>
			        	</c:if>
			        	<c:if test="${empty pend_req.profileImage}">
			        		<img class="thumbnail img-responsive" src="img/default.png"/>
			        	</c:if>
			        </div>
			         <div class="col-md-7">
			      <p><b>
			      		<c:if test="${cacheGuest.roleId == '4'}">
			      			xxxxxxx
			      		</c:if> 
			      		<c:if test="${cacheGuest.roleId != '4'}">
			      			<c:out value="${pend_req.firstName}" />  <c:out value="${pend_req.lastName}" />
			      		</c:if> 
			      	</b>, <c:out value="${pend_req.age}" /> yrs, <c:out value="${pend_req.inches}" /><br>
			      	 <c:out value="${pend_req.casteName}" />, <c:out value="${pend_req.currentCountryName}" /><br>
			 			Do you like this profile?</p>
			       </div>

			       <div class="col-md-3"><span><i class="fa fa-check-circle" style="font-size:25px;color:green"></i> &nbsp; <i class="fa fa-times-circle-o" aria-hidden="true"  style="font-size:25px;color:red"></i>
			       </span></div>

			       <div class="col-md-2">
			       		<span>
			       			<a href="#" onclick="acceptRequest_pendingReq(${pend_req.requestId},'1')"><i class="fa fa-check-circle" style="font-size:25px;color:green"></i></a> &nbsp; <a href="#" onclick="acceptRequest_pendingReq(${pend_req.requestId},'0')"><i class="fa fa-times-circle-o" aria-hidden="true"  style="font-size:25px;color:red"></i></a>
			       		</span>
			       		
			       	</div>
			      </div>
			      <c:set value="${count+1}" var="count" />
			</c:forEach>
      <div class="item">
        <div class="col-md-2">
        <img class="thumbnail img-responsive" src="img/1050587.png"/>
        </div>
         <div class="col-md-8">
      <p><b>Jangili mownika</b>, 23 Yrs, 5 Ft 2 In<br>
Yadav, India<br>
She could be a good match. Do you like her profile</p>
       </div>
       <div class="col-md-2"><span><i class="fa fa-check-circle" style="font-size:25px;color:green"></i> &nbsp; <i class="fa fa-times-circle-o" aria-hidden="true"  style="font-size:25px;color:red"></i>
       </span></div></div>

    <!-- Left and right controls -->
    <a class="left carousel-control bgc" href="#myCarousel" data-slide="prev" >
      <span class="fa fa-chevron-left pleftc" > </span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control bgc" href="#myCarousel" data-slide="next" id="pending_next">
      <span class="fa fa-chevron-right prightc" ></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
	</c:if>
</div><div class="clearfix"></div><br>
				<div class="panel panel-default">
					<div class="panel-body">
						<c:if test="${profile_filled_status != '100'}">
							Complete the Remaining Profile
						</c:if>
						
						<div class="progress">
							<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: ${profile_filled_status}%;">
								<%= session.getAttribute("profile_filled_status") %>% Complete 
							</div>
						</div>
						<c:if test="${emailverify == '0'}">
						
						<p><span class="glyphicon glyphicon-envelope"></span> Verify your Email <a href="#no" onclick="verifyEmail()"><u>Verify Email Address</u></a></p>
						</c:if>
						
					</div>

				</div>
				<div class="panel panel-success">
					<div class="panel-heading">Preferred Profiles </div>
		            <form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
	             		<form:hidden path="id" />
	             			<div class="panel-body" id="matches" style="overflow-y:scroll; max-height: 350px">
	             		
							
							</div>
						</form:form>
				</div>
				<div id="pagination_div" style="font-size: 12px; margin-bottom:8px;">
					<div id="altLists"></div>
					<div id="table_footer"></div>
				</div>
				<div class="panel panel-success">
					<div class="panel-heading">New Matches</div>
		            <div class="panel-body"> 
					  <div class='row'>
					    <div class='col-md-12'>
					      <div class="carousel slide media-carousel" id="media">
					        <div class="carousel-inner" id="new_matches">
						    	
					    	</div>
					    	<a data-slide="prev" href="#media" class="left carousel-control"> <i style="margin-top:8px;" class="fa fa-chevron-left"></i></a>
        					<a data-slide="next" href="#media" class="right carousel-control"> <i  style="margin-top:8px;" class="fa fa-chevron-right"></i></a>
        					<br><div align="center"><a class="btn btn-primary" href="newMatches">View all</a></div>
					    </div>
					</div></div></div></div>
				</div>
				<% 
				UsersBean userSessionBean = (UsersBean)session.getAttribute("cacheGuest");
				 String packageId= userSessionBean.getPackageId();
				if(packageId == null){
					%>
					
					<div id="newmodal" class="modal fade">
    		<div class="modal-dialog">
        <div class="modal-content" style="margin-top:50px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title grademember">Upgrade Membership</h2>
            </div>
            <div class="modal-body newbody col-md-12">
				<div class="col-md-5"><img src="images/up.png" class="img-responsive"/></div>
				<div class="col-md-7">
				<p style="color:#b7f528;">Start Contracting Matches</p>
				<p><i class="fa fa-phone"></i> View Phone Numbers </p>
				<p> <i class="fa fa-comment"></i> Chat Instantly</p>
				 <div class="clearfix"></div>
				 <p><i  class="fa fa-envelope"></i> Send Personalized Images</p>
				 <p> &nbsp; &nbsp; &nbsp; Upto Rs.2000 off</p>
				 <p> &nbsp; &nbsp; &nbsp; On Classic Packages</p><br>
				 <span class="btn btn-warning" align="center" h><a href="memberShipPage" >Upgrade Now </a><i class="fa fa-chevron-right"></i></span>
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
<script src="js/ajax.js"></script>
<script src="js/jquery-asPaginator.js"></script>
<script src="js/jquery.watermark.js"></script>


<script type="text/javascript">

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
var allowed_limit = ${allowed_profiles_limit};
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
		var tblRow = '<div>No matches found.</div>';
		$(tblRow).appendTo("#matches"); 
		$("#pagination_div").prop("hidden",true);
	}
	$.each(listOrders,function(i, orderObj) 
	{
		paginationSetup(total_items_count);
		$("#altLists").asPaginator('enable');
		$("#pagination_div").removeAttr("hidden");
		displayTableFooter(1);
		serviceUnitArray[orderObj.id] = orderObj;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		/* else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
			});
		} */
		
			var login_user_role_id = ${cacheGuest.roleId};
			var firstname = '<img src="images/blurr.png"/>',lastname='';
			var ageStr = orderObj.age;
			var age = ageStr.split(".")[0];
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14)){ //means premium,premium_plus,aarna premium users
			
				firstname = orderObj.firstName;
				lastname = orderObj.lastName;
				//mobile_no__str = '<tr id="row'+orderObj.id+'"><td><button type="button" class="btn1 btn btn-info"  id="mobileBtn'+orderObj.id+'" onclick="displayMobileNum('+orderObj.id+',\'preferences\')">View Mobile Number</button></td></tr>';
				//more_details_str = '<tr><td><span><a href="#no" onclick="showMoreDetails(this)">read more...</a></span></td></tr>';
				//mobile_no__str = '<tr><td><span><a href="#no" onclick="viewMobileNumber('+orderObj.id+')">View Mobile Number</a></span></td></tr>';
			}
			var premiumMember = "";
			var memberRoleId = orderObj.role_id;
			if(memberRoleId!=null && memberRoleId!="" && (memberRoleId==6 || memberRoleId==11 ||
					memberRoleId==12 || memberRoleId==13 || memberRoleId==14)){
				premiumMember = "<span class='premium-member'>Premium Member</span>";
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
				mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
				
			}else{
				mobile_num_Str = '<span ><a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="displayMobileNum('+orderObj.id+')"> View Mobile No..</a></span>';
			}
			var tblRow = '<div class="row">'
				+ '<div class=" col-md-2 col-xs-2 preprofile" >'
	            + 	"<img src="+image+" class='watermark_text img-responsive thumbnail ' >"
	            + '</div>'
	            + '<div class="col-md-10 col-xs-10">'
	            + ' <p>'+firstname+'&nbsp;'+lastname+'|'+orderObj.username+'&nbsp;'+premiumMember+'&nbsp; '+age+' yrs,&nbsp; '+orderObj.religionName+', '+orderObj.casteName+','+orderObj.inches+' , '+orderObj.occupationName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'. </p> '
	            + ' <p> '+interestStr+'| <a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" id="sendMail'+orderObj.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a> | <a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="fullProfile('+orderObj.id+')"> Full Profile</a> '
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
			var firstname = '<img src="images/blurr.png"/>',lastname='';
			var ageStr = orderObj.age;
			var age = ageStr.split(".")[0];
			if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
					|| (login_user_role_id == 13) || (login_user_role_id == 14)){ //means premium,premium_plus,aarna premium users
			
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
			 item =     item + ' 	<div class="col-md-3 thumbnailgal">'
				         +' 		<div class="thumbnailmain">	<a class="thumbnail thumbimg" href="#no" style="margin: 0px 0px 0px 0px; width:100%; height:auto;"><img alt="" src="'+image+'" class="watermark_text"></a></div>'
				         +' 			<p align="center" class="ptransition" style="margin: 10px 0px 0px 0px;"><span  class="ptransition" href="#no" onclick="fullProfile('+orderObj.id+')" style="transition: 0; padding:5px; color:blue; border-radius:5px;">'+orderObj.username+'</span></p>'
				         +' 			<p align="center" style="margin: px 0px 0px -3px;">'+age+' yrs, '+orderObj.inches+'</p>'
				         + 			    interestStr
				         +'			</div>';
	
	
			        
		    if(count==4){
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
	    				$("#mobileTD"+profile_id).html('<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+profileObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>');
	    				allowed_limit = limit;
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
	    				allowed_limit = limit;
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
          return '<ul>{{first}}{{prev}}{{altLists}}{{next}}{{last}}</ul>';
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

function acceptRequest_pendingReq(requestId,flag){
	$("#pending_div"+requestId).remove();
	$("#pending_next").trigger("click");
	
	/* var roleId = ${cacheGuest.roleId};
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
		/*var membershipStatus = ${cacheGuest.membership_status};
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
	    				if(flag==1){
	    					alert("Request accepted successfully");
	    					$("#accept"+requestId).html('');
	    					$("#accept"+requestId).html("<a type='button' class='btn btn-success btn-sm' disabled='true'>Accepted</a>");
	    				}else{
	    					alert("Request rejected successfully");
	    					$("#accept"+requestId).html('');
	    					$("#accept"+requestId).html("<a type='button' class='btn btn-danger btn-sm' disabled='true' >Ignored</a>");
	    				}
	    			}else if("failed"==msg || "exception"==msg){
	    				alert("Some problem occured. Please try again.");
	    			}
	    		
	    		
				
			}); 
	} */
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
			$('#pager').append('<a data-img="' + dataVal + '"><img src=' + $('img', this).attr('src') + ' width=' + thumbWidth + '></a>');
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
</script>

<%@ include file="userFooter.jsp"%>
