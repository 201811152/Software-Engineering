<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 전용 공간 </title>
</head>
<body>
	Home > 회원 전용 공간
	<hr>
	<%
		
		if(session.getAttribute("memberId")==null){
			response.sendRedirect("LOGIN.jsp");
		}
		else if(session.getAttribute("manager").equals("0")){
			String name = (String)session.getAttribute("membername");
			out.println("사용자 ["+ name +"]이 입장하셧습니다.\n");
		}
	%>
	반갑습니다.<br>
	여기는 회원 전용 공간입니다.<br>
	회원을 탈퇴하려면 버튼을 눌러주세요.<br><br>
	<table border="0">
		<tr>
			<td>
				<form action="MENU.jsp" method="post" >
					<input type="submit" value=" ◀ 메인 화면 " >
				</form>
			</td>
		</tr>	
	</table>	 	
</body>
</html>