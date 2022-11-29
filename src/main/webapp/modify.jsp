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
	<form action="modifyDB.jsp" name="user_info" method="post">
		<fieldset style="width:230px">
			<legend> 회원 수정 화면 </legend><p>
		<%
			String id = request.getParameter("id");
			String sql = "select * from member where ID=?";
		
			PreparedStatement sm = conn.prepareStatement(sql);
			sm.setString(1,id);
			ResultSet rs = sm.executeQuery();
			
			while (rs.next()){
		%>
			아이디 : <br>
			<input type="text" value=<%=rs.getString("ID")%> name="id"><br><br>
		
			이 름 : <br>
			<input type="text" value=<%=rs.getString("name") %> name="userName"><br><br>
		
			비밀번호 : <br> 
			<input type="password" value=<%=rs.getString("PW")%> name="userPW"><br><br>
			
			연락처 : <br>
			010 -
			<input type="text" maxlength="4" size="4" name="P2" style="width:40px"> -
			<input type="text" maxlength="4" size="4" name="P3" style="width:40px"><br><br>
			
			운전면허유무 : <br>
				<select name="license" style="width:60px;height=20.5px">
					<option value=""> 선택 </option>
					<option value="1종"> 1종 </option>
					<option value="2종"> 2종 </option>
					<option value="대형"> 대형 </option>
				</select>
			<br><br>
			관리자 여부 : <br>
			<%=rs.getString("manager")%><br>
			관리자 1 : <input type="radio" name="Master" value="1">
			사용자 0 : <input type="radio" name="Master" value="0">	
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