<%@ include file="userStepsHeader.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="user/css/demo.css" type="text/css" media="screen" />
<link rel="stylesheet" href="user/css/flexslider.css" type="text/css" media="screen" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
.btn-default {
  color: #333333;
  background-color: #ddd;
  border-color: #cccccc;
}
	</style>
	<br>
	
<div class="container-fluid">
    
		  <div class="modal-body">
      	<div class="searchresults">
									<div id="searchResults">
									</div>			
			
	</div></div></div>		
			<script type="text/javascript">
			
			var searchListOrders=${searchListOrders};
				displaydata(searchListOrders);
			
			 function displaydata(data) {
			    	
			        if(data == ""){
			           $('#searchResults').empty();	  
			                var tblHistory='<td colspan="7" style="text-align:center;">No History Found<span></span></td>';
			                $(tblHistory).appendTo("#searchResults");
			        }

			  	$.each(data,function(i, orderObj) {
			  		var profile_highlisht_str = '<div class="panel panel-default">';
			  		var highlight_option = orderObj.profile_highlighter;
			  		if(typeof highlight_option != "undefined" && highlight_option=='1'){
			  			profile_highlisht_str = '<div class="panel panel-default" style="background-color:skyblue">';
			  		}
			  		var image = orderObj.profileImage;
			  		if(typeof image == "undefined" || image=="" || image==null){
			  			image = "img/default.png";
			  		}
			  		var tblRow = profile_highlisht_str
			  		+ '<div class="panel-heading">'
			  		+ '<h5 class="panel-title" style="text-align:left;">'
			  		+ '<div class="form-check">	<label class="form-check-label"> <input type="checkbox" class="form-check-input" placeholder=""> '+orderObj.firstName+'&nbsp;'+orderObj.lastName+'</label>	<span class="pull-right">Created by '+orderObj.createProfileFor+'</span></div>'
			  		+ '</h5>'
			  		+ '</div>'
			  		+ '<div class="panel-body">'
			  		+ '<div class="col-md-2">' 
			  		+ '<a href="#" onclick="regFunction()">  <img src="'+image+'" class="img img-responsive thumbnail " style="margin-bottom:0;height: auto;width: 100%;"></a>'
			      	+ '</div>'
			      	 + '<div class="col-md-4">'
			       	 + '<h2 style="margin-top:10px;" class="pull-right"><a href="#" data-toggle="tooltip" data-placement="bottom" title="View Mobile Number" ><img style="margin-top:-10px;" src="images/Mobile_Icon.png"/></a></h2></span><div class="clearfix"></div><blockquote style="min-height:100px; max-height:120px; "><p>'+orderObj.About+'</p><br><a href="#" onclick="regFunction()"><p style="float:right;">...more</p></a></blockquote>'
			       	+ '</div>' 
			       	+  '<div class="col-md-1"></div>'
			      	+ '<div class="col-md-5">'
			  		+ '<table><tbody><tr><td width="150px">Age</td><td><span>: '+orderObj.age+' yrs</span></td></tr>'
			  		+ '<tr><td>Religion</td><td><span>: '+orderObj.religionName+'</span></td></tr>'	
			  		+ '<tr><td>Community</td><td><span>: '+orderObj.castName+'</span></td></tr>'
			  		+ '<tr><td>Location</td><td><span>: '+orderObj.cityName+'</span></td></tr>'
			  		+ '<tr><td>Education</td><td><span>: '+orderObj.Education+'</span></td></tr>'
			  		+ '<tr><td>Profession</td><td><span>: '+orderObj.Proffession+'</span></td></tr></tbody></table>'
			      	+ ' <a href="#" onclick="regFunction()"><button class="btn btn-warning">View Full Profile</button></a>'
			      	+ '</div>'
			      	+ '</div>' 
			      	+ '</div>' 
			      	+ '</div>'
			      	+ '</div>';
			  			$(tblRow).appendTo("#searchResults");
			  	});
			  }
			</script>		
<%@ include file="userStepsFooter.jsp"  %>