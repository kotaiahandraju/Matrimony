<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
			<h1>All Profiles </h1> 
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
				<span style="color: #999;cursor: auto;">All Profiles</span>
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
					All Profiles List
				</h3>
			</div>
			<div class="box-content nopadding table-responsive w3-animate-zoom" id="tableId">
				<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,text,text,text,text,null">
					<thead>
					<tr>
						<th>UserName</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Mobile</th>
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

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Image Upload</h4>
        </div>
        <div class="modal-body">
         <input type="hidden" name="profileId" id="profileId">
        <input id="imageName" type="file" value="" name="imageName" >
          <button type="button" onclick="imageAjax()" class="btn btn-default" >upload</button>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	<script src="${baseurl }/js/comman.js"></script>	
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
			+ '<thead><tr><th>UserName</th><th>First Name</th><th>Last Name</th><th>Email</th><th>Mobile</th><th></th></tr></thead><tbody></tbody></table>';
		$('#tableId').html(tableHead);
		serviceUnitArray = {};
		$.each(listOrders,function(i, orderObj) {
			var viewProfile = "<a data-toggle='tooltip' title='View' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-eye'></i></a>"
			var uploadPhotos = "<a data-toggle='tooltip'  title='Upload Photos' onclick='uploadPhotos("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-photo'></i></a>"
			var moveToHidden = "<a data-toggle='tooltip' title='Move To Hidden' onclick='moveToHidden("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-eye-slash'></i></a>"
			var editProfile = "<a data-toggle='tooltip' title='Edit' onclick='editProfile("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-pencil'></i></a>"
			var sendMail = "<a data-toggle='tooltip' title='Mail' onclick='sendMail("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-envelope'></i></a>"
			var inactive = "<a data-toggle='tooltip' title='Inactive' onclick='profileStatusChange("+ orderObj.id+ ",0)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-remove'></i></a>"
			var compareProfiles = "<a data-toggle='tooltip' title='Compare Profiles' onclick='compareProfiles("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-exchange'></i></a>"
			var deleteProfile = "<a data-toggle='tooltip' title='Delete' onclick='profileStatusChange("+ orderObj.id+ ",2)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-trash'></i></a>"
			var payment = "<a data-toggle='tooltip' title='Payment' onclick='payment("+ orderObj.id+ ",0)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-usd'></i></a>"
			var resetPassword = "<a data-toggle='tooltip' title='Reset Password' onclick='resetPassword("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-repeat'></i></a>"
			/* var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>"
							var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>"
							var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>" */
							serviceUnitArray[orderObj.id] = orderObj;
							if(orderObj.firstName !=null){
							var tblRow = "<tr >"
								+ "<td title='"+orderObj.username+"'>" + orderObj.username + "</td>"
								+ "<td title='"+orderObj.firstName+"'>" + orderObj.firstName + "</td>"
								+ "<td title='"+orderObj.lastName+"'>" + orderObj.lastName + "</td>"
								+ "<td title='"+orderObj.email+"'>" + orderObj.email + "</td>"
								+ "<td title='"+orderObj.mobile+"'>" + orderObj.mobile + "</td>"
								+ "<td style='text-align: center;white-space: nowrap;'>" + viewProfile + "&nbsp;&nbsp;" + uploadPhotos + "&nbsp;&nbsp;" 
								+	moveToHidden + "&nbsp;&nbsp;" + editProfile + "&nbsp;&nbsp;" + sendMail + "&nbsp;&nbsp;" 
								+	inactive + "&nbsp;&nbsp;" + compareProfiles + "&nbsp;&nbsp;" + deleteProfile + "&nbsp;&nbsp;"
								+	payment + "&nbsp;&nbsp;" + resetPassword
								+ "</td>"  
								+ "</tr >";
							$(tblRow).appendTo("#tableId table tbody"); 
							}
						});
		/* $('#DataTables_Table_0').DataTable({
			dom: 'Bfrtip',
			buttons: [{extend:"print",className:"btn default"},{extend:"pdf",className:"btn default"},{extend:"csv",className:"btn default"}]
		}); */
		
		 /*$('#datatable-buttons').DataTable({
		        "dom": 'C<"clear">lfrtip',
		        "colVis": {
		            "buttonText": "Change columns",
		        "buttons": [{extend:"copy",className:"btn default"},{extend:"print",className:"btn default"},{extend:"pdf",className:"btn default"},{extend:"csv",className:"btn default"}]
		        }
		    });*/
	}
 function uploadPhotos(id){

	 $("#profileId").val(id);
	    $('#myModal').modal();
	} 
 function imageAjax(){
	var id= $("#profileId").val();
	var formData = new FormData();
	formData.append("imageName", imageName.files[0]);
	formData.append("id", id);
	  $.fn.makeMultipartRequest('POST', 'imageUpload', false,
				formData, false, 'text', function(data){
			
		});
 }
 function editProfile(id) {
	 var location = $("#loc").val();
//  	 var win = window.open(""+location+"/admin/CreateProfile/"+id+"");
 	 window.location.href =location+"/admin/CreateProfile/"+id+"/AllProfilesHome";
	 if (win) {
	     //Browser has allowed it to be opened
	     win.focus();
	 } else {
	     //Browser has blocked it
	     alert('Please allow popups for this website');
	 }
	 
	
		}
 function profileStatusChange(id,statusId){
		var checkstr =  confirm('Are you sure you want to do this?');
		if(checkstr == true){
		var formData = new FormData();
	     formData.append('status', statusId);
	     formData.append('id', id);
	     formData.append('statusName', "all");
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
// 		var imageUrl = serviceUnitArray[id].image;
		
		var array = null;
// 		var imageUrl =null;
		
		var image = null; image = serviceUnitArray[id].image;
		if(image == "" || image == null || image == "undefined"){
			image = "img/default.png";
		}
		else{
		array = image.split(",");
		
		$.each(array,function(i){
			image = array[i];
// 			   alert(array[i]);
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
		
		var dob = null; dob = serviceUnitArray[id].dob;
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
		
		 var tblRow = "<div class='container table-responsive'><div class='row'>"
		 		+ 	"<div class='col-sm-2'>"
		 		+		"<img src=${baseurl }/"+image+" width='200px'/>"
// 				+		"<i class='fa fa-user' style='font-size: 10em;'></i>"
//	 	 		+		"<img class='img-responsive' src='../img/default.png' style='width: auto !important;height: 120px !important;'>"
		 		+ 	"</div>"
		 		+ 	"<div class='col-sm-10' style='border: 1px solid red;'>"
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
		 		+ "</div></div>";
		 
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
	 }
 $(".profiles").addClass("active");
 $(".allProfiles").addClass("active"); 
</script>

</body>


<!-- Mirrored from www.eakroko.de/flat/forms-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 18 Sep 2017 09:43:06 GMT -->
</html>

