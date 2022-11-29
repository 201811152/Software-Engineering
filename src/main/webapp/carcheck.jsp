<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 수정 </title>
</head>
<body>
	Home > 회원 수정
	<hr>
	<form action="modifyDBcar.jsp" name="user_info" method="post">
		<fieldset style="width:230px">
			<legend> 회원 수정 화면 </legend><p>
		<%
			String car_name = request.getParameter("car_name");
			String ID = (String)session.getAttribute("memberId");
			
			String sql = "select * from times where ID=?";
		
			PreparedStatement sm = conn.prepareStatement(sql);
			sm.setString(1,ID);
			ResultSet rs = sm.executeQuery();
			
			while (rs.next()){
		%>
			아이디 : <br>
			<%=rs.getString("ID")%><br><br>
		
			시작 시간 : <br>
			<input type="text" value=<%=rs.getString("st_time") %> name="start_t"><br><br>
		
			반납 시간 : <br> 
			<input type="text" value=<%=rs.getString("et_time")%> name="end_t"><br><br>
					
			자동차 모델 : <br>
			<%=rs.getString("car_name")%><br>
		<%
			}
			rs.close();
			sm.close();
			conn.close();	
		%>
			<hr>
			<input type="reset" value=" ◀ 다시작성 ">
			<input type="submit" value=" 수정 ▶ ">
			<br><br>
		</fieldset>
	</form>
</body>
</html>