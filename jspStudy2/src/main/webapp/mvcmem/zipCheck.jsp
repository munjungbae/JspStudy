<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.dev.student.model.StudentDAO"%>
<%@page import="com.kh.dev.student.model.ZipCodeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String check = (String) request.getAttribute("check");
String dong = (String) request.getAttribute("dong");
ArrayList<ZipCodeVO> zList = (ArrayList<ZipCodeVO>) request.getAttribute("zipcodeList");
int totalList = (int) request.getAttribute("totalList");
%>

<html>
<head>
<title>우편번호검색</title>
<link href="style.css<%=System.currentTimeMillis()%>" type="text/css"
	rel="stylesheet" />
<script language="JavaScript"
	src="script.js<%=System.currentTimeMillis()%>"></script>
<!-- ② -->
</head>
<body bgcolor="#FFFFCC">
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
				String tempZipcode = data.getZipcode();
				String tempSido = data.getSido();
				String tempGugun = data.getGugun();
				String tempDong = data.getDong();
				String tempBunji = data.getBunji();
				if (data.getBunji() == null) {
					data.setBunji(" ");
				}
			%>

			<tr>
				<td><a
					href="javascript:sendAddress('<%=tempZipcode%>', '<%=tempSido%>', '<%=tempGugun%>','<%=tempDong%>','<%=data.getBunji()%>')">
						<%=data.toString()%></a> <br> <%
 }
 }
 %> <%
 }
 %></td>
			</tr>
			<tr>
				<td align="center">
					<button onClick="javascript:self.close()">닫기</button>
				</td>
			</tr>
		</table>
	</main>
</body>
</html>