<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("userName");
	String pw = request.getParameter("userPW");
	String manager = request.getParameter("Master");
	String P1 = request.getParameter("P1");
	String P2 = request.getParameter("P2");
	String P3 = request.getParameter("P3");
	String phone = "010-"+P1+"-"+P2+"-"+P3;
	String license = request.getParameter("license");
	ResultSet rs = null;
	
	String sql = "select * from member where ID =?;";
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1,id);
	rs = sm.executeQuery();
	
	if(rs.next())
	{
		sql = "update member set name=?, PW=?, phonenum=?, license=?, manager=? where ID=?";  
		PreparedStatement sm1 = conn.prepareStatement(sql);
		sm1.setString(1,name);
		sm1.setString(2,pw);
		sm1.setString(3,phone);
		sm1.setString(4,license);
		sm1.setString(5,manager);
		sm1.setString(6,id);
		
		sm1.executeUpdate();
		response.sendRedirect("membersList.jsp");
	}
	rs.close();
	sm.close();
	conn.close();
%>