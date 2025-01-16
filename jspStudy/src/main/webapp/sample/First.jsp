<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		여기서 아래에 존재하는 멤버변수를 사용 할 수 있다. <%=declation%>
		<br>
		여기서 아래에 존재하는 멤버함수를 콜 할 수 있다. <%=getDaclation()%>
	</h1>
	
	<h1>연산처리</h1>
	<%
	//내장객체 9 가지 : context, config, request, response, pageContext, session, out, page 가 존재
	//자바 연산처리 제어문, 반복문 ... (service 내부에서 진행)
	String message = "연산처리문 입니다."; //(service 내부에 있는 지역변수
	out.println("내장 객체를 이용한 출력" + message);
	%>

	<h1>멤버변수 선언</h1>
	<%!//멤버변수 선언
	String declation = "멤버변수 선언문입니다.";
	String daclation = "멤버함수 선언문입니다.";
	%>

	<h1>멤버함수 선언</h1>
	<%!//멤버변수 선언
	public String getDaclation() {
		return daclation;
	}
	%>
</body>
</html>