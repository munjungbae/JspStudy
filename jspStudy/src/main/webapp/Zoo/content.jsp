<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
String name = (String) session.getAttribute("name");

int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

try {
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO vo = new BoardVO();
	vo.setNum(num);
	BoardVO bvo = bdao.selectBoardDB(vo);
	int _num = bvo.getNum();
	int ref = bvo.getRef();
	int step = bvo.getStep();
	int depth = bvo.getDepth();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문정배</title>
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<link href="content.css?timestamp=<%=System.currentTimeMillis()%>"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="script.js?timestamp=<%=System.currentTimeMillis()%>">
	
</script>
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
			<button type="button" class="ticket">
				<i class="fa-solid fa-ticket"></i><span>구매하기</span>
			</button>
			<ul class="myPage">
				<li class="dropdown"><b><%=id%></b>님 환영합니다.
					<div class="dropdown_content">
						<a href="#">마이페이지</a> <a href="./login/logout.jsp">로그아웃</a>
					</div></li>
			</ul>
		</div>
	</div>
	<%
	}
	%>
	<div class="content">
		<nav>
			<h4>커뮤니티</h4>
			<ul>
				<a href="list.jsp"><li>자유게시판</li></a>
				<a href=""><li>자료실</li></a>
			</ul>
		</nav>
		<div class="write_content">
			<h4 class="title">자유게시판</h4>
			<div class="write">
				<div class="table3">
					<table>
						<tr>
							<td><%=bvo.getSubject()%></td>
						</tr>
					</table>
				</div>
				<div class="table1">
					<table>
						<tr>
							<td>작성자 :</td>
							<td>&nbsp;<%=bvo.getWriter()%></td>
						</tr>
					</table>
					<div class="date">
						<table>
							<tr>
								<td><%=sdf.format(bvo.getRegdate())%></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="table2">
					<table>
						<tr>
							<td>조회수</td>
							<td><%=bvo.getReadcount()%></td>
						</tr>
					</table>
				</div>
				<hr>
				<div class="table4">
					<table>
						<tr>
							<td><pre><%=bvo.getContent()%></pre></td>
						</tr>
					</table>
				</div>
				<div class="table5">
					<input type="hidden" value="<%= _num %>" id="num">
					<input type="hidden" value="<%=pageNum%>" id="pageNum">
					<table>
						<tr>
							<td><input type="button" value="글수정" class="update"
								onclick="document.location.href='update.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
<%-- 								<input type="button" value="글삭제" class="delete" onclick="document.location.href='delete.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">  --%>
								<input type="button" value="글삭제" class="delete" onclick="deleteWindow()"> 
								<input type="button" value="답글쓰기" class="reply" onclick="document.location.href='write.jsp?num=<%=num%>&ref=<%=ref%>&step=<%=step%>&depth=<%=depth%>'">
								<input type="button" value="글목록" class="list" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<%
	} catch (Exception e) {
	}
	%>
</body>
</html>