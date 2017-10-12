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
			<div class="box-content nopadding w3-animate-zoom" id="tableId">
				<table class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,null">
					<thead>
					<tr>
						<th>Name</th>
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
		var tableHead = '<table  class="table table-hover table-nomargin table-bordered dataTable dataTable-column_filter" data-column_filter_types="text,null">'
				+ '<thead><tr><th>UserName</th><th>Name</th><th>Sur Name</th><th></th></tr></thead><tbody></tbody></table>';
		$('#tableId').html(tableHead);
		serviceUnitArray = {};
		$.each(listOrders,function(i, orderObj) {
			var viewProfile = "<a data-toggle='tooltip' title='View' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-eye'></i></a>"
			var uploadPhotos = "<a data-toggle='tooltip' title='Upload Photos' onclick='uploadPhotos("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-photo'></i></a>"
			var moveToHidden = "<a data-toggle='tooltip' title='Move To Hidden' onclick='moveToHidden("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-eye-slash'></i></a>"
			var editProfile = "<a data-toggle='tooltip' title='Edit' onclick='editProfile("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-pencil'></i></a>"
			var sendMail = "<a data-toggle='tooltip' title='Mail' onclick='sendMail("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-envelope'></i></a>"
			var inactive = "<a data-toggle='tooltip' title='Inactive' onclick='inactive("+ orderObj.id+ ",0)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-eye'></i></a>"
			var compareProfiles = "<a data-toggle='tooltip' title='Compare Profiles' onclick='compareProfiles("+ orderObj.id+ ")'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-transfer'></i></a>"
			var deleteProfile = "<a data-toggle='tooltip' title='Delete' onclick='deleteProfile("+ orderObj.id+ ",2)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-trash'></i></a>"
			var payment = "<a data-toggle='tooltip' title='Payment' onclick='payment("+ orderObj.id+ ",0)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-usd'></i></a>"
			var resetPassword = "<a data-toggle='tooltip' title='Reset Password' onclick='resetPassword("+ orderObj.id+ ",0)'><i style='color: #3c8dbc;cursor: pointer;' class='fa fa-repeat'></i></a>"
			/* var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>"
							var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>"
							var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>" */
							serviceUnitArray[orderObj.id] = orderObj;
							var tblRow = "<tr >"
									+ "<td title='"+orderObj.username+"'>" + orderObj.username + "</td>"
									+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
									+ "<td title='"+orderObj.sname+"'>" + orderObj.sname + "</td>"
									+ "<td style='text-align: center;'>" + viewProfile + "&nbsp;&nbsp;" + uploadPhotos + "&nbsp;&nbsp;" 
									+		moveToHidden + "&nbsp;&nbsp;" + editProfile + "&nbsp;&nbsp;" + sendMail + "&nbsp;&nbsp;" 
									+		inactive + "&nbsp;&nbsp;" + compareProfiles + "&nbsp;&nbsp;" + deleteProfile + "&nbsp;&nbsp;"
									+		payment + "&nbsp;&nbsp;" + resetPassword
									+ "</td>"  
									+ "</tr >";
							$(tblRow).appendTo("#tableId table tbody"); 
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
 function deleteProfile(id,statusId){
		var checkstr =  confirm('Are you sure you want to delete this?');
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
		
		var created_by = null; created_by = serviceUnitArray[id].created_by;
		if(created_by == "" || created_by == null || created_by == "undefined"){created_by = "---";}

		var executiveName = null; executiveName = serviceUnitArray[id].executiveName;
		if(executiveName == "" || executiveName == null || executiveName == "undefined"){executiveName = "---";}
		
		var castname = null; castname = serviceUnitArray[id].castname;
		if(castname == "" || castname == null || castname == "undefined"){castname = "---";}
		
		var SubCaste = null; SubCaste = serviceUnitArray[id].SubCaste;
		if(SubCaste == "" || SubCaste == null || SubCaste == "undefined"){SubCaste = "---";}

		var sname = null; sname = serviceUnitArray[id].sname;
		if(sname == "" || sname == null || sname == "undefined"){sname = "---";}

		var name = null; name = serviceUnitArray[id].name;
		if(name == "" || name == null || name == "undefined"){name = "---";}

		var gender = null; gender = serviceUnitArray[id].gender;
		if(gender == "" || gender == null || gender == "undefined"){gender = "---";}

		var dob = null; dob = serviceUnitArray[id].dob;
		if(dob == "" || dob == null || dob == "undefined"){dob = "---";}
		
		var tob = null; tob = serviceUnitArray[id].tob;
		if(tob == "" || tob == null || tob == "undefined"){tob = "---";}
		
		var pob = null; pob = serviceUnitArray[id].pob;
		if(pob == "" || pob == null || pob == "undefined"){pob = "---";}
		
		var inches = null; inches = serviceUnitArray[id].inches;
		if(inches == "" || inches == null || inches == "undefined"){inches = "---";}
		
		var complexionName = null; complexionName = serviceUnitArray[id].complexionName;
		if(complexionName == "" || complexionName == null || complexionName == "undefined"){complexionName = "---";}
		
		var raasiName = null; raasiName = serviceUnitArray[id].raasiName;
		if(raasiName == "" || raasiName == null || raasiName == "undefined"){raasiName = "---";}
		
		var starName = null; starName = serviceUnitArray[id].starName;
		if(starName == "" || starName == null || starName == "undefined"){starName = "---";}
		
		var padam = null; padam = serviceUnitArray[id].padam;
		if(padam == "" || padam == null || padam == "undefined"){padam = "---";}
		
		var gotram = null; gotram = serviceUnitArray[id].gotram;
		if(gotram == "" || gotram == null || gotram == "undefined"){gotram = "---";}
		
		var maritalStatus = null; maritalStatus = serviceUnitArray[id].maritalStatus;
		if(maritalStatus == "" || maritalStatus == null || maritalStatus == "undefined"){maritalStatus = "---";}
		
		var religionName = null; religionName = serviceUnitArray[id].religionName;
		if(religionName == "" || religionName == null || religionName == "undefined"){religionName = "---";}

		var mtongue = null; mtongue = serviceUnitArray[id].mtongue;
		if(mtongue == "" || mtongue == null || mtongue == "undefined"){mtongue = "---";}
		
		var sLanguages = null; sLanguages = serviceUnitArray[id].sLanguages;
		if(sLanguages == "" || sLanguages == null || sLanguages == "undefined"){sLanguages = "---";}
		
		var aboutYourself = null; aboutYourself = serviceUnitArray[id].aboutYourself;
		if(aboutYourself == "" || aboutYourself == null || aboutYourself == "undefined"){aboutYourself = "---";}
		
		var fname = null; fname = serviceUnitArray[id].fname;
		if(fname == "" || fname == null || fname == "undefined"){fname = "---";}

		var fatherEducation = null; fatherEducation = serviceUnitArray[id].fatherEducation;
		if(fatherEducation == "" || fatherEducation == null || fatherEducation == "undefined"){fatherEducation = "---";}
		
		var fatherOccupation = null; fatherOccupation = serviceUnitArray[id].fatherOccupation;
		if(fatherOccupation == "" || fatherOccupation == null || fatherOccupation == "undefined"){fatherOccupation = "---";}
		
		var foDetails = null; foDetails = serviceUnitArray[id].foDetails;
		if(foDetails == "" || foDetails == null || foDetails == "undefined"){foDetails = "---";}
		
		var ffName = null; ffName = serviceUnitArray[id].ffName;
		if(ffName == "" || ffName == null || ffName == "undefined"){ffName = "---";}

		var fnativeAddress = null; fnativeAddress = serviceUnitArray[id].fnativeAddress;
		if(fnativeAddress == "" || fnativeAddress == null || fnativeAddress == "undefined"){fnativeAddress = "---";}
		
		var presentAddress = null; presentAddress = serviceUnitArray[id].presentAddress;
		if(presentAddress == "" || presentAddress == null || presentAddress == "undefined"){presentAddress = "---";}

		var mobile = null; mobile = serviceUnitArray[id].mobile;
		if(mobile == "" || mobile == null || mobile == "undefined"){mobile = "---";}
		
		var phone2 = null; phone2 = serviceUnitArray[id].phone2;
		if(phone2 == "" || phone2 == null || phone2 == "undefined"){phone2 = "---";}

		var landLine = null; landLine = serviceUnitArray[id].landLine;
		if(landLine == "" || landLine == null || landLine == "undefined"){landLine = "---";}
		
		var email = null; email = serviceUnitArray[id].email;
		if(email == "" || email == null || email == "undefined"){email = "---";}

		var email2 = null; email2 = serviceUnitArray[id].email2;
		if(email2 == "" || email2 == null || email2 == "undefined"){email2 = "---";}
		
		var mname = null; mname = serviceUnitArray[id].mname;
		if(mname == "" || mname == null || mname == "undefined"){mname = "---";}

		var motherEducation = null; motherEducation = serviceUnitArray[id].motherEducation;
		if(motherEducation == "" || motherEducation == null || motherEducation == "undefined"){motherEducation = "---";}
		
		var motherOccupation = null; motherOccupation = serviceUnitArray[id].motherOccupation;
		if(motherOccupation == "" || motherOccupation == null || motherOccupation == "undefined"){motherOccupation = "---";}

		var moDetails = null; moDetails = serviceUnitArray[id].moDetails;
		if(moDetails == "" || moDetails == null || moDetails == "undefined"){moDetails = "---";}
		
		var mfName = null; mfName = serviceUnitArray[id].mfName;
		if(mfName == "" || mfName == null || mfName == "undefined"){mfName = "---";}

		var mnativeAddress = null; mnativeAddress = serviceUnitArray[id].mnativeAddress;
		if(mnativeAddress == "" || mnativeAddress == null || mnativeAddress == "undefined"){mnativeAddress = "---";}
		
		var sibilings = null; sibilings = serviceUnitArray[id].sibilings;
		if(sibilings == "" || sibilings == null || sibilings == "undefined"){sibilings = "---";}

		var property = null; property = serviceUnitArray[id].property;
		if(property == "" || property == null || property == "undefined"){property = "---";}
		
		var aboutFamily = null; aboutFamily = serviceUnitArray[id].aboutFamily;
		if(aboutFamily == "" || aboutFamily == null || aboutFamily == "undefined"){aboutFamily = "---";}

		var branchName = null; branchName = serviceUnitArray[id].branchName;
		if(branchName == "" || branchName == null || branchName == "undefined"){branchName = "---";}

		var educationName = null; educationName = serviceUnitArray[id].educationName;
		if(educationName == "" || educationName == null || educationName == "undefined"){educationName = "---";}

		var educationDetails = null; educationDetails = serviceUnitArray[id].educationDetails;
		if(educationDetails == "" || educationDetails == null || educationDetails == "undefined"){educationDetails = "---";}
		
		var educationInfo = null; educationInfo = serviceUnitArray[id].educationInfo;
		if(educationInfo == "" || educationInfo == null || educationInfo == "undefined"){educationInfo = "---";}

		var occupationName = null; occupationName = serviceUnitArray[id].occupationName;
		if(occupationName == "" || occupationName == null || occupationName == "undefined"){occupationName = "---";}

		var occupationDetails = null; occupationDetails = serviceUnitArray[id].occupationDetails;
		if(occupationDetails == "" || occupationDetails == null || occupationDetails == "undefined"){occupationDetails = "---";}
		
		var sinceWorking = null; sinceWorking = serviceUnitArray[id].sinceWorking;
		if(sinceWorking == "" || sinceWorking == null || sinceWorking == "undefined"){sinceWorking = "---";}

		var salaryperMonth = null; salaryperMonth = serviceUnitArray[id].salaryperMonth;
		if(salaryperMonth == "" || salaryperMonth == null || salaryperMonth == "undefined"){salaryperMonth = "---";}

		var salaryperyear = null; salaryperyear = serviceUnitArray[id].salaryperyear;
		if(salaryperyear == "" || salaryperyear == null || salaryperyear == "undefined"){salaryperyear = "---";}
		
		var nriCitizenOf = null; nriCitizenOf = serviceUnitArray[id].nriCitizenOf;
		if(nriCitizenOf == "" || nriCitizenOf == null || nriCitizenOf == "undefined"){nriCitizenOf = "---";}

		var currentCountry = null; currentCountry = serviceUnitArray[id].currentCountry;
		if(currentCountry == "" || currentCountry == null || currentCountry == "undefined"){currentCountry = "---";}

		var visaType = null; visaType = serviceUnitArray[id].visaType;
		if(visaType == "" || visaType == null || visaType == "undefined"){visaType = "---";}
		
		var stayingSince = null; stayingSince = serviceUnitArray[id].stayingSince;
		if(stayingSince == "" || stayingSince == null || stayingSince == "undefined"){stayingSince = "---";}

		var visaValidity = null; visaValidity = serviceUnitArray[id].visaValidity;
		if(visaValidity == "" || visaValidity == null || visaValidity == "undefined"){visaValidity = "---";}
		
		var ageGap = null; ageGap = serviceUnitArray[id].ageGap;
		if(ageGap == "" || ageGap == null || ageGap == "undefined"){ageGap = "---";}

		var requiredHeightFrom = null; requiredHeightFrom = serviceUnitArray[id].requiredHeightFrom;
		if(requiredHeightFrom == "" || requiredHeightFrom == null || requiredHeightFrom == "undefined"){requiredHeightFrom = "---";}
		
		var requiredHeightTo = null; requiredHeightTo = serviceUnitArray[id].requiredHeightTo;
		if(requiredHeightTo == "" || requiredHeightTo == null || requiredHeightTo == "undefined"){requiredHeightTo = "---";}

		var requiredComplexion = null; requiredComplexion = serviceUnitArray[id].requiredComplexion;
		if(requiredComplexion == "" || requiredComplexion == null || requiredComplexion == "undefined"){requiredComplexion = "---";}
		
		var requiredOccupation = null; requiredOccupation = serviceUnitArray[id].requiredOccupation;
		if(requiredOccupation == "" || requiredOccupation == null || requiredOccupation == "undefined"){requiredOccupation = "---";}
		
		var defendentName = null;
		if(defendentName == "" || defendentName == null || defendentName == "undefined"){defendentName = "---";}
		
		var sOrD = null;
		if(sOrD == "" || sOrD == null || sOrD == "undefined"){sOrD = "---";}
		
		var marriedOn = null;
		if(marriedOn == "" || marriedOn == null || marriedOn == "undefined"){marriedOn = "---";}
		
		var dateOfSeparation = null;
		if(dateOfSeparation == "" || dateOfSeparation == null || dateOfSeparation == "undefined"){dateOfSeparation = "---";}
		
		var courtCase = null;
		if(courtCase == "" || courtCase == null || courtCase == "undefined"){courtCase = "---";}
		
		var reason = null;
		if(reason == "" || reason == null || reason == "undefined"){reason = "---";}
		
		var maleChildrens = null;
		if(maleChildrens == "" || maleChildrens == null || maleChildrens == "undefined"){maleChildrens = "---";}
		
		var femaleChildrens = null;
		if(femaleChildrens == "" || femaleChildrens == null || femaleChildrens == "undefined"){femaleChildrens = "---";}
		
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
			 
		 
//	 	 Occupation :	 "46"	 Religion	 :	 "1"	 SubCaste	 :	 "xvcxv"	 aboutFamily	 :	 "xcx"	 aboutYourself	 :	 "zxczxc"	 ageGap	 :	 "xxcxc"
//	 	 branch	 :	 "1"	 branchName	 :	 "Guntur"	 cast	 :	 "9"	 castname	 :	 "Goud"	 cm	 :	 "139"	 complexion	 :	 "6"	 complexionName	 :	 "Medium"
//	 	 country	 :	 null	 countryName	 :	 null	 crCountry	 :	 "3"	 created_by	 :	 "xcvxv"	 created_time	 :	 "2017-10-06 16:16:42.0"
//	 	 currentCountry	 :	 "Australia"	 dob	 :	 "2017-10-06"	 education	 :	 "4"	 educationDetails	 :	 ""	 educationInfo	 :	 ""	 
//	 	 educationName	 :	 "B.Com"	 email	 :	 "andraju.kotaiah@gmail.com"	 email2	 :	 ""	 emply_type	 :	 null	 executiveName	 :	 "xcvxcv"
//	 	 fatherEducation	 :	 "M.Tech"	 fatherOccupation	 :	 "Government"	 feducation	 :	 "2"	 ffName	 :	 ""	 fname	 :	 "xcxcv"
//	 	 fnativeAddress	 :	 "xvxcv"	 foDetails	 :	 ""	 foccupation	 :	 "20"	 gender	 :	 "Male"	 requiredOccupation	 :	 "zxczcx"	 height	 :	 "3"
//	 	 id	 :	 "2756"	 inches	 :	 "4'7"	 landLine	 :	 ""	 languageName	 :	 "hhh"	 last_ip	 :	 "0:0:0:0:0:0:0:1"	 last_login	 :	 "2017-10-06 16:16:42.0"
//	 	 maritalStatus	 :	 "Unmarried"	 meducation	 :	 "4"	 mfName	 :	 "zxczxc"	 mname	 :	 "zxczxc"	 mnativeAddress	 :	 "zxczxc"	 moDetails	 :	 ""
//	 	 mobile	 :	 "9999999999999"	 moccupation	 :	 ""	 motherEducation	 :	 "B.Com"	 motherOccupation	 :	 null	 mstatus	 :	 null
//	 	 mtongue	 :	 "zxzxc"	 name	 :	 "xcvxv"	 ncitizenOf	 :	 "3"	 nriCitizenOf	 :	 "Australia"	 occupationDetails	 :	 "xcxc"
//	 	 occupationName	 :	 "Any"	 padam	 :	 ""	 password	 :	 ""	 phone1	 :	 null	 phone2	 :	 ""	 pob	 :	 "xvxcv"	 presentAddress	 :	 "xvcxz"
//	 	 profile_pic_status	 :	 null	 property	 :	 "xcxc"	 rComplexion	 :	 "6"	 rHeightFrom	 :	 "18"	 rHeightTo	 :	 "17"	 raasi	 :	 "7"
//	 	 raasiName	 :	 "Karkataka "	 register_with	 :	 null	 requiredComplexion	 :	 "Medium"	 requiredHeightFrom	 :	 "5'9"	 requiredHeightTo	 :	 "5'8"
//	 	 requiredOccupation	 :	 "Housewife"	 role_id	 :	 "4"	 rolename	 :	 "Free Profile"	 rprofession	 :	 "45"	 sLanguages	 :	 "7" salaryperMonth	 :	 ""
//	 	 salaryperyear	 :	 ""	 sibilings	 :	 "czxc"	 sinceWorking	 :	 "xcxc"	 sname	 :	 "xcvxcv"	 star	 :	 "4"	 starName	 :	 "Aslesha"
//	 	 status	 :	 null	 stayingSince	 :	 ""	 tob	 :	 "0000-00-00"	 udcreated_time	 :	 "2017-10-06 16:16:42.0"	 udupdated_time	 :	 "2017-10-06 16:16:42.0"
//	 	 updated_time	 :	 "2017-10-06 16:16:42.0"	 userId	 :	 "2756"	 userdetailsId	 :	 "21"	 username	 :	 "VMB3002756"	 visaType	 :	 ""	 
//	 	 visaValidity	

		 var tblRow = "<div class='container table-responsive'><div class='row'>"
		 		+ 	"<div class='col-sm-2'>"
		 		+		"<i class='fa fa-user' style='font-size: 10em;'></i>"
//	 	 		+		"<img class='img-responsive' src='../img/default.png' style='width: auto !important;height: 120px !important;'>"
		 		+ 	"</div>"
		 		+ 	"<div class='col-sm-10' style='border: 1px solid red;'>"
		 		+		"<table class='table table-hoverable table-condensed' style='width: 100%;'>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.createdByName' text='default text'/></b></td>"
				+				"<td>:</td><td>"+created_by+"</td>"
				+				"<td><b><spring:message code='label.executiveName' text='default text'/></b></td>"
				+				"<td>:</td><td>"+executiveName+"</td>"
				+			"</tr>"
				//Basic Information
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Basic Information</b></td></tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.casteName' text='default text'/></b></td>"
				+				"<td>:</td><td>"+castname+"</td>"
				+				"<td><b><spring:message code='label.subCaste' text='default text'/></b></td>"
				+				"<td>:</td><td>"+SubCaste+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.surName' text='default text'/></b></td>"
				+				"<td>:</td><td>"+sname+"</td>"
				+				"<td><b><spring:message code='label.name' text='default text'/></b></td>"
				+				"<td>:</td><td>"+name+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.gender' text='default text'/></b></td>"
				+				"<td>:</td><td>"+gender+"</td>"
				+				"<td><b><spring:message code='label.dob' text='default text'/></b></td>"
				+				"<td>:</td><td>"+dob+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.tob' text='default text'/></b></td>"
				+				"<td>:</td><td>"+tob+"</td>"
				+				"<td><b><spring:message code='label.pob' text='default text'/></b></td>"
				+				"<td>:</td><td>"+pob+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.height' text='default text'/></b></td>"
				+				"<td>:</td><td>"+inches+"</td>"
				+				"<td><b><spring:message code='label.complexion' text='default text'/></b></td>"
				+				"<td>:</td><td>"+complexionName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.raasi' text='default text'/></b></td>"
				+				"<td>:</td><td>"+raasiName+"</td>"
				+				"<td><b><spring:message code='label.star' text='default text'/></b></td>"
				+				"<td>:</td><td>"+starName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.padam' text='default text'/></b></td>"
				+				"<td>:</td><td>"+padam+"</td>"
				+				"<td><b><spring:message code='label.gothram' text='default text'/></b></td>"
				+				"<td>:</td><td>"+gotram+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.maritalStatus' text='default text'/></b></td>"
				+				"<td>:</td><td colspan='4'>"+maritalStatus+"</td>"
				+			"</tr>"
				//Widow / Divorcee Details
//	 			+			mStatus
				+			"<tr>"
				+				"<td><b><spring:message code='label.religion' text='default text'/></b></td>"
				+				"<td>:</td><td>"+religionName+"</td>"
				+				"<td><b><spring:message code='label.motherTongue' text='default text'/></b></td>"
				+				"<td>:</td><td>"+mtongue+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.spokenLanguages' text='default text'/></b></td>"
				+				"<td>:</td><td>"+sLanguages+"</td>"
				+				"<td><b><spring:message code='label.aboutYourself' text='default text'/></b></td>"
				+				"<td>:</td><td>"+aboutYourself+"</td>"
				+			"</tr>"
				
				//About My Family
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>About My Family</b></td></tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.fatherName' text='default text'/></b></td>"
				+				"<td>:</td><td>"+fname+"</td>"
				+				"<td><b><spring:message code='label.fatherEducation' text='default text'/></b></td>"
				+				"<td>:</td><td>"+fatherEducation+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.fatherOccupation' text='default text'/></b></td>"
				+				"<td>:</td><td>"+fatherOccupation+"</td>"
				+				"<td><b><spring:message code='label.fatherOccupationDetails' text='default text'/></b></td>"
				+				"<td>:</td><td>"+foDetails+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.fathersFatherName' text='default text'/></b></td>"
				+				"<td>:</td><td>"+ffName+"</td>"
				+				"<td><b><spring:message code='label.fatherNativeAddress' text='default text'/></b></td>"
				+				"<td>:</td><td>"+fnativeAddress+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.presentAddress' text='default text'/></b></td>"
				+				"<td>:</td><td>"+presentAddress+"</td>"
				+				"<td><b><spring:message code='label.contactPhNo' text='default text'/></b></td>"
				+				"<td>:</td><td>"+mobile+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.contactPhNo2' text='default text'/></b></td>"
				+				"<td>:</td><td>"+phone2+"</td>"
				+				"<td><b><spring:message code='label.landLine' text='default text'/></b></td>"
				+				"<td>:</td><td>"+landLine+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.email' text='default text'/></b></td>"
				+				"<td>:</td><td>"+email+"</td>"
				+				"<td><b><spring:message code='label.email2' text='default text'/></b></td>"
				+				"<td>:</td><td>"+email2+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.motherName' text='default text'/></b></td>"
				+				"<td>:</td><td>"+mname+"</td>"
				+				"<td><b><spring:message code='label.motherEducation' text='default text'/></b></td>"
				+				"<td>:</td><td>"+motherEducation+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.motherOccupation' text='default text'/></b></td>"
				+				"<td>:</td><td>"+motherOccupation+"</td>"
				+				"<td><b><spring:message code='label.motherOccupationDetails' text='default text'/></b></td>"
				+				"<td>:</td><td>"+moDetails+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.mothersFatherName' text='default text'/></b></td>"
				+				"<td>:</td><td>"+mfName+"</td>"
				+				"<td><b><spring:message code='label.motherNativeAddress' text='default text'/></b></td>"
				+				"<td>:</td><td>"+mnativeAddress+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.siblings' text='default text'/></b></td>"
				+				"<td>:</td><td>"+sibilings+"</td>"
				+				"<td><b><spring:message code='label.property' text='default text'/></b></td>"
				+				"<td>:</td><td>"+property+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.aboutFamily' text='default text'/></b></td>"
				+				"<td>:</td><td>"+aboutFamily+"</td>"
				+				"<td><b><spring:message code='label.selectNearestBranch' text='default text'/></b></td>"
				+				"<td>:</td><td>"+branchName+"</td>"
				+			"</tr>"
				//Education & Job information
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Education &amp; Job Information</b></td></tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.education' text='default text'/></b></td>"
				+				"<td>:</td><td>"+educationName+"</td>"
				+				"<td><b><spring:message code='label.educationDetails' text='default text'/></b></td>"
				+				"<td>:</td><td>"+educationDetails+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.educationInfo' text='default text'/></b></td>"
				+				"<td>:</td><td>"+educationInfo+"</td>"
				+				"<td><b><spring:message code='label.occupation' text='default text'/></b></td>"
				+				"<td>:</td><td>"+occupationName+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.occupationDetails' text='default text'/></b></td>"
				+				"<td>:</td><td>"+occupationDetails+"</td>"
				+				"<td><b><spring:message code='label.sinceWorking' text='default text'/></b></td>"
				+				"<td>:</td><td>"+sinceWorking+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.salaryPerMonth' text='default text'/></b></td>"
				+				"<td>:</td><td>"+salaryperMonth+"</td>"
				+				"<td><b><spring:message code='label.salaryPerYear' text='default text'/></b></td>"
				+				"<td>:</td><td>"+salaryperyear+"</td>"
				+			"</tr>"
				//for NRI - Visa Details
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>for NRI - Visa Details</b></td></tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.citizenOf' text='default text'/></b></td>"
				+				"<td>:</td><td>"+nriCitizenOf+"</td>"
				+				"<td><b><spring:message code='label.currentResidenceCountry' text='default text'/></b></td>"
				+				"<td>:</td><td>"+currentCountry+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.visaType' text='default text'/></b></td>"
				+				"<td>:</td><td>"+visaType+"</td>"
				+				"<td><b><spring:message code='label.stayingSince' text='default text'/></b></td>"
				+				"<td>:</td><td>"+stayingSince+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.visaValidity' text='default text'/></b></td>"
				+				"<td>:</td><td colspan='4'>"+visaValidity+"</td>"
				+			"</tr>"
				//Requirement
				+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Requirement</b></td></tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.ageGap' text='default text'/></b></td>"
				+				"<td>:</td><td>"+ageGap+"</td>"
				+				"<td><b><spring:message code='label.heightFrom' text='default text'/></b></td>"
				+				"<td>:</td><td>"+requiredHeightFrom+" <b><spring:message code='label.to' text='default text'/></b> "+requiredHeightTo+"</td>"
				+			"</tr>"
				+			"<tr>"
				+				"<td><b><spring:message code='label.complexion' text='default text'/></b></td>"
				+				"<td>:</td><td>"+requiredComplexion+"</td>"
				+				"<td><b><spring:message code='label.profession' text='default text'/></b></td>"
				+				"<td>:</td><td>"+requiredOccupation+"</td>"
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

