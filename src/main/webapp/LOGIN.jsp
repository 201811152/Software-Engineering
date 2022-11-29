<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<Link href="sort.css" rel="stylesheet" type="text/css"/>
	<title>렌트카 로그인 창</title>
	<script type="text/javascript">
		function check(){
			var f = document.person;
		
			if(f.p_id.value.length <4 || f.p_id.value.length >16)
			{
				alert("아이디를 입력해주세요");
				f.p_id.focus();
				return false;
			}
			if(f.p_Pw.value.length > 8)
			{
				alert("비밀번호는 8자 이하로 입력해주세요");
				f.p_Pw.focus();
				return false;
			}
			else return true;
		}
	</script>
</head>
<body>
	<h3> HOME > LOGIN </h3>
	<hr>
	<form action="loginSuccess.jsp" name=person method="get" onsubmit="return check()">
		<fieldset style="width:250px">
			<legend> 로 그 인 </legend><p>
				아이디 : <br>
				<input type="text" name="p_id" size="16"><br><br>
				비밀번호 : <br>
				<input type="password" name="p_Pw" size="16"><br><br>
				
			<hr>
			<div align="center">
				<button type="button" onclick="location.href='Sign.jsp';">회원가입</button> &nbsp;&nbsp;
				<input type="submit" value=" 로그인 ">
			</div>
		</fieldset>
		<div style=float:center class="ima">
			<img src="image/benz.jpg" alt=" " width="200" height="200">
			<img src="image/RENEGADE.jpg" alt=" " width="200" height="200">
			<img src="image/Porsche.jpg" alt=" " width="200" height="200">
			<img src="image/mac.jpg" alt=" " width="200" height="200">	
		</div>
	</form>
</body>
</html>

