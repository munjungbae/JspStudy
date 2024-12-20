<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!//멤버변수, 멤버함수, 오버라이딩
	private int globalNumber = 0;

	//멤버함수
	public int getGlobalNumber() {
		return this.globalNumber;
	}

	//오버라이딩 함수
	public void jspInit() {
		System.out.println("jspInit Overriding 함수가 호출됨");
	}

	public void jspDestroy() {
		System.out.println("jspDestroy Overriding 함수가 호출됨");
	}

	//%! => 선언문%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%
	//자바 코드 실행문 (제어문, 반복문 등등) Service 함수에서 작동된다
	int localNumber = 0;
	//서비스가 실행 될 때 마다 => 사용자가 요청 할 때 마다
	localNumber++;
	globalNumber++;
%>

<ul>
	<li>globalNumber = <%=this.getGlobalNumber()%></li>
	<li>localNumber = <%=localNumber%></li>
</ul>