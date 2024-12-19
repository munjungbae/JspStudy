<%@page import="co.kh.dev.boardone.model.BoardVO"%>
<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

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
<title>Insert title here</title>
</head>
<main>
	<b>글내용 보기</b> <br></br>
	<form>
		<table>
			<tr>
				<td>글번호</td>
				<td><%=bvo.getNum()%></td>
				<td>조회수</td>
				<td><%=bvo.getReadcount()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=bvo.getWriter()%></td>
				<td>작성일</td>
				<td><%=sdf.format(bvo.getRegdate())%></td>
			</tr>
			<tr>
				<td>글제목</td>
				<td><%=bvo.getSubject()%></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><pre><%=bvo.getContent()%></pre></td>
			</tr>
			<tr>
				<td><input type="button" value="글수정" onclick="document.location.href='updateForm.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
					<input type="button" value="글삭제" onclick="document.location.href='deleteForm.jsp?num=<%=_num%>&pageNum=<%=pageNum%>'">
					<input type="button" value="답글쓰기" onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&step=<%=step%>&depth=<%=depth%>'">
					<input type="button" value="글목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
		<%
		} catch (Exception e) {
		}
		%>
	</form>
</main>
</body>

</html>