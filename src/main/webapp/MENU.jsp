<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<Link href="M_sort.css" rel="stylesheet" type="text/css"/>
	<title>MENU</title>
</head>
<body>
	<h3> HOME > LOGIN > MENU </h3>
	<hr>
	<form  name=menu method="get">
		<div class=left>
			<img src="image/RENEGADE.jpg" alt=" " width="200" height="200">
		</div>
		<div class=right_up>
			<img src="image/mac.jpg" alt=" " width="200" height="200">
		</div>
		<fieldset style="width:230px">
			<legend>메 뉴 선 택</legend>
			<button type="button" onclick="location.href='car_image.jsp';">차량 예약</button><br><br>
			<button type="button" onclick="location.href='car_reservation.jsp';">예약 확인</button><br><br>
			<button type="button" onclick="location.href='del.jsp';">예약 취소</button><br><br>
			<button type="button" onclick="location.href='select.jsp';">차량 검색</button><br><br>
			<button type="button" onclick="location.href='logout.jsp';">로그아웃</button><br><br>
		</fieldset>
		<div class=image>
			<img src="image/benz.jpg" alt=" " width="200" height="200"> 
		</div>
		<div class=right>
			<img src="image/Porsche.jpg" alt=" " width="200" height="200">
		</div>
	</form>
</body>
</html>