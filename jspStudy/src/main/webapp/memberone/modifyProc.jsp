<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="sdao" class="co.kh.dev.memberone.model.StudentDAO" />
<jsp:useBean id="svo" class="co.kh.dev.memberone.model.StudentVO">
	<jsp:setProperty name="svo" property="*" />
</jsp:useBean>
<%
String id = (String) session.getAttribute("id");
svo.setId(id);
boolean flag = sdao.updateDB(svo);
%>
<html>
<head>
<title>Update Process</title>
</head>
<meta http-equiv="Refresh" content="3;url=login.jsp">
<body>
	<main>
		<%
		if (flag == true) {
		 session.setAttribute("pass", svo.getPass());
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