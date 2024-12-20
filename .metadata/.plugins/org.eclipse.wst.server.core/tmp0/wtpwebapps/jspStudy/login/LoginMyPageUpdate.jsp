<%@page import="co.kh.dev.model.UsersDAO"%>
<%@page import="co.kh.dev.model.UsersVO"%>
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
	response.setContentType("text/html;charset=UTF-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");

	boolean returnFlag = false;

	session = request.getSession(false);
	String idValue = (String) session.getAttribute("id");
	if (session != null) {
		try {
			UsersDAO uDao = new UsersDAO();
			UsersVO uVo = new UsersVO(id, pass, name, idValue);
			UsersVO rUvo = uDao.selectLoginCheckDB(uVo);
			returnFlag = uDao.updateDB(uVo);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		if (returnFlag == true) {
			if (idValue.equals(id)) {
	%>
	<h2><%=id%>는 이미 존재하는 아이디 입니다.
	</h2>
	<a href='LoginMyPage.jsp'><input type='button' value='뒤로가기'></a>
	<%
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	session.setAttribute("name", name);
	} else {
	%>
	<table align='center' width='700' border='1'>
		<th colspan='6'>정보 수정이 완료 되었습니다</th>
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
		}
		} else {
		%>
	
	<h2>잘못 입력하였습니다</h2>
	<%
	}
	} else {
	%>

	<h2>페이지에 대한 권한이 없습니다..</h2>
	<a href='LoginMyPage.jsp'><input type='button' value='뒤로가기'></a>
	<%
	}
	%>
</body>
</html>