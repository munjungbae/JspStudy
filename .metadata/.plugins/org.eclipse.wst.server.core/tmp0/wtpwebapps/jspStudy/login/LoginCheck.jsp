<%@page import="co.kh.dev.model.UsersVO"%>
<%@page import="co.kh.dev.model.UsersDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");

	session = request.getSession();

	UsersDAO uDao = new UsersDAO();
	UsersVO uVo = new UsersVO(id, pass, name);
	UsersVO rUvo = uDao.selectLoginCheckDB(uVo);

	if (rUvo == null) {
	%>
	<h2>아이디 또는 비밀번호를 입력 해 주세요.</h2>
	<a href='LoginPage.jsp'><input type='button' value='뒤로가기'></a>
	<%
	} else {
	if (id.equals("admin") && pass.equals("123456")) {
		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
		session.setAttribute("pass", pass);
		response.sendRedirect("LoginPage.jsp");

	} else {
		if (id.equals(rUvo.getId()) && pass.equals(rUvo.getPass())) {
			session.setAttribute("id", rUvo.getId());
			session.setAttribute("pass", rUvo.getPass());
			session.setAttribute("name", rUvo.getName());
			response.sendRedirect("LoginMyPage.jsp");
		} else if (id.equals(rUvo.getId())) {
	%>
	<h2 style='text-align: center'>비밀번호가 일치하지 않습니다.</h2>
	<a href='LoginPage.jsp'><input type='button' value='뒤로가기'></a>
</body>
</html>
<%
session.invalidate();
} else {
%>
<h2 style='text-align: center'>아이디가 존재하지 않습니다.</h2>
<a href='LoginPage.jsp'><input type='button' value='뒤로가기'></a>
</body>
</html>
<%
session.invalidate();
}
}
}
%>
</body>
</html>