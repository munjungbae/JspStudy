<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%
int check = (Integer) request.getAttribute("check");
String pageNum = (String) request.getAttribute("pageNum");

// check 반환값이 1일때 : 성공
// 2일때 : 패스워드 문제
// 3일때 : 수정문제
if (check == 1) {
%>
<meta http-equiv="Refresh" content="0;url=list.do?pageNum=<%=pageNum%>">
<%
} else if (check == 2) {
%>
<script>
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);
</script>
<%
} else {
%>
<script>
	alert("업데이트가 올바르게 이뤄지지 않았습니다.");
	history.go(-1);
</script>
<%
}
%>