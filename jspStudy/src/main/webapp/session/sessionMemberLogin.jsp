<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head>
<title>������ ����� ������ ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form method="post" action="/session/sessionMemberLogInOK.jsp">
		<table width="300" border="1" align="center">
			<tr>
				<td colspan="2">
					<div align="center">�α���</div>
				</td>
			</tr>
			<tr>
				<td width="100">���̵�</td>
				<td width="200"><input type="text" name="id"></td>
			</tr>
			<tr>
				<td width="100">��й�ȣ</td>
				<td width="200"><input type="password" name="passwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="�α���">
					&nbsp;&nbsp;&nbsp; <input type="reset" value="�ٽ��ۼ�"></td>
			</tr>
		</table>
	</form>
</body>
</html>