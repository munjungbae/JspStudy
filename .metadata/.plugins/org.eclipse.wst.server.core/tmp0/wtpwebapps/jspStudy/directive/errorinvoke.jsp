<%@page contentType="text/html; charset=UTF-8"%>
<%@page errorPage="/error/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>서버 에러 발생해서 에러페이지로 연결 한다.</h1>
<%
	//사용자 요청을 가져와서 출력한다
	String name = request.getParameter("name").toUpperCase();
	out.println("사용자가 입력한 이름 : "+ name);
%>

</body>
</html>