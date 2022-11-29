<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<%
	String st = request.getParameter("st");
	String et = request.getParameter("et");
	String carname = (String)session.getAttribute("carname");
	String ID = (String)session.getAttribute("memberId");
	
	
	String sql = "insert into times values(?, ?, ?, ?)";
	
	PreparedStatement sm = conn.prepareStatement(sql);
 	sm.setString(1, ID);
 	sm.setString(2,st);
 	sm.setString(3,et);
 	sm.setString(4,carname);

 	int rs = sm.executeUpdate();
 	if(rs==1){
 		session.setAttribute("start",st);
 		session.setAttribute("end",et);
		response.sendRedirect("MENU.jsp");
	}
	else{
		out.println("예약 실패");
		response.sendRedirect("MENU.jsp");
	}
%>