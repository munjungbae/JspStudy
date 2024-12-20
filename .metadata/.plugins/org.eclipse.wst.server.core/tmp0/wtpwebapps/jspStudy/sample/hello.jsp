<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		현재 날짜 시간은 =
		<%=(new Date()).toString()%>
	</h1>
	<!-- <h2>HTML에서의 주석처리 내용</h2> -->  <!-- html 주석이므로 jsp처리할 때 넘어감 -->
	<%-- <h2>HTML에서의 주석처리 내용</h2> --%> <%-- jsp 주석(넘어가지 않음) --%>
</body>
</html>