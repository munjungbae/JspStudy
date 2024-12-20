<%@ page contentType="text/html; charset=UTF-8"%>
<link href="./css/style.css" type="text/css" rel="stylesheet" />
<%
session.invalidate();
response.sendRedirect("login.jsp");
%>
<html>
<head>
<title>Logout</title>
</head>
<body>

</body>
</html>
