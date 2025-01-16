<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int score = 85;
request.setAttribute("score", score);
%>
<html>
<head>
<title>JSTL Example</title>
</head>
<body>
	<c:choose>
		<c:when test="${score ge 90}">
			<p>당신의 성적은 A입니다.</p>
		</c:when>
		<c:when test="${score ge 80}">
			<p>당신의 성적은 B입니다.</p>
		</c:when>
		<c:when test="${score ge 70}">
			<p>당신의 성적은 C입니다.</p>
		</c:when>
		<c:when test="${score ge 60}">
			<p>당신의 성적은 D입니다.</p>
		</c:when>
		<c:otherwise>
			<p>당신의 성적은 F입니다.</p>
		</c:otherwise>
	</c:choose>
</body>
</html>
