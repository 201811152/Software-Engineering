<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 예약</title>
</head>
<body>
<%
	String re = "지프 레니게이드";
	String m = "맥라렌 GT";
	String b = "벤츠 s클래스";
	String p = "포르쉐 카이엔";
%>
	<table border="0">
		<tr>
			<td>
				<form action="insertCar.jsp" method="post">
					<input type="text" value=<%=re%> name="car"><input type="submit" value="입력">
					<img src="image/RENEGADE.jpg" width="200" height="200">
				</form>
			</td>	 
			<td>
				<form action="insertCar.jsp" method="post">
					<input type="text" value=<%=m%> name="car"><input type="submit" value="입력">
					<img src="image/mac.jpg" width="200" height="200">
				</form>
			</td>
			<td>
				<form action="insertCar.jsp" method="post">
					<input type="text" value=<%=b%> name="car"><input type="submit" value="입력">
					<img src="image/benz.jpg" width="200" height="200">
				</form>
			</td>
			<td>
				<form action="insertCar.jsp" method="post">
					<input type="text" value=<%=p%> name="car"><input type="submit" value="입력">
					<img src="image/Porsche.jpg" width="200" height="200">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>