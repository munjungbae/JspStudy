<%@page import="co.kh.dev.sample.SimpleData"%>
<%@ page contentType="text/html;charset=euc-kr"%>
<%
	request.setCharacterEncoding("UTF-8");
/* 	String message1 = request.getParameter("message1");
	String message2 = request.getParameter("message2");
	
	SimpleData sd = new SimpleData(message1, message2); */
%>
<jsp:useBean id="sd" class = "co.kh.dev.sample.SimpleData" />
<jsp:setProperty name = "sd" property = "*" />
<html>
<body>
<h1>������ ���� ���α׷� ���</h1>
<hr color="red"></hr><br></br>
<h3>
�޼���1 :<%--  <%=sd.getMessage1()%> --%> <jsp:getProperty name="sd" property="message1"/>
<br>
�޼���2 :<%--  <%=sd.getMessage2()%> --%> <jsp:getProperty name="sd" property="message2"/>
</h3>
</body>
</html>
