function resetPassword(id){
	 var userObj = serviceUnitArray[id];
	 var firstName = userObj.firstName;
	 var lastName = userObj.lastName;
	 var username = userObj.username;
	 var email = userObj.email;
		var formData = new FormData();
	    formData.append('id', id);
	    formData.append('firstName', firstName);
	    formData.append('lastName', lastName);
	    formData.append('username', username);
	    formData.append('email', email);
	    //return false;
	    $.fn.makeMultipartRequest('POST', 'resetPassword', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			alert(jsonobj.message);
		});
 }

/*function profileStatusChange(id,statusId,statusName){
	var checkstr =  confirm('Are you sure you want to do this?');
	if(checkstr == true){
	var formData = new FormData();
     formData.append('status', statusId);
     formData.append('id', id);
     formData.append('statusName', statusName);
	$.fn.makeMultipartRequest('POST', 'updateStatus', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		alert(jsonobj.message);
		
		var alldata = jsonobj.allOrders1;
		console.log(jsonobj.allOrders1);
		displayTable(alldata);
	});
	}
	
}*/

function moveToHidden(id,statusName){
	var checkstr =  confirm('Are you sure you want to do this?');
	if(checkstr == true){
	var formData = new FormData();
     formData.append('id', id);
     formData.append('status', 3);
     formData.append('statusName', statusName);
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

function updateUserName(cityId){
	var id = 'username';
	var value=cityId;
	var constant ='u';
	var formData = new FormData();
    formData.append('id', id);
    formData.append('value', value);
    formData.append('constant', constant);
	$.fn.makeMultipartRequest('POST', 'updateUserName', false,
			formData, false, 'text', function(data){
		
	});
}