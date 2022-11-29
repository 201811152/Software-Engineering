<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<%
	String ID = (String)session.getAttribute("memberId");
	String st= request.getParameter("start_t");
	String et= request.getParameter("end_t");
	
	String sql = "select * from times where ID =?;";
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1,ID);
	ResultSet rs = sm.executeQuery();
	
	if(rs.next())
	{
		sql = "update times set st_time=?, et_time=? where ID=?";  
		PreparedStatement sm1 = conn.prepareStatement(sql);
		sm1.setString(1,st);
		sm1.setString(2,et);
		sm1.setString(3,ID);
		
		sm1.executeUpdate();
		response.sendRedirect("car_reservation.jsp");
	}
	rs.close();
	sm.close();
	conn.close();
%>