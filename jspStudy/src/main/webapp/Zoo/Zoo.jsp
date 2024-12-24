<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
int banner_num = (int) Math.floor(Math.random() * (4 - 1 + 1) + 1);
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
String name = (String) session.getAttribute("name");

session.setAttribute("pass", pass);
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문정배</title>
<link rel="stylesheet"
	href="Zoo.css?timestamp=<%=System.currentTimeMillis()%>">
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="javascript"
	src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
<script>
function onload() {
    const img = document.querySelector(".banner_change");
    const left = document.querySelector(".fa-caret-left");
    const right = document.querySelector('.fa-caret-right');
    const menu = document.querySelector('.dropdown');

    let intervalID = null;

    function change() {
    	let banner_num = Math.floor(Math.random() * (4 - 1 + 1) + 1);
            let srcData = "http://localhost:8080/jspStudy/Zoo/img/Zoo"+banner_num+".png";
            img.src = srcData;
    }
    intervalID = setInterval(change, 2000);

    img.addEventListener("mouseenter", (event) => {
        clearInterval(intervalID);
    })
    img.addEventListener("mouseleave", (event) => {
        intervalID = setInterval(change, 2000);
    })
    left.addEventListener("click", change);

    left.addEventListener("mouseenter", (event) => {
        clearInterval(intervalID);
    })
    left.addEventListener("mouseleave", (event) => {
        intervalID = setInterval(change, 2000);
    })

    right.addEventListener("click", change);

    right.addEventListener("mouseenter", (event) => {
        clearInterval(intervalID);
    })
    right.addEventListener("mouseleave", (event) => {
        intervalID = setInterval(change, 2000);
    })
}
</script>
<body onload="onload()">
	<%
	if (id == null) {
	%>
	<div class="banner">
		<div class="banner_left">
			<a href="Zoo.jsp" target="_self"><i class="fa-solid fa-cat"></i></a>
			<a href="Zoo.jsp"><p>123</p></a>
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
						<a href="#">프로그램 안내</a> <a href="#">동물정보</a>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown_button">매장정보</a>
					<div class="dropdown_content">
						<a href="#">제휴/할인 안내</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
						<a href="#">오시는길</a>
					</div></li>
				<li class="dropdown"><a href="list.jsp" class="dropdown_button">커뮤니티</a>
					<div class="dropdown_content">
						<a href="list.jsp">자유게시판</a> <a href="#">자료실</a>
					</div></li>
			</ul>

		</div>
		<div class="input_button">
			<button type="button" class="ticket"
				onClick="window.location='./ticket/ticket.jsp'">
				<i class="fa-solid fa-ticket"></i><span>구매하기</span>
			</button>
			<i class="fa-solid fa-user" onclick="loginWindow()"></i>
		</div>
	</div>

	<aside>
		<div class="img_change">
			<i class="fa-solid fa-caret-left"></i> <img
				src="./img/Zoo<%=banner_num%>.png" alt="" class="banner_change">
			<i class="fa-solid fa-caret-right"></i>
		</div>
	</aside>
	<div class="zoo_main">
		<p>우리 동물원을 소개 합니다.</p>
	</div>
</body>
</html>
<%
} else {
%>
<div class="banner">
	<div class="banner_left">
		<a href="Zoo.jsp" target="_self"><i class="fa-solid fa-cat"></i></a> <a
			href="Zoo.jsp"><p>123</p></a>
	</div>
	<div class="banner_right">
		<ul>
			<li class="dropdown"><a href="#" class="dropdown_button">매장소개</a>
				<div class="dropdown_content">
					<a href="#">관람 유의사항</a> <a href="#">운영시간</a> <a href="#">매장안내</a> <a
						href="#">오시는길</a>
				</div></li>
			<li class="dropdown"><a href="#" class="dropdown_button">체험정보</a>
				<div class="dropdown_content">
					<a href="#">프로그램 안내</a> <a href="#">동물정보</a>
				</div></li>
			<li class="dropdown"><a href="#" class="dropdown_button">매장정보</a>
				<div class="dropdown_content">
					<a href="#">제휴/할인 안내</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
					<a href="#">오시는길</a>
				</div></li>
			<li class="dropdown"><a href="list.jsp" class="dropdown_button">커뮤니티</a>
				<div class="dropdown_content">
					<a href="list.jsp">자유게시판</a> <a href="#">자료실</a>
				</div></li>
		</ul>

	</div>
	<div class="input_button">
		<button type="button" class="ticket"
			onClick="window.location='./ticket/ticket.jsp'">
			<i class="fa-solid fa-ticket"></i><span>구매하기</span>
		</button>
		<i class="fa-solid fa-user" onclick="loginWindow()"></i>
	</div>
</div>

<aside>
	<div class="img_change">
		<i class="fa-solid fa-caret-left"></i> <img
			src="./img/Zoo<%=banner_num%>.png" alt="" class="banner_change">
		<i class="fa-solid fa-caret-right"></i>
	</div>
</aside>
<div class="zoo_main">
	<div>
		<p>
			<span style="color: rgb(124, 198, 35)">동물원</span> 지점 안내
		</p>
	</div>
	<div class="text">
		<p>방문 전 이용 시간 및 요금을 확인 해 주세요</p>
	</div>
</div>
<div class="zoo_img1">
	<img src="./img/animal2.png" alt="" class="img_main1">
	<p class="img_text2">
		도심 속 살아 숨쉬는 생명을 만날 수 있는 대한민국 애니멀 테마파크 <br>자연 생테계에 영향을 미치지 않는 방식으로
		동물고의 교감을 느껴보세요
	</p>
</div>
<div class="zoo_img2">
	<img src="./img/animal1.png" alt="" class="img_main2">
	<p class="img_text1">
		단순히 동물을 관찰하는 동물원을 넘어, 울타리 없는 가까운 교감을 통해 생명의 소중함을 느껴보는 장소 <br>도심의
		한 가운데서 현대인들에게 휴식과 힐링이 되는 행복한 한 때를 제공하는 애니멀 테마파크를 추천 합니다.
	</p>
</div>
<div class="zoo_content">
	<p>
		<span style="color: rgb(124, 198, 35)">동물원</span> 한 눈에 보기
	</p>
</div>
</body>
</html>

<%
}
%>
