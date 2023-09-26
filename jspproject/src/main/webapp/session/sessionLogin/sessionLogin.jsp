<%@ page contentType = "text/html; charset=utf-8" %>

<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    
    if (id.equals(password)) {
        session.setAttribute("MEMBERID", id);	/* 세션설정 */
%>

		<html>
			<head><title>로그인성공</title></head>
			<body>

				<Script>
				alert("로그인 성공");
				location.href = "sessionLoginCheck.jsp";
				</Script>

			</body>
		</html>

<%
    } else { // 로그인 실패시
%>

		<script>
			alert("로그인에 실패하였습니다.");
			history.go(-1);
		</script>
<%
    }
%>
