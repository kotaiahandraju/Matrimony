
	<script src="${baseurl }/js/customValidation.js"></script>
	
	<!-- Nice Scroll -->
	<script src="${baseurl }/js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
		<!-- Bootstrap -->
	<script src="${baseurl }/js/bootstrap.min.js"></script>
	
	<!-- jQuery UI -->
	<%-- <script src="${baseurl }/js/plugins/jquery-ui/jquery-ui.js"></script> --%>
	<!-- Touch enable for jquery UI -->
	<script src="${baseurl }/js/plugins/touch-punch/jquery.touch-punch.min.js"></script>
	<!-- slimScroll -->
	<script src="${baseurl }/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>	
	<!-- vmap -->
	<script src="${baseurl }/js/plugins/vmap/jquery.vmap.min.js"></script>
	<script src="${baseurl }/js/plugins/vmap/jquery.vmap.world.js"></script>
	<script src="${baseurl }/js/plugins/vmap/jquery.vmap.sampledata.js"></script>
	<!-- Bootbox -->
	<script src="${baseurl }/js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- Flot -->
	<script src="${baseurl }/js/plugins/flot/jquery.flot.min.js"></script>
	<script src="${baseurl }/js/plugins/flot/jquery.flot.bar.order.min.js"></script>
	<script src="${baseurl }/js/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="${baseurl }/js/plugins/flot/jquery.flot.resize.min.js"></script>
	<!-- imagesLoaded -->
	<script src="${baseurl }/js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
	<!-- PageGuide -->
	<script src="${baseurl }/js/plugins/pageguide/jquery.pageguide.js"></script>
	<!-- FullCalendar -->
	<script src="${baseurl }/js/plugins/fullcalendar/moment.min.js"></script>
	<script src="${baseurl }/js/plugins/fullcalendar/fullcalendar.min.js"></script>
	<!-- Chosen -->
	<script src="${baseurl }/js/plugins/chosen/chosen.jquery.min.js"></script>
	<!-- select2 -->
	<script src="${baseurl }/js/plugins/select2/select2.min.js"></script>
	<!-- icheck -->
	<script src="${baseurl }/js/plugins/icheck/jquery.icheck.min.js"></script>

	<!-- Theme framework -->
	<script src="${baseurl }/js/eakroko.min.js"></script>
	<!-- Theme scripts -->
	<script src="${baseurl }/js/application.min.js"></script>
	<!-- Just for demonstration -->
	<script src="${baseurl }/js/demonstration.min.js"></script>
	<link rel="stylesheet" href="${baseurl }/css/plugins/select2/select2.css">
	<!-- Datatables -->
	<script src="${baseurl }/js/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${baseurl }/js/plugins/datatables/extensions/dataTables.tableTools.min.js"></script>
	<script src="${baseurl }/js/plugins/datatables/extensions/dataTables.colReorder.min.js"></script>
	<script src="${baseurl }/js/plugins/datatables/extensions/dataTables.colVis.min.js"></script>
	<script src="${baseurl }/js/plugins/datatables/extensions/dataTables.scroller.min.js"></script>
	<script src="${baseurl }/js/ajax.js"></script>
	<script src="${baseurl }/js/chosen.jquery.js"></script>
	<script src="${baseurl }/js/prism.js" type="text/javascript" charset="utf-8"></script>
  	<script src="${baseurl }/js/init.js" type="text/javascript" charset="utf-8"></script>
  	<script src="${baseurl }/js/plugins/select2/select2.min.js"></script>
  	<script src="${baseurl }/js/jquery.watermark.js"></script>
  		<script src="${baseurl }/js/jquery.blockUI.min.js"></script>
  	
  	<!-- Datatables -->


<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
<link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css"/>
<!--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="${baseurl }/datatable/jquery.dataTables.min.js"></script>
<!-- <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> -->
<script src="${baseurl }/datatable/dataTables.buttons.min.js"></script>
<script src="${baseurl }/datatable/pdfmake.min.js"></script>
<script src="${baseurl }/datatable/vfs_fonts.js"></script>
<script src="${baseurl }/datatable/buttons.html5.min.js"></script>
<script src="${baseurl }/datatable/buttons.print.min.js"></script>
<script src="${baseurl }/datatable/buttons.flash.min.js"></script>
<script src="${baseurl }/datatable/jszip.min.js"></script>



 


  	
  	
  	
	<script type="text/javascript">
		var isCheck = "Yes";
		
		function viewProfileNew(id){
			$('#dial1').html('');
			
			var username = serviceUnitArray[id].username;
//	 		var imageUrl = serviceUnitArray[id].image;
			 username1 = username;
			var array = null;
//	 		var imageUrl =null;
			
			var image = null; image = serviceUnitArray[id].image;
			if(image == "" || image == null || image == "undefined"){
				image = "${baseurl}/img/default.png";
			}
			else{
			array = image.split(",");
			$.each(array,function(i){
				image ="${catalina_base}/"+array[i];
//	 			   alert(array[i]);
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
			
			var height = null; height = serviceUnitArray[id].inches;
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
			
			// Family Details         
			var fatherName = null; fatherName = serviceUnitArray[id].fatherName;
			if(fatherName == "" || fatherName == null || fatherName == "undefined"){fatherName = "---";}
			
			var motherName = null; motherName = serviceUnitArray[id].motherName;
			if(motherName == "" || motherName == null || motherName == "undefined"){motherName = "---";}
			
			var fOccupation = null; fOccupation = serviceUnitArray[id].fOccupation;
			if(fOccupation == "" || fOccupation == null || fOccupation == "undefined"){fOccupation = "---";}
			
			var mOccupation = null; mOccupation = serviceUnitArray[id].mOccupation;
			if(mOccupation == "" || mOccupation == null || mOccupation == "undefined"){mOccupation = "---";}
			
			var noOfBrothers = null; noOfBrothers = serviceUnitArray[id].noOfBrothers;
			if(noOfBrothers == "" || noOfBrothers == null || noOfBrothers == "undefined"){noOfBrothers = "---";}
			
			var noOfSisters = null; noOfSisters = serviceUnitArray[id].noOfSisters;
			if(noOfSisters == "" || noOfSisters == null || noOfSisters == "undefined"){noOfSisters = "---";}
			
			var noOfBrothersMarried = null; noOfBrothersMarried = serviceUnitArray[id].noOfBrothersMarried;
			if(noOfBrothersMarried == "" || noOfBrothersMarried == null || noOfBrothersMarried == "undefined"){noOfBrothersMarried = "---";}
			
			var noOfSistersMarried = null; noOfSistersMarried = serviceUnitArray[id].noOfSistersMarried;
			if(noOfSistersMarried == "" || noOfSistersMarried == null || noOfSistersMarried == "undefined"){noOfSistersMarried = "---";}
			
			
			
			
			var rAgeFrom = null; rAgeFrom = serviceUnitArray[id].rAgeFrom;
			if(rAgeFrom == "" || rAgeFrom == null || rAgeFrom == "undefined"){rAgeFrom = "---";}
			
			var rAgeTo = null; rAgeTo = serviceUnitArray[id].rAgeTo;
			if(rAgeTo == "" || rAgeTo == null || rAgeTo == "undefined"){rAgeTo = "---";}
			
			var rHeight = null; rHeight = serviceUnitArray[id].rHeightInches;
			if(rHeight == "" || rHeight == null || rHeight == "undefined"){rHeight = "---";}
			
			var rHeightTo = null; rHeightTo = serviceUnitArray[id].rHeightToInches;
			if(rHeightTo == "" || rHeightTo == null || rHeightTo == "undefined"){rHeightTo = "---";}
			
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
			
			 var tblRow = 	"<div id='printProfile'><div class='col-sm-2' ><img src='${baseurl}/images/logo.png'/></div>"
			 		+		"<div class='col-sm-2' style='float:right;'><img src="+image+" class='' width='150px' align='right'/>"
			 		+'		<div class="watermarkcontent_profilepic">'
			 		+'			<span>aarnamatrimony.com</span>'
			 		+'		</div>'
		//			+		"<i class='fa fa-user' style='font-size: 10em;'></i>"
		// 	 		+		"<img class='img-responsive' src='../img/default.png' style='width: auto !important;height: 120px !important;'>"
			 		+ 	"</div>" 
					 +"<div  class='container table-responsive'>"
				   
					 +"<div class='row' style='margin-right:0px;'>"
			 		+"<a href='' class='noPrint' onclick='PrintElem()' style='background: turquoise;border-radius: 3px;padding: 2px;font-size: 18px; float:right;''>Print</a>"
			 		+ 	"<div class='col-sm-10' >"
			 		+		"<table class='table table-hoverable table-condensed' style='width: 100%;margin-top:25px;'>"
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
//		 			+			mStatus
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
					//Family Details   
					+			"<tr class='bg'><td colspan='6' style='color: green;'><b>Family Details</b></td></tr>"
					+			"<tr>"
					+				"<td><b>Father's Name</b></td>"
					+				"<td>:</td><td>"+fatherName+"</td>"
					+				"<td><b>Mother's Name</b></td>"
					+				"<td>:</td><td>"+motherName+"</td>"
					+			"</tr>"
					+			"<tr>"
					+				"<td><b>Father's Occupation	</b></td>"
					+				"<td>:</td><td>"+fOccupation+"</td>"
					+				"<td><b>Mother's Occupation</b></td>"
					+				"<td>:</td><td>"+mOccupation+"</td>"
					+			"</tr>"
					+			"<tr>"
					+				"<td><b>No. of Brothers</b></td>"
					+				"<td>:</td><td>"+noOfBrothers+"</td>"
					+				"<td><b>Brothers Married</b></td>"
					+				"<td>:</td><td>"+noOfBrothersMarried+"</td>"
					+			"</tr>"
					+			"<tr>"
					+				"<td><b>No. of Sisters</b></td>"
					+				"<td>:</td><td>"+noOfSisters+"</td>"
					+				"<td><b>Sisters Married</b></td>"
					+				"<td>:</td><td>"+noOfSistersMarried+"</td>"
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
					+				"<td><b>Profile Created for</b></td>"
					+				"<td>:</td><td>"+rCreateProfileFor+"</td>"
					+				"<td><b>Diet</b></td>"
					+				"<td>:</td><td>"+rDiet+"</td>"
					+			"</tr>"
					+		"</table>"
//		 	 		+		"<div class='row'>"
//		 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.createdByName' text='default text' />:</label>"
//		 	 		+			"<div class='col-sm-3'>"+created_by+"</div>"
//		 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.executiveName' text='default text' />:</label>"
//		 	 		+			"<div class='col-sm-3'>"+executiveName+"</div>"
//		 	 		+		"</div>"
//		 	 		+		"<div class='row'>"
//		 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.casteName' text='default text' />:</label>"
//		 	 		+			"<div class='col-sm-3'>"+castname+"</div>"
//		 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.subCaste' text='default text' />:</label>"
//		 	 		+			"<div class='col-sm-3'>"+SubCaste+"</div>"
//		 	 		+		"</div>"
//		 	 		+		"<div class='row'>"
//		 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.surName' text='default text' />:</label>"
//		 	 		+			"<div class='col-sm-3'>"+sname+"</div>"
//		 	 		+			"<label class='col-sm-3 control-label required'><spring:message code='label.name' text='default text' />:</label>"
//		 	 		+			"<div class='col-sm-3'>"+name+"</div>"
//		 	 		+		"</div>"
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
//			 	$(window).scrollTop($('.wrapper').offset().top);
//			 	$(".view_list").hide();
//			 	$('#view_list1').hide();
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
		
		function PrintElem(elem)
		 {
		 	$(".noPrint").hide();
		     Popup($("#printProfile").html());
		     
		 }


		 function Popup(data)
		 {
		 	var mywindow = window.open('','new div');

		     var is_chrome = Boolean(mywindow.chrome);
		     var isPrinting = false;
		     mywindow.document.write('<html><head><title>'+username1+'</title> <link rel="stylesheet" type="text/css" href="../assets/css/img.css"><link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css"></head><body>');
		     mywindow.document.write(data);
		    
		     mywindow.document.write('</body></html>');
		     mywindow.document.close(); // necessary for IE >= 10 and necessary before onload for chrome

		 
		 $(".noPrint").show();
		     if (is_chrome) {
		         mywindow.onload = function() { // wait until all resources loaded 
		             mywindow.focus(); // necessary for IE >= 10
		             mywindow.print();  // change window to mywindow
		             mywindow.close();// change window to mywindow
		         };
		     
		     
		    } else {
		         mywindow.document.close(); // necessary for IE >= 10
		         mywindow.focus(); // necessary for IE >= 10

		         mywindow.print();
		         mywindow.close();
		    }
		   
		     return true;
		 }
	</script>
</body>
</html>