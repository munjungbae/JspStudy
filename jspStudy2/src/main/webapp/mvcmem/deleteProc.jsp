<%@ page contentType="text/html;charset=euc-kr"%>


<html>
<head>
<title>회원탈퇴</title>
</head>
<%
boolean flag = (boolean) request.getAttribute("flag");
if (flag == true) {
%>
<meta http-equiv="Refresh" content="3;url=login.do">
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