<span class="trans_mng">	

	<%@ include file="header1.jsp" %>
	
		 <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Transaction Management
            <small>Transaction Details</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Transaction Details</li>
          </ol>
        </section>
       <!-- Main content -->     
       
        <section class="content">
          <div class="row">
            <div class="col-xs-12">  
              <div class="box">               
                <div class="box-header">
                <!--  <h3 class="box-title">Data Table With Full Features</h3>-->
                </div><!-- /.box-header -->
                <div class="box-body">
        <form action="b2ctransaction_details.jsp" method="POST">        
        <div class="row form-group" style="margin-left: 20%;">
		<div class="col-sm-5">
			<label class="control-label">From&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp; To</label>
			
			<input type="text" class="form-control" name="from_to_date" id="reservationtime" />
		</div>
		
		<div class="col-sm-3">
			<label class="control-label">&nbsp;</label><br/>
			<button type="submit" class="btn btn-primary btn-block">Search</button>
		</div>
		</div>
		</form>
		<hr/>
       <br/>
       
		<span style="color:#1B7F14;">
		<%
			try{
			out.print(session.getAttribute("abc").toString());
			session.removeAttribute("abc");
			out.print("<br/>");
			out.print("<br/>");
			}catch(Exception e){out.print("");}
				
		%>
		</span>
	         
            
		<%
		String search_date="",search_reg_by="",datefrom="",dateto="",query11="",part1="",part2="",part3="";
						 
		 search_date=request.getParameter("from_to_date");
		 
		java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String dt=df.format(new java.util.Date()).toString();
		
		try{
		String[] parts = search_date.split(" ");
		part1 = parts[0]; //dateform
		part2 = parts[1]; //here (-)
		part3 = parts[2]; //dateto
		
		}catch(Exception ex1){out.print("");}
		
		if(search_date==null){datefrom=dt; dateto=dt;}
		else{datefrom=part1; dateto=part3;}
		
		query11="select * from mobiletransaction where date between '"+datefrom+"' AND '"+dateto+"' order by date DESC,time DESC";
		rst11=stmt11.executeQuery(query11);
		
		%>
		
                  <table id="example1" class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>S.No.</th>
                        <th>Date/Time</th>
                        <th>TID</th>
                        <th>User ID</th>
                        <th>A/c No.</th>			
						<th>Amount</th>
						<th>Status</th>			
						<!--<th>Action</th>-->
                      </tr>
                    </thead>
                    <tbody>
					  <%
					  int sno=1;
					  while(rst11.next())
					  {
					  %>
					  
					  <tr>
                        <td><%=sno%></td>
                        <td><%=rst11.getString(5)%> <%=rst11.getString(7)%></td>
                        <td><a href="#quickreply" data-toggle="modal" onclick="Trans_<%=sno%>();"><%=rst11.getString(2)%></a></td>
                        <td><%=rst11.getString(1)%></td>
                        <td><%=rst11.getString(3)%></td>
						<td><%=rst11.getString(4)%></td>
						
						<%if(rst11.getString(6).equalsIgnoreCase("Pending")){%>
						<td><a href="update_pending.jsp?tid=<%=rst11.getString(2)%>">Pending</a></td>
						<%}else{%>
						<td><%=rst11.getString(6)%></td>
						<%}%>
						<!--<td><a href="#">Refund</a></td>-->
                      </tr>
					
					<input value="<%=rst11.getString(2)%>" id="ttid<%=sno%>" type="text" style="display:none;" />
							
					<script>
					  function Trans_<%=sno%>()
					  {
						   var tid1=document.getElementById("ttid<%=sno%>").value;
						   //alert(tid1);
						var xmlhttp;
						if (window.XMLHttpRequest)
						  {  xmlhttp=new XMLHttpRequest();
						  }
						else
						  {  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
						  }
						  xmlhttp.onreadystatechange=function()
						  {
						  if (xmlhttp.readyState==4 && xmlhttp.status==200)
							{
							var sdf =xmlhttp.responseText;
							document.getElementById("trans_table").innerHTML=xmlhttp.responseText;	// id there display data must be in this page

							}
						  }
						  xmlhttp.open("GET","search_transaction.jsp?tid="+tid1+"",true);
						xmlhttp.send();	 				  
					  }
					  </script>
					  
                    <%sno++;}%>
                  
                    </tfoot>
                  </table>
				   <!--download section-->
				  <div class="help-box">
				  Download with Current Table 
				  <a href="TransDetailsCSV.jsp?datefrom=<%=datefrom%>&dateto=<%=dateto%>" class="btn btn-default">CSV&nbsp;<i class="fa fa-table"></i></a>
				  <!--<a href="" class="btn btn-default">PDF&nbsp;<i class="fa fa-file"></i></a>-->
                
				 <!--quick reply modal-->
	<div class="example-modal">
            <div class="modal fade modal-info" id="quickreply" role="dialog">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Transaction Details</h4>
                  </div>
                  <div class="modal-body">
                    <form action="" class="form-group">
						<div class="row">
							
						<div class="box">
				                <div class="box-header">
				                  
				                </div><!-- /.box-header -->
				                <div id="trans_table" class="box-body">
				                  
				                </div><!-- /.box-body -->
				                
				              </div><!-- /.box -->
							
						</div>	
					</form>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-outline pull-right" data-dismiss="modal">Close</button>
                    <!--<button type="button" class="btn btn-outline">Save changes</button>-->
                  </div>
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
          </div><!-- /.example-modal -->
				
				
				</div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
       
       <%@ include file="footer.jsp"%>
       
    </div><!-- ./wrapper -->

  <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->
    <script src="plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='plugins/fastclick/fastclick.min.js'></script>
	<script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
	<!-- InputMask -->
    <script src="plugins/input-mask/jquery.inputmask.js" type="text/javascript"></script>
    <script src="plugins/input-mask/jquery.inputmask.date.extensions.js" type="text/javascript"></script>
    <script src="plugins/input-mask/jquery.inputmask.extensions.js" type="text/javascript"></script>
    <!-- date-range-picker -->
    <script src="plugins/daterangepicker/daterangepicker.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>
    <!-- page script -->
    
    <script type="text/javascript">
      $(function () {
        $("#example1").dataTable();
        $('#example2').dataTable({
          "bPaginate": true,
          "bLengthChange": false,
          "bFilter": false,
          "bSort": true,
          "bInfo": true,
          "bAutoWidth": false
        });
      });
    </script>
    
    <script type="text/javascript">
      $(function () {
        //Datemask dd/mm/yyyy
        $("#datemask").inputmask("dd-mm-yyyy", {"placeholder": "dd-mm-yyyy"});
        //Datemask2 mm/dd/yyyy
        $("#datemask2").inputmask("mm-dd-yyyy", {"placeholder": "mm-dd-yyyy"});
        //Money Euro
        $("[data-mask]").inputmask();

        //Date range picker
        $('#reservation').daterangepicker();
        //Date range picker with time picker
        $('#reservationtime').daterangepicker({timePicker: false, timePickerIncrement: 30, format: 'YYYY-MM-DD'});
        //Date range as a button
        $('#daterange-btn').daterangepicker(
                {
                  ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
                    'Last 7 Days': [moment().subtract('days', 6), moment()],
                    'Last 30 Days': [moment().subtract('days', 29), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
                  },
                  startDate: moment().subtract('days', 29),
                  endDate: moment()
                },
        function (start, end) {
          $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
        );

        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
          checkboxClass: 'icheckbox_minimal-blue',
          radioClass: 'iradio_minimal-blue'
        });
        //Red color scheme for iCheck
        $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
          checkboxClass: 'icheckbox_minimal-red',
          radioClass: 'iradio_minimal-red'
        });
        //Flat red color scheme for iCheck
        $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
          checkboxClass: 'icheckbox_flat-green',
          radioClass: 'iradio_flat-green'
        });

        //Colorpicker
        $(".my-colorpicker1").colorpicker();
        //color picker with addon
        $(".my-colorpicker2").colorpicker();

        //Timepicker
        $(".timepicker").timepicker({
          showInputs: false
        });
      });
    </script>
    
<%con.close();%>
  </body>
</html>
