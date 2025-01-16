<%@page import="co.kh.dev.model.UsersVO"%>
<%@page import="java.util.ArrayList"%>
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
	UsersDAO uDao = new UsersDAO();
	ArrayList<UsersVO> uList = new ArrayList<UsersVO>();
	uList = uDao.selectDB();

	try {

		response.setContentType("text/html;charset=UTF-8");

		for (UsersVO uVo : uList) {
	%>
	<table align=center width=900 border=1>
		<tr>
			<th width=300 height=50>넘버</th>
			<td width=400 align=center><%=uVo.getNo()%></td>
			<th width=300 height=50>아이디</th>
			<td width=400 align=center><%=uVo.getId()%></td>
			<th width=300 height=50>비밀번호</th>
			<td width=400 align=center><%=uVo.getPass()%></td>
			<th width=300 height=50>이름</th>
			<td width=400 align=center><%=uVo.getName()%></td>
		</tr>
	</table>
	<%
	}
	%>
	<p align=center>
		<a href=LoginPage.jsp>뒤로</a>
	</p>
	<%
	} catch (Exception e) {
	System.out.println(e.toString());
	}
	%>
</body>
</html>