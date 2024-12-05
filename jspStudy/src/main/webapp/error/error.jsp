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
<title>예외 발생 처리</title>
</head>
<body>
<h1>요청 처리 과정에서 예외가 발생</h1>
<h1>처리 중 입니다..</h1>
<h2>에러타입 <%= exception.getClass().getName() %> </h2>
<br>
<h2>에러타입 <%= exception.getMessage() %></h2>
</body>
</html>