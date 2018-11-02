<span class="plan_details">
	
	<%@ include file="header1.jsp"%>
		
		 <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
         <h1>
       Bus Management
            <small>Fill Bus Details</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Fill bus details</li>
          </ol>
        </section>
         <!-- Main content -->
        	<section class="content">
          <div class="row">
		  <div class="col-xs-2">&nbsp;</div>
            <!-- left column -->
            <div class="col-md-8">
              <!-- general form elements -->
              <div class="box box-primary">
                <div class="box-header">
                  <h3 class="box-title">Bus registration</h3>
				<span style="color:#1B7F14;">
				<%
						try{
								out.print(session.getAttribute("abc").toString());
								session.removeAttribute("abc");
						}catch(Exception e){out.print("");}
				%>
			    </span>
				</div><!-- /.box-header -->
                <!-- form start -->
                <form    action="bus_registration_jdbc.jsp" method="POST">
                  <div class="box-body">
                   
				    <div class="row form-group">
						<div class="col-md-6">
						<label class="control-label">Bus Name</label>
							 <input type="text" id="b_name" name="b_name" placeholder="Enter Bus Name" class="form-control" maxlength="500" required  />
						</div>
						<div class="col-md-6">
						<label class="control-label">Agency Name</label>
							<input type="text" id="a_name" name="a_name" class="form-control" maxlength="999" placeholder="Agency Name" required />
						</div>
					</div>
					
					 <div class="row form-group">
						<div class="col-md-6">

						<label class="control-label">Bus Category</label>
							 <input type="text" id="b_cat" name="b_cat" placeholder="Bus Category" class="form-control" maxlength="50" required />
						</div>
						<div class="col-md-6">
						<label class="control-label">Total seat</label>
							<input type="text" id="t_seat" name="t_seat" class="form-control" maxlength="999" placeholder="Bus Type" onkeypress="return isNumberKey(event)" required/>
						</div>
					</div>
						
						 <div class="row form-group">
						<div class="col-md-6">
						<label class="control-label">Vehicle No.</label>
							 <input type="text" id="v_no" name="v_no" placeholder="Enter Vehicle No." class="form-control" maxlength="50" required />
						</div>
						<div class="col-md-6">
						<label class="control-label">Bus Type</label>
							<input type="text" id="b_type" name="b_type" class="form-control" maxlength="999" placeholder="Bus Type" required />
						</div>
					</div>
						
					

					 <div class="row form-group">
						<div class="col-md-6">
						<label class="control-label">Fare/seat</label>
							 <input type="text" id="fare" name="fare" placeholder="Enter Fare/seat" class="form-control" maxlength="50" onkeypress="return isNumberKey(event)" required />
						</div>
						<div class="col-md-6">
						<label class="control-label">Booking charges</label>
							<input type="text" id="b_charge" name="b_charge" class="form-control" maxlength="999" placeholder="Bus Type" onkeypress="return isNumberKey(event)" required />
						</div>
					</div>
				

					
					<div class="row form-group">
						<div class="col-md-6">
						<label class="control-label">TAX</label>
							 <input type="text" id="tax" name="tax" placeholder="Tax" class="form-control" maxlength="50" onkeypress="return isNumberKey(event)" required />
						</div>
						<div class="col-md-6">
						<label class="control-label">Service Charge</label>
							<input type="text" id="s_caharge" name="s_caharge" class="form-control" maxlength="999" placeholder="Service Charge" onkeypress="return isNumberKey(event)" required />
						</div>
					</div>
						<div class="row form-group">
							<div class="col-md-6">
						<label class="control-label">City From</label>
							<input type="text" id="city_from" name="city_from" class="form-control" maxlength="999" placeholder="Enter Originated City" required />
						</div>
						<div class="col-md-6">
						<label class="control-label">City to</label>
							 <input type="text" id="city_to" name="city_to" placeholder="Enter Destination" class="form-control" maxlength="50" required  />
						</div>
					
					</div>
							<div class="row form-group">
						<div class="col-md-6">
						<label class="control-label">Status</label>
							 <select  id="Status" name="status" placeholder="City To" class="form-control" required  >
							 <option value="">Select Status</option>
							  <option value="active">ACTIVE</option>
							  <option value="inactive">INACTIVE</option>
							 </select>
						</div>
						
					</div>
						<div class="row form-group">
					
						<div class="col-md-6">
						<label class="control-label"></label>
						  <input type="submit" value="Submit" class="btn btn-primary"  />
                
						</div>
					</div>
					</div>
				

 
                  
				
                   
                  </div><!-- /.box-body -->

                 
                  
                </form>
              </div><!-- /.box -->

              <!-- Form Element sizes -->
              

             

		  
		  
		  <!-- Your Page Content Here -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->
      
      <%@ include file="footer.jsp"%>
      
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- Slimscroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js" type="text/javascript"></script>

<script>
$(document).ready(function(){

$("select").change(function(){
		$( "select option:selected").each(function(){
			
			$("#service").show();
						
			if($(this).attr("value")=="prepaid_mobile"){
				
				$("#prepaid_op").show();
				$("#dth_op").hide();
				$("#data_card_op").hide();
				
				$("#mobile_value").show();
				$("#dth_value").hide();
				$("#data_value").hide();
				
				$("#operator2").val("");
				$("#operator3").val("");
				$("#dth_val").val("");
				$("#data_val").val("");
				
			}
			if($(this).attr("value")=="dth"){
				
				$("#prepaid_op").hide();
				$("#dth_op").show();
				$("#data_card_op").hide();
				
				$("#mobile_value").hide();
				$("#dth_value").show();
				$("#data_value").hide();
				
				$("#operator1").val("");
				$("#operator3").val("");
				$("#mobile_val").val("");
				$("#data_val").val("");
			}
			if($(this).attr("value")=="data_card"){
				
				 $("#prepaid_op").hide();
				$("#dth_op").hide();
				$("#data_card_op").show();
				
				$("#mobile_value").hide();
				$("#dth_value").hide();
				$("#data_value").show();
				
				$("#operator1").val("");
				$("#operator2").val("");
				$("#dth_val").val("");
				$("#mobile_val").val("");
			}
			
		
		});
	}).change();

});
</script>
	
	<script>
	function isNumberKey(evt)
       {
          var charCode = (evt.which) ? evt.which : evt.keyCode;
          if (charCode != 46 && charCode > 31 
            && (charCode < 48 || charCode > 57))
             return false;

          return true;
       }
			

	function validate()
	{
		var flag1,flag2,flag3,flag4,flag5,flag6;
		
		if((document.getElementById("amount").value == "") || (document.getElementById("amount").value == 0) )
		{	flag=0;
									
			$("#amount").css({borderColor:"#89062D"}); 
			
		}
		else{flag1=1;
		$("#amount").css({borderColor: "#0099ff"}); 
		}
		
		if(document.getElementById("talktime").value == "")
		{flag=0;
			
			
			$("#talktime").css({borderColor: "#89062D"}); 
			
		}
		else{flag2=2;
		$("#talktime").css({borderColor: "#0099ff"}); 
		}
		
							
		if(document.getElementById("validity").value == "") 
		{flag=0;
										
			$("#validity").css({borderColor: "#89062D"}); 
			
		}
		else{flag3=3;
		$("#validity").css({borderColor: "#0099ff"}); 
		}
		if(document.getElementById("desc").value == "") 
		{flag=0;
										
			$("#desc").css({borderColor: "#89062D"}); 
			
		}
		else{flag4=4;
		$("#desc").css({borderColor: "#0099ff"}); 
		}
		if(document.getElementById("circle").value == "") 
		{flag=0;
										
			$("#circle").css({borderColor: "#89062D"}); 
			
		}
		else{flag5=5;
		$("#circle").css({borderColor: "#0099ff"}); 
		}
		if(document.getElementById("service1").value == "") 
		{flag=0;
										
			$("#service1").css({borderColor: "#89062D"}); 
			
		}
		else{flag6=6;
		$("#service1").css({borderColor: "#0099ff"}); 
		}
		
		if(document.getElementById("service1").value == "") 
		{flag=0;
										
			$("#service1").css({borderColor: "#89062D"}); 
			
		}
		else{flag6=6;
		$("#service1").css({borderColor: "#0099ff"}); 
		}

		if(flag1==1 && flag2==2 && flag3==3 && flag4==4 && flag5==5 && flag6==6){

			$("#frm1").submit();
		}		
	 }
					
</script>
	
  </body>
   <%con.close();%>
</html>
