<%@ include file="userCommonHeader.jsp"%>

<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css"/>
<script src="js/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css" />

<style>
blockquote {
  background: #f9f9f9;
  border-left: 1px solid #ccc;
  margin: 1.5em 10px;
  padding: 0.5em 10px;
  quotes: "\201C""\201D""\2018""\2019";
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
.picstyle {
/* height:220px !important; */
overflow:hidden !important;
margin-bottom:5px;
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
<h4>New Matches</h4>
<p>Listed below are the new matches.</p><p> <input type="checkbox" id="withPhoto" onchange="getMatchesBasedOnCheckboxes()"/>  Show profiles with photo  <input type="checkbox" id="alreadyViewed" onchange="getMatchesBasedOnCheckboxes()" /> Don't show already viewed <input type="checkbox"  id="alreadyContacted" onchange="getMatchesBasedOnCheckboxes()" /> Don't show already contacted
</p>
</div><br><br><br>
		<div class="mid-grids">
		
			  
			<div class="col-md-3 products-grid-right">
			<div class="matches1"><h4>Matches</h4><div class="Subl">
			<p class="on">New Matches</p>
			<p class="new"><a href="" >Profiles yet to be viewed (${cacheGuest.yetToBeViewedCount})</a><br>

<a href="">Extended Matches</a><br>

<a href="">Profiles viewed & not</a><br>
<a href="">contacted (${cacheGuest.viewedNotContactedCount})</a><br>

<a href="">Members looking for me</a><br>

<a href="">Mutual Matches</a><br>

<a href="">Premium Members</a></p><br>
			</div></div>
		<br>
				
				
				
<div class="collapse-group">
  

  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" class="trigger collapsed">
        Show Profiles Created</a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
         <p> <a href=""> Within a day (27)</a><br>
    <a href=""> Within a week (181)</a><br>
    <a href=""> Within a month (582)</a></p>   </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" class="trigger">
          Active
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        Active Tab
      </div>
    </div>
  </div>
</div>

<div class="collapse-group">
  

  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree" class="trigger">
          Profile Type
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">
        <p> <a href="">  With Photo (323)
    </a><br>
    <a href=""> With Horoscope (225)</a><br>
    </p> 
      </div>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingFour">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour" class="trigger">
          Age
        </a>
      </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFour">
      <div class="panel-body">
      <div class="">
      <select name="" id="" style="width:;height:30px;" class="optiondiv" size="1">
      <option value="21">21</option><option value="22">22</option><option value="23" selected="selected">23</option>
      <option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option>
      <option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
      <option value="32">32</option><option value="33">33</option><option value="34">34</option><option value="35">35</option>
      <option value="36">36</option><option value="37">37</option><option value="38">38</option><option value="39">39</option>
      <option value="40">40</option><option value="41">41</option><option value="42">42</option><option value="43">43</option>
      <option value="44">44</option><option value="45">45</option><option value="46">46</option><option value="47">47</option>
      <option value="48">48</option><option value="49">49</option><option value="50">50</option><option value="51">51</option>
      <option value="52">52</option><option value="53">53</option><option value="54">54</option><option value="55">55</option>
      <option value="56">56</option><option value="57">57</option><option value="58">58</option><option value="59">59</option>
      <option value="60">60</option><option value="61">61</option><option value="62">62</option><option value="63">63</option>
      <option value="64">64</option><option value="65">65</option><option value="66">66</option><option value="67">67</option>
      <option value="68">68</option><option value="69">69</option><option value="70">70</option></select>&nbsp;&nbsp;to&nbsp;&nbsp;
      <select name="" id="" style="width:;height:30px;" class="optiondiv" size="1"><option value="18">18</option><option value="19">19</option>
      <option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option>
      <option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option>
      <option value="28">28</option><option value="29">29</option><option value="30" selected="selected">30</option>
      <option value="31">31</option><option value="32">32</option><option value="33">33</option><option value="34">34</option>
      <option value="35">35</option><option value="36">36</option><option value="37">37</option><option value="38">38</option>
      <option value="39">39</option><option value="40">40</option><option value="41">41</option><option value="42">42</option>
      <option value="43">43</option><option value="44">44</option><option value="45">45</option><option value="46">46</option>
      <option value="47">47</option><option value="48">48</option><option value="49">49</option><option value="50">50</option>
      <option value="51">51</option><option value="52">52</option><option value="53">53</option><option value="54">54</option>
      <option value="55">55</option><option value="56">56</option><option value="57">57</option><option value="58">58</option>
      <option value="59">59</option><option value="60">60</option><option value="61">61</option><option value="62">62</option>
      <option value="63">63</option><option value="64">64</option><option value="65">65</option><option value="66">66</option>
      <option value="67">67</option><option value="68">68</option><option value="69">69</option><option value="70">70</option>
      </select>&nbsp;&nbsp;Yrs<span class="errortext" id="ageerr"></span>&nbsp;&nbsp;<input class="" style="background: rgb(255, 255, 255) none repeat scroll 0% 0%; border-radius: 3px; color: rgb(2, 116, 203); font-weight: normal; font-size: 12px; margin-left: 0px; padding: 5px; margin-top: -2px; border: 1px solid rgb(214, 214, 214); line-height: 16px;cursor:pointer !important;" value="Submit" onclick="submitMore('age','')" type="button"></div>
        </div>
    </div>
  </div>
</div>
			</div>
			<div id="dial1"></div>
			<div class="col-md-9 products-grid-left">
            	<div class="panel panel-success">
					<div class="panel-heading">New Matches</div>
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
			
<script type="text/javascript">

var total_items_count = ${total_records};
var page_size = ${page_size};
var allowed_limit = ${allowed_profiles_limit};
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
</script>
<%@ include file="userFooter.jsp"%>