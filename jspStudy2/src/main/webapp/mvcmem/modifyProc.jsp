<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

boolean flag = (boolean) request.getAttribute("flag");
%>
<html>
<head>
<title>Update Process</title>
</head>
<meta http-equiv="Refresh" content="3;url=login.do">
<body>
	<main>
		<%
		if (flag == true) {
		%>
		<p>
			입력하신 내용대로 <b>회원정보가 수정 되었습니다.</b><br></br> 3초후에 Logon Page로 이동합니다
		</p>
		<%
		} else {
		%>
		<p>수정에 실패 하였습니다 다시 입력 바랍니다.</p>
		<%
		return;
		}
		%>
	</main>
</body>
</html>