<%@ page contentType="text/html;charset=euc-kr"%>

<jsp:useBean id="sdao" class="co.kh.dev.memberone.model.StudentDAO" />
<jsp:useBean id="svo" class="co.kh.dev.memberone.model.StudentVO" />
<html>
<head>
<title>회원탈퇴</title>
</head>
<%
request.setCharacterEncoding("UTF-8");

String id = (String) session.getAttribute("id");
String sessionPass = (String) session.getAttribute("pass");
String pass = request.getParameter("pass");

svo.setId(id);
svo.setPass(pass);
boolean flag = sdao.deleteDB(svo);
if (flag == true) {
	session.invalidate();
%>
<meta http-equiv="Refresh" content="3;url=login.jsp">
<body>
	<main>
		<p>
			회원정보가 삭제되었습니다<br></br> 안녕히 가세요 ! ㅠ.ㅠ<br></br> 3초후에 로그인 페이지로 이동합니다
		</p>
	</main>
	<%
	} else {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>