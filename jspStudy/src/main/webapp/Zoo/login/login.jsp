<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Log in</title>
<link href="./login.css" type="text/css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="JavaScript"
	src="../script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<body class="loginBody">
		<form class="login" method="post" action="loginCheck.jsp">
			<table class="top">
					<tr class="title">
						<th>회원 로그인</th>
					</tr>
					<tbody>
					<tr>
						<td class="tdicon" placeholder="ID"><i class="fa-regular fa-user"></i></td>
						<td class="tdbody" ><input type="text" name="id" class="ID" placeholder="ID"/></td>
					</tr>
					<tr>
						<td class="tdicon"><i class="fa-solid fa-key"></i></td>
						<td class="tdbody"><input type="password" name="pass" class="pwd" placeholder="PW"/></td>
					</tr>
				</tbody>
					<tr>
						<td><input type="submit" value="로그인" class="loginID"/></td>
						<td><input type="button" value="회원가입" onClick="registerWindow()" /></td>
					</tr>
			</table>
		</form>
</body>
</html>