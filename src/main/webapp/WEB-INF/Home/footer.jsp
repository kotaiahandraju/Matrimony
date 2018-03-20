
	<script src="${baseurl }/js/customValidation.js"></script>
	
	<!-- Nice Scroll -->
	<script src="${baseurl }/js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
		<!-- Bootstrap -->
	<script src="${baseurl }/js/bootstrap.min.js"></script>
	
	<!-- jQuery UI -->
	<%-- <script src="${baseurl }/js/plugins/jquery-ui/jquery-ui.js"></script> --%>
	<!-- Touch enable for jquery UI -->
	<script src="${baseurl }/js/plugins/touch-punch/jquery.touch-punch.min.js"></script>
	<!-- slimScroll -->
	<script src="${baseurl }/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>	
	<!-- vmap -->
	<script src="${baseurl }/js/plugins/vmap/jquery.vmap.min.js"></script>
	<script src="${baseurl }/js/plugins/vmap/jquery.vmap.world.js"></script>
	<script src="${baseurl }/js/plugins/vmap/jquery.vmap.sampledata.js"></script>
	<!-- Bootbox -->
	<script src="${baseurl }/js/plugins/bootbox/jquery.bootbox.js"></script>
	<!-- Flot -->
	<script src="${baseurl }/js/plugins/flot/jquery.flot.min.js"></script>
	<script src="${baseurl }/js/plugins/flot/jquery.flot.bar.order.min.js"></script>
	<script src="${baseurl }/js/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="${baseurl }/js/plugins/flot/jquery.flot.resize.min.js"></script>
	<!-- imagesLoaded -->
	<script src="${baseurl }/js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
	<!-- PageGuide -->
	<script src="${baseurl }/js/plugins/pageguide/jquery.pageguide.js"></script>
	<!-- FullCalendar -->
	<script src="${baseurl }/js/plugins/fullcalendar/moment.min.js"></script>
	<script src="${baseurl }/js/plugins/fullcalendar/fullcalendar.min.js"></script>
	<!-- Chosen -->
	<script src="${baseurl }/js/plugins/chosen/chosen.jquery.min.js"></script>
	<!-- select2 -->
	<script src="${baseurl }/js/plugins/select2/select2.min.js"></script>
	<!-- icheck -->
	<script src="${baseurl }/js/plugins/icheck/jquery.icheck.min.js"></script>

	<!-- Theme framework -->
	<script src="${baseurl }/js/eakroko.min.js"></script>
	<!-- Theme scripts -->
	<script src="${baseurl }/js/application.min.js"></script>
	<!-- Just for demonstration -->
	<script src="${baseurl }/js/demonstration.min.js"></script>
	<link rel="stylesheet" href="${baseurl }/css/plugins/select2/select2.css">
	<!-- Datatables -->
	<script src="${baseurl }/js/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${baseurl }/js/plugins/datatables/extensions/dataTables.tableTools.min.js"></script>
	<script src="${baseurl }/js/plugins/datatables/extensions/dataTables.colReorder.min.js"></script>
	<script src="${baseurl }/js/plugins/datatables/extensions/dataTables.colVis.min.js"></script>
	<script src="${baseurl }/js/plugins/datatables/extensions/dataTables.scroller.min.js"></script>
	<script src="${baseurl }/js/ajax.js"></script>
	<script src="${baseurl }/js/chosen.jquery.js"></script>
	<script src="${baseurl }/js/prism.js" type="text/javascript" charset="utf-8"></script>
  	<script src="${baseurl }/js/init.js" type="text/javascript" charset="utf-8"></script>
  	<script src="${baseurl }/js/plugins/select2/select2.min.js"></script>
  	<script src="${baseurl }/js/jquery.watermark.js"></script>
  		<script src="${baseurl }/js/jquery.blockUI.min.js"></script>
  	
  	<!-- Datatables -->


<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
<link href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css"/>
<!--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="${baseurl }/datatable/jquery.dataTables.min.js"></script>
<!-- <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> -->
<script src="${baseurl }/datatable/dataTables.buttons.min.js"></script>
<script src="${baseurl }/datatable/pdfmake.min.js"></script>
<script src="${baseurl }/datatable/vfs_fonts.js"></script>
<script src="${baseurl }/datatable/buttons.html5.min.js"></script>
<script src="${baseurl }/datatable/buttons.print.min.js"></script>
<script src="${baseurl }/datatable/buttons.flash.min.js"></script>
<script src="${baseurl }/datatable/jszip.min.js"></script>



 


  	
  	
  	
	<script type="text/javascript">
		var isCheck = "Yes";
		function PrintElem(elem)
		 {
		 	$(".noPrint").hide();
		     Popup($("#printProfile").html());
		     
		 }


		 function Popup(data)
		 {
		 	var mywindow = window.open('','new div');

		     var is_chrome = Boolean(mywindow.chrome);
		     var isPrinting = false;
		     mywindow.document.write('<html><head><title>'+username1+'</title> <link rel="stylesheet" type="text/css" href="../assets/css/img.css"><link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css"></head><body>');
		     mywindow.document.write(data);
		    
		     mywindow.document.write('</body></html>');
		     mywindow.document.close(); // necessary for IE >= 10 and necessary before onload for chrome

		 
		 $(".noPrint").show();
		     if (is_chrome) {
		         mywindow.onload = function() { // wait until all resources loaded 
		             mywindow.focus(); // necessary for IE >= 10
		             mywindow.print();  // change window to mywindow
		             mywindow.close();// change window to mywindow
		         };
		     
		     
		    } else {
		         mywindow.document.close(); // necessary for IE >= 10
		         mywindow.focus(); // necessary for IE >= 10

		         mywindow.print();
		         mywindow.close();
		    }
		   
		     return true;
		 }
	</script>
</body>
</html>