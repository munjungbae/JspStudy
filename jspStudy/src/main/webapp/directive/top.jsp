<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
Date date = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script></script>
<style type="text/css"></style>
<body>
	<h1>top.jsp 페이지 입니다</h1>
	<p style='color:red;'>
		오늘의 시간은
		<%=date%>
		입니다
	</p>
	<hr color="red">