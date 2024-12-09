<%@page import="co.kh.dev.model.UsersVO"%>
<%@page import="co.kh.dev.model.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	session = request.getSession(false);
	if (session != null) {
		HttpSession sessionValue = request.getSession();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");

		UsersDAO uDao = new UsersDAO();
		UsersVO uVo = new UsersVO(id, pass, name);
		boolean returnFlag = uDao.insertDB(uVo);

		if (returnFlag == true) {
	%>
	<table align='center' width='700' border='1'>

		<th colspan='6'>회원 가입이 완료 되었습니다</th>
		<tr>

			<th width=300 height=50>아이디</th>
			<td width=400 align=center><%=id%></td>
			<th width=300 height=50>비밀번호</th>
			<td width=400 align=center><%=pass%></td>
			<th width=300 height=50>이름</th>
			<td width=400 align=center><%=name%></td>
		</tr>

		<td align='center' colspan='6' height='50'><a
			href='LoginMyPage.jsp'><input type='button' value='로그인'
				align='center'></a></td>
	</table>
	<p>
		<%
		sessionValue.setAttribute("id", id);
		sessionValue.setAttribute("pass", pass);
		sessionValue.setAttribute("name", name);
		} else {
		%>
	
	<h2><%=id%>는 이미 존재하는 아이디 입니다.
	</h2>
	<a href='login.html'><input type='button' value='뒤로가기'></a>
	<%
	}
	} else {
	%>
	<h2>권한이 존재하지 않습니다</h2>
	<a href='login.html'><input type='button' value='뒤로가기'></a>
	<%
	}
	%>
</body>
</html>