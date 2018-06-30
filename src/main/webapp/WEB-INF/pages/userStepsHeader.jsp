<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String baseurl =  request.getScheme() + "://" + request.getServerName() +      ":" +   request.getServerPort() +  request.getContextPath();
	session.setAttribute("baseurl", baseurl);
%>	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Aarna Matrimony">
    <meta name="author" content="Aarna Matrimony">

    <title>Aarna Matrimony</title>
    <link rel="shortcut icon" href="img/aarna-fav.png"/>

    <!-- Bootstrap core CSS -->
    <link href="${baseurl }/user/vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
           
    <script src="${baseurl }/user/js/ie-emulation-modes-warning.js"></script>
    <link href="${baseurl }/user/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${baseurl }/user/vendor/woocommerce-FlexSlider/flexslider.css" type="text/css" media="screen" />
    <link href="${baseurl }/user/css/style.css" rel="stylesheet">
    <link href="${baseurl }/user/css/custom.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${baseurl }/user/css/component.css" />
    <link rel="stylesheet" href="${baseurl }/css/plugins/select2/select2.css">
    <script src="${baseurl }/user/vendor/jquery/jquery.min.js"></script>
    <script src="${baseurl }/user/js/modernizr.custom.js"></script>
    
    <style type="text/css">
.dispnone
{
	display: none !important;
}
.hiddencss
{
	visibility: hidden;
}
body {
	background:#F1F1F2;
}
.container { background:#FFF;}
.ilogo { padding:15px 0; border-bottom:12px solid #F1F1F2 }
.control-label { text-align:left;}
.midcontnet { border-bottom:12px solid #F1F1F2; padding-bottom:40px; }


.your-class::-webkit-input-placeholder {color: #e73d4a !important;}
.your-class::-moz-placeholder {color: #e73d4a !important;}

.default-class::-webkit-input-placeholder {color: #e73d4a !important;}
.default-class::-moz-placeholder {color: #e73d4a !important;}


/* body{margin:40px;} */

.stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}

th,td {text-align: center;}

.multiSelect{
	width: 187px;
}
.manditory{color: red;}
</style>
<script>

function validate(id, errorMessage)
{
	var styleBlock = '.placeholder-style.placeholder-style::-moz-placeholder {color: #cc0000;} .placeholder-style::-webkit-input-placeholder {color: #cc0000;}';
	if($('#'+id).val() ==  null || $('#'+id).val() == ""  || $('#'+id).val()=="undefined" ) {
		$('style').append(styleBlock);
		$('#'+id).css('border-color','#cc0000');
		$('#'+id).css('color','#cc0000');
		$('#'+id).attr('placeholder',errorMessage);
		$('#'+id).addClass('placeholder-style your-class');
//			$('#'+id).css('color','#cc0000');
//			$('#'+id+'Error').text(errorMessage);
	}else{
		$('#'+id).css('border-color','');
		$('#'+id).removeClass('placeholder-style your-class');
//			$('#'+id).css('color','');
//			$('#'+id+'Error').text("");
	}
	
}

function getFilteredStatesMultiSelect(id){
	if($("#"+id).val()== null   || $('#'+id).val() == "" || $('#'+id).val()=="undefined"){
		$("#"+id).select2({
		    placeholder: "-- Choose Country --"
		});
		
	}else{
		var countryIds =$("#"+id).val();
		var formData = new FormData();
	     formData.append('country_ids', countryIds);
	     
	    $.fn.makeMultipartRequest('POST', 'getFilteredStates', false,
				formData, false, 'text', function(data){
			var jsonobj = $.parseJSON(data);
			var statesList = jsonobj.states_list;
         $("#rState").empty();
			$("#rState").append("<option value='' >-- Choose State --</option>");
			
			$.each(statesList, function(i, state) {
				$("#rState").append("<option value="+state.id+" >"+ state.name+"</option>");
			});
			
		});
		
	}
}

/* $('.validate').keydown(function() {
	var id = $(this).attr('id');
	removeBorder(id);
	
}); */
</script>
</head>
<body>
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<div class="container">
	<div class="row">
		<div class="ilogo">
			<div class="col-md-7 col-sm-12">
				<img src="images/logo.png" class="img-responsive">
			</div>