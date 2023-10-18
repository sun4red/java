<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
    <c:if test = "true">
무조건 실행 ${param.name }<br><br>
    
    </c:if>
    
<c:if test = "${param.name == 'toto' }">

your name is ${param.name } <br>
너의 나이는 ${param.age } <br>

</c:if>

<c:if test ="${param.age >= 20 }">

당신의 나이 20세 이상 <br>

</c:if>