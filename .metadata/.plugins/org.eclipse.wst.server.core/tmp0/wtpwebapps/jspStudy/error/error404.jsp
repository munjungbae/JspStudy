<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	//웹브라우저에게 정상적으로 처리 되었음을 알림 ( 200번 메세지 )
	response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404예외발생</title>
</head>
<body>
<h1>요청과정 중 문제 발생</h1>
<h1>페이지가 존재하지 않습니다</h1>
</body>
</html>