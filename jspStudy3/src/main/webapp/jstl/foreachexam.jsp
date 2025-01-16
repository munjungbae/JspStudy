<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.edu.jstl.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
MemberVO vo1 = new MemberVO("문정배1", "MJB1@daum.net", 27);
MemberVO vo2 = new MemberVO("문정배2", "MJB2@daum.net", 28);
MemberVO vo3 = new MemberVO("문정배3", "MJB3@daum.net", 29);
MemberVO vo4 = new MemberVO("문정배4", "MJB4@daum.net", 30);
ArrayList<MemberVO> list = new ArrayList<MemberVO>();

list.add(vo1);
list.add(vo2);
list.add(vo3);
list.add(vo4);

request.setAttribute("list", list);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="450">
		<c:forEach var="data" items="${list}" varStatus="no">
			<tr>
				<th width="50">번호 : ${no.count}</th>
				<th width="100">이름 : ${data.name}</th>
				<th width="200">메일 : ${data.email}</th>
				<th width="100">나이 : ${data.age}</th>
			</tr>
		</c:forEach>
	</table>
</body>
</html>