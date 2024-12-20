<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Board</title>
<link rel="stylesheet" href="Board.css">
<script src="https://kit.fontawesome.com/f5a3833180.js" defer crossorigin="anonymous"></script>
</head>
<% 
	int num = (int) Math.floor(Math.random()*(4-1+1)+1);
%>
<script>
    function onload() {
        const img = document.querySelector(".banner_change");
        const left = document.querySelector(".fa-caret-left");
        const right = document.querySelector('.fa-caret-right');

        let intervalID = null;

        function change() {
        	  let num = Math.floor(Math.random()*(4-1+1)+1);
            let srcData = "http://localhost:8080/jspStudy/board/img/lulu"+num+".png";
            img.src = srcData;
        }
        
        
        intervalID = setInterval(change, 1000);

        img.addEventListener("mouseenter", (event) => {
            clearInterval(intervalID);
        })
        img.addEventListener("mouseleave", (event) => {
            intervalID = setInterval(change, 1000);
        })
        left.addEventListener("click", change);

        left.addEventListener("mouseenter", (event) => {
            clearInterval(intervalID);
        })
        left.addEventListener("mouseleave", (event) => {
            intervalID = setInterval(change, 1000);
        })

        right.addEventListener("click", change);

        right.addEventListener("mouseenter", (event) => {
            clearInterval(intervalID);
        })
        right.addEventListener("mouseleave", (event) => {
            intervalID = setInterval(change, 1000);
        })
    }

</script>
<body onload="onload();">
	<header>
		<div class="banner">
			<div class="banner_left">
				<a href="#"><i class="fa-solid fa-feather"></i></a> <a href=""><p>몽글</p></a>
			</div>
			<div class="banner_right">
				<ul>
					<li class="dropdown"><a href="#" class="dropdown_button">MENU1</a>
						<div class="dropdown_content">
							<a href="#">menu1</a> <a href="#">menu1</a> <a href="#">menu1</a>
						</div></li>
					<li class="dropdown"><a href="#" class="dropdown_button">MENU1</a>
						<div class="dropdown_content">
							<a href="#">menu1</a> <a href="#">menu1</a> <a href="#">menu1</a>
						</div></li>
					<li class="dropdown"><a href="#" class="dropdown_button">MENU1</a>
						<div class="dropdown_content">
							<a href="#">menu1</a> <a href="#">menu1</a> <a href="#">menu1</a>
						</div></li>
					<li class="dropdown"><a href="#" class="dropdown_button">MENU1</a>
						<div class="dropdown_content">
							<a href="#">menu1</a> <a href="#">menu1</a> <a href="#">menu1</a>
						</div></li>

				</ul>

				<button type="button">SIGN UP</button>
			</div>
		</div>
	</header>
	<aside>
		<div class="img_change">
			<i class="fa-solid fa-caret-left"></i> <img src="./img/lulu<%= num %>.png"
				alt="" class="banner_change"> <i
				class="fa-solid fa-caret-right"></i>
		</div>
	</aside>
	<div class="content">
		<nav>
			<h3>국민소통</h3>
			<h5 style="color: rgb(0, 128, 0);">국민참여</h5>
			<ul>
				<a href=""><li>이벤트</li></a>
				<a href=""><li>칭찬합시다</li></a>
				<a href=""><li>궁금합니다</li></a>
				<a href=""><li>제안합니다</li></a>
				<a href=""><li>국민신고방(불법산행)</li></a>
			</ul>
			<h5>혁신제안</h5>
			<ul>
				<a href=""><li>기업성장응답센터</li></a>
				<a href=""><li>사회적가치, 혁신 우수사례</li></a>
			</ul>
			<h5>클린신고센터</h5>
			<ul>
				<a href=""><li>공익신고</li></a>
				<a href=""><li>소극행정신고</li></a>
				<a href=""><li>갑질신고</li></a>
				<a href=""><li>청탁금지법 위반신고</li></a>
				<a href=""><li>사이버 감사실</li></a>
				<a href=""><li>예산낭비신고</li></a>
				<a href=""><li>갑질행위공개</li></a>
			</ul>
		</nav>
		<main>
			<div class="main_top">
				<h3>칭찬합시다</h3>
				<ul>
					<a href=""><i class="fa-solid fa-house"></i>
					<li></li></a>
					<a href=""></i>
					<li>국립공원공단</li></a>
					<a href=""></i>
					<li>국민소통</li></a>
					<a href=""></i>
					<li>국민참여</li></a>
					<a href=""></i>
					<li>칭찬합시다</li></a>
				</ul>
			</div>
			<p>- 본 게시판과 관련이 없거나 상업적인 내용, 특정인이나 특정사안을 비방하는 내용등은 예고없이 삭제될 수
				있습니다.</p>
			<div class="select_display">
				<div class="select1">
					<select name="selectbox_left" id="selectbox_left">
						<option value="10">10개씩</option>
						<option value="20">20개씩</option>
						<option value="30">30개씩</option>
					</select> <label for="selectbox_left"><button type="button">보기</button></label>
				</div>
				<div class="select2">
					<select name="selectbox_right" id="selectbox_right">
						<option value="제목">제목</option>
						<option value="제목">작성자</option>
						<option value="제목">제목 + 내용</option>
					</select> <input type="search" name="search" id="search"> <label
						for="search"><button type="button">검색</button></label>
				</div>

			</div>
			<div class="dgree">
				<div class="number">
					<h5>번호</h5>
				</div>
				<div class="park">
					<h5>공원명</h5>
				</div>
				<div class="title">
					<h5>제목</h5>
				</div>
				<div class="writer">
					<h5>작성자</h5>
				</div>
				<div class="view">
					<h5>조회수</h5>
				</div>
				<div class="date">
					<h5>등록일</h5>
				</div>
			</div>
			<div class="dgree1">
				<div class="number">
					<p>5417</p>
				</div>
				<div class="park">
					<p>북한산</p>
				</div>
				<div class="title">
					<a href=""><p>내용</p></a>
				</div>
				<div class="writer">
					<a href=""><p>안준모</p></a>
				</div>
				<div class="view">
					<p>22</p>
				</div>
				<div class="date">
					<p>2024-10-30</p>
				</div>
			</div>
			<div class="dgree1">
				<div class="number">
					<p>5417</p>
				</div>
				<div class="park">
					<p>북한산</p>
				</div>
				<div class="title">
					<a href=""><p>내용</p></a>
				</div>
				<div class="writer">
					<a href=""><p>안준모</p></a>
				</div>
				<div class="view">
					<p>22</p>
				</div>
				<div class="date">
					<p>2024-10-30</p>
				</div>
			</div>
			<div class="dgree1">
				<div class="number">
					<p>5417</p>
				</div>
				<div class="park">
					<p>북한산</p>
				</div>
				<div class="title">
					<a href=""><p>내용</p></a>
				</div>
				<div class="writer">
					<a href=""><p>안준모</p></a>
				</div>
				<div class="view">
					<p>22</p>
				</div>
				<div class="date">
					<p>2024-10-30</p>
				</div>
			</div>
			<div class="dgree1">
				<div class="number">
					<p>5417</p>
				</div>
				<div class="park">
					<p>북한산</p>
				</div>
				<div class="title">
					<a href=""><p>내용</p></a>
				</div>
				<div class="writer">
					<a href=""><p>안준모</p></a>
				</div>
				<div class="view">
					<p>22</p>
				</div>
				<div class="date">
					<p>2024-10-30</p>
				</div>
			</div>
			<div class="dgree1">
				<div class="number">
					<p>5417</p>
				</div>
				<div class="park">
					<p>북한산</p>
				</div>
				<div class="title">
					<a href=""><p>내용</p></a>
				</div>
				<div class="writer">
					<a href=""><p>안준모</p></a>
				</div>
				<div class="view">
					<p>22</p>
				</div>
				<div class="date">
					<p>2024-10-30</p>
				</div>
			</div>
			<div class="dgree1">
				<div class="number">
					<p>5417</p>
				</div>
				<div class="park">
					<p>북한산</p>
				</div>
				<div class="title">
					<a href=""><p>내용</p></a>
				</div>
				<div class="writer">
					<a href=""><p>안준모</p></a>
				</div>
				<div class="view">
					<p>22</p>
				</div>
				<div class="date">
					<p>2024-10-30</p>
				</div>
			</div>
			<div class="dgree1">
				<div class="number">
					<p>5417</p>
				</div>
				<div class="park">
					<p>북한산</p>
				</div>
				<div class="title">
					<a href=""><p>내용</p></a>
				</div>
				<div class="writer">
					<a href=""><p>안준모</p></a>
				</div>
				<div class="view">
					<p>22</p>
				</div>
				<div class="date">
					<p>2024-10-30</p>
				</div>
			</div>
			<div class="dgree1">
				<div class="number">
					<p>5417</p>
				</div>
				<div class="park">
					<p>북한산</p>
				</div>
				<div class="title">
					<a href=""><p>내용</p></a>
				</div>
				<div class="writer">
					<a href=""><p>안준모</p></a>
				</div>
				<div class="view">
					<p>22</p>
				</div>
				<div class="date">
					<p>2024-10-30</p>
				</div>
			</div>
			<div class="dgree1">
				<div class="number">
					<p>5417</p>
				</div>
				<div class="park">
					<p>북한산</p>
				</div>
				<div class="title">
					<a href=""><p>내용</p></a>
				</div>
				<div class="writer">
					<a href=""><p>안준모</p></a>
				</div>
				<div class="view">
					<p>22</p>
				</div>
				<div class="date">
					<p>2024-10-30</p>
				</div>
			</div>
			<div class="dgree1">
				<div class="number">
					<p>5417</p>
				</div>
				<div class="park">
					<p>북한산</p>
				</div>
				<div class="title">
					<a href=""><p>내용</p></a>
				</div>
				<div class="writer">
					<a href=""><p>안준모</p></a>
				</div>
				<div class="view">
					<p>22</p>
				</div>
				<div class="date">
					<p>2024-10-30</p>
				</div>
			</div>

			<div class="page">
				<ul>
					<a href=""><li>1</li></a>
					<a href=""><li>2</li></a>
					<a href=""><li>3</li></a>
					<a href=""><li>4</li></a>
					<a href=""><li>5</li></a>
					<a href=""><li>6</li></a>
					<a href=""><li>7</li></a>
					<a href=""><li>8</li></a>
					<a href=""><li>9</li></a>
					<a href=""><li>10</li></a>
					<a href=""><li><i class="fa-solid fa-angle-right"></i></li></a>
					<a href=""><li><i class="fa-solid fa-angles-right"></i></li></a>

				</ul>
			</div>


		</main>

	</div>

</body>
</html>
