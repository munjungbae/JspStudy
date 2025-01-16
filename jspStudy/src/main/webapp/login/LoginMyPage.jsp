<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	response.setContentType("text/html;charset=UTF-8");

	try {
		session = request.getSession(false);
		if (session != null) {
			String name = (String) session.getAttribute("name");
	%>
	<table align='center' border='1' width='300'>
		<tr>
			<td width='300' align='center'><%=name%> 님 로그인 되었습니다.</td>
		</tr>
		<tr>
			<td align='center'><a href='loginUpdate.html'>정보수정</a> <a
				href='Logout.jsp'>로그아웃</a></td>
		</tr>
	</table>
	<%
	} else {
	%>
	<form method='post' action='LoginCheck.jsp'>
		<table align='center' border='1' width='300'>
			<tr>
				<th width='100'>아이디</th>
				<td width='200'>&nbsp;<input type='text' name='id'></td>
			</tr>
			<tr>
				<th width='100'>비밀번호</th>
				<td width='200'>&nbsp;<input type='password' name='pass'></td>
			</tr>
			<tr>
				<td align='center' colspan='2'><a href='login.html'><input
						type='button' value='회원가입' align='center'></a> <input
					type='submit' value='로그인'></td>
			</tr>
			</form>
		</table>
		<%
		}
		} catch (Exception e) {
		System.out.println(e.toString());
		}
		%>
	
</body>
</html>