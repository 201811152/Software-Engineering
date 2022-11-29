<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 로그인 </title>
</head>
<body>
	Home > 로그인
	<hr>
	<%
		String u_id = request.getParameter("p_id");
		
		String sql = "select * from member where ID=?";
		PreparedStatement sm = conn.prepareStatement(sql);
		sm.setString(1,u_id);
		ResultSet rs = sm.executeQuery();
		
		if(rs.next()){
			String manager = rs.getString("manager");
			String name = rs.getString("name");
			String id = rs.getString("ID");
			
			if(manager.equals("1")){
				session.setAttribute("manager",manager);
				session.setAttribute("memberId", id);
				session.setAttribute("membername",name);
				
				out.println("새로운 세션 생성 성공 ! <br>");
				out.println("관리자 [ " + id + " ]님이 입장하였습니다. <p>");
				
				response.sendRedirect("membersList.jsp");
			}
			else if(manager.equals("0")){
				session.setAttribute("manager",manager);
				session.setAttribute("memberId", id);
				session.setAttribute("membername", name);
				
				out.println("새로운 세션 생성 성공 ! <br>");
				out.println("사용자 [ " + id + " ]님이 입장하였습니다. <p>");
				
				response.sendRedirect("membership.jsp");
			}
		}
		else{
			response.sendRedirect("LOGIN.jsp");
		}
		rs.close();
		sm.close();
		conn.close();
	%>
</body>
</html>