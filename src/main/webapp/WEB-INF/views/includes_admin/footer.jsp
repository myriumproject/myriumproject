<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resources/bsAdmin2/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/bsAdmin2/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/bsAdmin2/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->


    <!-- Custom Theme JavaScript -->
    <script src="/resources/bsAdmin2/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->

    
    <script>
	  $(document).ready(function() {
	    $('#dataTables-example').DataTable({
	      responsive: true
	    });
	    $(".sidebar-nav")
	      .attr("class","sidebar-nav navbar-collapse collapse")
	      .attr("aria-expanded",'false')
	      .attr("style","height:1px");
	  });
</script>

</body>

</html>