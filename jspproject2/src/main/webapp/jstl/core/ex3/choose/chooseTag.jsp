<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>  





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.name}</title>
</head>
<body>
<!--
 
1. 조건식을 만들 때는 if태그 대신에 when 태그로 조건식을 만든다
2. 여러개의 조건식이 모두 참이라도 가장 먼저 만족하는 조건식 아래쪽의 문장만 실행하고 빠져나간다.
3. 위의 조건식을 만족 하지 않을때는 otherwise 태그 아래쪽의 문장을 실행한다.
 
-->



${param.name }	<br>
${param.age }	<br>

<c:choose>
<c:when test="${param.name == 'name' }">
name is ${param.name }<br>
age is ${param.age }<br><br>
</c:when>
<c:when test="${param.age >= 50 }">
너의 이름은 ${param.name}<br>
나이는 ${param.age }<br><br>
</c:when>
<c:otherwise>
이름 : ${param.name }<br>
나이 : ${param.age }<br>
</c:otherwise>
</c:choose>


</body>
</html>