<%@ page contentType="text/html;charset=euc-kr"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<HTML>
<HEAD>
<TITLE>표현언어의 사용예제</TITLE>
</HEAD>
<BODY>
	<H3>파라미터값 처리</H3>
	<br></br>
	<FORM action="elexam3.jsp" method="post">
		이름 : <input type="text" name="name" value="${param['name']}">
		<input type="submit" value="확인">
	</FORM>
	<P>이름은: ${param.name} 입니다.</P>
</BODY>
</HTML>