<%@page import="java.util.ArrayList"%>
<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@page import="co.kh.dev.memberone.model.ZipCodeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//1. 사용자 정보를 가져온다
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

<!-- 3. 화면설계 -->


<!-- ① -->
<html>
<head>
<title>우편번호검색</title>
<link href="./css/style.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="memscript.js"></script>
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
			<td><a href="javascript:sendAddress('<%=tempZipcode%>', '<%=tempSido%>', '<%=tempGugun%>','<%=tempDong%>','<%=data.getBunji()%>')">
					<%=data.toString()%></a>
				<br> <%
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