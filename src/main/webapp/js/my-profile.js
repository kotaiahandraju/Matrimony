function displayMobileNum(profileId,listType){
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
	
}

$(".dashboard").addClass("active");

jQuery(document).ready(function($){
	//open popup
	$('.cd-popup-trigger').on('click', function(event){
		event.preventDefault();
		$('.cd-popup').addClass('is-visible');
	});
	
	//close popup
	$('.cd-popup').on('click', function(event){
		if( $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.cd-popup').removeClass('is-visible');
	    }
    });
});
function toggleDiv(divElem){
	var isHidden = $("#"+divElem+"_edit").attr("hidden");
	$(".all_hidden_divs").attr("hidden",true);
	$(".all_visible_divs").removeAttr("hidden");
	$(".all_a").html("<i class='fa fa-edit'></i>Edit");
	if(isHidden){
		$("#"+divElem+"_view").attr("hidden",true);
		$("#"+divElem+"_edit").removeAttr("hidden");
		$("#"+divElem+"_a").html("<i class='fa fa-close'></i>Close");
	}else{
		$("#"+divElem+"_edit").attr("hidden",true);
		$("#"+divElem+"_view").removeAttr("hidden");
		$("#"+divElem+"_a").html("<i class='fa fa-edit'></i>Edit");
	}
	
}

function colorChange(){
	$('#aboutMyself').css('border-color','black');
 	$('#aboutMyself').css('color','black');
}	
function checkLen(){
	var abtMySelfLen =$("#aboutMyself").val().trim();
	if(abtMySelfLen!=''){
	$('#errorMsg').text("");
		}
}


  function saveChanges(data_type){
	$("#pageName").val(data_type);
	 var formData = new FormData();
   	formData.append("pageName",data_type);
   	formData.append("aboutMyself",$("#aboutMyself").val());
   	formData.append("createProfileFor",$("#createProfileFor").val());
   	var selected_gender = $("input[type=radio][name=gender]:checked").val();
   	formData.append("gender",selected_gender);
   	formData.append("firstName",$("#firstName").val().trim());
   	formData.append("lastName",$("#lastName").val().trim());
   	formData.append("dob",$("#dob").val());
   	formData.append("height",$("#height").val());
   	formData.append("maritalStatus",$("#maritalStatus").val());
   	formData.append("bodyType",$("#bodyType").val());
   	formData.append("complexion",$("#complexion").val());
   	formData.append("disability",$("#disability").val());
   	formData.append("motherTongue",$("#motherTongue").val());
   	formData.append("diet",$("#diet").val());
   	formData.append("smoking",$("#smoking").val());
   	formData.append("drinking",$("#drinking").val());
   	// religion info
   	formData.append("religion",$("#religion").val());
   	formData.append("caste",$("#caste").val());
   	formData.append("gotram",$("#gotram").val().trim());
   	formData.append("star",$("#star").val());
   	formData.append("dosam",$("#dosam").val());
   	//formData.append("drinking",$("#drinking").val());
   	// location info
   	formData.append("currentCountry",$("#currentCountry").val());
   	formData.append("currentState",$("#currentState").val());
   	formData.append("currentCity",$("#currentCity").val());
   	// professional info
   	formData.append("education",$("#education").val());
   	formData.append("workingWith",$("#workingWith").val());
   	formData.append("occupation",$("#occupation").val());
	formData.append("annualIncome",$("#annualIncome").val());
   	// family details
   	formData.append("fatherName",$("#fatherName").val().trim());
   	formData.append("motherName",$("#motherName").val().trim());
   	formData.append("fOccupation",$("#fOccupation").val());
   	formData.append("mOccupation",$("#mOccupation").val());
   	formData.append("noOfBrothers",$("#noOfBrothers").val());
   	formData.append("noOfBrothersMarried",$("#noOfBrothersMarried").val());
   	formData.append("noOfSisters",$("#noOfSisters").val());
   	formData.append("noOfSistersMarried",$("#noOfSistersMarried").val());
   	//partner preferences
   	formData.append("rAgeFrom",$("#rAgeFrom").val().trim());
   	formData.append("rAgeTo",$("#rAgeTo").val().trim());
   	formData.append("rHeight",$("#rHeight").val());
   	formData.append("rHeightTo",$("#rHeightTo").val());
   	formData.append("rMaritalStatus",$("#rMaritalStatus").val());
   	formData.append("rReligion",$("#rReligion").val());
   	formData.append("rCaste",$("#rCaste").val());
   	formData.append("rMotherTongue",$("#rMotherTongue").val());
   	formData.append("rCountry",$("#rCountry").val());
   	formData.append("rState",$("#rState").val());
 	formData.append("rCity",$("#rCity").val());
   	formData.append("rEducation",$("#rEducation").val());
   	formData.append("rWorkingWith",$("#rWorkingWith").val());
   	formData.append("rOccupation",$("#rOccupation").val());
   	formData.append("rAnnualIncome",$("#rAnnualIncome").val());
   	formData.append("rDiet",$("#rDiet").val());
   
   	if($('#aboutMyself').val() ==  null || $('#aboutMyself').val() == "" || $('#aboutMyself').val()=="undefined"){
		$('#aboutMyself').css('border-color','red');
		$('#aboutMyself').css('color','#cc0000');
		$('#aboutMyself').addClass('your-class');
		$('#errorMsg').text("Please enter some text..");
		return false;
	}
	var abtMySelfLen =$("#aboutMyself").val().trim().length;
	if(abtMySelfLen < 50){
		$('#errorMsg').text("Please enter minimum 50 charectors...");
		return false;
	}
	var ageFrom = $("select[name='rAgeFrom']").val();
	var ageTo = $("select[name='rAgeTo']").val();
	var heightFrom = $("#rHeight").val();
	if(heightFrom!=""){
		heightFrom = parseInt(heightFrom);
	}
	var heightTo = $("#rHeightTo").val();
	if(heightTo!=""){
		heightTo = parseInt(heightTo);
	}
	if(ageFrom > ageTo){
		alert("Sorry, Invalid Age range");
		return false;
	}else if(heightFrom > heightTo){
		alert("Sorry, Invalid Height range");
		return false;
	}
	$.fn.makeMultipartRequest('POST', 'editProfile', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		if(msg != "undefined"){
			if(msg == "success"){
				alert("Updates are saved.");
				updateViewValues(data_type);
				
				if(data_type=="partner_basic"){
					
					
					updateMultiDropDownValues("rMaritalStatus");
					updateMultiDropDownValues("rReligion");
					updateMultiDropDownValues("rCaste");
					updateMultiDropDownValues("rMotherTongue");
					updateMultiDropDownValues("rDiet");
				}
				if(data_type=="partner_professional"){
					updateMultiDropDownValues("rEducation");
					updateMultiDropDownValues("rWorkingWith");
					updateMultiDropDownValues("rOccupation");
				}
				if(data_type=="partner_location"){
					updateMultiDropDownValues("rCountry");
					updateMultiDropDownValues("rState");
					updateMultiDropDownValues("rCity");
				}
					/* var updated_values = jsonobj.partner_updated_values;
					$("#rMaritalStatus_val").html(updated_values.maritalStatus);
					$("#rReligion_val").html(updated_values.religion);
					$("#rCaste_val").html(updated_values.caste);
					$("#rMotherTongue_val").html(updated_values.motherTongue);
					$("#rCountry_val").html(updated_values.country);
					$("#rState_val").html(updated_values.state);
					$("#rEducation_val").html(updated_values.education);
					$("#rWorkingWith_val").html(updated_values.workingWith);
					$("#rOccupation_val").html(updated_values.occupation);
					$("#rDiet_val").html(updated_values.diet); */
		
				$(".all_hidden_divs").attr("hidden",true);
				$(".all_visible_divs").removeAttr("hidden");
				$(".all_a").html("<i class='fa fa-edit'></i>Edit");
			}
			
			else{
				alert("Problem occured while saving the updates. Please try again");
			}
		}
	});
} 
 
  function cancelChanges(block){
	  if(block=="about"){
		  var current_val = $("#aboutMyself_val").html().trim();
		  $("#aboutMyself").val(current_val);
	  }else if(block=="location"){
		  var current_country_val = $("#currentCountry_val").html().trim();
		  var current_state_val = $("#currentState_val").html().trim();
		  var current_city_val = $("#currentCity_val").html().trim();
		  var tem = $("#currentCountry option:selected").val();
		  //$("#currentCountry").val(tem);
		  var t1 = $("#currentCountry option:selected").text();
		  var t2 = $("#currentCountry option").text();
		  $("#currentState").val(current_state_val);
		  $("#currentCity").val(current_city_val);
		  $("#currentCountry").trigger("chosen:updated");
		  $("#currentState").trigger("chosen:updated");
		  $("#currentCity").trigger("chosen:updated");
	  }
	  toggleDiv(block);
  }
  
  function fullProfile(profile_id){
		
		$("#id").val(profile_id);
		//document.editProfileForm.action = "fullProfile"
	    //document.editProfileForm.target = "_blank";    // Open in a new window
	    //document.editProfileForm.submit();             // Submit the page
	    $('#userProfile').attr('target',"_blank");
	    $('#userProfile').attr('action',"fullProfile");
		$("#userProfile").submit();
	    return true;
		
	}
  
  function updateViewValues(data_type){
	  // all drop down values are updated seperately...so here only update other field values
	  $("#aboutMyself_val").html($("#aboutMyself").val());
	  //$("#createProfileFor_val").html($("#createProfileFor").val());
	 // $("#gender_val").html($("#gender").val());
	  $(".name_val").html($("#firstName").val()+" "+$("#lastName").val());
	  //$("#lastName_val").html($("#lastName").val());
	  $("#dob_val").html($("#dob").val());
	  //$("#height_val").html($("#height").label);
	 // $("#maritalStatus_val").html($("#maritalStatus").val());
	  /* $("#bodyType_val").html($('#bodyType option:selected').text());
	  $("#complexion_val").html($("#complexion option:selected").text());
	  $("#disability_val").html($("#disability option:selected").text());
	  $("#motherTongue_val").html($('#motherTongue option:selected').text());
	  $("#diet_val").html($("#diet option:selected").text());
	  $("#smoking_val").html($("#smoking option:selected").text());
	  $("#drinking_val").html($("#drinking option:selected").text());
	   	// religion info
	   	$("#religion_val").html($("#religion option:selected").text());
	   	$("#caste_val").html($("#caste option:selected").text()); */
	   	//$("#gotram_val").html($("#gotram").val());
	   	/* $("#star_val").html($("#star option:selected").text());
	   	$("#dosam_val").html($("#dosam option:selected").text());
	   	//formData.append("drinking",$("#drinking").val());
	   	// location info
	   	$("#currentCountry_val").html($("#currentCountry option:selected").text());
	   	$("#currentState_val").html($("#currentState option:selected").text());
	   	$("#currentCity_val").html($("#currentCity option:selected").text());
	   	// professional info
	   	$("#education_val").html($("#education option:selected").text());
	   	$("#workingWith_val").html($("#workingWith option:selected").text());
	   	$("#occupation_val").html($("#occupation option:selected").text()); */
	   	// family details
	   	//$("#fatherName_val").html($("#fatherName").val());
	   	//$("#motherName_val").html($("#motherName").val());
	   	/* $("#fOccupation_val").html($("#fOccupation option:selected").text());
	   	$("#mOccupation_val").html($("#mOccupation option:selected").text());
	   	$("#noOfBrothers_val").html($("#noOfBrothers option:selected").text());
	   	var temp = $("#noOfBrothersMarried option:selected").text();
	   	if ((temp.toLowerCase().indexOf("-- select --") >= 0) || (temp.toLowerCase().indexOf("-- choose --") >= 0)){
	   		$("#noOfBrothersMarried_val").html("Not Specified");
	   	}else{
	   		$("#noOfBrothersMarried_val").html(temp);
	   	}
	   	
	   	$("#noOfSisters_val").html($("#noOfSisters option:selected").text());
	   	$("#noOfSistersMarried_val").html($("#noOfSistersMarried option:selected").text()); */
	    //partner preferences
	   	
	   	//$("#rAgeTo_val").html($("#rAgeTo").val());
	   	/* $("#rHeight_val").html($("#rHeight option:selected").text());
	   	$("#rHeightTo_val").html($("#rHeightTo option:selected").text());
	   	$("#rMaritalStatus_val").html($("#rMaritalStatus option:selected").text());
	   	$("#rReligion_val").html($("#rReligion option:selected").text());
	   	$("#rCaste_val").html($("#rCaste option:selected").text());
	   	$("#rMotherTongue_val").html($("#rMotherTongue option:selected").text());
	   	$("#rCountry_val").html($("#rCountry option:selected").text());
	   	$("#rState_val").html($("#rState option:selected").text());
	   	$("#rEducation_val").html($("#rEducation option:selected").text());
	   	$("#rWorkingWith_val").html($("#rWorkingWith option:selected").text());
	   	$("#rOccupation_val").html($("#rOccupation option:selected").text());
	   	$("#rAnnualIncome_val").html($("#rAnnualIncome option:selected").text());
	   	$("#rDiet_val").html($("#rDiet option:selected").text()); */
	   	if(data_type=="partner_basic"){
	   		$("#rHeight_outer_val").html("");
		   	$("#rHeight_val").html("");
		   	$("#rHeightTo_val").html("");	
	   	}
	   	
	   	updateDropDownValues(data_type);
	   	updateTextFieldValues(data_type);
	   	$("#rAgeFrom_val").html($("#rAgeFrom").val()+" - "+$("#rAgeTo").val());
	   	var dob = $("#dob").val();
	   	var current_date = new Date();
	   	var date1 = dob.split("-");
	    var dob_year = date1[2];
	    var current_year = current_date.getFullYear();
	    var age = current_year-dob_year;
	    //$("#age_val").html(age+" yrs");
	    $(".all_age_val").html(age+" yrs");
	    ////partner preferences
	    //updateMultiDropDownValues(data_type);
  }
  /* $("select").change(function(event){
	  var elemId = this.id;
	  var val = $("#"+elemId+" option:selected").text();
	  
	   	if ((val.toLowerCase().indexOf("--") >= 0) || (val.toLowerCase().indexOf("-- choose --") >= 0)){
	   		
	   		$("#"+elemId+"_val").html("Not Specified");
	   	}else{
	   		if(elemId == "rHeight" || elemId == "rHeightTo"){
	  		  $("#rHeight_val").html($("rHeight").val()+" - "+$("rHeightTo").val());
	  	  	}else{
	  	  		$("#"+elemId+"_val").html(val);
	  	  	}
	   		
	   	}
  }); */
  function updateDropDownValues(data_type){
	  $("#"+data_type+"_edit :selected").each(function () {
		  //var elemId = this.id;
		  var elemId = this.parentElement.id;
		  var val = $(this).text();
		  
		   	if ((val.toLowerCase().indexOf("--") >= 0) || (val.toLowerCase().indexOf("-- choose --") >= 0)){
		   		if(elemId == "rHeight" || elemId == "rHeightTo"){
			  		  
			  		$("#rHeight_outer_val").html("Not Specified");
			  	}else{
			  		$("#"+elemId+"_val").html("Not Specified");
			  	}
		   		
		   	}else{
		   		if(elemId == "rHeight" || elemId == "rHeightTo"){
		   			$("#rHeight_outer_val").html("");
		   		}
		   		
		  	  	if(elemId == "rHeight"){
		  	  		$("#"+elemId+"_val").html(val+" - ");
		  	  	}else{
		  	  		$("#"+elemId+"_val").html(val);
		  	  		$(".all_"+elemId+"_val").html(val);
		  	  	}
		  	  	
		   		
		   	}
	        
	  });
	  
  }
  
  function updateTextFieldValues(data_type){
	  $("#"+data_type+"_edit input[type=text]").each(function () {
		  //var elemId = this.id;
		  var elemId = this.id;
		  var val = $(this).val().trim();
		  if(val==""){
			  $("#"+elemId+"_val").html("Not Specified");
		  }else{
			  $("#"+elemId+"_val").html(val);
		  }
		   	
	  });
	  
  }
  
  function updateMultiDropDownValues(elementId){
	  
		  var val = "";
		  var test = $("#"+elementId);
		  var dataList = $(test).select2('data');
		  $.each(dataList,function(i,data){
			  if(i==0)
				  val = data.text;
			  else
				  val += ","+data.text; 
		  });
		  if ((val.toLowerCase().indexOf("--") >= 0) || val.trim()=="" || val.trim()=="null"){
		   		
		   		$("#"+elementId+"_val").html("Not Specified");
		   	}else{
		   		
		  	  		$("#"+elementId+"_val").html(val);
		  	  	
		   		
		   	}
  }
  
  function displayEditMobilenumberDiv(user_id,old_mobile_no){
	  $("#mobileNoDiv").attr("hidden",true);
	  $("#editMobileDiv").removeAttr("hidden");
	  $("#editMobileAnchor").html("Update");
	  $("#mobile").val(old_mobile_no);
	  $("#editMobileAnchor").attr("onclick","editMobileNumber("+user_id+","+old_mobile_no+")");
	  return false;
  }
  
  /* $(".multiSelect").change(function(event){
	  var elemId = this.id;
	  var seletced_opts = this.selectedOptions;
	  var val = "";
	  $.each(seletced_opts,function(i,selOption){
		  if(i==0)
			  val = selOption.innerHTML; 
		  else
			  val += ","+selOption.innerHTML;
	  });
	  
	  
	   	if ((val.toLowerCase().indexOf("--") >= 0) || (val.toLowerCase().indexOf("-- choose --") >= 0)){
	   		
	   		$("#"+elemId+"_val").html("Not Specified");
	   	}else{
	   		if(elemId == "rHeight" || elemId == "rHeightTo"){
	  		  $("#rHeight_val").html($("rHeight").val()+" - "+$("rHeightTo").val());
	  	  	}else{
	  	  		$("#"+elemId+"_val").html(val);
	  	  	}
	   		
	   	}
  }); */
  
  $("#dob").datepicker({
	  dateFormat: "dd-MM-yy",
	     changeDate : true,
	 	changeMonth : true,
	 	changeYear : true,
		minDate: "-50Y",
		maxDate: "-18Y",
		yearRange: "-65:+0"
	 });  
  $('#aboutMyself').on('keydown', function(e) {
	    if (e.which === 32 &&  e.target.selectionStart === 0) {
	      return false;
	    }  
	  });
  
  function getFilteredStates(id){
		if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
			 $("#currentState").attr("readonly", true);
			$("#currentState").attr("disabled" ,"disabled");
			//$("#currentState").empty();
			$("#currentState").val(""); 
		}else{
			$("#currentState").removeAttr("disabled");
			$("#currentState").removeAttr("readonly");
			var countryIds =$("#"+id).val();
			var formData = new FormData();
		     formData.append('country_ids', countryIds);
		     //return false;
			$.fn.makeMultipartRequest('POST', 'getFilteredStates', false,
					formData, false, 'text', function(data){
				var jsonobj = $.parseJSON(data);
				var statesList = jsonobj.states_list;
	         $("#currentState").empty();
				$("#currentState").append("<option value='' >-- Choose State --</option>");
				
				$.each(statesList, function(i, state) {
					$("#currentState").append("<option value="+state.id+" >"+ state.name+"</option>");
				});
				$("#currentState").val(""); 
				$("#currentState").trigger("change");
			});
			
		}
	}
function getCitys(id){
		
		if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
			$("#currentCity").attr("readonly", true);
			$("#currentCity").attr("disabled" ,"disabled");
			$("#currentCity").val("");
		}else{
			$("#currentCity").removeAttr("disabled");
			$("#currentCity").removeAttr("readonly");
			var stateIds =$("#"+id).val();
			var formData = new FormData();
		     formData.append('state_ids', stateIds);
			$.fn.makeMultipartRequest('POST', 'getCitys', false,
					formData, false, 'text', function(data){
				var jsonobj = $.parseJSON(data);
				var alldata = jsonobj.citys;
//	 			alert(alldata);
	         $("#currentCity").empty();
				$("#currentCity").append("<option value='' >-- Choose City --</option>");
				
				$.each(alldata, function(i, tests) {
					$("#currentCity").append("<option value="+tests.id+" >"+ tests.name+"</option>");
				});
				
			});
			
		}
	}
  
$('.slider_images').each(function(i, item) {
    var img_height = $(item).height();
    var div_height = $(item).parent().height();
    if(img_height<div_height){
        //INCREASE HEIGHT OF IMAGE TO MATCH CONTAINER
        $(item).css({'width': 'auto', 'height': div_height });
        //GET THE NEW WIDTH AFTER RESIZE
        var img_width = $(item).width();
        //GET THE PARENT WIDTH
        var div_width = $(item).parent().width();
        //GET THE NEW HORIZONTAL MARGIN
        var newMargin = (div_width-img_width)/2+'px';
        //SET THE NEW HORIZONTAL MARGIN (EXCESS IMAGE WIDTH IS CROPPED)
        $(item).css({'margin-left': newMargin });
    }else{
        //CENTER IT VERTICALLY (EXCESS IMAGE HEIGHT IS CROPPED)
        var newMargin = (div_height-img_height)/2+'px';
        $(item).css({'margin-top': newMargin});
    }
});