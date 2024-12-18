<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int banner_num = (int) Math.floor(Math.random() * (4 - 1 + 1) + 1);
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
%>
<%
request.setCharacterEncoding("UTF-8");
//1. 페이징기법 ( 페이징 사이즈 , 즉 한페이지에 보일 카디널리티의 개수 (현재 10개로 지정))
int pageSize = 10;

//2. 페이지 번호 선택
String pageNum = request.getParameter("pageNum");
if (pageNum == null) {
	pageNum = "1";
}

//3 현재 페이지를 설정하고 start, end 를 결정
int currentPage = Integer.parseInt(pageNum);
int start = (currentPage - 1) * pageSize + 1; // ex) 4페이지를 원한다 => (4-1)*10+1 = 31부터 시작 
int end = (currentPage) * pageSize; // ex) 4페이지를 원한다 => (4)*10 = 40까지 즉 31 ~ 40 항목 출력.

/* CURD 부문 */
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

//4. 해당된 페이지 10개를 가져온다
int number = 0;
ArrayList<BoardVO> boardList = null;
BoardDAO bdao = BoardDAO.getInstance();

//전체 글 목록 개수파악 (num desc) 가장최근것 가져오기
int count = bdao.selectCounteDB();
if (count > 0) {
	//현재 페이지 내용을 가져온다 (start부터 end까지 현재 사이즈는 10이므로 10개만 가져옴.)
	boardList = bdao.selectStartEndDB(start, end);
}

//5. 위 예시처럼 4페이지를 가져왔다면 해당 number는 31번부터 40번까지를 출력해야 하므로 
// count = 전체개수 ex) 100
//즉 잔체개수 100 => 1페이지 (100 ~ 91), 2페이지 (90 ~ 81)
// 100 - (2 -1) * 10 = 90
number = count - (currentPage - 1) * pageSize;
%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet"
	href="list.css?timestamp=<%=System.currentTimeMillis()%>">
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<script language="javascript"
	src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>
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
						<a href="#">관람 유의사항</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
						<a href="#">오시는길</a>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown_button">요금/할인</a>
					<div class="dropdown_content">
						<a href="#">관람 유의사항</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
						<a href="#">오시는길</a>
					</div></li>
				<li class="dropdown"><a href="list.jsp" class="dropdown_button">커뮤니티</a>
					<div class="dropdown_content">
						<a href="list.jsp">자유게시판</a> <a href="#">자료실</a>
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
</body>
</html>
<%
} else {
%>
<body onload="onload()">

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
						<a href="#">관람 유의사항</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
						<a href="#">오시는길</a>
					</div></li>
				<li class="dropdown"><a href="#" class="dropdown_button">요금/할인</a>
					<div class="dropdown_content">
						<a href="#">관람 유의사항</a> <a href="#">운영시간</a> <a href="#">매장안내</a>
						<a href="#">오시는길</a>
					</div></li>
				<li class="dropdown"><a href="list.jsp" class="dropdown_button">커뮤니티</a>
					<div class="dropdown_content">
						<a href="list.jsp">자유게시판</a> <a href="#">자료실</a>
					</div></li>
			</ul>

		</div>
		<div class="input_button">
			<button type="button" class="ticket">
				<i class="fa-solid fa-ticket"></i><span>구매하기</span>
			</button>
			<ul class="myPage">
				<li class="dropdown"><%=id%>님 환영합니다. <input type="hidden"
					name="id" value="<%=id%>">
					<div class="dropdown_content">
						<a href="#">마이페이지</a> <a href="./login/logout.jsp">로그아웃</a>
					</div></li>
			</ul>
		</div>
	</div>
</body>
</html>
<%
}
%>
<div class="content">
	<nav>
		<h4>문의사항</h4>
		<ul>
			<a href="list.jsp"><li>자유게시판</li></a>
			<a href=""><li>자료실</li></a>
		</ul>
	</nav>

	<div class="board">
		<div class="main_top">
			<b>글목록(전체 글:<%=count%>)
			</b>
			<table>
				<tr>
					<td><a href="wirte.jsp">글쓰기</a></td>
			</table>
		</div>
		<%
		if (count == 0) {
		%>
		<table>
			<tr>
				<td align="center">게시판에 작성 된 글이 없습니다.</td>
		</table>
		<%
		} else {
		%>
		<table class="table_top">
			<thead>
					<th>번 호</th>
					<th>제 목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조 회</th>
					<th>IP</th>
			</thead>
			<%
			for (BoardVO article : boardList) {
			%>
			<tbody>
					<td><%=number--%></td>
					<td><a
						href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
							<!-- 수정<6> --> <%
 //6 DEPTH 값에 따라 HTML코드에는 공백이 비례해야 함. EX) DEPTH = 1 , 공백 = 5 DEPTH = 2, 공백 = 10
 int wid = 0;
 if (article.getDepth() > 0) {
 	wid = 5 * (article.getDepth());
 %> <img src="images/level.gif" width="<%=wid%>" height="16"> <img
							src="images/re.gif"> <%
 }
 %> <%=article.getSubject()%></a></td>
					<td><a href="mailto:<%=article.getEmail()%>"> <%=article.getWriter()%></a></td>
					<td><%=sdf.format(article.getRegdate())%></td>
					<td><%=article.getReadcount()%></td>
					<td><%=article.getIp()%></td>
			</tbody>
			<%
			}
			%>
		</table>
		<%
		}
		%>
		<div class="center">
			<%
			if (count > 0) {
				int pageBlock = 5;
				int imsi = count % pageSize == 0 ? 0 : 1;
				int pageCount = count / pageSize + imsi;
				int startPage = (int) ((currentPage - 1) / pageBlock) * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount) {
					endPage = pageCount;
				}
				if (startPage > pageBlock) {
			%>
			<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">이전</a>
			<%
			}
			for (int i = startPage; i <= endPage; i++) {
			if (currentPage == i) {
			%>
			<a href="list.jsp?pageNum=<%=i%>"><b><%=i%> </b> </a>
			<%
			} else {
			%>
			<a href="list.jsp?pageNum=<%=i%>"><%=i%> </a>
			<%
			}
			%>

			<%
			}
			if (endPage < pageCount) {
			%>
			<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">다음</a>
			<%
			}
			}
			%>
		</div>
	</div>
</div>
</body>
</html>