<%@ page contentType="text/html;charset=utf-8"%>

<html>
	<body>

	<h1>포워딩되는 페이지(a.jsp)</h1>

	<%
		String name = request.getParameter("name");
		String bloodType = request.getParameter("bloodType");
	%>

	<b><%=name%></b>님의 혈액형은
	<b><%=bloodType%></b>형이고
	성실하고 신중하며 완벽주의자입니다.

	</body>
</html>