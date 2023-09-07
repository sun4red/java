<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file = "header.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>


<!-- form 태그의 속성 
method : 값을 전달하는 방식을 설정하는 속성 (get or post)
action : 값이 전달될 파일명을 설정
-->

<form method = "post" action ="login.jsp">
<table border="1" width="350" align="center">
	<caption>로그인</caption>
	<tr>
		<td>ID</td>
		<td><input type="text" size = "20" maxlength="10"
		autofocus
		name="id"
		id = "id">
		<!-- name 값은 변수명이다. id 는 대소문자를 구분한다..-->
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type = "password"
		size ="20"
		required
		name = "passwd"
		id = "passwd"
		class = "form-comntrol">
		</td>
	</tr>
	<tr>
		<td colspan = "2" align = "center">
			<input type = "submit" value = "로그인"> 	<!--전송기능이있는버튼-->
			<!-- 값이 전송되는 기능이기 때문에 하나만 만들어야하는 submit -->
			<input type = "reset" value = "취소">		<!--초기화 버튼-->
		</td>
	</tr>
</table>




	
</form>


</body>
</html>
<%@ include file = "footer.jsp" %>