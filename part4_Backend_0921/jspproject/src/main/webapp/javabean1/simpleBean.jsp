<%@ page import = "javaBean.SimpleBean" %>
<%@ page contentType="text/html; charset=utf-8" %>

<% request.setCharacterEncoding("utf-8");%>

<%

SimpleBean sb1 = new SimpleBean();
// sb1.msg = "h1"; // private 접근자라 접근 불가
sb1.setMsg("안녕");

%>

<!-- 유즈빈은 심플빈 클래스의 객체를 생성한다? 힙메모리상에...
sb가 스택메모리상에 있고 힙메모리에 msg가 있고 -->
<jsp:useBean id="sb" class="javaBean.SimpleBean" />


<!-- 자바빈 클래스의 setter 메소드를 호출해서 값을 heap메모리에 저장시키는 역할 -->
<jsp:setProperty name="sb" property="msg" />
<%-- <jsp:setProperty name="sb" property="name" /> --%>
<jsp:setProperty property = "*" name = "sb"/>
<!-- property에 "*"를 쓰면 소스코드가 늘지않고 가입하는 양식의 name값과
javabean에 msg가 일치하는 값을 바로 넘겨줌?
대신에 ... -->

<html>
	<body>

	<h1>간단한 자바빈 프로그래밍</h1>
	<br>

<!-- 자바빈 클래스의 getter메소드를 호출해서 리턴된 필드(property)를
브라우저에 출력해주는 역할 -->

	이름 : <%=sb.getName() %><br>
	이름 : <jsp:getProperty property="name" name="sb"/><br><br>

	메시지: <jsp:getProperty name="sb" property="msg" />

	</body>
</html>