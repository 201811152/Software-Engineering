<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<% 
	String u_name = request.getParameter("p_name");
	String se = request.getParameter("secret");
	String u_id = request.getParameter("p_id");
	String u_pw = request.getParameter("p_pw");
	
	String P01 = request.getParameter("P1");
	String P02 = request.getParameter("P2");
	String P03 = request.getParameter("P3");
	
	String license = request.getParameter("license");
	
	String sql = "insert into member (name,RRN,ID,PW,phonenum,license) values(?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,u_name);
	pstmt.setString(2,se);
	pstmt.setString(3,u_id);
	pstmt.setString(4,u_pw);
	pstmt.setString(5,P01+"-"+P02+"-"+P03);
	pstmt.setString(6,license);

	
	int count = pstmt.executeUpdate();
	if(count == 1){
		response.sendRedirect("LOGIN.jsp");
	}else{
		out.println("회원가입 실패!");
		response.sendRedirect("Signup.jsp");
	}
	pstmt.close();
	conn.close();	
%>