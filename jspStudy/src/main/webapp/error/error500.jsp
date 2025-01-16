<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<%
//웹브라우저에게 정상적으로 처리 되었음을 알림 ( 200번 메세지 )
response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500예외발생</title>
</head>
<body>
	<h1>요청과정 중 문제 발생</h1>
	<h1>처리중 입니다...</h1>
	<h2>
		에러타입
		<%=exception.getClass().getName()%>
	</h2>
	<br>
	<h2>
		에러타입
		<%=exception.getMessage()%></h2>
</body>
</html>