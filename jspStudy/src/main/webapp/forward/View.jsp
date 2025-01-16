<%@ page contentType="text/html; charset=euc-kr"%>
<%
String code = request.getParameter("code");
String viewPageURI = null;
if (code.equals("A")) {
	viewPageURI = "viewModule/A.jsp";
} else if (code.equals("B")) {
	viewPageURI = "viewModule/B.jsp";
} else if (code.equals("C")) {	
	viewPageURI = "viewModule/C.jsp";
}

/* RequestDispatcher rd = request.getRequestDispatcher(viewPageURI);
rd.forward(request, response); */
%>
<jsp:forward page="<%=viewPageURI%>"/>