			<div class="clearfix"></div>
		</div>
	</div>
</div>
<!-- body ends here-->
<!-- footer -->
<div class="container">
	<div class="row">
		<div class="footer" style="font-size: 10px;">
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
					<li><a href="dashboard">My Account</a></li>
					<li><a href="myProfile">My Profile</a></li>
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
		<div class="footer-copy">
			<p>A product of Aarna Associates © 2017. All rights reserved.</p>
		</div>
	</div>
</div>
<!-- //footer -->
<script>
var selectIds = $('#panel1,#panel2,#panel3');
$(function ($) {
    selectIds.on('show.bs.collapse hidden.bs.collapse', function () {
        $(this).prev().find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus');
    })
});
</script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.blockUI.min.js"></script>
	
	<!-- start-smoth-scrolling -->
	<script type="text/javascript" src="user/js/move-top.js"></script>
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

</body>
</html>