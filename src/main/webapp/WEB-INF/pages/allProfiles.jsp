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
<!-- <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" /> -->
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
							var edit = "<a title='Edit Profile' onclick='editProfile("+ orderObj.id+ ")'><i style='color: green;' class='fa fa-edit'></i></a>"
							var deleterow = "<a title='Delete Profile' onclick='deleteProfile("+ orderObj.id+ ",2)'><i style='color: red;' class='fa fa-trash' ></i></a>"
							var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>"
							var inactive = "<a title='Inactive Profile' onclick='deleteProfile("+ orderObj.id+ ",0)'><i style='color: blue;' class='fa fa-eye'></i></a>"
							/* var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>"
							var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>"
							var viewProfile = "<a title='View Profile' onclick='viewProfile("+ orderObj.id+ ")'><i style='color: blue;' class='fa fa-eye'></i></a>" */
							serviceUnitArray[orderObj.id] = orderObj;
							var tblRow = "<tr >"
									+ "<td title='"+orderObj.username+"'>" + orderObj.username + "</td>"
									+ "<td title='"+orderObj.name+"'>" + orderObj.name + "</td>"
									+ "<td title='"+orderObj.sname+"'>" + orderObj.sname + "</td>"
									+ "<td style='text-align: center;' >" + edit + "&nbsp;|&nbsp;" + viewProfile + "&nbsp;|&nbsp;" + deleterow + "&nbsp;|&nbsp;" + inactive + "</td>" 
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
	 
// 	 Occupation :	 "46"	 Religion	 :	 "1"	 SubCaste	 :	 "xvcxv"	 aboutFamily	 :	 "xcx"	 aboutYourself	 :	 "zxczxc"	 ageGap	 :	 "xxcxc"
// 	 branch	 :	 "1"	 branchName	 :	 "Guntur"	 cast	 :	 "9"	 castname	 :	 "Goud"	 cm	 :	 "139"	 complexion	 :	 "6"	 complexionName	 :	 "Medium"
// 	 country	 :	 null	 countryName	 :	 null	 crCountry	 :	 "3"	 created_by	 :	 "xcvxv"	 created_time	 :	 "2017-10-06 16:16:42.0"
// 	 currentCountry	 :	 "Australia"	 dob	 :	 "2017-10-06"	 education	 :	 "4"	 educationDetails	 :	 ""	 educationInfo	 :	 ""	 
// 	 educationName	 :	 "B.Com"	 email	 :	 "andraju.kotaiah@gmail.com"	 email2	 :	 ""	 emply_type	 :	 null	 executiveName	 :	 "xcvxcv"
// 	 fatherEducation	 :	 "M.Tech"	 fatherOccupation	 :	 "Government"	 feducation	 :	 "2"	 ffName	 :	 ""	 fname	 :	 "xcxcv"
// 	 fnativeAddress	 :	 "xvxcv"	 foDetails	 :	 ""	 foccupation	 :	 "20"	 gender	 :	 "Male"	 gotram	 :	 "zxczcx"	 height	 :	 "3"
// 	 id	 :	 "2756"	 inches	 :	 "4'7"	 landLine	 :	 ""	 languageName	 :	 "hhh"	 last_ip	 :	 "0:0:0:0:0:0:0:1"	 last_login	 :	 "2017-10-06 16:16:42.0"
// 	 maritalStatus	 :	 "Unmarried"	 meducation	 :	 "4"	 mfName	 :	 "zxczxc"	 mname	 :	 "zxczxc"	 mnativeAddress	 :	 "zxczxc"	 moDetails	 :	 ""
// 	 mobile	 :	 "9999999999999"	 moccupation	 :	 ""	 motherEducation	 :	 "B.Com"	 motherOccupation	 :	 null	 mstatus	 :	 null
// 	 mtongue	 :	 "zxzxc"	 name	 :	 "xcvxv"	 ncitizenOf	 :	 "3"	 nriCitizenOf	 :	 "Australia"	 occupationDetails	 :	 "xcxc"
// 	 occupationName	 :	 "Any"	 padam	 :	 ""	 password	 :	 ""	 phone1	 :	 null	 phone2	 :	 ""	 pob	 :	 "xvxcv"	 presentAddress	 :	 "xvcxz"
// 	 profile_pic_status	 :	 null	 property	 :	 "xcxc"	 rComplexion	 :	 "6"	 rHeightFrom	 :	 "18"	 rHeightTo	 :	 "17"	 raasi	 :	 "7"
// 	 raasiName	 :	 "Karkataka "	 register_with	 :	 null	 requiredComplexion	 :	 "Medium"	 requiredHeightFrom	 :	 "5'9"	 requiredHeightTo	 :	 "5'8"
// 	 requiredOccupation	 :	 "Housewife"	 role_id	 :	 "4"	 rolename	 :	 "Free Profile"	 rprofession	 :	 "45"	 sLanguages	 :	 "7"	 salaryperMonth	 :	 ""
// 	 salaryperyear	 :	 ""	 sibilings	 :	 "czxc"	 sinceWorking	 :	 "xcxc"	 sname	 :	 "xcvxcv"	 star	 :	 "4"	 starName	 :	 "Aslesha"
// 	 status	 :	 null	 stayingSince	 :	 ""	 tob	 :	 "0000-00-00"	 udcreated_time	 :	 "2017-10-06 16:16:42.0"	 udupdated_time	 :	 "2017-10-06 16:16:42.0"
// 	 updated_time	 :	 "2017-10-06 16:16:42.0"	 userId	 :	 "2756"	 userdetailsId	 :	 "21"	 username	 :	 "VMB3002756"	 visaType	 :	 ""	 
// 	 visaValidity	

	 var tblRow = "<div>"
			+"<table>"
			+"<tr>"
			+	"<td><h3 style='text-align: left;'>GST No: 3EDTLNU564FL6KD</h3></td>"
			+	"<td class='bgcolor'><h5>INVOICE</h5></td>"
			+	"<td><h4>PAN No: 3EDTLNU564FL6KD</h4></td>"
			+"</tr>"
			+"</table>"
			+"<address style='float: left;width: 50% !important;'>"
			+	"<span><p>Customer Details</p></span><span style='text-decoration: none;'><p style='float: left;'>"+customerAddress+"</p></span>"
			+"</address>"
			+"<table class='meta'>"
			+	"<tr><th><span >Invoice #</span></th><td style=''><span>"+invoiceName+"</span></td></tr>"
			+	"<tr><th><span >Invoice Date</span></th><td style=''><span>"+invoiceDate+"</span></td></tr>"
			+	"<tr><th><span >Party Pan #</span></th><td style=''><span>"+partyPan+"</span></td></tr>"
			+	"<tr><th><span >Party GST #</span></th><td style=''><span>"+partyGst+"</span></td></tr>"
			+	"<tr><th><span >Party State</span></th><td style=''><span>"+partyState+"</span></td></tr>"
			+"</table>"
			+"<table class='inventory'><thead>"
			+"<tr>"
			+	"<th rowspan='2' style='width:20px'><span>Sl.<br/>No</span></th>"
			+	"<th rowspan='2' style='width:200px'><span>Product Description</span></th>"
			+	"<th rowspan='2'><span>HSE/SAC Code</span></th>"
			+	"<th rowspan='2'><span>Qty</span></th>"
			+	"<th rowspan='2'><span>Unit</span></th>"
			+	"<th rowspan='2'><span>Rate</span></th>"
			+	"<th rowspan='2'><span>Total Sale</span></th>"
			+	"<th rowspan='2'><span>Disc</span></th>"
			+	"<th rowspan='2'><span>Taxable<br>Value</span></th>"
			+	"<th colspan='2'><span>CGST</span></th>"
			+	"<th colspan='2'><span>SGST</span></th>"
			+	"<th colspan='2'><span>IGST</span></th>"
			+"</tr>"
			+"<tr>"
			+	"<th><span>%</span></th><th><span>Amt</span></th>"
			+	"<th><span>%</span></th><th><span>Amt</span></th>"
			+	"<th><span>%</span></th><th><span>Amt</span></th>"
			+"</tr></thead>"
			+"<tbody id='tableBodyId'>"
			
			+"</tbody>"
			+"<tfoot>"
			+	"<tr>"
			+		"<th colspan='6'><h3 align='right'>Total</h3></th>"
			+		"<th><span>"+totalInvoice+"</span></th>"
			+		"<th><span>"+totalDiscount+"</span></th>"
			+		"<th><span>"+totalTaxableValue+"</span></th>"
			+		"<th></th>"
			+		"<th><span>"+totalCgst+"</span></th>"
			+		"<th></th>"
			+		"<th><span>"+totalSgst+"</span></th>"
			+		"<th></th>"
			+		"<th><span>"+totalIgst+"</span></th>"
			+	"</tr>"
			+"</tfoot></table>"
			+"<table class='balance1'>"
			+"<tr><th><span>Remarks</span></th></tr>"
			+"<tr><td style='text-align: left;height: 55px;'><span style='width: 304px;'>"+remarks+"</span></td></tr>"
			+"<tr>"
			+	"<td style='text-align: left'><br /><br /><br /><br /><br /><br /><br /><span>Customer/'s Signature</span></td>"
			+	"<td style='text-align: left'><br /><br /><br /><br /><br /><br /><br /><span>Authorised Signature</span></td>"
		    +"</tr>"
		  	+"</table>"
		  	+"<table class='balance'>"
		  	+	"<tr><th><span>Total Invoice value</span></th><td><span>"+totalInvoice+"</span></td></tr>"
		    +	"<tr><th><span>Total Discounts</span></th><td><span>"+totalDiscount+"</span></td></tr>"
		    +	"<tr><th><span>Total Taxable value</span></th><td><span>"+totalTaxableValue+"</span></td></tr>"
		    +	"<tr><th><span>Total CGST</span></th><td><span>"+totalCgst+"</span></td></tr>"
		    +	"<tr><th><span>Total SGST</span></th><td><span>"+totalSgst+"</span></td></tr>"
		    +	"<tr><th><span>Total IGST</span></th><td><span>"+totalIgst+"</span></td></tr>"
		    +	"<tr><th><span>Grand Total</span></th><td><span>"+grandTotal+"</span></td></tr>"
//	 	    +	"<tr><th><span>Round Off</span></th><td><span></span></td></tr>"
		  	+"</table>"
	 
	 
	 $('#dial1').dialog({width:1199,height:600,modal: true}).dialog('open');
//	 	$(window).scrollTop($('.wrapper').offset().top);
//	 	$(".view_list").hide();
//	 	$('#view_list1').hide();
 }
 $(".profiles").addClass("active");
 $(".allProfiles").addClass("active"); 
</script>

</body>


<!-- Mirrored from www.eakroko.de/flat/forms-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 18 Sep 2017 09:43:06 GMT -->
</html>

