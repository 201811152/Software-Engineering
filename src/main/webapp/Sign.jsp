<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회 원 가 입</title>
	<script type="text/javascript">
		function check(){
			var f = document.sign_up;
			
			var names = f.p_name.value;
			var regeExpName = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				
			
			if(!regeExpName.test(names))
				{
					alert("이름은 한글로만 작성가능.");
					f.p_name.focus();
					return false;
				}
			if(f.secret.value=="")
			{
				alert("주민등록번호를 입력해주세요.");
				f.secret.focus();
				return false;
			}
			else return true;	
		}
	</script>
</head>
<body>
	<h3>HOME > Login > Sign up</h3>
	<hr>
	<form name="sign_up" action="insertDB.jsp" method="POST" onsubmit="return check()">
	<fieldset style="width:500px">
			<legend> 개인 정보 입력 </legend><p>		
				이름 : <br>
				<input type="text" name="p_name" size="16"><br><br>
				
				주민번호 : <br>
				<input type="text" maxlength="6" size="6" name="secret" style="width:50px">
				<br><br>
				
				아이디 : <br>
				<input type="text" name="p_id" size="16"><br><br>
				
				비밀번호 : <br>
				<input type="password" name="p_pw" maxlength="16" size="16"><br><br>
				
				연락처 : <br>
				<select name="choice" style="width:60px;height=20.5px">
					<option value="choice"> 선택 </option>
					<option value="KT"> KT </option>
					<option value="SKT"> SKT </option>
					<option value="LGU+"> LGU+ </option>
				</select>
				<input type="text" maxlength="3" size="3" name="P1" style="width:30px"> -
				<input type="text" maxlength="4" size="4" name="P2" style="width:40px"> -
				<input type="text" maxlength="4" size="4" name="P3" style="width:40px"><br><br>
				
				운전면허유무 : <br>
				<select name="license" style="width:60px;height=20.5px">
					<option value="license"> 선택 </option>
					<option value="1종"> 1종 </option>
					<option value="2종"> 2종 </option>
					<option value="대형"> 대형 </option>
				</select>
			<hr>
			<div align="center">
				<input type="submit" value=" 가입하기 "> &nbsp;&nbsp;
				<input type="reset" value=" 다시작성 ">
			</div>
		</fieldset>
		</form>
</body>
</html>