<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.sql.Timestamp"%>
<%
request.setCharacterEncoding("UTF-8");

boolean flag = (boolean) request.getAttribute("flag");
if (flag == true) {
	response.sendRedirect("list.do");
} else {
%>
<script>
	alert("게시판 등록이 실패 하였습니다.");
	history.go(-1);
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>