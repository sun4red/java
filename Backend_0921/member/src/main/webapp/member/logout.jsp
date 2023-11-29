<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 세션 삭제 : 서버와 클라이언트의 연결이 끊어짐
session.invalidate();
%>

<script>
alert("로그아웃");
location.href="loginform.html";


</script>