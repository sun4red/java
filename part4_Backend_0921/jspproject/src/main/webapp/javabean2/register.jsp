<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType = "text/html; charset=utf-8" %>

<%
    request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="memberInfo" class="member.MemberInfo" />
<jsp:setProperty name="memberInfo" property="*" />
<!-- 일치하는 값만 저장이 된다. -->
<jsp:setProperty name="memberInfo" property="password"
                 value="<%= memberInfo.getId() %>" />
                 
                 <%
                 SimpleDateFormat sd 
                 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss EEE요일");
                 %>
<jsp:setProperty name="memberInfo" property="registerDate"
                 value="<%=new Timestamp(System.currentTimeMillis())%>" />

<html>
		<head><title>가입</title></head>
		<body>

		<table width="400" border="1" cellpadding="0" cellspacing="0">
			<tr><td>아이디</td>
				<td><jsp:getProperty name="memberInfo" property="id" /></td>
				<td>암호</td>
				<td><jsp:getProperty name="memberInfo" property="password" /></td>
			</tr>
			<tr><td>이름</td>
				<td><jsp:getProperty name="memberInfo" property="name" /></td>
				<td>이메일</td>
				<td><jsp:getProperty name="memberInfo" property="email" /></td>
			</tr>
			<tr><td>주소</td>
				<td colspan="3"><jsp:getProperty name="memberInfo" property="address" /></td>
			</tr>
			<tr><td>날짜</td>
				<td colspan="3"><%-- <jsp:getProperty name="memberInfo" property="registerDate" /> --%>
				<%= sd.format(memberInfo.getRegisterDate()) %>
				</td>
			</tr>
		</table>

		</body>
</html>