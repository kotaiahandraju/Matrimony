/*  $('.nospecialCharacter').bind('keypress', function(e) {
	    console.log( e.which );
	        var k = e.which;
	        var ok = k >= 65 && k <= 90 || // A-Z
	            k >= 97 && k <= 123 || // a-z
	            k >= 48 && k <= 57; // 0-9
	        
	        if (!ok){
	            e.preventDefault();
	        }
	});*/

/* if(!(inputValue >= 65 && inputValue <= 123) && (inputValue != 32 && inputValue != 0)) { 
     event.preventDefault(); 
 }
function changetext(){
$(".capsOnly").val(function () {
    return this.value.toUpperCase();
}); 
}*/

$(".capsOnly").keyup(function() {
	this.value = this.value.toUpperCase();
});

/*
 * $(".capsOnly").keypress(function (e) { if
 * (String.fromCharCode(e.keyCode).match(/[^A-Z]/g)) return false; });
 */

/*
 * $(".numericOnly").keypress(function (e) {
 * 
 * if (String.fromCharCode(e.keyCode).match(/[^0-9]/g)) return false; });
 */

jQuery('.numericOnly').keyup(function() {
	this.value = this.value.replace(/[^0-9\.]/g, '');
});

/*
 * $('.numericOnly').keydown(function (event) {
 * 
 * var keycode = event.which;
 * 
 * if (!/[\d\t\b+]/.test(String.fromCharCode(event.which)) || event.shiftKey ) {
 * return false; } else { return true; } });
 */

$(".numericOnly").keydown(function(e) {
			// Allow: backspace, delete, tab, escape, enter and .
			if ($.inArray(e.keyCode, [ 46, 8, 9, 27, 13, 110, 190 ]) !== -1 ||
			// Allow: Ctrl+A, Command+A
			(e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
			// Allow: home, end, left, right, down, up
			(e.keyCode >= 35 && e.keyCode <= 40)) {
				// let it happen, don't do anything
				return;
			}
			// Ensure that it is a number and stop the keypress
			if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
					&& (e.keyCode < 96 || e.keyCode > 105)) {
				e.preventDefault();
			}
		});

jQuery('.numbersOnly').keyup(function() {
	this.value = this.value.replace(/[^0-9]/g, '');
});

$(".numbersOnly").keydown(function(e) {
	// Allow: backspace, delete, tab, escape, enter and .
	if ($.inArray(e.keyCode, [ 46, 8, 9, 27, 13, 110 ]) !== -1 ||
	// Allow: Ctrl+A, Command+A
	(e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
	// Allow: home, end, left, right, down, up
	(e.keyCode >= 35 && e.keyCode <= 40)) {
		// let it happen, don't do anything
		return;
	}
	// Ensure that it is a number and stop the keypress
	if (e.keyCode===190 || ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57))
			&& (e.keyCode < 96 || e.keyCode > 105))) {
		e.preventDefault();
	}
});


// $('.onlyCharacters').keypress(function (e) {
// var keyCode = event.keyCode || event.which
// //Don't validate the input if below arrow, delete and backspace keys were
// pressed
// if (keyCode == 8 || (keyCode >= 35 && keyCode <= 40)) { // Left / Up / Right
// / Down Arrow, Backspace, Delete keys
// return;
// }
/*
 * var regex = new RegExp("^[A-Z, ,a-z\b]+$"); var str =
 * String.fromCharCode(!e.charCode ? e.which : e.charCode); if (regex.test(str)) {
 * return true; } else { e.preventDefault(); return false; }
 */
// });
var correct = false;
function checkEmail(str) {
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	if (!re.test(str)) {
		alert("Please enter a valid email address");

		correct = false;
		return false;
	} else {
		correct = true;
		return true;
	}
}

$('#mobile').blur(function() {
	if($('#mobile').val().trim().length<10){
		$('#mobileError111').text("Please enter a valid mobile number.");
		event.preventDefault();
		return false;
	}else{
		$('#mobileError111').text('');
		event.preventDefault();
		//$('#mobileError111').text("");
		var formData = new FormData();
	    formData.append('mobile', $("#mobile").val());
	    formData.append('id', $("#id").val());
	    var actionStr = "../mobileNumChecking";
	     var nextPage = nextPage1;
	     if(nextPage!=null && nextPage!="" && nextPage!="undefined"){
	    	 actionStr = "../../../mobileNumChecking";
	     }
	     var req_from = $("#req_from").val();
	     if(typeof req_from != "undefined" && req_from=="user"){
	    	 actionStr = "mobileNumChecking";
	     }
	    
		$.fn.makeMultipartRequest('POST', actionStr, false,formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			if(jsonobj.msg =="exist"){
				//error message write
				$('#mobileError111').text("Mobile number already in Use. Please try another.");
				mobileExists = true;
				$("#firstForm").hide();
				$('#secondForm').hide();
				$("#thirdForm").show();
				$('#fourthForm').hide();
//				ChangeUrl('page1', 'profile.htm?page=3');
				event.preventDefault();
				$("#step1").removeClass("btn-primary");
				 $("#step2").removeClass("btn-primary");
				 $("#step3").addClass("btn-primary");
				 $("#step4").removeClass("btn-primary"); 
			}else{
				$('#mobileError111').text("");
				mobileExists = false;
				/*$("#firstForm").hide();
				$('#secondForm').hide();
				$("#thirdForm").hide();
				$('#fourthForm').show();*/
				//ChangeUrl('page1', 'profile.htm?page=4');
				//event.preventDefault();
				
				/*$("#step1").removeClass("btn-primary");
				 $("#step2").removeClass("btn-primary");
				 $("#step3").removeClass("btn-primary");
				 $("#step4").addClass("btn-primary");*/
			}
		});
		//isMobileNumDuplicate();
		 
		
	}
});

/*$(".emailOnly").on(	"keypress",	function(e) {

					// console.log(event.which);
					var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
					// var expr =/[A-Z0-9a-z@]/;
					var key = String.fromCharCode(event.which);
					
					 * if($(".emailOnly").match(expr)) { console.log("Email");
					 * return true; }
					 
					if (e.test(expr)) {
						console.log("Email");
						return true;
					}
					// keychar = String.fromCharCode(keynum);
					// regEx = /[A-Z0-9a-z@]/;
					// return regEx.test(keychar);
					return false;
				});*/

$('.nospecialCharacter').bind('keypress', function validate(e) {
	var regex = new RegExp("[a-zA-Z0-9]");
	var key = e.keyCode || e.which;
	key = String.fromCharCode(key);

	if (!regex.test(key) && key.charCodeAt(0) > 32) {
		e.returnValue = false;
		if (e.preventDefault) {
			e.preventDefault();
		}
	}
});

$(".onlyCharacters").on("keypress",	function(event) {

			// Disallow anything not matching the regex pattern (A to Z
			// uppercase, a to z lowercase and white space)
			var englishAlphabetAndWhiteSpace = /[A-Za-z. ]/g;

			// Retrieving the key from the char code passed in event.which
			var key = String.fromCharCode(event.which);

			// alert(event.keyCode);

			if (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37
					|| event.keyCode == 39
					|| englishAlphabetAndWhiteSpace.test(key)) {
				return true;
			}

			// If we got this far, just return false because a disallowed key
			// was typed.
			return false;
		});

/*$('.onlyCharacters').on("paste", function(e) {
	e.preventDefault();
});*/

// ---------------------------------------------------

var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
var emailExist = true;
var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

// input placeholders
$("input").each(function() {
	$(this).data('holder', $(this).attr('placeholder'));
	$(this).focusin(function() {
		$(this).attr('placeholder', '');
	});
	$(this).focusout(function() {
		$(this).attr('placeholder', $(this).data('holder'));
	});

});
/*$(".validate").focusout(function(){
		$('.validate').on('change',function() {
			var id = $(this).attr('id');
			var placeholder = $(this).attr('placeholder');
			var value = $("#" + id).val();
			if (value == null || value == "" || value == "undefined") {
				$("#" + id + "Error").text("Please " + placeholder);
			} else {
				$("#" + id + "Error").text(" ");
			}
		});*/
// onblur validation

$('.validate').blur(function() {
	var id = $(this).attr('id');
	var placeholder = $(this).attr('placeholder');
	var value = $("#" + id).val();
	if (value == null || value == "" || value == "undefined") {
		$('style').append(styleBlock);
		$("#" + id ).attr("placeholder", placeholder);
		$("#" + id ).css('border-color','#e73d4a');
		$("#" + id ).css('color','#e73d4a');
		$("#" + id ).addClass('placeholder-style your-class');
//		$("#" + id + "Error").text("Please " + placeholder);
	} else {
		$("#" + id + "Error").text("");
	}
});

var idArray = $.makeArray($('.validate').map(function() {
	return this.id;
}));
//	console.log(idArray);
//	submit validation
var validation = true;

$('#submit1').click(function(event) {
	validation = true;
	$.each(idArray, function(i, val) {
		var value = $("#" + idArray[i]).val();
		var placeholder = $("#" + idArray[i]).attr('placeholder');
		if (value == null || value == "" || value == "undefined") {
			$('style').append(styleBlock);
			$("#" + idArray[i] ).attr("placeholder", placeholder);
			$("#" + idArray[i] ).css('border-color','#e73d4a');
			$("#" + idArray[i] ).css('color','#e73d4a');
			$("#" + idArray[i] ).addClass('placeholder-style your-class');
//			$("#" + idArray[i] + "Error").text("Please " + placeholder);
			validation = false;
		} 
	});
	var validPwd = validatePassword();
	if(!validPwd){
		//return false;
		validation = false;
	}
	if($('#aboutMyself').val() ==  null || $('#aboutMyself').val().trim() == "" || $('#aboutMyself').val()=="undefined"){
		
		$('#aboutMyself').css('border-color','red');
		$('#aboutMyself').css('color','#cc0000');
		$('#aboutMyself').addClass('your-class');
		$('#errorMsg').text("Enter some text..");
		validation = false;
		//return false;
	}
	var abtMySelfLen =$("#aboutMyself").val().trim().length;
	if(abtMySelfLen < 50){
		$('#errorMsg').text("Enter minimum 50 charecters...");
		validation = false;
		//return false;
	}else{
		$('#errorMsg').text("");
	}
	if($('#mobile').val().trim().length<10){
		$('#mobileError111').text("Please enter a valid mobile number.");
		validation = false;
		return false;
		event.preventDefault();
	}else{
		$('#mobileError111').text("");
	}
	//mobile  number duplicate check
	/*event.preventDefault();
	var formData = new FormData();
    formData.append('mobile', $("#mobile").val());
    formData.append('id', $("#id").val());
    var actionStr = "../mobileNumChecking";
    var nextPage = "${pageName}";
    if(nextPage!=null && nextPage!="" && nextPage!="undefined"){
   	 actionStr = "../../../mobileNumChecking";
    }
	$.fn.makeMultipartRequest('POST', actionStr, false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		if(jsonobj.msg =="exist"){
			//error message write
			$('#mobileError111').text("Mobile number already in Use. Please Try Another.");
			mobileExists = true;
			validation = false;
			return false;
		}else{
			$('#mobileError111').text("");
			mobileExists = false;
		}
	});*/
	
	//var exists = isMobileNumDuplicate();
	/*if(mobileExists){
		$('#mobileError111').text("Mobile number already in Use. Please Try Another.");
		
		validation = false;
	}*/
	if(mobileExists){
		$('#mobileError111').text("Mobile number already in Use. Please Try Another.");
	}else{
		$('#mobileError111').text("");
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
		validation = false;
	}else if(heightFrom > heightTo){
		alert("Sorry, Invalid Height range");
		validation = false;
	}
	
	if(validation && emailExist && !mobileExists) {
		$("#submit1").attr("disabled",true);
		$("#submit1").val("Please wait...");
		$("form").submit();											
		event.preventDefault();
	}else {
		return false;
		event.preventDefault();
	}
});

function validatePassword(){
	
	
	   var str = $("#regPassword").val();
	   var upper_text= new RegExp('[A-Z]');
	   var lower_text= new RegExp('[a-z]');
	   var number_check=new RegExp('[0-9]');
	   var special_char= new RegExp('[!/\'^£$%&*()}{@#~?><>,|=_+¬-\]');
	   
	   var upper_text_flag = false;
	   var lower_text_flag = false;
	   var number_check_flag = false;
	   var special_char_flag = false;
	   var min_length_flag = false;
	   if(str.match(upper_text) || str.match(lower_text)){
		 upper_text_flag = true;
		 $("#password_error_div").html('');
		$("#password_error_div").attr("hidden",true);
	   }else{
		   $("#password_error_div").html('');
		   $("#password_error_div").html('Enter atleast one alphabet letter');
		   $("#password_error_div").removeAttr("hidden");
		   return false;  
	   }
	 
	   /* if(str.match(lower_text)){
		   lower_text_flag = true;
	  		 $("#password_error_div").html('');
	   		$("#password_error_div").attr("hidden",true);
	   }else{
		   $("#password_error_div").html('');
		   $("#password_error_div").html('Enter atleast one lowercase letter');
		   $("#password_error_div").removeAttr("hidden");
		   return false;  
	   } */
	   
	   if(str.match(number_check)){
		   number_check_flag = true;
		 	$("#password_error_div").html('');
	   		$("#password_error_div").attr("hidden",true);
	   }else{
		   $("#password_error_div").html('');
		   $("#password_error_div").html('Enter atleast one number');
		   $("#password_error_div").removeAttr("hidden");
		   return false;  
	   }
	   
	   if(str.match(special_char)){
		   special_char_flag = true;
		 	$("#password_error_div").html('');
	   		$("#password_error_div").attr("hidden",true);
	   }else{
		   $("#password_error_div").html('');
		   $("#password_error_div").html('Enter atleast one special character');
		   $("#password_error_div").removeAttr("hidden");
		   return false;  
	   }
	   
	   if(str.trim().length>=8){
		   min_length_flag = true;
			 $("#password_error_div").html('');
	   		$("#password_error_div").attr("hidden",true);
	   }else{
		   $("#password_error_div").html('');
		   $("#password_error_div").html('Should contain minimum 8 characters');
		   $("#password_error_div").removeAttr("hidden");
		   return false;  
	   }
	   //$("#regPassword").val(str);
	   return true; 
  }

//remove border validation for edit-form
$(".editIt").click(function()
{
	$.each(idArray, function(i, val)
	{
		$("#"+idArray[i]).css('border-color','');
		$("#"+idArray[i]).css('color','black');
		$("#"+idArray[i]).removeClass('placeholder-style your-class default-class');
		if ($("#" + idArray[i]+"_chosen").length)
		{
			$("#" + idArray[i]+"_chosen").children('a').css('border-color','black');
		}
	});
});

//reset-form
$(".cancel").click(function()
{
	$("#id").val(0);
	$.each(idArray, function(i, val)
	{
		var value = $("#" + idArray[i]).val();
		if ($("#" +idArray[i]+"_chosen").length)
		{
			$("#" +idArray[i]).val("");
			$("#" +idArray[i]).trigger("chosen:updated");
		}
//		$("form")[0].reset();
		$("#"+idArray[i]).val('');
		$("#"+idArray[i]).css('border-color','');
		$("#"+idArray[i]).css('color','black');
		$("#"+idArray[i]).removeClass('placeholder-style your-class default-class');
		if ($("#" + idArray[i]+"_chosen").length)
		{
			$("#" + idArray[i]+"_chosen").children('a').css('border-color','black');
		}
	});
});

//
$('.validate').keydown(function() {
	var id = $(this).attr('id');
	removeBorder(id);
});
//remove borders
function removeBorder(el){	
	  $("#"+el).css("border", "");
	  $("#"+el).css('color','black');
	  $('#'+el).addClass('default-class');
	  if ($("#" + el+"_chosen").length)
		{
			$("#" +el+"_chosen").children('a').css('border-color','black');
		}
}



$(".mobile").keydown(function (e) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [8, 9, 27, 13]) !== -1 ||
         // Allow: Ctrl+A, Command+A
        (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
         // Allow: home, end, left, right, down, up
        (e.keyCode >= 35 && e.keyCode <= 40)) {
             // let it happen, don't do anything
             return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
});

