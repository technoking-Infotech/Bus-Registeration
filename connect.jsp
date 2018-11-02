<%@ page import="java.sql.*" %> 

<%Connection con=null;
		ResultSet rst=null,rst2=null,rst3=null,rst1=null,rst4=null,rst5=null,rst6=null,rst7=null,rst8=null,rst9=null,rst10=null,rst11=null,rst12=null,rst13=null,rst14=null,rst15=null,rst16=null,rst17=null,rst18=null,rst19=null,rst20=null,rst21=null,rst22=null,rst23=null,rst24=null,rst25=null;
		
		Statement stmt=null,stmt2=null,stmt3=null,stmt1=null,stmt4=null,stmt5=null,stmt6=null,stmt7=null,stmt8=null,stmt9=null,stmt10=null,stmt11=null,stmt12=null,stmt13=null,stmt14=null,stmt15=null,stmt16=null,stmt17=null,stmt18=null,stmt19=null,stmt20=null,stmt21=null,stmt22=null,stmt23=null,stmt24=null,stmt25=null;
		PreparedStatement preparedStatement=null ,pstatement=null,pstatement2=null,pstatement3=null,pstatement4=null;
		String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver).newInstance();
			String url="jdbc:mysql://localhost:3306/aitbus_subjhfjhjgh?user=aitbus_subjhfuti&password=Ait@2020";
			
			con=DriverManager.getConnection(url);
			stmt=con.createStatement();
			stmt1=con.createStatement();
			stmt2=con.createStatement();
			stmt3=con.createStatement();
			stmt4=con.createStatement();
			stmt5=con.createStatement();
			stmt6=con.createStatement();
			stmt7=con.createStatement();
			stmt8=con.createStatement();
			stmt9=con.createStatement();
			stmt10=con.createStatement();
			stmt11=con.createStatement();
			stmt12=con.createStatement();
			stmt13=con.createStatement();
			stmt14=con.createStatement();
			stmt15=con.createStatement();
			stmt16=con.createStatement();
			stmt17=con.createStatement();
			stmt18=con.createStatement();
			stmt19=con.createStatement();
			stmt20=con.createStatement();
			stmt21=con.createStatement();
			stmt22=con.createStatement();
			stmt23=con.createStatement();
			stmt24=con.createStatement();
			stmt25=con.createStatement();
			
			%>