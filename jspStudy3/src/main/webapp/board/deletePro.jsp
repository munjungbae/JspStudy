<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%
String pageNum = (String) request.getAttribute("pageNum");
boolean flag = (boolean) request.getAttribute("flag");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (flag == true) {
	%>
	<meta http-equiv="Refresh"content="0;url=list.jsp?pageNum=<%=pageNum%>">
	<%
	} else {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>