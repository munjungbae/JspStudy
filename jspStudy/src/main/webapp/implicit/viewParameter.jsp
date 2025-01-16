<%@page import="java.util.Map"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
request.setCharacterEncoding("uft-8");
String name = request.getParameter("name");
String address = request.getParameter("address");
//체크박스에서 체크 한 것만 가져옴.
String [] values = request.getParameterValues("pet");
Enumeration enumData = request.getParameterNames();

System.out.println("name = " + name);
System.out.println("address = " + address);
for(int i=0; i<values.length; i++) {
	System.out.println("Values ["+i+"] = " + values);
}

while(enumData.hasMoreElements()) {
	//enum안에 값이 존재하니  hamoreElements
	String enumName = (String) enumData.nextElement();
	System.out.println("enumName = " + enumName);
}
//키값 value 값으로 분류해서 나누어 버린다.
Map parameterMap = request.getParameterMap();
String[] nameParam = (String[])parameterMap.get("name");
System.out.println("nameParam = " + nameParam[1]);
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