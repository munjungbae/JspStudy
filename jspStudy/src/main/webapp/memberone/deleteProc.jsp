<%@ page contentType="text/html;charset=euc-kr"%>

<jsp:useBean id="sdao" class="co.kh.dev.memberone.model.StudentDAO" />
<jsp:useBean id="svo" class="co.kh.dev.memberone.model.StudentVO" />
<html>
<head>
<title>ȸ��Ż��</title>
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
			ȸ�������� �����Ǿ����ϴ�<br></br> �ȳ��� ������ ! ��.��<br></br> 3���Ŀ� �α��� �������� �̵��մϴ�
		</p>
	</main>
	<%
	} else {
	%>
	<script>
		alert("��й�ȣ�� ���� �ʽ��ϴ�");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>