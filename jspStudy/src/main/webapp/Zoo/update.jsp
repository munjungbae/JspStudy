<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");
String name = (String) session.getAttribute("name");

int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
BoardVO vo = new BoardVO();
vo.setNum(num);
try {
	BoardDAO bdao = BoardDAO.getInstance();
	BoardVO article = bdao.selectBoardOneDB(vo);
%>
<!DOCTYPE html>
<html>
<head>
<title>문정배</title>
<link href="write.css" rel="stylesheet" type="text/css">
<script src="script.js?timestamp=<%=System.currentTimeMillis()%>"></script>
</head>

<body onload="onload()">
	<%
	if (id != null) {
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
			<ul class="myPage">
				<li class="dropdown"><b><%=name%></b>님 환영합니다.
					<div class="dropdown_content">
						<a href="myPage.jsp" class="my_page">마이페이지</a> <a
							href="./login/logout.jsp">로그아웃</a>
					</div></li>
			</ul>
		</div>
	</div>
	<div class="content">
		<nav>
			<h4>커뮤니티</h4>
			<ul>
				<a href="list.jsp"><li>자유게시판</li></a>
				<a href=""><li>자료실</li></a>
			</ul>
		</nav>
		<div class=write_content>
			<h4 class="title">자유게시판</h4>
			<div class="write">
				<form method="post" name="writeform"
					action="updateCheck.jsp?pageNum=<%=pageNum%>" onsubmit="">
					<input type="hidden" name="num" value="<%=num%>" />
					<div class="name_mail">
						<table>
							<tr>
								<!-- 작성자 -->
								<td><input type="text" name="writer" class="writer"
									value="<%=article.getWriter()%>" /></td>
							</tr>
						</table>
						<table>
							<tr>
								<!-- 비밀번호 -->
								<td><input type="password" name="pass" class="pass"
									placeholder="비밀번호" /></td>
							</tr>
							<tr>
						</table>
					</div>
					<table>
						<tr>
							<td><input type="text" name="subject" class="subject"
								value="<%=article.getSubject()%>" /></td>
						</tr>
					</table>
					<table>
						<!-- 내용 -->
						<tr>
							<td><textarea name="content" class="text_area" rows="20"
									cols="105"><%=article.getContent()%></textarea></td>
						</tr>
					</table>
					<div class="table5">
						<table>
							<tr>
								<td><input type="submit" class="submit" value="수정하기" /> <input
									type="reset" class="reset" value="다시작성" /> <input
									type="button" value="목록" class="list"
									onClick="window.location='list.jsp'"></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		<%
		} else {
		%>
		<script>
			alert("로그인 후 이용 바랍니다.")
			history.go(-1);
		</script>
		<%
		}
		} catch (Exception e) {
		}
		%>
	</div>
</body>
</html>