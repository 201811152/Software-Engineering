<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<Link href="sort.css" rel="stylesheet" type="text/css"/>
	<title>차량 예약 확인</title>
</head>
<body>
	<% 
		if(session.getAttribute("memberId")==null){
			response.sendRedirect("LOGIN.jsp");
		}
		else if(session.getAttribute("manager").equals("0")){
			String name = (String)session.getAttribute("membername");
			out.println("사용자 ["+ name +"]이 입장하셧습니다.\n");
		}
		else if(session.getAttribute("manager").equals("1")){
			response.sendRedirect("LOGIN.jsp");
		}
		
	%>
	<hr>
	<table border = "1" cellpadding= "10">
	<tr>
	<th> NO </th> <th> 차 </th><th>시작 시간</th><th>반납 시간</th><th>수정</th>
	</tr>
	<% 
		Statement sm = conn.createStatement();
		ResultSet rs;
		String Id = (String)session.getAttribute("memberId");
		
		String sql = "SELECT * FROM times where ID='"+Id+"'";
		rs = sm.executeQuery(sql);
		
		int count =1;
		while(rs.next()){
			
			String mod = new String("'carcheck.jsp?car_name="+rs.getString("car_name")+"'");
	%>
			<tr>
			<td><%=count%>
			<td align="center"><%=rs.getString("car_name")%></td>
			<td align="center"><%=rs.getString("st_time")%>
			<td align="center"><%=rs.getString("et_time")%>
			<td align="center"><a href=<%=mod%>>ㅁ</a>
			</td>
			</tr>
	<%
		
			count++;
		}
		
		rs.close();
		sm.close();
		conn.close();	
	%>
	<hr>
	<button type="button" onclick="location.href='MENU.jsp';">뒤로가기</button><br><br>
	<table border="0">
		<tr>
			<td>
				<form method="post">
					<img src="image/RENEGADE.jpg" alt=" " width="200" height="200">
				</form>
			</td>	 
			<td>
				<form  method="post">
					<img src="image/mac.jpg" alt=" " width="200" height="200">
				</form>
			</td>
			<td>
				<form  method="post">
					<img src="image/benz.jpg" alt=" " width="200" height="200">
				</form>
			</td>
			<td>
				<form  method="post">
					<img src="image/Porsche.jpg" alt=" " width="200" height="200">
				</form>
			</td>
		</tr>
	</table>
</table>  		
</body>
</html>