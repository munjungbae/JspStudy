<%@page contentType="text/html; charset=UTF-8"%>
<%@page isErrorPage="true"%>
<%
//웹브라우저에게 정상적으로 처리 되었음을 알림 ( 200번 메세지 )
response.setStatus(HttpServletResponse.SC_OK);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
</head>
<body>
	<h4>올바른 요청이 아닙니다!</h4>
	<a href="index.do">인덱스 돌아가기</a>
</body>
</html>
s
