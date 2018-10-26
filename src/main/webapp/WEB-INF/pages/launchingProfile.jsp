\<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<style>
 .error {
        color: red; font-weight: bold;
    }
</style>
<script type="text/javascript">
$( document ).ready(function() {
    $("#editProfile").hide();
});
</script>
<link href="${baseurl }/css/datepicker1.css" rel="stylesheet" type="text/css" />
<script src="${baseurl }/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<!-- 	<script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.1/themes/black-tie/jquery-ui.css"> -->
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.js"></script> -->
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<div id="main">
<div class="container-fluid">
	<div class="page-header">
		<div class="pull-left">
			<h1>Premium Plus Profiles </h1> 
		</div>
	</div>
	<div class="breadcrumbs">
		<ul>
			<li>
				<i class="fa fa-edit"></i>
				<a href="javascript:void(0)" style="color: blue;text-decoration: none;">Profiles </a>
				<i class="fa fa-angle-right"></i>&nbsp;
			</li>
			<li>
				&nbsp;<i class="fa fa-file"></i>
				<span style="color: #999;cursor: auto;">Premium Plus  Profiles</span>
			</li>
		</ul>
		
	</div>
	<div class="col-lg-8">
		<div>
			<div class="portlet" id="yw0">
				<div class="portlet-content w3-animate-zoom">
					<!-- Body Type Form Starts Here-->
					<%-- <form:form modelAttribute="casteForm" class="form-horizontal" role="form" id="branch-form" action="addCaste" method="post">								
						<div class="form-group">
							<div class="col-sm-12">
								<div class="errorMessage" id="Branch_invalid_em_" >
									<c:if test="${not empty msg}">
										<div class="alert alert-success fadeIn animated">${msg}</div>
									</c:if>
								</div>
								<form:hidden path="id"/>
							</div>
					  	</div>
						<div class="form-group">
							<label class="col-sm-4 control-label required"><spring:message code="label.casteName" text="default text" /> <span style="color:red;">*</span></label>
							<div class="col-sm-8">
						  		<form:input path="name" type="text" class="form-control" maxlength="255"/>						
						  		<div><form:errors path="name" cssClass="error" /></div>										
							</div>
					  	</div>
				  		<div class="form-group">
							<div class="col-sm-8 col-sm-offset-4"><input class="btn btn btn-primary" type="submit" name="yt0" value="Add"></div>
					  	</div>
					</form:form> --%>
					<!-- Body Type Form Ends Here-->
				</div>
			</div>
		</div>
	</div>


<div id="dial1"></div>

<div class="row" id="allProfilesId">
	<div class="col-sm-12">
		<div class="box">
			<div class="box-title">
				<h3>
					<i class="fa fa-table"></i>
					Premium Plus  Profiles List
				</h3>
			</div>
			<div class="box-content nopadding table-responsive w3-animate-zoom" id="tableId">
				<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,text,text,null">
					<thead><tr><th>UserName</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Mobile</th><th>Age</th><th>Caste</th><th>Package</th>
						<th></th>
					</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</div>
</div>

<script src="${baseurl }/js/common.js"></script>			
<script type="text/javascript">
/* var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-38620714-4']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script');
ga.type = 'text/javascript';
ga.async = true;
ga.src = ('https:' == document.k.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0];
s.parentNode.insertBefore(ga, s);
})();
 */
 var listOrders1 = ${allOrders1};
	if (listOrders1 != "") {
		displayTable(listOrders1);
	}
 function displayTable(listOrders) {
		$('#tableId').html('');
		var tableHead = '<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,text,text,null">'
			+ '<thead><tr><th>created</th><th>UserName</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Mobile</th><th>Age</th><th>Caste</th><th>Package</th><th></th></tr></thead><tbody></tbody></table>';
		$('#tableId').html(tableHead);
		serviceUnitArray = {};
		$.each(listOrders,function(i, orderObj) {
			var viewProfile = "<a data-toggle='tooltip' title='View' onclick='viewProfileNew("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-eye'></i></a>"
			var uploadPhotos = "";
			var moveToHidden = "";
			var editProfile = "";
			var sendMail = "";
			var inactive = "";
// 			var compareProfiles = "";
			var deleteProfile = "";
// 			var payment = "";
			var resetPassword = "";
			if (role_id == 1){
			var uploadPhotos = "<a data-toggle='tooltip' title='Upload Photos' onclick='uploadPhotos("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-photo'></i></a>"
			var moveToHidden = "<a data-toggle='tooltip' title='Move To Hidden' onclick='moveToHidden("+ orderObj.id+ ",\"premium_plus\")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-eye-slash'></i></a>"
			var editProfile = "<a data-toggle='tooltip' title='Edit' onclick='editProfile("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-pencil'></i></a>"
			var sendMail = "<a data-toggle='tooltip' title='Mail' onclick='sendMail("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-envelope'></i></a>"
			var inactive = "<a data-toggle='tooltip' title='Inactive' onclick='profileStatusChange("+ orderObj.id+ ",0)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-remove'></i></a>"
// 			var compareProfiles = "<a data-toggle='tooltip' title='Compare Profiles' onclick='compareProfiles("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-exchange'></i></a>"
			var deleteProfile = "<a data-toggle='tooltip' title='Delete' onclick='profileStatusChange("+ orderObj.id+ ",2)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-trash'></i></a>"
// 			var payment = "<a data-toggle='tooltip' title='Payment' onclick='payment("+ orderObj.id+ ",0)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-usd'></i></a>"
			var resetPassword = "<a data-toggle='tooltip' title='Reset Password' onclick='resetPassword("+ orderObj.id+ ",0)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-repeat'></i></a>"
			}
			/* var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>"
							var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>"
							var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>" */
							serviceUnitArray[orderObj.id] = orderObj;
							if(orderObj.firstName !=null){
							var tblRow = "<tr >"
								+ "<td title='"+orderObj.created_time+"'>" + orderObj.created_time + "</td>"
								+ "<td title='"+orderObj.username+"'>" + orderObj.username + "</td>"
								+ "<td title='"+orderObj.firstName+"'>" + orderObj.firstName + "</td>"
								+ "<td title='"+orderObj.lastName+"'>" + orderObj.lastName + "</td>"
								+ "<td title='"+orderObj.email+"'>" + orderObj.email + "</td>"
								+ "<td title='"+orderObj.mobile+"'>" + orderObj.mobile + "</td>"
								+ "<td title='"+orderObj.age+"'>" + orderObj.age + "</td>"
								+ "<td title='"+orderObj.casteName+"'>" + orderObj.casteName + "</td>"
								+ "<td title='"+orderObj.planPackage+"'>" + orderObj.planPackage + "</td>"
									+ "<td style='text-align: center;white-space: nowrap;'>" + viewProfile + "&nbsp;&nbsp;" + uploadPhotos + "&nbsp;&nbsp;" 
									+		moveToHidden + "&nbsp;&nbsp;" + editProfile + "&nbsp;&nbsp;" + sendMail + "&nbsp;&nbsp;" 
									+		inactive  + "&nbsp;&nbsp;" + deleteProfile + "&nbsp;&nbsp;"
									+		resetPassword
									+ "</td>"  
									+ "</tr >";
							$(tblRow).appendTo("#tableId table tbody");
							}
						});
		if(isCheck=="Yes"){
			$('.dataTable').DataTable({
				 dom: 'lBfrtip',
				 title: 'Premium Plus Profiles',
				 /* buttons: [
				            'copy', 'csv', 'excel', 'pdf','print'
				        ]	 */
				        buttons: [
						            {
						                extend: 'excelHtml5',
						                title: 'Premium Plus Profiles',
						                filename: 'Premium Plus Profiles'
						            },
						            {
						                extend: 'pdfHtml5',
//		 		                        messageTop : 'Premium Plus Profiles',
					                        title : 'Premium Plus Profiles',
					                        orientation : 'landscape',
							                pageSize : 'LEGAL',
							                text : '<i class="fa fa-file-pdf-o"> PDF</i>',
							                titleAttr : 'PDF',
										exportOptions: {columns: [0,1,2,3,4,5,6,7]},
				                        customize: function ( doc ) {
											doc.content.splice( 1, 0, {
												margin: [ 0, 0, 0, 12 ],
												alignment: 'center',
												image: 'data:image/jpeg;base64,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',
												width:100,height:50
											});
										}
						  		     
						            },{
						                extend: 'print',
						                title: 'Premium Plus Profiles',
						                customize: function(doc) {
						                  doc.styles.title = {
						                    color: 'red',
						                    fontSize: '40',
						                    background: 'blue',
						                    alignment: 'center'
						                  }   
						                } , 
						                customize: function ( win ) {
						                    $(win.document.body)
						                        .css( 'font-size', '10pt' )
						                          
						                        .prepend(
						                            '<img src="${baseurl }/img/aarna.jpg" style="position:absolute; top:0; left:0;margin-left:40%;width:100;height:50;" />'
						                        ).prepend(
						                        		documentMessage
						                        );
						                    $(win.document.body).find( 'table' )
						                        .addClass( 'compact' )
						                        .css( 'font-size', 'inherit' );
						                }
						            }
						        ]
			});	
		}
	}
 function editProfile(id) {
	 var location = $("#loc").val();
//  	 var win = window.open(""+location+"/admin/CreateProfile/"+id+"");
 	 window.location.href =location+"/admin/CreateProfile/"+id+"/FreeRegisterProfile";
	 if (win) {
	     //Browser has allowed it to be opened
	     win.focus();
	 } else {
	     //Browser has blocked it
	     alert('Please allow popups for this website');
	 }
	 
	
		}
  function profileStatusChange(id,statusId){
	  var checkstr = "";
	 	if(statusId==0){
	 		checkstr =  confirm('Are you sure you want to In-Activate this profile?');
	 	}
	 	if(statusId==2){
	 		checkstr =  confirm('Are you sure you want to Delete  this profile?');
	 	}
		if(checkstr == true){
		var formData = new FormData();
	     formData.append('status', statusId);
	     formData.append('id', id);
	     formData.append('statusName', "premium_plus");
		$.fn.makeMultipartRequest('POST', 'updateStatus', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			alert(jsonobj.message);
			
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata);
		});
		}
		
	} 
 
  function viewProfile(id){
		$('#dial1').html('');
		
		var username = serviceUnitArray[id].username;
//		var imageUrl = serviceUnitArray[id].image;
		 username1 = username;
		var array = null;
//		var imageUrl =null;
		
		var image = null; image = serviceUnitArray[id].image;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
//			   alert(array[i]);
			});
		}
		
		var registerwith = null; registerwith = serviceUnitArray[id].registerwith;
		if(registerwith == "" || registerwith == null || registerwith == "undefined"){registerwith = "---";}
		
		var executiveName = null; executiveName = serviceUnitArray[id].executiveName;
		if(executiveName == "" || executiveName == null || executiveName == "undefined"){executiveName = "---";}
		
		var email = null; email = serviceUnitArray[id].email;
		if(email == "" || email == null || email == "undefined"){email = "---";}
		
		var createProfileFor = null; createProfileFor = serviceUnitArray[id].createProfileFor;
		if(createProfileFor == "" || createProfileFor == null || createProfileFor == "undefined"){createProfileFor = "---";}		

		var gender = null; gender = serviceUnitArray[id].gender;
		if(gender == "" || gender == null || gender == "undefined"){gender = "---";}
		
		var firstName = null; firstName = serviceUnitArray[id].firstName;
		if(firstName == "" || firstName == null || firstName == "undefined"){firstName = "---";}
		
		var lastName = null; lastName = serviceUnitArray[id].lastName;
		if(lastName == "" || lastName == null || lastName == "undefined"){lastName = "---";}
		
		/* var dob = null; dob = serviceUnitArray[id].dob;
		if(dob == "" || dob == null || dob == "undefined"){dob = "---";} */
		
		var dob = null; dob = serviceUnitArray[id].dobString;
		if(dob == "" || dob == null || dob == "undefined"){dob = "---";}
		
		var religionName = null; religionName = serviceUnitArray[id].religionName;
		if(religionName == "" || religionName == null || religionName == "undefined"){religionName = "---";}

		var motherTongueName = null; motherTongueName = serviceUnitArray[id].motherTongueName;
		if(motherTongueName == "" || motherTongueName == null || motherTongueName == "undefined"){motherTongueName = "---";}
		
		var currentCountryName = null; currentCountryName = serviceUnitArray[id].currentCountryName;
		if(currentCountryName == "" || currentCountryName == null || currentCountryName == "undefined"){currentCountryName = "---";}
		
		var currentStateName = null; currentStateName = serviceUnitArray[id].currentStateName;
		if(currentStateName == "" || currentStateName == null || currentStateName == "undefined"){currentStateName = "---";}
		
		var currentCityName = null; currentCityName = serviceUnitArray[id].currentCityName;
		if(currentCityName == "" || currentCityName == null || currentCityName == "undefined"){currentCityName = "---";}
		
		var maritalStatus = null; maritalStatus = serviceUnitArray[id].maritalStatus;
		if(maritalStatus == "" || maritalStatus == null || maritalStatus == "undefined"){maritalStatus = "---";}
		
		var casteName = null; casteName = serviceUnitArray[id].casteName;
		if(casteName == "" || casteName == null || casteName == "undefined"){casteName = "---";}
		
		var gotram = null; gotram = serviceUnitArray[id].gotram;
		if(gotram == "" || gotram == null || gotram == "undefined"){gotram = "---";}
		
		var starName = null; starName = serviceUnitArray[id].starName;
		if(starName == "" || starName == null || starName == "undefined"){starName = "---";}
		
		var dosam = null; dosam = serviceUnitArray[id].dosam;
		if(dosam == "" || dosam == null || dosam == "undefined"){dosam = "---";}
		
		var dosamName = null; dosamName = serviceUnitArray[id].dosamName;
		if(dosamName == "" || dosamName == null || dosamName == "undefined"){dosamName = "---";}
		
		//
		var educationName = null; educationName = serviceUnitArray[id].educationName;
		if(educationName == "" || educationName == null || educationName == "undefined"){educationName = "---";}
		
		var workingWith = null; workingWith = serviceUnitArray[id].workingWith;
		if(workingWith == "" || workingWith == null || workingWith == "undefined"){workingWith = "---";}
		
		//
		var occupationName = null; occupationName = serviceUnitArray[id].occupationName;
		if(occupationName == "" || occupationName == null || occupationName == "undefined"){occupationName = "---";}
		
		var annualIncome = null; annualIncome = serviceUnitArray[id].annualIncome;
		if(annualIncome == "" || annualIncome == null || annualIncome == "undefined"){annualIncome = "---";}
		
		var diet = null; diet = serviceUnitArray[id].diet;
		if(diet == "" || diet == null || diet == "undefined"){diet = "---";}
		
		var smoking = null; smoking = serviceUnitArray[id].smoking;
		if(smoking == "" || smoking == null || smoking == "undefined"){smoking = "---";}
		
		var drinking = null; drinking = serviceUnitArray[id].drinking;
		if(drinking == "" || drinking == null || drinking == "undefined"){drinking = "---";}
		
		var height = null; height = serviceUnitArray[id].height;
		if(height == "" || height == null || height == "undefined"){height = "---";}
		
		var bodyTypeName = null; bodyTypeName = serviceUnitArray[id].bodyTypeName;
		if(bodyTypeName == "" || bodyTypeName == null || bodyTypeName == "undefined"){bodyTypeName = "---";}
		
		var complexionName = null; complexionName = serviceUnitArray[id].complexionName;
		if(complexionName == "" || complexionName == null || complexionName == "undefined"){complexionName = "---";}
		
		var mobile = null; mobile = serviceUnitArray[id].mobile;
		if(mobile == "" || mobile == null || mobile == "undefined"){mobile = "---";}
		
		var aboutMyself = null; aboutMyself = serviceUnitArray[id].aboutMyself;
		if(aboutMyself == "" || aboutMyself == null || aboutMyself == "undefined"){aboutMyself = "---";}
		
		var disability = null; disability = serviceUnitArray[id].disability;
		if(disability == "" || disability == null || disability == "undefined"){disability = "---";}
		
		var rAgeFrom = null; rAgeFrom = serviceUnitArray[id].rAgeFrom;
		if(rAgeFrom == "" || rAgeFrom == null || rAgeFrom == "undefined"){rAgeFrom = "---";}
		
		var rAgeTo = null; rAgeTo = serviceUnitArray[id].rAgeTo;
		if(rAgeTo == "" || rAgeTo == null || rAgeTo == "undefined"){rAgeTo = "---";}
		
		var rHeight = null; rHeight = serviceUnitArray[id].rHeight;
		if(rHeight == "" || rHeight == null || rHeight == "undefined"){rHeight = "---";}
		
		var rMaritalStatus = null; rMaritalStatus = serviceUnitArray[id].rMaritalStatus;
		if(rMaritalStatus == "" || rMaritalStatus == null || rMaritalStatus == "undefined"){rMaritalStatus = "---";}
		
		var requiredReligionName = null; requiredReligionName = serviceUnitArray[id].requiredReligionName;
		if(requiredReligionName == "" || requiredReligionName == null || requiredReligionName == "undefined"){requiredReligionName = "---";}
		
		var requiredCasteName = null; requiredCasteName = serviceUnitArray[id].requiredCasteName;
		if(requiredCasteName == "" || requiredCasteName == null || requiredCasteName == "undefined"){requiredCasteName = "---";}
		
		var requiredMotherTongue = null; requiredMotherTongue = serviceUnitArray[id].requiredMotherTongue;
		if(requiredMotherTongue == "" || requiredMotherTongue == null || requiredMotherTongue == "undefined"){requiredMotherTongue = "---";}
		
		var requiredCountry = null; requiredCountry = serviceUnitArray[id].requiredCountry;
		if(requiredCountry == "" || requiredCountry == null || requiredCountry == "undefined"){requiredCountry = "---";}
		
		//
		var requiredStateName = null; requiredStateName = serviceUnitArray[id].requiredStateName;
		if(requiredStateName == "" || requiredStateName == null || requiredStateName == "undefined"){requiredStateName = "---";}
		
		var requiredStateName = null; requiredStateName = serviceUnitArray[id].requiredStateName;
		if(requiredStateName == "" || requiredStateName == null || requiredStateName == "undefined"){requiredStateName = "---";}
		
		var requiredEducationName = null; requiredEducationName = serviceUnitArray[id].requiredEducationName;
		if(requiredEducationName == "" || requiredEducationName == null || requiredEducationName == "undefined"){requiredEducationName = "---";}
		
		var rWorkingWith = null; rWorkingWith = serviceUnitArray[id].rWorkingWith;
		if(rWorkingWith == "" || rWorkingWith == null || rWorkingWith == "undefined"){rWorkingWith = "---";}
		
		var requiredOccupationName = null; requiredOccupationName = serviceUnitArray[id].requiredOccupationName;
		if(requiredOccupationName == "" || requiredOccupationName == null || requiredOccupationName == "undefined"){requiredOccupationName = "---";}
		
		var rAnnualIncome = null; rAnnualIncome = serviceUnitArray[id].rAnnualIncome;
		if(rAnnualIncome == "" || rAnnualIncome == null || rAnnualIncome == "undefined"){rAnnualIncome = "---";}
		
		var rCreateProfileFor = null; rCreateProfileFor = serviceUnitArray[id].rCreateProfileFor;
		if(rCreateProfileFor == "" || rCreateProfileFor == null || rCreateProfileFor == "undefined"){rCreateProfileFor = "---";}
		
		var rDiet = null; rDiet = serviceUnitArray[id].rDiet;
		if(rDiet == "" || rDiet == null || rDiet == "undefined"){rDiet = "---";}

		var rStateName = null; rStateName = serviceUnitArray[id].rStateName;
		if(rStateName == "" || rStateName == null || rStateName == "undefined"){rStateName = "---";}
		
		 var tblRow = 	"<div id='printProfile'><div class='col-sm-2' >"
		 		+		"<img src=${baseurl }/"+image+" class='watermark_text' width='150px' align='right'/>"
	//			+		"<i class='fa fa-user' style='font-size: 10em;'></i>"
	// 	 		+		"<img class='img-responsive' src='../img/default.png' style='width: auto !important;height: 120px !important;'>"
		 		+ 	"</div>" 
				 +"<div  class='container table-responsive'>"
			   
				 +"<div class='row'>"
		 		+"<a href='' class='noPrint' onclick='PrintElem()' style='background: turquoise;border-radius: 3px;padding: 2px;font-size: 18px;''>Print</a>"
		 		+ 	"<div class='col-sm-10' >"
		 		+		"<table class='table table-hoverable table-condensed' style='width: 100%;'>"
				+			"<tr>"
				+				"<td><b>Profile Created for</b></td>"
				+				"<td>:</td><td>"+createProfileFor+"</td>"
				+				"<td><b><spring:message code='label.executiveName' text='default text'/></b></td>"
				+				"<td>:</td><td>"+executiveName+"</td>"
				+			"</tr>"
				//Basic Information
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Basic Information</b></td></tr>"
				+			"<tr>"
				+				"<td><b>First Name</b></td>"
				+				"<td>:</td><td>"+firstName+"</td>"
				+				"<td><b>Last Name</b></td>"
				+				"<td>:</td><td>"+lastName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Gender</b></td>"
				+				"<td>:</td><td>"+gender+"</td>"
				+				"<td><b>Date of Birth</b></td>"
				+				"<td>:</td><td>"+dob+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Email</b></td>"
				+				"<td>:</td><td>"+email+"</td>"
				+				"<td><b>Caste</b></td>"
				+				"<td>:</td><td>"+casteName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Gothram</b></td>"
				+				"<td>:</td><td>"+gotram+"</td>"
				+				"<td><b>Nakshtram</b></td>"
				+				"<td>:</td><td>"+starName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Dosham</b></td>"
				+				"<td>:</td><td>"+dosam+"</td>"
				+				"<td><b>Dosham Name</b></td>"
				+				"<td>:</td><td>"+dosamName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Marital Status</b></td>"
				+				"<td>:</td><td colspan='4'>"+maritalStatus+"</td>"
				+			"</tr>"
				//Widow / Divorcee Details
//	 			+			mStatus
				+			"<tr>"
				+				"<td><b>Religion</b></td>"
				+				"<td>:</td><td>"+religionName+"</td>"
				+				"<td><b>Mother Tongue</b></td>"
				+				"<td>:</td><td>"+motherTongueName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Country</b></td>"
				+				"<td>:</td><td>"+currentCountryName+"</td>"
				+				"<td><b>State</b></td>"
				+				"<td>:</td><td>"+currentStateName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>City</b></td>"
				+				"<td>:</td><td>"+currentCityName+"</td>"
				+				"<td><b>Mobile</b></td>"
				+				"<td>:</td><td>"+mobile+"</td>"
				+			"</tr>"
				//Education & Job information
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Education &amp; Job Information</b></td></tr>"
				+			"<tr>"
				+				"<td><b>Education</b></td>"
				+				"<td>:</td><td>"+educationName+"</td>"
				+				"<td><b>Working with</b></td>"
				+				"<td>:</td><td>"+workingWith+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Occupation</b></td>"
				+				"<td>:</td><td>"+occupationName+"</td>"
				+				"<td><b>Annual Income</b></td>"
				+				"<td>:</td><td>"+annualIncome+"</td>"
				+			"</tr>"
				//Personal Details
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Personal Details</b></td></tr>"
				+			"<tr>"
				+				"<td><b>Diet</b></td>"
				+				"<td>:</td><td>"+diet+"</td>"
				+				"<td><b>Smoking</b></td>"
				+				"<td>:</td><td>"+smoking+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Drinking</b></td>"
				+				"<td>:</td><td>"+drinking+"</td>"
				+				"<td><b>Height</b></td>"
				+				"<td>:</td><td>"+height+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Body Type</b></td>"
				+				"<td>:</td><td>"+bodyTypeName+"</td>"
				+				"<td><b>Complexion</b></td>"
				+				"<td>:</td><td>"+complexionName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>About Yourself</b></td>"
				+				"<td>:</td><td>"+aboutMyself+"</td>"
				+				"<td><b>Any Disability</b></td>"
				+				"<td>:</td><td>"+disability+"</td>"
				+			"</tr>"
				//Life Partner Requirements
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Life Partner Requirements</b></td></tr>"
				+			"<tr>"
				+				"<td><b>Height</b></td>"
				+				"<td>:</td><td>"+rHeight+"</td>"
				+				"<td><b>Age</b></td>"
				+				"<td>:</td><td>"+rAgeFrom+" <b>to</b> "+rAgeTo+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Marital Status</b></td>"
				+				"<td>:</td><td colspan='4'>"+rMaritalStatus+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Religion</b></td>"
				+				"<td>:</td><td>"+requiredReligionName+"</td>"
				+				"<td><b>Caste</b></td>"
				+				"<td>:</td><td>"+requiredCasteName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Mother Tongue</b></td>"
				+				"<td>:</td><td>"+requiredMotherTongue+"</td>"
				+				"<td><b>Country</b></td>"
				+				"<td>:</td><td>"+requiredCountry+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>State</b></td>"
				+				"<td>:</td><td>"+rStateName+"</td>"
				+				"<td><b>Education</b></td>"
				+				"<td>:</td><td>"+requiredEducationName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Working with</b></td>"
				+				"<td>:</td><td>"+rWorkingWith+"</td>"
				+				"<td><b>Profession area</b></td>"
				+				"<td>:</td><td>"+requiredOccupationName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Annual Income</b></td>"
				+				"<td>:</td><td colspan='4'>"+rAnnualIncome+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b>Profile Created by</b></td>"
				+				"<td>:</td><td>"+rCreateProfileFor+"</td>"
				+				"<td><b>Diet</b></td>"
				+				"<td>:</td><td>"+rDiet+"</td>"
				+			"</tr>"
				+		"</table>"
//	 	 		+		"<div class='row'>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.createdByName' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+created_by+"</div>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.executiveName' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+executiveName+"</div>"
//	 	 		+		"</div>"
//	 	 		+		"<div class='row'>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.casteName' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+castname+"</div>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.subCaste' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+SubCaste+"</div>"
//	 	 		+		"</div>"
//	 	 		+		"<div class='row'>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.surName' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+sname+"</div>"
//	 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.name' text='default text' />:</label>"
//	 	 		+			"<div class='col-sm-3'>"+name+"</div>"
//	 	 		+		"</div>"
		 		+ 	"</div>"
		 		+ "</div></div></div>";
		 
		 $(tblRow).appendTo('#dial1');
		 var mStatus = null;
			if(mStatus == "" || mStatus == null || mStatus == "undefined")
			{
				if(maritalStatus == "Widower" || maritalStatus == "Divorcee")
				{
					mStatus = "<tr class='bg'><td colspan='6' style='color: green;'><b>Widow/Divorcee Details</b></td></tr>"
					+			"<tr>"
					+				"<td><b><spring:message code='label.defendentName' text='default text'/></b></td>"
					+				"<td>:</td><td>"+gender+"</td>"
					+				"<td><b><spring:message code='label.sOrD' text='default text'/></b></td>"
					+				"<td>:</td><td>"+dob+"</td>"
					+			"</tr>"
					+			"<tr>"
					+				"<td><b><spring:message code='label.marriedOn' text='default text'/></b></td>"
					+				"<td>:</td><td>"+gender+"</td>"
					+				"<td><b><spring:message code='label.dateOfSeparation' text='default text'/></b></td>"
					+				"<td>:</td><td>"+dob+"</td>"
					+			"</tr>"
					+			"<tr>"
					+				"<td><b><spring:message code='label.courtCase' text='default text'/></b></td>"
					+				"<td>:</td><td>"+gender+"</td>"
					+				"<td><b><spring:message code='label.reason' text='default text'/></b></td>"
					+				"<td>:</td><td>"+dob+"</td>"
					+			"</tr>"
					+			"<tr>"
					+				"<td><b><spring:message code='label.maleChildrens' text='default text'/></b></td>"
					+				"<td>:</td><td>"+gender+"</td>"
					+				"<td><b><spring:message code='label.femaleChildrens' text='default text'/></b></td>"
					+				"<td>:</td><td>"+dob+"</td>"
					+			"</tr>";
				}
			}
			else{mStatus = "<tr></tr>";}
			 $(mStatus).appendTo('#mstatusId');
			 
		 $('#dial1').dialog({title: "Profile of "+username, width: 1199, height: 600, modal: true}).dialog('open');
//		 	$(window).scrollTop($('.wrapper').offset().top);
//		 	$(".view_list").hide();
//		 	$('#view_list1').hide();
		 var formData = new FormData();
	     formData.append('id', id);
		$.fn.makeMultipartRequest('POST', 'verifyProfile', false,
				formData, false, 'text', function(data){
			/* var jsonobj = $.parseJSON(data);
			alert(jsonobj.message);
			
			var alldata = jsonobj.allOrders1;
			console.log(jsonobj.allOrders1);
			displayTable(alldata); */
		});
	 }
  
 $(function(){
		$('.dataTable').DataTable({
			 dom: 'lBfrtip',
			 title: 'Premium Plus Profiles',
			 /* buttons: [
			            'copy', 'csv', 'excel', 'pdf','print'
			        ]	 */
			        buttons: [
					            {
					                extend: 'excelHtml5',
					                title: 'Premium Plus Profiles',
					                filename: 'Premium Plus Profiles'
					            },
					            {
					                extend: 'pdfHtml5',
//	 		                        messageTop : 'Premium Plus Profiles',
				                        title : 'Premium Plus Profiles',
				                        orientation : 'landscape',
						                pageSize : 'LEGAL',
						                text : '<i class="fa fa-file-pdf-o"> PDF</i>',
						                titleAttr : 'PDF',
									exportOptions: {columns: [0,1,2,3,4,5,6,7]},
			                        customize: function ( doc ) {
										doc.content.splice( 1, 0, {
											margin: [ 0, 0, 0, 12 ],
											alignment: 'center',
											image: 'data:image/jpeg;base64,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',
											width:100,height:50
										});
									}
					  		     
					            },{
					                extend: 'print',
					                title: 'Premium Plus Profiles',
					                customize: function(doc) {
					                  doc.styles.title = {
					                    color: 'red',
					                    fontSize: '40',
					                    background: 'blue',
					                    alignment: 'center'
					                  }   
					                } , 
					                customize: function ( win ) {
					                    $(win.document.body)
					                        .css( 'font-size', '10pt' )
					                          
					                        .prepend(
					                            '<img src="${baseurl }/img/aarna.jpg" style="position:absolute; top:0; left:0;margin-left:40%;width:100;height:50;" />'
					                        ).prepend(
					                        		documentMessage
					                        );
					                    $(win.document.body).find( 'table' )
					                        .addClass( 'compact' )
					                        .css( 'font-size', 'inherit' );
					                }
					            }
					        ]
		});	
	});
 $(".profiles").addClass("active");
 $(".premiumPlusProfiles").addClass("active"); 
</script>

</body>


<!-- Mirrored from www.eakroko.de/flat/forms-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 18 Sep 2017 09:43:06 GMT -->
</html>
