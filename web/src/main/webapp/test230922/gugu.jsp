<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
String dan = request.getParameter("dan");
%>

<h2>
	구구단
	<%=dan%>단
</h2>

<%
int d = Integer.parseInt(dan);

for (int i = 1; i <= 9; i++) {
	out.print(d + "*" + i + "=" + d * i + "<br>");
}
%>