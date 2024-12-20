<%@page import="java.util.ArrayList"%>
<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="view/color.jsp"%>
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
<link href="	style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
	<main>
		<b>글목록(전체 글:<%=count%>)
		</b>
		<table width="700">
			<tr>
				<td align="right" bgcolor="<%=value_c%>"><a
					href="writeForm.jsp">글쓰기</a></td>
		</table>
		<%
		if (count == 0) {
		%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
		</table>
		<%
		} else {
		%>
		<table border="1" width="700" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30" bgcolor="<%=value_c%>">
				<td align="center" width="50">번 호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="100">작성자</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회</td>
				<td align="center" width="100">IP</td>
			</tr>
			<%
			for (BoardVO article : boardList) {
			%>
			<tr height="30">
				<td align="center" width="50"><%=number--%></td>
				<td width="250"><a
					href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
						<!-- 수정<6> --> <%
 //6 DEPTH 값에 따라 HTML코드에는 공백이 비례해야 함. EX) DEPTH = 1 , 공백 = 5 DEPTH = 2, 공백 = 10
 int wid = 0;
 if (article.getDepth() > 0) {
 	wid = 5 * (article.getDepth());
 %> <img src="images/level.gif" width="<%=wid%>" height="16"> <img
						src="images/re.gif"> <%
 }
 %> <%=article.getSubject()%></a> <%
 if (article.getReadcount() >= 20) {
 %> <img src="images/hot.gif" border="0" height="16"> <%
 }
 %></td>
				<td align="center" width="100"><a
					href="mailto:<%=article.getEmail()%>"> <%=article.getWriter()%></a></td>
				<td align="center" width="150"><%=sdf.format(article.getRegdate())%></td>
				<td align="center" width="50"><%=article.getReadcount()%></td>
				<td align="center" width="100"><%=article.getIp()%></td>
			</tr>
			<%
			}
			%>
		</table>
			</main>
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
		<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
		<%
		}
		for (int i = startPage; i <= endPage; i++) {
		if (currentPage == i) {
		%>
		<a href="list.jsp?pageNum=<%=i%>"><b>[<%=i%>]</b>
		</a>
		<%
		} else {
		%>
		<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]
		</a>
		<%
		}
		%>

		<%
		}
		if (endPage < pageCount) {
		%>
		<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
		<%
		}
		}
		%>
</div>
</body>
</html>