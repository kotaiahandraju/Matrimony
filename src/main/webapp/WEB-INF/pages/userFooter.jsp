			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- body ends here-->
<!-- footer -->
<div class="" style="background:;">
	<div class="row">
		<div class="footer" style="font-size: 10px;">
		<div class="container" style="background: #333333 !important;">
			<div class="col-md-3 footer-grid">
				<h6>About us</h6>
				<p>Welcome to the profound world of Aarna Matrimony one of the most frequently visited and highly preferred matrimonial site..</p>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>Search</h6>
				<ul>
					<li><a href="aboutUs">About Us</a></li>
					<li><a href="privacyAndPolicy">Privacy Policy</a></li>
					<li><a href="termsConditions">Terms &amp; Conditions</a></li>
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>My Account</h6>
				<ul>
					<li><a href="dashboard">My Account</a></li>
					<li><a href="myProfile">My Profile</a></li>
<!-- 					<li><a href="#">My Interest</a></li> -->
				</ul>
			</div>
			<div class="col-md-3 footer-grid">
				<h6>Extras</h6>
				<ul>
<!-- 					<li><a href="#">Login</a></li> -->
<!-- 					<li><a href="#">Register</a></li> -->
					<li><a href="help">Help</a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
			</div>
		</div>
		<div class="footer-copy">
			<p>A product of Aarna Associates © 2018. All rights reserved.</p>
		</div>
	</div>
</div>

<a href="#" class="scrollup" style="display: none;">Scroll</a>
<!-- //footer -->
<script src="${baseurl }/js/customValidation.js"></script>
<script>
var selectIds = $('#panel1,#panel2,#panel3');
$(function ($) {
    selectIds.on('show.bs.collapse hidden.bs.collapse', function () {
        $(this).prev().find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus');
    })
});
</script>
	<script src="${baseurl }/js/bootstrap.min.js"></script>
	<script src="${baseurl }/js/jquery.blockUI.min.js"></script>
	<script src="${baseurl }/js/plugins/select2/select2.min.js"></script>
	
	<!-- start-smoth-scrolling -->
	<!-- <script type="text/javascript" src="user/js/move-top.js"></script> -->
	<!-- <script type="text/javascript" src="user/js/easing.js"></script> -->
	
	<!-- <script type="text/javascript" src="user/js/megamenu.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){$(".megamenu").megamenu();});
	</script>
	
	<script src="user/js/menu_jquery.js"></script>

	<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
	<script type="text/javascript" id="sourcecode">
		$(function(){$('.scroll-pane').jScrollPane();});
	</script> -->
<!-- <script>
 $(document).ready(function(){
        // Show hide popover
        $(".navbar").click(function(){
            $(this).find(".navbar-collapse").slideToggle("collapse");
        });
    });

$(document).on("click", function(event){
        var $trigger = $(".navbar");
        if($trigger !== event.target && !$trigger.has(event.target).length){
            $(".navbar-collapse").slideUp("collapse");
        }            
    });
</script> -->
<script type="text/javascript">

$(window).on("load", function () {
	    var urlHash = window.location.href.split("#")[1];
	    $('html,body').animate({
	        scrollTop: $('#' + urlHash).offset().top
	    }, 100);
	});
</script>
</body>
</html>