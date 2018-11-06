<%@ include file="userCommonHeader.jsp"%>
<!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="${baseurl}/engine1/style.css" />
<%-- <script type="text/javascript" src="${baseurl}/engine1/jquery.js"></script> --%>
<!-- End WOWSlider.com HEAD section -->
<style>
.cha {
min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    }
    .modal{
    background: rgba(0, 0, 0, 0.3) !important;
		height: auto;
		padding: 10px 10px;
		border-radius: 5px;
		-webkit-box-shadow: 3px 4px 8px rgba(0, 0, 0, .21);
		-moz-box-shadow: 3px 4px 8px rgba(0, 0, 0, .21);
		box-shadow: 3px 4px 8px rgba(0, 0, 0, .21);
		border: solid 3px rgba(220, 220, 220, .37);}
</style>
<div class="products">
<img src="../nimages/help.jpg" class="container img-responsive" />
<div class="container" style="background: white; padding-top: 25px; padding-left:0px; padding-right:0px;">
	<div class="container-fluid">
		<div class="col-md-8" style="padding-left:0px;">
		<div class="panel ">
			<div class="panel-heading"><b><h5>Help</h5></b></div>
			<div class="panel-body" style="min-height: 350px;">

				<p align="justify">Aarna Matrimony is eager to help you find your partner at the
				earliest. Our Customer Service team will be pleased to assist you
				anytime you have a query. You can contact our Customer Service team
				in one of the following ways.</p></br>
				
				
				
				<div class="col-md-6">
				
				<b>Our Office :</b><br>Door No 58-2-3/1,<br>
Bagaiah Street,<br>
Opposite Tanusri Hospital,<br> 
Pantakalava Road,<Br>
Benzcircle Vijayawada.<br> +91 8466999991 <br>Email:
				<a href="" style="color:blue;">info@aarnamatrimony.com</a>
</div>


<br>
	<div class="col-md-6">
<img  src="../nimages/secure.png" class="img-responsive newimg"/></div>






</div></div>
</div>
<div class="col-md-4 cha"><h5>Leave Message</h5>
         <form:form commandName="createProfile" action="#" method="post" class="login-form" style="min-height: 335px;">
			<div class="clearfix" style="padding-bottom: 8px;"></div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user"></i></span> <form:input
						type="text" class="form-control validate notAllowFirstSpace"
						path="leaveMsgUserName" placeholder="Name"></form:input>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span> <form:input
						type="email" class="form-control validate " 
						path="leaveMsgMail" placeholder="eMail"></form:input> 
				</div>
						 <span class="hasError" id="emailError1" style="color: red;"></span>

						</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span> <form:input
						type="text" class="form-control validate numbersOnly"
						 path="leaveMsgMobile" maxlength="10" placeholder="Mobile"></form:input>
				</div>

						</div>

			<div class="form-group">
				<form:textarea path="leaveMsgText" 
					placeholder="Enter few words about you"
					class="form-control validate notAllowFirstSpace" rows="2"></form:textarea>
				<span id="errorMsg" style="color: red"></span>
				<div></div>
				<div class="clearfix" style="padding-bottom: 8px;"></div>

				<div class="form-group">
					<button  type="submit" id="submit2"
						class="btn btn-primary pull-right" >Submit</button>
				</div>
				<div class="clearfix" style="padding-bottom: 3px;"></div>
					</form:form>

<div class="clearfix" style="padding-bottom:3px;"></div>
		

			
		</div></div><div class="clearfix"></div>
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#pop">Open Modal</button>
<div class="modal fade" id="pop" role="dialog">
    <div class="modal-dialog">
    <div class="modal-content" style="padding:10px;border:none;">
        <div class="modal-header" style="background:none;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          
        </div> 
        <div class="modal-body">
<!-- Start WOWSlider.com BODY section -->
<div id="wowslider-container1">
<div class="ws_images"><ul>
		<li><img src="${baseurl}/data1/images/package.jpg" alt="package" title="package" id="wows1_0"/></li>
		<li><img src="${baseurl}/data1/images/aadhar_card_copy.jpg" alt="aadhar card copy" title="aadhar card copy" id="wows1_1"/></li>
		<li><img src="${baseurl}/data1/images/blue_strip.jpg" alt="blue strip" title="blue strip" id="wows1_2"/></li>
		<li><img src="${baseurl}/data1/images/tenali_m.jpg" alt="tenali m" title="tenali m" id="wows1_3"/></li>
		<li><img src="${baseurl}/data1/images/tenali_m1.jpg" alt="tenali m1" title="tenali m1" id="wows1_4"/></li>
		<li><a href="#"><img src="${baseurl}/data1/images/tenali.jpg" alt="css image gallery" title="TENALI" id="wows1_5"/></a></li>
		<li><img src="${baseurl}/data1/images/pan_card.jpg" alt="pan card" title="pan card" id="wows1_6"/></li>
	</ul></div>
	<div class="ws_thumbs">
<div>
		<a href="#" title="package"><img src="${baseurl}/data1/tooltips/package.jpg" alt="" /></a>
		<a href="#" title="aadhar card copy"><img src="${baseurl}/data1/tooltips/aadhar_card_copy.jpg" alt="" /></a>
		<a href="#" title="blue strip"><img src="${baseurl}/data1/tooltips/blue_strip.jpg" alt="" /></a>
		<a href="#" title="tenali m"><img src="${baseurl}/data1/tooltips/tenali_m.jpg" alt="" /></a>
		<a href="#" title="tenali m1"><img src="${baseurl}/data1/tooltips/tenali_m1.jpg" alt="" /></a>
		<a href="#" title="TENALI"><img src="${baseurl}/data1/tooltips/tenali.jpg" alt="" /></a>
		<a href="#" title="pan card"><img src="${baseurl}/data1/tooltips/pan_card.jpg" alt="" /></a>
	</div>
</div>
<div class="ws_script" style="position:absolute;left:-99%"><a href="">html5 slideshow</a></div>
<div class="ws_shadow"></div>
</div>	</div></div></div></div></div></div>
<script type="text/javascript" src="${baseurl}/engine1/wowslider.js"></script>
<script type="text/javascript" src="${baseurl}/engine1/script.js"></script>
<!-- End WOWSlider.com BODY section -->

<<script type="text/javascript">

var leaveMsgMail = $('#leaveMsgMail').val();
	var expr = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|in|yahoo|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$/;
 $('#leaveMsgMail').blur(function() {
var leaveMsgMaill = $('#leaveMsgMail').val();
if(leaveMsgMaill == "" || !leaveMsgMaill.match(expr)){
	$("#leaveMsgMail").css("border-color","#e73d4a");
	$("#leaveMsgMail").attr("title","Email-ID");
	$('#leaveMsgMail').css('color','red');
	$('#emailError1').html("Enter Valid eMail Id");
	return false;
event.preventDefault();
}
else{
	$('#emailError1').html("");
}
 });



var idArray = $.makeArray($('.validate').map(function() {
	return this.id;
}));
$('#submit2').click(function(event) {
	validation = true;
	$.each(idArray, function(i, val) {
		var value = $("#" + idArray[i]).val();
		var placeholder = $("#" + idArray[i]).attr('placeholder');
		if (value == null || value == "" || value == "undefined") {
			
			 $("#" + idArray[i] ).attr("placeholder", placeholder);
			 $("#" + idArray[i] ).css('border-color','#e73d4a');
			    $("#" + idArray[i] ).css('color','#e73d4a');
			    $("#" + idArray[i] ).addClass('your-class');
//			$("#" + idArray[i] + "Error").text("Please " + placeholder);
			validation = false;
		}
	});
		if(validation){
			LeaveMsgSubmit();
			$("#submit2").attr("disabled",true);
		}else {
			event.preventDefault();
			return false;
		}
		
});

function LeaveMsgSubmit(){
	 var expr = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|org|net|in|yahoo|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$/;
		var leaveMsgUserName = $("#leaveMsgUserName").val();
		var leaveMsgMail = $("#leaveMsgMail").val();
		var leaveMsgMobile = $("#leaveMsgMobile").val();
		var leaveMsgText = $("#leaveMsgText").val();
		if(leaveMsgMail == "" || !leaveMsgMail.match(expr)){
//			alert("Please Enter Valid Email");
	   	$("#leaveMsgMail").css("border-color","#e73d4a");
	   	$("#leaveMsgMail").attr("title","Email-ID");
	   	$('#leaveMsgMail').css('color','red');
	   	$('#emailError1').html("Enter Valid eMail Id");
//	    	$('#email').focus();
	   	return false;
		event.preventDefault();
		}
		else{
			$('#emailError1').html("");
		}
		
		var formData = new FormData();
		formData.append("leaveMsgUserName",leaveMsgUserName);
		formData.append("leaveMsgMail",leaveMsgMail);
		formData.append("leaveMsgMobile",leaveMsgMobile);
		formData.append("leaveMsgText",leaveMsgText);
		
		$.fn.makeMultipartRequest('POST', 'LeaveMsgSubmit', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
				alert("successfully Sent Message");
				$('#leaveMsgUserName').val("");
				$('#leaveMsgMail').val("");
				$('#leaveMsgMobile').val("");
				$('#leaveMsgText').val("");
				$("#submit2").attr("disabled",false);
			
		});
}


$('.notAllowFirstSpace').on('keydown', function(e) {
    if (e.which === 32 &&  e.target.selectionStart === 0) {
      return false;
    }  
  });
</script>





				<%@ include file="userFooter.jsp"%>