<%@ include file="userStepsHeader.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="user/css/demo.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="user/css/flexslider.css" type="text/css" media="screen" />
	<style>
	.btn-default {
  color: #333333;
  background-color: #ddd;
  border-color: #cccccc;
}
	</style><br>
<div class="container-fluid">
					<div class="panel panel-success">
					<div class="panel-heading">Success Story <a class="pull-right" href="HomePage" style=" color:#000;">Back </a> </div>
	             	<div class="panel-body">
	             	<h5>(AMNLR278948) Avanigadda Sudha <span class="pull-right"><button type=""button" class="btn btn-default">Prev</button> &nbsp; <button type=""button" class="btn btn-primary">Next</button></span></h5><br>
	             	<p>Location : India / Marriage Date 04-may-2018</p>
	             	<div class="col-md-5" style="margin-left:-15px;">
	             	<section class="slider">
        <div id="slider" class="flexslider">
          <ul class="slides">
            <li>
  	    	  <img src="user/images/banner1.jpg" />
  	    		</li>
  	    		<li>
  	    	   <img src="user/images/banner2.jpg" />
  	    		</li>
  	    		<li>
  	    	   <img src="user/images/banner3.jpg" />
  	    		</li>
  	    		<li>
  	    	    <img src="user/images/banner4.jpg" />
  	    		</li>
            <li>
  	    	  <img src="user/images/banner5.jpg" />
  	    		</li>
  	    		
          </ul>
        </div>
        <div id="carousel" class="flexslider">
          <ul class="slides">
            <li>
  	    	    <img src="user/images/banner1.jpg" />
  	    		</li>
  	    		<li>
  	    	    <img src="user/images/banner2.jpg" />
  	    		</li>
  	    		
             <li>
  	    	  <img src="user/images/banner3.jpg" />
  	    		</li>
  	    		<li>
  	    	   <img src="user/images/banner4.jpg" />
  	    		</li>
  	    		<li>
  	    	   <img src="user/images/banner5.jpg" />
  	    		</li>
  	    		
          </ul>
        </div>
      </section></div>
      <div class="col-md-7">
     <p style="padding:20px; color:#000;font-family: 'Open Sans', sans-serif;"> Both of us met through Aarna Matrimony. He expressed interest in my profile, my father visited his parents, we met and got hitched within a month's time.</p>
      
      
      </div>
	             	
	             	
	             	</div></div></div>
	             	
	             	 <!-- jQuery -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>

  <!-- FlexSlider -->
  <script defer src="user/js/jquery.flexslider.js"></script>

  <script type="text/javascript">
    $(function(){
      SyntaxHighlighter.all();
    });
    $(window).load(function(){
      $('#carousel').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        itemWidth: 210,
        itemMargin: 5,
        asNavFor: '#slider'
      });

      $('#slider').flexslider({
        animation: "slide",
        controlNav: false,
        animationLoop: false,
        slideshow: false,
        sync: "#carousel",
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
    });
  </script>
<%@ include file="userStepsFooter.jsp"  %>