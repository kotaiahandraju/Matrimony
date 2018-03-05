<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<%@page import="com.aurospaces.neighbourhood.bean.UsersBean"%>
<html>
<head>
<title>View Profiles</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script> -->
<!-- //for-mobile-apps -->
<link href="user/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="user/css/style-profile.css" rel="stylesheet" type="text/css" media="all" />
<link href="user/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<!-- js -->
<script src="user/js/jquery-1.11.1.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<!-- //js -->
<!-- start-smoth-scrolling -->
<!-- <script type="text/javascript" src="user/js/move-top.js"></script>
<script type="text/javascript" src="user/js/easing.js"></script>
<script type="text/javascript" src="user/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script src="user/js/menu_jquery.js"></script>
<link href='http://fonts.googleapis.com/css?family=Monda:400,700' rel='stylesheet' type='text/css'> -->
<!-- the jScrollPane script -->
<!-- <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
		<script type="text/javascript" id="sourcecode">
			$(function()
			{
				$('.scroll-pane').jScrollPane();
			});
		</script> -->
<!-- //the jScrollPane script -->
</head>
	
<body>
<%
UsersBean userBean = null;
if(session.getAttribute("cacheGuest") != null){
	userBean= (UsersBean)session.getAttribute("cacheGuest");
}
%>
<!-- top-header -->

<!-- top-header -->
<!-- logo-cart -->
<div class="header_top">
	<div class="container">
    <div class=" col-md-3">
		<div class="logo">
		 	<img src="user/images/logo1.jpg" class="img-responsive" >
	  </div>
      <div class="clearfix"></div>
      </div>
      
      <div class="col-md-4 ">
      <div class=" box_1 midfont">
		<p> <a href="#">Matches</a>  <span class="badge badge-notify">30</span>&nbsp;&nbsp;&nbsp;
        <a href="#">Search</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <a href="#">Inbox</a>  <span class="badge badge-notify">30</span></p>
        
        </div>      
      </div>
      
		<div class="col-md-5">
			<div class="cart box_1">
				<p>Dear, <%= userBean.getFirstName() %> <%= userBean.getLastName() %> | &nbsp;&nbsp;<a href="memberShipPage" >Upgrade</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="#" >Help</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="logoutHome" >Signout</a></p>
				<div class="clearfix"> </div>
			</div>				 
		</div>
        
        
        
	</div>
</div>
<!-- //logo-cart -->
<!------>
<div class="top_bg">
	
</div>
<div class="mega_nav">
	 <div class="container">
		 <div class="menu_sec">
		 <!-- start header menu -->
		<ul class="megamenu skyblue">
			<li class="active"><a class="color1" href="dashboard">Dashboard</a></li>
			<li><a class="color1" href="myProfile">My Profile</a></li>
            <li><a class="color1" href="myPhotos">My Photos</a></li>
            <li><a class="color1" href="searchProfiles">Search</a></li>
             <li><a class="color1" href="#">More</a></li>
		</ul> 
			<div class="clearfix"></div>
		 </div>
	  </div>
</div>
<!---->
<!-- products -->
	<div class="products">
		<div class="container">
			<div class="mid-grids">
            <div class="col-md-12">
            <h4>Hello <%= userBean.getFirstName() %>. <%= userBean.getLastName() %><span>(<%= userBean.getUsername() %>)</span></h4>
            </div>   
            
				<div class="col-md-3 products-grid-right">
					<div class="well">
                    <div class="row">
					<div class="col-md-5 ">
						<c:if test="${not empty cacheGuest.profileImage}">
							<img src="${cacheGuest.profileImage}" class="img-responsive thumbnail" style="margin-bottom:0;">
						</c:if>
						<c:if test="${empty cacheGuest.profileImage}">
							<img src="img/default.png" class="img-responsive thumbnail" style="margin-bottom:0;">
						</c:if>
                      
                      </div>	
                      
                      <div class="col-md-7" style="padding-left:0;" >
                      <div class="profiletable">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="EditUserProfile">Edit Profile</a></td>
  </tr>
   <tr>
    <td><a href="#">Manage Profile</a></td>
  </tr>
  <tr>
    <td><a href="#">Edit Preferrences</a></td>
  </tr>
  <tr>
    <td><a href="#">Privacy Options</a></td>
  </tr>
</table>
						</div>
                      </div>
                      
                      
                      
                    <div class="clearfix"></div>
                    </div>
                    </div>
                    
                    
                  <div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Inbox
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="receivedRequests">Invitations</a></td>
    <td><div class="badge pull-right">${cacheGuest.receivedInterestCount}</div></td>
  </tr>
</table>

				</div>
				
			</div>  
            
            
            <div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Accepted
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="acceptedRequests">Members</a></td>
    <td><div class="badge pull-right">${cacheGuest.acceptedInterestCount}</div></td>
  </tr>
</table>

				</div>
				
			</div>
                    
                    
             <div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						Sent
					</h4>
				</div>
				<div class="panel-body">
					
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><a href="sentRequests">Invitations</a></td>
    <td><div class="badge pull-right">${cacheGuest.sentInterestCount}</div></td>
  </tr>
</table>

				</div>
				
			</div>       
				</div>
             
                
                
                <div class="col-md-9 products-grid-left">
					<div class="panel panel-default">
			            <div class="panel-heading">
			            	Received Interest Requests
			            </div>
			            <form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form"   method="post">
		             		<form:hidden path="id" />
							<div class="panel-body" id="received_requests">
								
							</div>
							<div id="paginator"></div>
							<div id="table_footer"></div>
							
						</form:form>
					</div>
			
				</div>
                
                
                
                
                
              
			</div>  
            
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
<!-- //products -->
<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="col-md-3 footer-grid">
				<h6>About us</h6>
				<p>Suspendisse sed accumsan risus. Curabitur rhoncus, elit vel tincidunt elementum, nunc urna tristique nisi, in interdum libero magna .</p>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>Search</h6>
				<ul>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Terms &amp; Conditions</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>My Account</h6>
				<ul>
					<li><a href="#">My Account</a></li>
					<li><a href="#">My Profile</a></li>
					<li><a href="#">My Interest</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>Extras</h6>
				<ul>
					<li><a href="#">Login</a></li>
					<li><a href="#">Register</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="footer-copy">
		<p>© 2017. All rights reserved.</p>
	</div>

<!-- //footer -->
<input type="hidden" name="loc" id="loc" value="${baseurl }" />
<script src="js/ajax.js"></script>
<script src="js/common.js"></script>
<script src="js/jquery-asPaginator.js"></script>
<link rel="stylesheet" type="text/css" href="css/asPaginator.css">
<script type="text/javascript">
var total_items_count = ${total_records};
var page_size = ${page_size};
var roleid = ${cacheGuest.roleId};
var listOrders1 = ${reveivedRequests};
		paginationSetup(total_items_count);
		$("#paginator").asPaginator('enable');
		displayMatches(listOrders1,"received_requests",roleid,"receivedRequests");
		displayTableFooter(1);
function displayTable(listOrders) {
	$('#tableId').html('');
	var tableHead = '<table class="table table-hover table-nomargin table-bordered" >'
		+ '<thead><tr><th>UserName</th><th>Received On</th><th></th></tr></thead><tbody></tbody></table>';
	$('#tableId').html(tableHead);
	serviceUnitArray = {};
	if(listOrders==""){
		var tblRow = "<tr><td colspan='3' class='dataTables_empty'>No data available</td></tr>";
		$(tblRow).appendTo("#tableId table tbody");
		$("#table_footer").prop("hidden",true);
		$("#paginator").prop("hidden",true);
	}
	$.each(listOrders,function(i, orderObj) {
						serviceUnitArray[orderObj.id] = orderObj;
						var tblRow = "<tr>"
							+ "<td title='"+orderObj.fromName+"'><a href='#' onclick='fullProfile("+orderObj.id+")'>" + orderObj.fromName + "</a></td>"
							+ "<td title='"+orderObj.receivedOn+"'>" + orderObj.receivedOn + "</td>"
							+ "<td title=''><div id='accept"+orderObj.id+"'><a href='#' onclick='acceptRequest("+orderObj.id+",\"1\")'>Accept</a>&nbsp;|&nbsp;<a id='reject"+orderObj.id+"' href='#' onclick='rejectRequest("+orderObj.id+" \"0\")'>Reject</a></td>"
							+ "</tr >";
						$(tblRow).appendTo("#tableId table tbody"); 
					});
	/* $('#DataTables_Table_0').DataTable({
		dom: 'lBfrtip',
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
function fullProfile(profile_id){
	var roleId = ${cacheGuest.roleId};
	$("#id").val(profile_id);
	if(roleId==4){
		document.searchForm2.action = "memberShipPage"
	}else{
		document.searchForm2.action = "fullProfile"
	}
	//document.searchForm2.id = profile_id;
	
    document.searchForm2.target = "_blank";    // Open in a new window
    document.searchForm2.submit();             // Submit the page
    return true;
	
}
function displayTableFooter(page){
	var from_val = ((parseInt(page)-1)*page_size)+1;
	var to_val = parseInt(page)*page_size;
	if(to_val > total_items_count){
		to_val = total_items_count;
	}
	if(from_val>to_val){
		from_val = to_val;
	}
	$("#table_footer").html("Showing "+from_val+" to "+to_val+" of "+total_items_count+" records");
}
	
function paginationSetup(total_items_count) {
	  $('#paginator').asPaginator(total_items_count, {
        currentPage: 1,
        visibleNum: {
          0: 10,
          480: 3,
          960: 5
        },
        tpl: function() {
          return '<ul>{{first}}{{prev}}{{altLists}}{{next}}{{last}}</ul>';
        },
        components: {
          first: true,
          prev: true,
          next: true,
          last: true,
          altLists: true
        },
        onChange: function(page) {
           var formData = new FormData();
      	 formData.append("page_no",page);
      	formData.append("request_type","received");
  		$.fn.makeMultipartRequest('POST', 'interestRequestsPagination', false,
  				formData, false, 'text', function(data){
  			var jsonobj = $.parseJSON(data);
  			var requestsList = jsonobj.requestsList;
  			if(requestsList==""){
	    		/* 	$('#countId').html('');
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		 */	
	    		 	var str = '<div class="panel panel-default"><h6>No results found.</h6></div>';
	    		 	$('#tableId').html('');
	    		 	$('#tableId').html(str);
	    		 	$("#table_footer").prop("hidden",true);
	    			$("#paginator").prop("hidden",true);
	    		}else{
	    			paginationSetup(total_items_count);
	    			$("#paginator").asPaginator('enable');
	    			displayMatches(requestsList,"received_requests",roleid,"receivedRequests");
	    			$("#table_footer").removeAttr("hidden");
	    			$("#paginator").removeAttr("hidden");
	    			displayTableFooter(page);
	    		}
  			
  		});
          
        }
      });
}

function acceptRequest(requestId,flag){
	var formData = new FormData();
	formData.append("requestId",requestId);
	formData.append("accept_flag",flag);
	$.fn.makeMultipartRequest('POST', 'acceptRequest', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var msg = jsonobj.message;
		if(typeof msg != "undefined" ){
			if("success"==msg){
				if(flag==1){
					alert("Request accepted successfully");
					$("#accept"+requestId).html('');
					$("#accept"+requestId).html("Accepted");
				}else{
					alert("Request rejected successfully");
					$("#accept"+requestId).html('');
					$("#accept"+requestId).html("Rejected");
				}
				
				
			}else if("failed"==msg || "exception"==msg){
				alert("Some problem occured. Please try again.");
			}
		}
				
	});
}

</script>

</body>
</html>