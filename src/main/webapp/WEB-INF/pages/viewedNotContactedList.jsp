<%@ include file="userCommonHeader.jsp"%>

<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"/>

<style>
blockquote {
  background: #f9f9f9;
  border-left: 10px solid #ccc;
  margin: 1.5em 10px;
  padding: 0.5em 10px;
  quotes: "\201C""\201D""\2018""\2019";
}
.smallSlides, .picstyle {
/* height:220px !important; */
overflow:hidden !important;
}
blockquote:before {
  color: #ccc;
  content: open-quote;
  font-size: 4em;
  line-height: 0.1em;
  margin-right: 0.25em;
  vertical-align: -0.4em;
}
blockquote p {
  display: inline;
}
p {
font-size:13px;

}
.matches1 {
border: 1px solid #d6d6d6;
background: #f1f1f1;
}
 .matches1 h4 {
background: #f1f1f1;
margin-left:15px;
font: bold 15px arial;
}
.Subl {
background-color: #FFF;
padding: 1px;
}
.on {
background-color: #F1F1F1;
margin: 3px;
padding: 6px 4px;
font-weight: bold;


}
.controls {
  margin-bottom: 10px;
}
.panel-title {
text-align:left;
}
.collapse-group {
 
  border: 1px solid darkgrey;
  margin-bottom: 10px;
}

.panel-title .trigger:before {
  content: '\e082';
  font-family: 'Glyphicons Halflings';
  vertical-align: text-bottom;
  margin-left:2px;
  float:right;
}

.panel-title .trigger.collapsed:before {
  content: '\e081';
}
.new {
margin-left:10px;
}</style>
<div class="products">
	<div class="container" style="background: #FFF;">
	<div class="col-md-12">
<h4>Viewed Not Contacted List</h4>
<p>Listed below are the profiles that you viewed but not contacted.</p><p> <input type="checkbox" id="withphotos" onclick="filterProfiles()"/>  Show profiles with photo   
</p>
</div><div class="clearfix" style="margin-bottom:5px;"></div>
		<div class="mid-grids">
		
			  
			<jsp:include page="sideGridForResults.jsp" />
			<div id="dial1"></div>
			<div class="col-md-9 products-grid-left">
            	<div class="panel panel-success">
					<div class="panel-heading">Viewed Not Contacted Profiles <span class="pull-right"><input type="checkbox" id="selectAllRequest"> Select All &nbsp; <a onclick="requetAllExpressInterest();" href="#">Send Interest to selected</a></span> </div>
					<div class="panel-body table-responsive">
						<form:form commandName="createProfile"  class="form-horizontal" id="searchForm2" name="searchForm2" role="form" method="post">
						<form:hidden path="id" />
							<div class="col-md-12">
							<div id="searchresultsDiv" style="font-size: 12px;">
								   <div id="searchResults">
										

									</div>       
							    <div id="table_footer"></div>
								<div id="altLists"></div>
							</div>
							<div class="clearfix"></div>
							
							</div>
						</form:form>
				</div></div>
                         
					</div>
			
			

<script type="text/javascript">

var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = "${allowed_profiles_limit}";
if(allowed_limit=="unlimited"){
	allowed_limit = "1";
	allowed_limit = parseInt(allowed_limit);
}
 var listOrders1 = ${viewedNotContactedList};
 
if (listOrders1 != "" && listOrders1 != null) {
	paginationSetup(total_items_count);
	$("#altLists").asPaginator('enable');
	displayMatches_matches(listOrders1);
	displayTableFooter(1);
}else if (listOrders1 == null) {
	$('#search_criteria').removeAttr("hidden");
	$('#searchResults').html('');
	$("#searchresultsDiv").prop("hidden",true);
}else{
	$('#countId').html('0');
	var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No profiles found..!</h6></div>';
	$('#searchResults').html('');
	$(str).appendTo("#searchResults");
	$('#search_criteria').prop("hidden",true);
	$("#searchresultsDiv").removeAttr("hidden");
}


/* function updateList(){
	var allVals = [];
    $("#castdiv :checked").each(function () {
        allVals.push($(this).val());
    });
    if(allVals!=""){
    	//alert(allVals);
    	var formData = new FormData();

    	formData.append('selected_casts',allVals);
    	jQuery.fn.makeMultipartRequest('POST', 'updateProfilesList', false,
    			formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var filtered_list = jsonobj.filtered_profiles;
	    		$('#countId').html('');
	    		if(filtered_list==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(filtered_list.length);
	    			displayMatches(filtered_list);
	    		}
    			
    		});
    }
	
}
$(function () {
    $("#castdiv input[name='caste']").click(updateList);
    updateList();
}); */
function updateProfilesList(){
	var castVals = [];
	var religionVals = [];
	var educationVals = [];
    $("#castdiv :checked").each(function () {
    	castVals.push($(this).val());
    });
    $("#religiondiv :checked").each(function () {
    	religionVals.push($(this).val());
    });
    $("#educationdiv :checked").each(function () {
    	educationVals.push($(this).val());
    });
   // if(allVals!=""){
    	//alert(allVals);
    	var formData = new FormData();

    	formData.append('selected_casts',castVals);
    	formData.append('selected_religions',religionVals);
    	formData.append('selected_educations',educationVals);
    	jQuery.fn.makeMultipartRequest('POST', 'updateProfilesList', false,
    			formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var filtered_profiles = jsonobj.filtered_profiles;
	    		var total_count = jsonobj.total_records;
	    		$('#countId').html('');
	    		$("#search_criteria").prop("hidden",true);
	    		$('#searchresultsDiv').removeAttr("hidden");
	    		if(filtered_profiles==""){
	    			$('#countId').html('0');
	    			var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    			$("#table_footer").prop("hidden",true);
	    			$("#altLists").prop("hidden",true);
	    		}else{
	    			$('#countId').html(total_count);
	    			total_items_count = total_count;
	    			paginationSetup(total_items_count);
	    			$("#altLists").asPaginator('enable');
	    			displayMatches_matches(filtered_profiles);
	    			displayTableFooter(1);
	    			$("#table_footer").removeAttr("hidden");
	    			$("#altLists").removeAttr("hidden");
	    		}
    			
    		});
}
   
$("#castdiv input[name='caste']").click(updateProfilesList);   
$("#religiondiv input[name='religion']").click(updateProfilesList);
$("#educationdiv input[name='education']").click(updateProfilesList);


function submitSearch(){
	var formData = new FormData();
	formData.append("username",$("#username").val());
	$.fn.makeMultipartRequest('POST', 'searchByIdAction', false,
			formData, false, 'text', function(data){
		var jsonobj = $.parseJSON(data);
		var results = jsonobj.results;
		total_items_count = jsonobj.total_records;
		$("#search_criteria").prop("hidden",true);
		$('#searchresultsDiv').removeAttr("hidden");
		if(results==""){
			$('#countId').html('0');
			var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
			$('#searchResults').html('');
			$(str).appendTo("#searchResults");
			$("#table_footer").prop("hidden",true);
			$("#altLists").prop("hidden",true);
		}else{
			$('#countId').html('');
			$('#countId').html(total_items_count);
			paginationSetup(total_items_count);
			$("#altLists").asPaginator('enable');
			displayMatches_matches(results);
			$("#table_footer").removeAttr("hidden");
			$("#altLists").removeAttr("hidden");
			displayTableFooter(1);
		}
		
	});
}
	//$("#searchForm2").submit();
	
//}

   
/* $("#castdiv input[name='caste']").click(function(){
	var allVals = [];
    $("#castdiv :checked").each(function () {
        allVals.push($(this).val());
    });
   // if(allVals!=""){
    	//alert(allVals);
    	var formData = new FormData();

    	formData.append('selected_casts',allVals);
    	jQuery.fn.makeMultipartRequest('POST', 'updateProfilesList', false,
    			formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);
	    		var filtered_list = jsonobj.filtered_profiles;
	    		$('#countId').html('');
	    		if(filtered_list==""){
	    			$('#countId').html('0');
	    			var str = '<div class="panel panel-default"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    		}else{
	    			$('#countId').html(filtered_list.length);
	    			displayMatches(filtered_list);
	    		}
    			
    		});
   // }
}); */



/* $(".more").click(function(){
	$(".hideMe").hide();
	$(".ifMore").show();
}); */

function showMoreDetails(thisObj){
	//$("#hideMe"+id).prop("hidden",true);
	var isHidden = $(".showMore").prop("hidden");
	if(isHidden){
		$(".showMore").removeAttr("hidden");
		thisObj.innerHTML="hide...";
	}else{
		$(".showMore").prop("hidden",true);
		thisObj.innerHTML="read more...";
	}
	
	
}

/* function viewMobileNumber(profile_id){
	var formData = new FormData();
	formData.append('profile_id',profile_id);
	jQuery.fn.makeMultipartRequest('POST', 'viewMobileNumber', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);
    		
    		
	});
} */


function fullProfile(profile_id){
	$("#id").val(profile_id);
    document.searchForm2.action = "fullProfile"
    document.searchForm2.target = "_blank";    // Open in a new window
    document.searchForm2.submit();             // Submit the page
    return true;
}


function paginationSetup(total_items_count) {
	  $('#altLists').asPaginator(total_items_count, {
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
             //$("#page_no").val(page);
             //var search_form = $("#searchForm2");
        	 //var formData = $("#searchForm2 :input").serialize();
        	 //var t = $("#rAgeFrom").val();
        	 //var formData = $("#searchForm2").serialize();
        	 var castVals = [];
			var religionVals = [];
			var educationVals = [];
		    $("#castdiv :checked").each(function () {
		    	castVals.push($(this).val());
		    });
		    $("#religiondiv :checked").each(function () {
		    	religionVals.push($(this).val());
		    });
		    $("#educationdiv :checked").each(function () {
		    	educationVals.push($(this).val());
		    });
        	 var formData = new FormData();
        	 formData.append("username",$("#username").val());
        	 /* formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val());
        	 formData.append("rAgeFrom",$("#rAgeFrom").val()); */
        	 formData.append("page_no",page);
        	 formData.append("request_from","viewednotcontacted");
        	 //var tempData = $("#searchForm2").serialize();
        	  var with_photo = $("#withphotos").prop("checked");
        	 formData.append('withPhoto',with_photo);
    		$.fn.makeMultipartRequest('POST', 'displayPage', false,
    				formData, false, 'text', function(data){
    			var jsonobj = $.parseJSON(data);
    			var results = jsonobj.results;
    			//$('#countId').html('');
	    		$("#search_criteria").prop("hidden",true);
	    		$('#searchresultsDiv').removeAttr("hidden");
	    		if(results==""){
	    			$('#countId').html('');
	    			$('#countId').html('0');
	    			var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    			$("#table_footer").prop("hidden",true);
	    			$("#altLists").prop("hidden",true);
	    		}else{
	    			paginationSetup(total_items_count);
	    			$("#altLists").asPaginator('enable');
	    			displayMatches_matches(results,"viewedNotContactedList");
	    			$("#table_footer").removeAttr("hidden");
	    			$("#altLists").removeAttr("hidden");
	    			displayTableFooter(page);
	    		}
    			
    		});
            
          }
        });
}
var clicked_link;
function paginationSetupForSideGrid(total_items_count) {
	$('#altLists')
			.asPaginator(
					total_items_count,
					{
						currentPage : 1,
						visibleNum : {
							0 : 10,
							480 : 3,
							960 : 5
						},
						tpl : function() {
							return '<ul>{{first}}{{prev}}{{altLists}}{{next}}{{last}}</ul>';
						},
						components : {
							first : true,
							prev : true,
							next : true,
							last : true,
							altLists : true
						},
						onChange : function(page) {
							var formData = new FormData();
							
							formData.append("page_no", page);
							formData.append("request_from", "viewednotcontacted");
							
							var with_photo = $("#withPhoto").prop("checked");
							//var already_viewed = $("#alreadyViewed").prop("checked");
							//var already_contacted = $("#alreadyContacted").prop("checked");
							
							formData.append('withPhoto',with_photo);
							//formData.append('alreadyViewed',already_viewed);
							//formData.append('alreadyContacted',already_contacted);
							
							formData.append("rCity", $("#city").val());
							formData.append("rAgeFrom", $("#age_from").val());
							formData.append("rAgeTo", $("#age_to").val());
							
							if(clicked_link=="day"){
								formData.append("with_in_day", "true");
							}else if(clicked_link=="week"){
								formData.append("with_in_week", "true");
							}else if(clicked_link=="month"){
								formData.append("with_in_month", "true");
							}else if(clicked_link=="all"){
								formData.append("all", "true");
							}else if(clicked_link=="photo"){
								formData.append("with_photo", "true");
							}
							
							$.fn
									.makeMultipartRequest(
											'POST',
											'displayPage',
											false,
											formData,
											false,
											'text',
											function(data) {
												var jsonobj = $
														.parseJSON(data);
												var results = jsonobj.results;
												//$('#countId').html('');
												$("#search_criteria").prop(
														"hidden", true);
												$('#searchresultsDiv')
														.removeAttr(
																"hidden");
												if (results == "") {
													$('#countId').html('');
													$('#countId').html('0');
													var str = '<div class="alert alert-danger ban"><h6>No results found..!</h6></div>';
													$('#searchResults')
															.html('');
													$(str)
															.appendTo(
																	"#searchResults");
													$("#table_footer")
															.prop("hidden",
																	true);
													$("#altLists").prop(
															"hidden", true);
												} else {
													
													paginationSetupForSideGrid(total_items_count);
									    			$("#altLists").asPaginator('enable');
									    			displayMatches_matches(results,"viewedNotContactedList");
									    			$("#table_footer").removeAttr("hidden");
									    			$("#altLists").removeAttr("hidden");
									    			displayTableFooter(page);
									    			addWaterMark();
												}

											});

						}
					});
}
//displayPagination();
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

function hideChildren() {
	 var maritalStatus=$("#rMaritalStatus").val();
	 if(maritalStatus == "Unmarried"){
		 $("#haveChildrenId").hide();
		 $("#haveChildren").val();
	 }else{
		 $("#haveChildrenId").show();
	 }
	}
$(document).ready(function(){
	var selected_values = "${createProfile.rMaritalStatus}";
    $("#rMaritalStatus").val(selected_values.split(","));
    
    selected_values="";
    selected_values = "${createProfile.rCaste}";
    $("#rCaste").val(selected_values.split(","));
    
    selected_values="";
    selected_values = "${createProfile.rState}";
    $("#rState").val(selected_values.split(","));
    
    selected_values="";
    selected_values = "${createProfile.rEducation}";
    $("#rEducation").val(selected_values.split(","));
    
    selected_values="";
	selected_values = "${createProfile.rReligion}";
	$("#rReligion").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rMotherTongue}";
	$("#rMotherTongue").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rCountry}";
	$("#rCountry").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rWorkingWith}";
	$("#rWorkingWith").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rOccupation}";
	$("#rOccupation").val(selected_values.split(","));
	
	selected_values="";
	selected_values = "${createProfile.rDiet}";
	$("#rDiet").val(selected_values.split(","));
	
	$("#city").select2({
		placeholder : "-- Select City --",
		allowClear : true
	});
	//populate city dropdown
	var city_map = ${all_cities};
	  $.each(city_map,function(key, value) {
				$("#city").append("<option value="+key+" >"+ value+ "</option>");
			}); 
});

$(".newMatches").addClass("active");
</script>
<script>
$(".open-button").on("click", function() {
	  $(this).closest('.collapse-group').find('.collapse').collapse('show');
	});

	$(".close-button").on("click", function() {
	  $(this).closest('.collapse-group').find('.collapse').collapse('hide');
	});
	
	function filterProfiles(){
		
		var with_photo = $("#withphotos").prop("checked");
		var formData = new FormData();
		formData.append('withPhoto',with_photo);
		$.fn.makeMultipartRequest('POST', 'viewedNotContactedAjaxAction', false,
				formData, false, 'text', function(data){
	    		var jsonobj = $.parseJSON(data);;
	    		var total_records = jsonobj.total_records;
	    		var viewedNotContactedList = jsonobj.viewedNotContactedList;
	    		total_items_count = total_records;
	    		if(viewedNotContactedList==""){
	    			
	    			var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No matches found..!</h6></div>';
	    			$('#searchResults').html('');
	    			$(str).appendTo("#searchResults");
	    			$("#table_footer").prop("hidden",true);
	    			$("#altLists").prop("hidden",true);
	    		}else{
	    			$("#altLists").asPaginator('destroy');
	    			paginationSetup(total_records);
	    			$("#altLists").asPaginator('enable');
	    			displayMatches_matches(viewedNotContactedList,"viewedNotContactedList");
	    			$("#table_footer").removeAttr("hidden");
	    			$("#altLists").removeAttr("hidden");
	    			displayTableFooter(1);
	    			
	    		}
		});
	}

	function submitMore(option_str){
		var page = 1;
			var formData = new FormData();
			
			if(option_str=="day"){
				formData.append("with_in_day", "true");
				clicked_link = "day";
			}else if(option_str=="week"){
				formData.append("with_in_week", "true");
				clicked_link = "week";
			}else if(option_str=="month"){
				formData.append("with_in_month", "true");
				clicked_link = "month";
			}else if(option_str=="all"){
				formData.append("all", "true");
				clicked_link = "all";
			}else if(option_str=="photo"){
				formData.append("with_photo", "true");
				clicked_link = "photo";
			}
			formData.append("rCity", $("#city").val());
			formData.append("rAgeFrom", $("#age_from").val());
			formData.append("rAgeTo", $("#age_to").val());
			
			formData.append("page_no", page);
			formData.append("request_from", "viewednotcontacted");
			
			var with_photo = $("#withPhoto").prop("checked");
			//var already_viewed = $("#alreadyViewed").prop("checked");
			//var already_contacted = $("#alreadyContacted").prop("checked");
			
			formData.append('withPhoto',with_photo);
			//formData.append('alreadyViewed',already_viewed);
			//formData.append('alreadyContacted',already_contacted);
			
			jQuery.fn.makeMultipartRequest('POST', 'displayPage', false,
					formData, false, 'text', function(data){
						var jsonobj = $.parseJSON(data);
						var results = jsonobj.results;
						total_items_count = jsonobj.total_records;
						//$('#countId').html('');
						$("#search_criteria").prop(
								"hidden", true);
						$('#searchresultsDiv')
								.removeAttr(
										"hidden");
						if (results == "") {
							//$('#countId').html('');
							//$('#countId').html('0');
							var str = '<div class="alert alert-danger ban"><h6>No profiles found..!</h6></div>';
							$('#searchResults')
									.html('');
							$(str)
									.appendTo(
											"#searchResults");
							$("#table_footer")
									.prop("hidden",
											true);
							$("#altLists").prop(
									"hidden", true);
						} else {
							//$('#countId').html('');
							//$('#countId').html(total_items_count);
							$("#altLists").asPaginator('destroy');
							paginationSetupForSideGrid(total_items_count);
			    			$("#altLists").asPaginator('enable');
			    			displayMatches_matches(results,"viewedNotContactedList");
			    			$("#table_footer").removeAttr("hidden");
			    			$("#altLists").removeAttr("hidden");
			    			displayTableFooter(1);
			    			addWaterMark();
						}
			});
	}
	
	$("#selectAllRequest").on("click", function() {
//		 $(".form-check-input").attr('checked', this.checked);
		 if ($(this).prop("checked")==true) {
	         $('.yet-to-send').prop('checked', true);
	       } else {
	         $('.yet-to-send').prop('checked', false);
	       }
	});

	
</script>
<%@ include file="userFooter.jsp"%>