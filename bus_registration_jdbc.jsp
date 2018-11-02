<%@include file="connect.jsp" %>
<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%

	String b_name=request.getParameter("b_name");
	String a_name=request.getParameter("a_name");
	String vehicle_no=request.getParameter("v_no");
	String b_type=request.getParameter("b_type");
	String b_catagory=request.getParameter("b_cat");
	String seat=request.getParameter("t_seat");
	String fear=request.getParameter("fare");
	String book_charge=request.getParameter("b_charge");
	String tax=request.getParameter("tax");
	String sevice_charge=request.getParameter("s_caharge");
	String city_from=request.getParameter("city_from");
	String city_to=request.getParameter("city_to");
	String status = request.getParameter("status");



	 String tid="",user_uid="";
	 String AB = "123456789";
	 Random rnd = new Random();
	 StringBuilder sb = new StringBuilder(8);
	    for( int i8 = 0; i8 <10; i8++ ) 
		  sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
		     tid+=sb.toString();

	
	if(b_name=="" || b_name==null || vehicle_no==null || vehicle_no=="" || fear=="" || fear==null || sevice_charge==null || sevice_charge=="" ){
		  session.setAttribute("abc","Invalid Parameter..!Fill all details and try");
		  response.sendRedirect("bus_registration.jsp");

	}else{
	try{
		int updateQuery = 0;
		String query = "INSERT INTO `bus_registration`(`bus_id`, `bus_name`, `agency_name`, `vehicle_no`, `bus_type`, `bus_catagory`, `total_seat`, `fare/seat`, `booking_charges`, `tax`, `service_charges`, `city_from`, `city_to`, `status`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	
		 pstatement = con.prepareStatement(query);
					  pstatement.setString(1, tid);
					  pstatement.setString(2, b_name);
					  pstatement.setString(3, a_name);
					  pstatement.setString(4, vehicle_no);
					  pstatement.setString(5, b_type);
					  pstatement.setString(6, b_catagory);
					  pstatement.setString(7, seat);
				    pstatement.setString(8, fear);
					  pstatement.setString(9, book_charge);
					  pstatement.setString(10, tax);
					  pstatement.setString(11, sevice_charge);
					  pstatement.setString(12, city_from);
					  pstatement.setString(13, city_to);
					   pstatement.setString(14, status);
					  updateQuery = pstatement.executeUpdate();
					  if(updateQuery!=0)
					  {
						  session.setAttribute("abc","Bus Added to List");
						  response.sendRedirect("bus_registration.jsp");

					  }else{
						  session.setAttribute("abc","Data Error");
						  response.sendRedirect("bus_registration.jsp");
					  }
	}catch(Exception ex){
						 session.setAttribute("abc",ex.toString());
						 response.sendRedirect("bus_registration.jsp");

		}
	}

	   
	con.close();
%>