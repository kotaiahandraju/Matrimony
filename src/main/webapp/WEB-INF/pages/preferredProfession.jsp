<%@ include file="userCommonHeader.jsp"%>

<div class="products">
	<div class="container" style="background: #FFF;">
	<div class="mid-grids"><br>
<div class="panel panel-success">
					<div class="panel-heading">Preferred Profession </div>
		            <form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
	             		<form:hidden path="id" />
	             			<div class="panel-body" id="matches" style="overflow-y:scroll;max-height:350px; min-height: 350px;">
<!-- 	             		<div class="row"><div class=" col-md-2 col-xs-2 preprofile"><img src="http://localhost:8080/NBD/img/260654.png" class="watermark_text img-responsive thumbnail "></div><div class="col-md-10 col-xs-10"> <p>Gopika&nbsp;C|AMTNL836781&nbsp;<span class="premium-member">Premium Member</span>&nbsp; 19 yrs,&nbsp; Hindu, Kamma,5'8 , Software Profession, Tenali, India. </p>  <p> <span id="expInterest260"><a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="expressInterest_dashboard_prof(260)">  Express Interest  </a></span>| <a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" id="sendMail260" onclick="displayMailPopup(260,'Gopika C')">Send Mail</a> | <a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="fullProfile(260)"> Full Profile</a>  | <span id="mobileTD260"><span><a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="displayMobileNum(260)"> View Mobile No..</a></span></span> | <span id="shortlistTD260"><a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="shortList_dashboard_prof(260)"> Shortlist</a></span></p> </div><div class="clearfix" style="border-bottom:1px solid #f1f11;margin-bottom:5px;"></div><hr></div> -->
							
							</div>
						</form:form>
				</div>
				<div id="pagination_div" style="font-size: 12px; margin-bottom:8px;">
					<div id="altLists"></div>
					<div id="table_footer"></div>
				
				</div>
				</div>
</div>
</div>
<script type="text/javascript">

var listOrders1 = ${pref_profession_profiles};
var allowed_limit = "${allowed_profiles_limit}";
displayMatches(listOrders1);

function displayMatches(listOrders) {
	$('#matches').html('');
	serviceUnitArray = {};
	if(listOrders=="" || listOrders==null){
		var tblRow = '<div>No matches found.</div>';
		$(tblRow).appendTo("#matches"); 
	}
	$.each(listOrders,function(i, orderObj) 
	{
		serviceUnitArray[orderObj.id] = orderObj;
		var image = null;
		image = orderObj.profileImage;
		if(image == "" || image == null || image == "undefined"){
			var genderStr = orderObj.gender;
			if(genderStr == "Female"){
				image = "${baseurl}/images/girl.jpg";
			}else if(genderStr == "Male"){
				image = "${baseurl}/images/boy.jpg";
			}
		}else{
			image = "${catalina_base}/"+image;
		}
		
		var login_user_role_id = ${cacheGuest.roleId};
		var firstname = '<img src="${baseurl}/images/blurr.png"/>',lastname='';
		if((login_user_role_id == 6) || (login_user_role_id == 11) || (login_user_role_id == 12)
				|| (login_user_role_id == 13) || (login_user_role_id == 14) || (login_user_role_id == 15) || (login_user_role_id == 16)){ //means premium,premium_plus,aarna premium users
			firstname = orderObj.firstName;
			lastname = orderObj.lastName;
		}
		var shortListedStr = '<span id="shortlistProf'+orderObj.id+'"><a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="shortList_dashboard_prof('+orderObj.id+')"> Shortlist</a></span>';
		if(orderObj.shortlisted == "1"){
			shortListedStr = "<span>Shortlisted</span>";
		}
		var expressed = orderObj.expressedInterest;
		var interestStr = "";
		if(expressed==0){
			interestStr = '<span id="expInterestProf'+orderObj.id+'"><a   href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="expressInterest_dashboard_prof('+orderObj.id+')">  Express Interest  </a></span>';
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
			mobile_num_Str = '<span style="background:url(user/images/mobile.gif) no-repeat left top;padding-left:13px;font:bold 14px/18px Arial;">&nbsp;+91-'+orderObj.mobile+'&nbsp;<font class="mediumtxt">(&nbsp;<img src="${baseurl}/user/images/tick.gif" alt="" title="" style="vertical-align:middle;" width="14" hspace="5" height="11"> <span style="color: green;font:14px/18px Arial;color:#4baa26;">Verified </span>)</font></span>';
			
		}else{
			mobile_num_Str = '<span ><a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="displayMobileNum('+orderObj.id+')"> View Mobile No..</a></span>';
		}
		var tblRow = '<div class="row">'
			+ '<div class=" col-md-2 col-xs-2 preprofile" >'
       + 	"<a href='#'  onclick='fullProfile("+orderObj.id+")'><img src='"+image+"' class='watermark_text img-responsive thumbnail ' ></a>"
            + '</div>'
            + '<div class="col-md-10 col-xs-10">'
            + ' <p>'+firstname+'&nbsp;'+lastname+','+orderObj.username+'&nbsp '+orderObj.age+' yrs,&nbsp; '+orderObj.religionName+', '+orderObj.castName+', '+orderObj.occupationName+', '+orderObj.currentCityName+', '+orderObj.currentCountryName+'. </p> '
            + ' <p> '+interestStr+'|  <a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" id="sendMail'+orderObj.id+'" onclick="displayMailPopup('+orderObj.id+',\''+orderObj.firstName+' '+orderObj.lastName+'\')">Send Mail</a> | <a href="#no" type="button" class="btn" style="padding:5px; color:blue; border-radius:5px;" onclick="fullProfile('+orderObj.id+')"> Full Profile</a> '
            + ' | <span id="mobileTD'+orderObj.id+'">'+mobile_num_Str+'</span> | '+shortListedStr+'</p> '
            + '</div>'
            + '<div class="clearfix" style="border-bottom:1px solid #f1f11;margin-bottom:5px;"></div>'
            + '<hr>'
          
            + '</div>';
      
		$(tblRow).appendTo("#matches"); 
	
});
}
function expressInterest_dashboard_prof(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	var profileObj = serviceUnitArray[profile_id];
	$("#expressModalName").html("");
	var expIntUserName=profileObj.firstName+" "+profileObj.lastName+""+"("+profileObj.username+")";
	$("#expressModalName").html(expIntUserName);
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
// 	    				alert("Interest request has been sent successfully");
								$("#profile_id").val(profile_id);
			    				$("#memberName").val(expIntUserName);
			    				$("#member_name_todisplay").html(" to "+profileObj.firstName+" "+profileObj.lastName);
			    				$("#sendMailexpressModal").attr("onclick","displayMailPopup("+profile_id+",'"+expIntUserName+"')");
								$('#expressModal').show();
			    				$('#expressModal').modal();
	    				$("#expInterestProf"+profile_id).html('Expressed Interest');
	    				$("#expInterestProf"+profile_id).prop("disabled",true);
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
function shortList_dashboard_prof(profileId){
	$("#id").val(profileId);
	var profileObj = serviceUnitArray[profileId];
	$("#shortListModalName").html("");
	var expIntUserName=profileObj.firstName+" "+profileObj.lastName+""+"("+profileObj.username+")";
	$("#shortListModalName").html(expIntUserName);
	var formData = new FormData();
	formData.append('profile_id',profileId);
	jQuery.fn.makeMultipartRequest('POST', 'shortList', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		var msg = jsonobj.message;
    		if(typeof msg != "undefined"){
    			if(msg=="success"){
    				$("#profile_id").val(profileId);
    				$("#memberName").val(expIntUserName);
    				$("#sendMailShortlistModal").attr("onclick","displayMailPopup("+profileId+",'"+expIntUserName+"')");
					$('#shortlistModal').show();
    				$('#shortlistModal').modal();
    				$("#shortlistProf"+profileId).html('Shortlisted');
    				//$("#shortlistTD"+profileId).removeAttr("href");
    				//$("#shortlistTD"+profileId).attr("disabled");
    			}else{
    				alert("Some problem occured. Please try again.");
    			}
    		}
    		
	});
}
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

</script>
<%@ include file="userFooter.jsp"%>