<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 3. 화면설계 -->
<!DOCTYPE html>
<html>
<head>
<title>ID중복체크</title>
<body bgcolor="#FFFFCC">
	<link href="style.css" type="text/css" rel="stylesheet" />
	<script language="JavaScript" src="memscript.js"></script>
</head>
<br>
<main>
<b>${id}</b>
	<%
	String id = (String) request.getAttribute("id");
	boolean check =	(boolean) request.getAttribute("check");
	
	if (check == true) {
		out.println("<b>" + id + "<b>는 이미 존재하는 ID입니다.<br></br>");
	} else {
		out.println("<b>" + id + "<b>는 사용 가능 합니다.<br></br>");
	}
	%>
	<button onClick="javascript:self.close()">닫기</button>
</main>
</body>
</html>