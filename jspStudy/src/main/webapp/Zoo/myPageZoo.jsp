<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet"
	href="Zoo.css?timestamp=<%=System.currentTimeMillis()%>">
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="javascript"
	src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>

<body onload="onload()">

	<div class="banner">
		<div class="banner_left">
			<a href="#" target="_self"><i class="fa-solid fa-cat"></i></a> <a
				href=""><p>123</p></a>
		</div>
		<div class="banner_right">
			<ul>
				<li class="dropdown"><a href="#" class="dropdown_button">매장소개</a>
					<div class="dropdown_content">
						<a href="#">관람 유의사항</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
						<a href="#">오시는길</a>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown_button">체험정보</a>
					<div class="dropdown_content">
						<a href="#">관람 유의사항</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
						<a href="#">오시는길</a>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown_button">요금/할인</a>
					<div class="dropdown_content">
						<a href="#">관람 유의사항</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
						<a href="#">오시는길</a>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown_button">소통/공지</a>
					<div class="dropdown_content">
						<a href="#">공지사항</a> <a href="#">1:1문의</a> <a href="#">자유게시판</a>

					</div></li>
			</ul>

		</div>
		<div class="input_button">
			<button type="button" class="ticket">
				<i class="fa-solid fa-ticket"></i><span>구매하기</span>
			</button>
			<ul class="myPage">
			<li class="dropdown"><%= id %>님 환영합니다.
					<div class="dropdown_content">
						<a href="#">마이페이지</a> <a href="./login/logout.jsp">로그아웃</a>
					</div>
					</li>
			</ul>
			
		</div>
	</div>

	<aside>
		<%@ include file="./banner.jsp"%>
	</aside>
</body>
</html>