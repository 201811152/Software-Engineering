<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 예약 삭제 </title>
</head>
<body>
	Home > 예약 삭제하기
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
	<button type="button" onclick="location.href='withdraw.jsp';">삭제하기</button><br><br>
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