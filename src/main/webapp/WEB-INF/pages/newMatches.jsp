<%@ include file="userCommonHeader.jsp"%>

<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"/>
<script src="${baseurl}/js/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />
<style>
	div .picstyle .watermarkcontent {
  position: absolute; /* Position the background text */
  top: -17px; /* At the bottom. Use top:0 to append it to the top */
  //background: rgb(0, 0, 0); /* Fallback color */
  //background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
  color: white; /* Grey text */
  width: 100%; /* Full width */
  padding: 10px; /* Some padding */
  transform: rotate(90deg);
//transform-origin: left top 0;
width : 0;
}
blockquote
{background:#f7f7f7;padding:15px;border:1px solid #eee;text-align:justify;position:relative;
font-weight:500;clear:both;}
blockquote {
    background: #f9f9f9;
    border-left: 1px solid #ccc;
    margin: 1.5em 10px;
    padding: 0.9em 17px;
    quotes: "\201C""\201D""\2018""\2019";
}
blockquote:before{color:#319604;position:absolute;line-height:1;font-size:10px;z-index:0;
transition:.2s ease-in;font-family:FontAwesome;left: -3px;
    top: -2px;font-style:normal;padding:5px;content:"\f10d";}
blockquote:after{content:"\f10e";position:absolute;font-size:10px;color:#319604;z-index:0;
font-family:FontAwesome;line-height:1;bottom:-4px;right:-3px;font-style:normal;transition:.2s ease-in;padding:7px;}
</style>

<div class="products">
	<div class="container" style="background: #FFF;">
	<div class="col-md-12">
<h4>New Matches</h4>
<p>Listed below are the new matches.</p><p> <input type="checkbox" id="withPhoto" onchange="getMatchesBasedOnCheckboxes()"/>  Show profiles with photo  &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="alreadyViewed" onchange="getMatchesBasedOnCheckboxes()" /> Don't show already viewed &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox"  id="alreadyContacted" onchange="getMatchesBasedOnCheckboxes()" /> Don't show already contacted
</p>
</div><div class="clearfix" style="margin-bottom:5px;"></div>
		<div class="mid-grids">
		
 			  <jsp:include page="sideGridForResults.jsp" />
			<div id="dial1"></div>
			<div class="col-md-9 products-grid-left">
            	<div class="panel ">
					<div class="panel-heading"><b> New Matches</b> <span class="pull-right"><input type="checkbox" id="selectAllRequest"> Select All &nbsp; <a onclick="requetAllExpressInterest();" href="#">Send Interest to selected</a></span></div>
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
							<div class="clearfix"></div><br>
							
							</div>
						</form:form>
				</div></div>
                         
					</div>
					<%-- <div class="col-md-2">
					 <jsp:include page="sideGridForMatches.jsp" /></div> --%>
		
<script type="text/javascript">

var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = "${allowed_profiles_limit}";
if(allowed_limit=="unlimited"){
	allowed_limit = "1";
	allowed_limit = parseInt(allowed_limit);
}
 var listOrders1 = ${allOrders1};
 
if (listOrders1 != "" && listOrders1 != null) {
	paginationSetup(total_items_count);
	$("#altLists").asPaginator('enable');
	displayMatches_matches(listOrders1,"newMatches");
	displayTableFooter(1);
}else if (listOrders1 == null) {
	$('#search_criteria').removeAttr("hidden");
	$('#searchResults').html('');
	$("#searchresultsDiv").prop("hidden",true);
}else{
	$('#countId').html('0');
	var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No results found..!</h6></div>';
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
	    			displayMatches(filtered_profiles);
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
			displayMatches(results);
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
          itemsPerPage: 10,
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
        	 
        	 formData.append("page_no",page);
        	 formData.append("request_from","newmatches");
        	 /////
        	 	var with_photo = $("#withPhoto").prop("checked");
				var already_viewed = $("#alreadyViewed").prop("checked");
				var already_contacted = $("#alreadyContacted").prop("checked");
				
				formData.append('withPhoto',with_photo);
				formData.append('alreadyViewed',already_viewed);
				formData.append('alreadyContacted',already_contacted);
        	 ////
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
	    			displayMatches_matches(results,"newMatches");
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
							formData.append("request_from", "newmatches");
							
							var with_photo = $("#withPhoto").prop("checked");
							var already_viewed = $("#alreadyViewed").prop("checked");
							var already_contacted = $("#alreadyContacted").prop("checked");
							
							formData.append('withPhoto',with_photo);
							formData.append('alreadyViewed',already_viewed);
							formData.append('alreadyContacted',already_contacted);
							
							formData.append("rCaste", $("#caste").val());
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
									    			displayMatches_matches(results,"newMatches");
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

function getMatchesBasedOnCheckboxes(){
	var with_photo = $("#withPhoto").prop("checked");
	var already_viewed = $("#alreadyViewed").prop("checked");
	var already_contacted = $("#alreadyContacted").prop("checked");
	
	var formData = new FormData();
	formData.append('withPhoto',with_photo);
	formData.append('alreadyViewed',already_viewed);
	formData.append('alreadyContacted',already_contacted);
	$.fn.makeMultipartRequest('POST', 'newMatchesAjaxAction', false,
			formData, false, 'text', function(data){
    		var jsonobj = $.parseJSON(data);;
    		var total_records = jsonobj.total_records;
    		var newMatches = jsonobj.new_matches;
    		total_items_count = total_records;
    		if(newMatches==""){
    			
    			var str = '<div class="alert alert-danger" style="margin-bottom: 0px;padding: 5px;"><h6>No matches found..!</h6></div>';
    			$('#searchResults').html('');
    			$(str).appendTo("#searchResults");
    			$("#table_footer").prop("hidden",true);
    			$("#altLists").prop("hidden",true);
    		}else{
    			$("#altLists").asPaginator('destroy');
    			paginationSetup(total_records);
    			$("#altLists").asPaginator('enable');
    			displayMatches_matches(newMatches,"newMatches");
    			$("#table_footer").removeAttr("hidden");
    			$("#altLists").removeAttr("hidden");
    			displayTableFooter(1);
    			
    		}
    		
    		
	});
	
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
	$("#caste").select2({
		placeholder : "-- Select Caste --",
		allowClear : true
	});
	//populate city dropdown
	var city_map = ${all_cities};
	  $.each(city_map,function(key, value) {
				$("#city").append("<option value="+key+" >"+ value+ "</option>");
			}); 
	
	//populate castes dropdown
		var castes_map = ${all_castes};
		  $.each(castes_map,function(key, value) {
					$("#caste").append("<option value="+key+" >"+ value+ "</option>");
				}); 
	
});

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
		
		formData.append("rCaste", $("#caste").val());
		formData.append("rCity", $("#city").val());
		formData.append("rAgeFrom", $("#age_from").val());
		formData.append("rAgeTo", $("#age_to").val());
		
		formData.append("page_no", page);
		formData.append("request_from", "newmatches");
		
		var with_photo = $("#withPhoto").prop("checked");
		var already_viewed = $("#alreadyViewed").prop("checked");
		var already_contacted = $("#alreadyContacted").prop("checked");
		
		formData.append('withPhoto',with_photo);
		formData.append('alreadyViewed',already_viewed);
		formData.append('alreadyContacted',already_contacted);
		
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
						var str = '<div class="alert alert-danger ban"><h6>No matches found..!</h6></div>';
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
		    			displayMatches_matches(results,"newMatches");
		    			$("#table_footer").removeAttr("hidden");
		    			$("#altLists").removeAttr("hidden");
		    			displayTableFooter(1);
		    			addWaterMark();
					}
		});
}

$(".newMatches").addClass("active");
</script>
<script>
$(".open-button").on("click", function() {
	  $(this).closest('.collapse-group').find('.collapse').collapse('show');
	});

	$(".close-button").on("click", function() {
	  $(this).closest('.collapse-group').find('.collapse').collapse('hide');
	});
	$("#selectAllRequest").on("click", function() {
		
// 		 $(".form-check-input").attr('checked', this.checked);
		 
		 if ($(this).prop("checked")==true) {
         $('.yet-to-send').prop('checked', true);
       } else {
         $('.yet-to-send').prop('checked', false);
       }
	});
	
	
</script>
<%@ include file="userFooter.jsp"%>