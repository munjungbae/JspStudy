<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.net.URLEncoder"%>
<%
//�� �������� �ѱ��� ���� ���� UTF-8 ���Ϸ� ����
Cookie cookie = new Cookie("keyValue", URLEncoder.encode("������", "UTF-8"));
response.addCookie(cookie);
%>
<html>
<head>
<title>��Ű����</title>
</head>
<body>
	<%=cookie.getName()%>
	��Ű�� �� = "<%=cookie.getValue()%>"
</body>
</html>