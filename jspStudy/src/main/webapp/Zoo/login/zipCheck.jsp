<%@page import="java.util.ArrayList"%>
<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@page import="co.kh.dev.memberone.model.ZipCodeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String dong = request.getParameter("dong");
String check = request.getParameter("check");
ArrayList<ZipCodeVO> zList = new ArrayList<ZipCodeVO>();
//2. curd
if (check.equals("n") == true) {
	ZipCodeVO zvo = new ZipCodeVO();
	zvo.setDong(dong);
	StudentDAO sdao = new StudentDAO();
	zList = sdao.selectZipCodeCheck(zvo);
}
%>
<html>
<head>
<title>우편번호검색</title>
<link href="./login.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="../script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
<!-- ② -->
</head>
<body>
<main>
	<b>우편번호 찾기</b>
	<form name="zipForm" method="post" action="zipCheck.jsp">
		<input type="hidden" name="check" value="n">
		<table>
			<tr>
				<td>동이름 입력 : <input name="dong" type="text"> <input
					type="button" value="검색" onclick="dongCheck()" />
				</td>
			</tr>
		</table>
	</form>
	<table>
		<!-- ③ -->
		<%
		if (check.equals("n")) {
			if (zList.isEmpty()) {
		%>
		<tr>
			<td align="center"><br />검색된 결과가 없습니다.</td>
		</tr>
		<%
		} else {
		%>
		<tr>
			<td align="center"><br /> ※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
		</tr>
		<%
		for (ZipCodeVO data : zList) {
			String Zipcode = data.getZipcode();
			String Sido = data.getSido();
			String Gugun = data.getGugun();
			String Dong = data.getDong();
			if (data.getBunji() == null) {
				data.setBunji("");
			}
		%>

		<tr>
			<td><a
				href="javascript:sendAddress('<%=Zipcode%>', '<%=Sido%>', '<%=Gugun%>','<%=Dong%>','<%=data.getBunji()%>')">
					<%=data.toString()%></a> <br> <%
 }
 }
 %> <%
 }
 %></td>
		</tr>
		<!-- ③ -->
		<tr>
			<td align="center">
				<button onClick="javascript:self.close()">닫기</button>
			</td>
		</tr>
	</table>
</main>
</body>
</html>