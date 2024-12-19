<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("id");
String pass = (String) session.getAttribute("pass");

int _num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

BoardDAO bdao = BoardDAO.getInstance();
BoardVO vo = new BoardVO();
vo.setNum(_num);
BoardVO bvo = bdao.selectBoardDB(vo);
int __num = bvo.getNum();
int _ref = bvo.getRef();
int _step = bvo.getStep();
int _depth = bvo.getDepth();
%>
<%
//새로운글로 입력(num=0, ref=0, step=0, depth=0)
//다른글을 누르고 입력(num=부모값, ref=부모값, step=부모값, depth=부모값)
int num = 0, ref = 0, step = 0, depth = 0;
try {
	if (request.getParameter("num") != null) {
		num = Integer.parseInt(request.getParameter("num"));
		ref = Integer.parseInt(request.getParameter("ref"));
		step = Integer.parseInt(request.getParameter("step"));
		depth = Integer.parseInt(request.getParameter("depth"));
	}
%>
<html>
<head>
<title>문정배</title>
<script src="https://kit.fontawesome.com/f5a3833180.js" defer
	crossorigin="anonymous"></script>
<link href="write.css?timestamp=<%=System.currentTimeMillis()%>"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="script.js?timestamp=<%=System.currentTimeMillis()%>">
	
</script>
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
	<div class="content">
		<nav>
			<h4>문의사항</h4>
			<ul>
				<a href="list.jsp"><li>자유게시판</li></a>
				<a href="#"><li>자료실</li></a>
			</ul>
		</nav>
		<div class=write_content>
			<h4 class="title">자유게시판</h4>
			<div class="write">
				<table>
					<tr>
						<td>글제목</td>
						<td><%=bvo.getSubject()%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%=bvo.getWriter()%></td>
					</tr>
				</table>
				<div class="table2">
					<table>
						<tr>
							<td>작성일</td>
							<td><%=sdf.format(bvo.getRegdate())%></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>조회수</td>
							<td><%=bvo.getReadcount()%></td>
						</tr>
					</table>
				</div>
				<table>
					<tr>
						<td>글내용</td>
						<td><pre><%=bvo.getContent()%></pre></td>
					</tr>
					<tr>
						<td><input type="button" value="글수정"
							onclick="document.location.href='update.jsp?num=<%=__num%>&pageNum=<%=pageNum%>'">
							<input type="button" value="글삭제"
							onclick="document.location.href='delete.jsp?num=<%=__num%>&pageNum=<%=pageNum%>'">
							<input type="button" value="답글쓰기"
							onclick="document.location.href='reply.jsp?num=<%=_num%>&ref=<%=ref%>&step=<%=step%>&depth=<%=depth%>'">
							<input type="button" value="글목록"
							onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content_reply">
			<div class=write_content>
				<h4 class="title">자유게시판</h4>
				<div class="write">
					<form method="post" name="writeForm" action="writeCheck.jsp">
						<input type="hidden" name="num" value="<%=num%>"> <input
							type="hidden" name="ref" value="<%=ref%>"> <input
							type="hidden" name="step" value="<%=step%>"> <input
							type="hidden" name="depth" value="<%=depth%>">
						<div class="name_mail">
							<table>
								<tr>
									<!-- 작성자 -->
									<td><input type="text" name="writer" class="writer"
										placeholder="작성자 이름" /></td>
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
								<td>
									<%
									if (request.getParameter("num") == null) {
									%> <!-- 제목 --> <input type="text" name="subject" class="subject"
									placeholder="제목을 입력 해 주세요" /> <%
 } else {
 %> <input type="text" name="subject" value="[답변]" /> <%
 }
 %>
								</td>
							</tr>
						</table>
						<table>
							<!-- 내용 -->
							<tr>
								<td><textarea name="content" class="text_area" rows="20"
										cols="105" placeholder="내용을 입력 해 주세요"></textarea></td>
							</tr>
						</table>

						<td><input type="submit" class="submit" value="글쓰기" /> <input
							type="reset" class="reset" value="다시작성" /> <input type="button"
							value="목록" class="list" onClick="window.location='list.jsp'"></td>
						</tr>
					</form>
				</div>
			</div>

			<!-- 예외처리<2> -->
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