<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> car_select </title>
	<script type="text/javascript">	
		function checkFun() 
		{
			var f = document.search;
			if(f.key.value == "")
			{
				alert("검색할 이름을 입력해 주세요.");
				f.key.focus();
				return false;
			}
			else return true;
		}		
	</script>	
</head>
<body>
	Home > 차량 검색
	<hr>
	<%
		String car = request.getParameter("key");
	
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
	<table border = "1" cellpadding= "10">
	<tr>
	<th> NO </th><th> 자동차 모델 </th> <th> 연료 </th><th>유형</th><th> 변속</th> <th>비용(킬로미터당)</th>
	<th>편의기능1</th><th>편의기능2</th><th>편의기능3</th><th>편의기능4</th><th>편의기능5</th>
	</tr>
	<% 
	
		Statement sm = conn.createStatement();
		ResultSet rs;
		

		
		if(car==null){
			String sql = "SELECT * FROM cars as c, opt as o where c.options=o.options";
			rs = sm.executeQuery(sql);
		}
		else{
		  String sql = "select * from cars as c, opt as o where c.options=o.options and car_name like '%"+car+"%'";
			rs = sm.executeQuery(sql);
		}
		
		int count =1;
		while(rs.next()){
			String drive =rs.getString("drive_price");
	%>
			<tr>
			<td><%=count%>
			<td align="center"><%=rs.getString("car_name")%></td>
			<td align="center"><%=rs.getString("fuel")%></td>
			<td align="center"><%=rs.getString("type")%></td>
			<td align="center"><%=rs.getString("gear")%></td>
			<td align="center"><%=drive%></td>
			<td align="center"><%=rs.getString("one")%></td>
			<td align="center"><%=rs.getString("two")%></td>
			<td align="center"><%=rs.getString("three")%></td>
			<td align="center"><%=rs.getString("four")%></td>
			<td align="center"><%=rs.getString("five")%>
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
	<table border="0">
		<tr>
			<td>
				<form action="MENU.jsp" method="post" >
					<input type="submit" value=" 뒤로 가기" >
				</form>
			</td>	 
		</tr>
		<form action=select.jsp method="post" name="search" onsubmit="return checkFun()">
			<input type="text" name="key"><input type="submit" value="검색">
		</form>
	</table>
</table>  		
</body>
</html>	