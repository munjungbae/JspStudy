<%@ page contentType="text/html;charset=euc-kr"%>


<html>
<head>
<title>ȸ��Ż��</title>
</head>
<%
boolean flag = (boolean) request.getAttribute("flag");
if (flag == true) {
%>
<meta http-equiv="Refresh" content="3;url=login.do">
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