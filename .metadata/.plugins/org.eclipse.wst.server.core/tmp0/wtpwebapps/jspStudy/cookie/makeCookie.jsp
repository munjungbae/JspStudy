<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.net.URLEncoder"%>
<%
//웹 브라우저에 한글을 보낼 때는 UTF-8 파일로 전송
Cookie cookie = new Cookie("keyValue", URLEncoder.encode("문정배", "UTF-8"));
response.addCookie(cookie);
%>
<html>
<head>
<title>쿠키생성</title>
</head>
<body>
	<%=cookie.getName()%>
	쿠키의 값 = "<%=cookie.getValue()%>"
</body>
</html>