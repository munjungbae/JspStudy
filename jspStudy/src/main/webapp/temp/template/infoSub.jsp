<%@ page contentType="text/html; charset=euc-kr"%>
<%
String type = request.getParameter("type");
if (type != null) {
%>
	<tr>
		<td>Ÿ��</td>
		<td>
		<b><%=type%></b>
		</td>
	</tr>
	<tr>
		<td>Ư¡</td>
		<td>
			<%
			if (type.equals("A")) {
			%> ���� ������. <%
			} else if (type.equals("B")) {
			%> �پ ��ó �ɷ� <%
			}
			%>
		</td>
	</tr>
<%
}
%>