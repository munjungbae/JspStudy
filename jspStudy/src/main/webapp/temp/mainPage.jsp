<%@ page contentType="text/html; charset=euc-kr"%>
<%
request.setAttribute("PAGETITLE", "��������");
request.setAttribute("CONTENTPAGE", "info_view.jsp");

RequestDispatcher rd = request.getRequestDispatcher("/temp/template/template.jsp");
rd.forward(request, response);
%>
<%-- <jsp:forward page="/temp/template/template.jsp">
	<jsp:param name="CONTENTPAGE" value="info_view.jsp" />
</jsp:forward> --%>