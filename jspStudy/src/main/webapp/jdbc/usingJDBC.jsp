<%@page import="java.sql.SQLException"%>
<%@page import="co.kh.dev.tempmember.model.TempMemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.kh.dev.tempmember.model.TempMemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int counter = 0;
TempMemberDAO tmdao = new TempMemberDAO();
ArrayList<TempMemberVO> tmList = tmdao.selectDB(); // DB에서 사용자 목록 가져오기
%>
<!DOCTYPE html>
<html>
<head>
<title>JSP에서 데이터베이스 연동</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<h2>JSP 스크립틀릿에서 데이터베이스 연동 예제입니다</h2>
	<br></br>
	<h3>회원정보</h3>
	<table>
		<tr>
			<td><strong>ID</strong></td>
			<td><strong>PASSWD</strong></td>
			<td><strong>NAME</strong></td>
			<td><strong>MEM_NUM1</strong></td>
			<td><strong>MEM_NUM2</strong></td>
			<td><strong>E_MAIL</strong></td>
			<td><strong>PHONE</strong></td>
			<td><strong>ZIPCODE</strong></td>
			<td><strong>ADDRESS</strong></td>
			<td><strong>JOB</strong></td>
		</tr>
		<%
for (TempMemberVO data : tmList){
%>
		<tr>
			<td><%= data.getId()%></td>
			<td><%= data.getPasswd() %></td>
			<td><%= data.getName() %></td>
			<td><%= data.getMemNum1() %></td>
			<td><%= data.getMemNum2() %></td>
			<td><%= data.geteMail() %></td>
			<td><%= data.getPhone() %></td>
			<td><%= data.getZipcode() %></td>
			<td><%= data.getAddress() %></td>
			<td><%= data.getJob() %></td>
			<%
 				counter++;
 			}//end while
%>
		</tr>
	</table>
	<br></br> total records : <%= counter %>
</body>
</html>
