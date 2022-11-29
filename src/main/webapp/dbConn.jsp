<%@ page import = "java.sql.*" %>    
<%
   Connection conn = null;
	 String driverName="com.mysql.jdbc.Driver";
   String url = "jdbc:mysql://localhost:3306/odbo";
   String user = "root";
   String passwd = "1234";
   
	 Class.forName(driverName);
	 conn = DriverManager.getConnection(url,user,passwd);
%>    