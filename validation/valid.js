function reset () {
			$("#toggleCSS").attr("href", "alertify/themes/alertify.default.css");
			alertify.set({
				labels : {
					ok     : "OK",
					cancel : "Cancel"
				},
				delay : 5000,
				buttonReverse : false,
				buttonFocus   : "ok"
			});
		}




//numeric key aloowed only
function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

         return true;
      }
//onkeypress="return isNumberKey(event)" write in input type.....




// blog page validation	
	$(function () {
    $('.blog_id').hide();
	$("input#title").focus();
	 });
	
function valid_blog()
	{
		$('#blog_id').hide();
		 var title = $("input#title").val();
		 //alert(title);
		 if (title == "") {
			 reset();
					alertify.error("Title is Required.");
            //$("label#blog_id").show();
			
            $("input#title").focus();
            return false;
        }
		var sub_title	=	$("input#sub_title").val();
			$("label#err_subtitle").hide();
			if(sub_title == "")
			{
				reset();
				alertify.error("Sub title is required.");
				//$("label#err_subtitle").show();
				$("input#sub_title").focus();
				return false;
			}
		var blog_content	=	$("textarea#blog_content").val();
			$("label#err_content").hide();
			if(blog_content	==	"")
			{
				reset();
				alertify.error("Blog Content is required.");
				//$("label#err_content").show();
				$("textarea#blog_content").focus();
				return false;
			}
			if(blog_content.length <=20)
			{
				reset();
				alertify.error("Content must be max 20 character.");
				$("textarea#blog_content").focus();
				return false;
			}
			
			 var dataString = 'title=' + title + '&sub_title=' + sub_title + '&blog_content=' + blog_content;
		 //alert(dataString);
			 	$.ajax({
					   type:"post",
					   url:"b2cblog_code.php",
					   data:dataString,
           				success:function (result) {
								 $('#blog_form')[0].reset();
								 
								 	$("#title_details").html(result);
									   }
					   });
			
			 
			 
	}//function blog closed....
	
		
	
	
	
	//push notification message validation
	
			$(function () {
				$(".n_err").hide();
				$("textarea#notificationarea").focus();
				});
			function not_msg_valid()
			{
				
				$(".n_err").hide();
				var notification	=	$("textarea#notificationarea").val();
				if(notification =="")
				{
					reset();
					alertify.error("Notification Message is Required.");
					//$("label#err_not").show();
					$("textarea#notificationarea").focus();
				}
				else if(notification.length<=20)
				{
					reset();
					alertify.error("SMS must be max 20 character.");
					$("textarea#notificationarea").focus();
				}
				
			}
				
	
		
		// promotion sms validation
		
		function promo_sms()
		{
				$("#promo_err").hide();
				$("#sel_err").hide();
				var promo_sms	=	$("textarea#promo_sms").val();
				var sel_mail	=	$("select#sel_mail").val();
				//alert(sel_mail);
				if(sel_mail == null)
				{
					reset();
					alertify.error("select at least one.");
					//$("#sel_err").show();
					$("select#sel_mail").focus();
				}
				
				
				else if(promo_sms == "")
				{
					reset();
					alertify.error("Promotional sms is required.");
					
					//$("#promo_err").show();
					$("textarea#promo_sms").focus();
					return false;
				}
				else if(promo_sms.length<=20)
				{
					reset();
					alertify.error("SMS must be max 20 character");
					$("textarea#promo_sms").focus();
					return false;
				}
				
		}