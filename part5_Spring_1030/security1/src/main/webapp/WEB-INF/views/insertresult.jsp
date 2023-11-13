<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${result == -1 }">
	<script>
		alert("중복 ID입니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result == 1 }">
	<script>
		alert("회원가입 성공");
		location.href="loginform";
	</script>
</c:if>
<c:if test="${result == -2 }">
	<script>
		alert("회원가입 실패");
		history.go(-1);
	</script>
</c:if>

</body>
</html>