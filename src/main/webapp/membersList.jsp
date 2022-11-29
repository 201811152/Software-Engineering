<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Members List </title>
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
	<% 
		Statement sm = conn.createStatement();
		ResultSet rs;
		String sql;
		String search_name = request.getParameter("key");
		String search = request.getParameter("select");
		int pages;
		int firstnum=1;
		int lastnum=0;
		int pagecount=0;
		
		sql = "select * from member";
		rs= sm.executeQuery(sql);
		while(rs.next()){
			pagecount++;
		}
		lastnum=(pagecount/5)+1;
		sql = "select * from member";
		rs = sm.executeQuery(sql);
		if(request.getParameter("counts") == null){
			pages = firstnum;
		}
		else {
			pages = Integer.parseInt(request.getParameter("counts"));
		}
		if(pages < 1){
			pages=1;
		}
		if(lastnum < pages){
			pages = pages-1;
		}
		for(int i = 0; i < (pages-1) * 5; i++){
			rs.next();
		}
		if(search_name!=null){
			sql = "select * from member where "+search+" like '%"+search_name+"%'";
			rs = sm.executeQuery(sql);
			for(int i = 0; i < (pages-1) * 5; i++){
				rs.next();
			}
		}
	%>

</head>
<body>
	Home > 등록 회원 관리
	<hr>
	<%
		if(session.getAttribute("memberId")==null){
			response.sendRedirect("LOGIN.jsp");
		}
		else if(session.getAttribute("manager").equals("1")){
			String name = (String)session.getAttribute("membername");
			out.println("관리자 ["+ name +"]이 입장하셧습니다.\n");
		}
		else if(session.getAttribute("manager").equals("0")){
			response.sendRedirect("LOGIN.jsp");
		}
	%> 
<table border = "1" cellpadding= "10">
	<tr>
	<th> 아이디 </th> <th> 이름 </th> <th> 비밀 번호 </th><th> 연락처</th><th> 운전 면허</th> <th>관리자 여부</th><th>수정</th><th> 삭제 </th>
	</tr>
	<% 
		int count = 1;
		for (int i =0 ;i<5 ;i++){
				if(rs.next()){
					String del= new String("'drawCheck.jsp?userID=" + rs.getString("id") + "'");
					String mod = new String("'modify.jsp?id="+rs.getString("id")+"'");
					%>
						<tr>
						<td><%=count%>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("ID")%></td>
						<td><%=rs.getString("PW")%></td>
						<td align="center"><%=rs.getString("RRN")%>
						<td align="center"><%=rs.getString("phonenum")%>
						<td align="center"><%=rs.getString("license")%>
						<td align="center"><a href=<%=mod%>>ㅁ</a>
						<td align="center"><a href=<%=del%>>X</a>
						</td>
						</tr>
					<% 
					count++;
					}
				}	
	%>
	<a href="membersList.jsp?counts=<%=firstnum%>">처음</a>&nbsp;&nbsp;
	<a href="membersList.jsp?counts=<%=pages-1%>">이전</a>&nbsp;&nbsp;
	<a href="membersList.jsp?counts=<%=pages+1%>">다음</a>&nbsp;&nbsp;
	<a href="membersList.jsp?counts=<%=lastnum%>">마지막</a>&nbsp;&nbsp;
	<hr>
	<table border="0">
		<tr>
			<td>
				<form action="withdraw.jsp" method="post" >
					<input type="submit" value=" ◀ 회원 탈퇴시키기 " >
				</form>
			</td>	 
			<td>
				<form action="logout.jsp" method="post" >
					<input type="submit" value=" 로그 아웃 ▶" >
				</form>
			</td>
		</tr>
		<form action=membersList.jsp method="post" name="search" onsubmit="return checkFun()">
			<input type = "radio" name = select value=ID> ID
			<input type = "radio" name = select value=name> name
			<input type = "radio" name = select value=phonenum> 전화번호
			<input type="text" name="key">
			<input type="submit" value="검색">
		</form>
	</table>
</table>  		
</body>
</html>	