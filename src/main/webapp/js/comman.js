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