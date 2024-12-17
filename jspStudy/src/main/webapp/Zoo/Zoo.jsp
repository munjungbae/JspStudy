<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
int num = (int) Math.floor(Math.random() * (3 - 1 + 1) + 1);
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
<script>
function onload() {
    const img = document.querySelector(".banner_change");
    const left = document.querySelector(".fa-caret-left");
    const right = document.querySelector('.fa-caret-right');
    const menu = document.querySelector('.dropdown');

    let intervalID = null;

    function change() {
    	let num = Math.floor(Math.random() * (4 - 1 + 1) + 1);
            let srcData = "http://localhost:8080/jspStudy/Zoo/img/lulu"+num+".png";

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
			<i class="fa-solid fa-user" onclick="loginWindow()"></i>
		</div>
	</div>

	<aside>
		<div class="img_change">
			<i class="fa-solid fa-caret-left"></i> <img
				src="./img/lulu<%=num%>.png" alt="" class="banner_change"> <i
				class="fa-solid fa-caret-right"></i>
		</div>
	</aside>
</body>
</html>