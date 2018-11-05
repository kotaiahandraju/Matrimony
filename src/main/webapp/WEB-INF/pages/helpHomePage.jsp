<%@ include file="userStepsHeader.jsp"%>
<%@ include file="homeMenu.jsp"%>
<div class="clearfix"></div>
<style>
.newimg {
float: right;
    margin-right: 20%;
}
@media  (min-width: 320px) and (max-width:640px) {
.newimg {
float: right;
    margin-right: 0% !important;
    margin-top:15px
}
}
.panel {
    border: 1px solid #e3e3e3;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
}
::placeholder {
color:#000;
}::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  color: pink !important;
}
::-moz-placeholder { /* Firefox 19+ */
  color: pink;
}
:-ms-input-placeholder { /* IE 10+ */
  color: pink;
}
:-moz-placeholder { /* Firefox 18- */
  color: pink;
}
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
</style>
<img src="nimages/help.jpg" class="img-responsive" />
<div class="container" style="background: white; padding-top: 25px;">
	<div class="container-fluid">
	<div class="col-md-8">
		<div class="panel ">
			<div class="panel-heading"><h4>Help</h4></div>
			<div class="panel-body" style="min-height: 295px;">

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
<img  src="nimages/secure.png" class="img-responsive newimg"/></div>

</div></div></div>
<div class="col-md-4 cha"><h4>Leave Message</h4>
         <form:form commandName="createProfile" action="#" method="post" class="login-form" style="min-height: 335px;">
			<div class="clearfix" style="padding-bottom: 8px;"></div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-user"></i></span> <form:input
						type="text" class="form-control validate"
						path="leaveMsgUserName" placeholder="Name"></form:input>
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<span class="input-group-addon"><i class="fa fa-lock"></i></span> <form:input
						type="email" class="form-control validate" 
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
					class="form-control validate" rows="2"></form:textarea>
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
		

			
		</div>
</div></div>
				<%@ include file="homeFooter.jsp"%> 