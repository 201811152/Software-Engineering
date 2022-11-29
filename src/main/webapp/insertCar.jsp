<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 예약</title>
</head>
<body>
<h3> 차량 예약</h3>
	<hr>
	<form name="car_reser" action="insertDB_car.jsp" method="POST" >
		<fieldset style="width:500px">
			<legend> 차량 예약</legend><p>		
<%
		
		String que = request.getParameter("car");
		session.setAttribute("carname",que);
	 	String sql = "select * from cars as c, opt as o where c.options=o.options and car_name like ?";
	 	
	 	PreparedStatement sm = conn.prepareStatement(sql);
	 	sm.setString(1, "%"+que+"%");
	 	ResultSet rs = sm.executeQuery();
	 		 	
	 	if(rs.next()){
	 		String car_name = rs.getString("car_name");
	 		String fuel = rs.getString("fuel");
	 		String type = rs.getString("type");
	 		String gear = rs.getString("gear");
	 		String drive = rs.getString("drive_price");
	 		String one = rs.getString("one");
	 		String two = rs.getString("two");
	 		String three = rs.getString("three");
	 		String four = rs.getString("four");
	 		String five = rs.getString("five");
	 		
%>
			자동차 모델 : <br>
			<%=car_name%> <br><br>
			연료 : <br>
			<%=fuel %><br><br>
			유형 : <bt>
			<%=type%> <br><br>
			변속 : <br>
			<%=gear%> <br><br>
			비용(키로미터) : <br>
			<%=drive%> <br><br>
			편의기능1 : <br>
			<%=one%> <br><br>
			편의기능2 : <br>
			<%=two%> <br><br>
			편의기능3 : <br>
			<%=three%> <br><br>
			편의기능4 : <br>
			<%=four%> <br><br>
			편의기능5 : <br>
			<%=five%> <br><br>
			시작 시간 : <br>
			<input type="text" name="st"> <br><br>
			반납 시간 : <br>
			<input type="text" name="et"> <br><br>
	<% 
	 }
	 	rs.close();
	 	sm.close();
	 	conn.close();
	%>
			<hr>
			<input type="reset" value=" ◀ 다시작성 ">
			<input type="submit" value=" 예약 ▶ ">
			<br><br>
	</fieldset>
</form>
</body>
</html>