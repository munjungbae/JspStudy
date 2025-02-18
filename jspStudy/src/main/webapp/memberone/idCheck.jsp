<%@page import="co.kh.dev.memberone.model.StudentVO"%>
<%@page import="co.kh.dev.memberone.model.StudentDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
//1. 사용자 정보를 가져온다
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
//2. curd
StudentVO svo = new StudentVO();
svo.setId(id);
StudentDAO sdao = new StudentDAO();
boolean flag = sdao.selectIdCheck(svo);
%>

<!-- 3. 화면설계 -->
<!DOCTYPE html>
<html>
<head>
<title>ID중복체크</title>
<body bgcolor="#FFFFCC">
<link href="./css/style.css" type="text/css" rel="stylesheet" />
<script language="JavaScript" src="memscript.js"></script>
</head>
<br>
<main>
	<%
	if (flag) {
		out.println("<b>"+id+"<b>는 이미 존재하는 ID입니다.<br></br>");
	} else {
		out.println("<b>"+id+"<b>는 사용 가능 합니다.<br></br>");
	}
	%>
	<button onClick="javascript:self.close()">닫기</button>
</main>
</body>
</html>