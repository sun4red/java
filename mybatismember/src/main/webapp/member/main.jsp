<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>

<!-- 세션이 있는 경우 -->

<%-- <c:if test="${sessionScope.id != null }"> --%>
<c:if test = "${!empty sessionScope.id}">
${sessionScope.id }님 환영합니다.<br><br>

<a href = "<%=request.getContextPath() %>/UpdateMember.do">회원정보 수정</a><br>
<a href = "<%=request.getContextPath() %>/Logout.do">로그아웃</a><br>
<a href = "<%=request.getContextPath() %>/DeleteMember.do">회원탈퇴</a><br>

</c:if>

<!-- 세션이 없는 경우 -->

<%-- <c:if test="${sessionScope.id == null }"> --%>
<c:if test = "${empty sessionScope.id}">
<a href = "<%=request.getContextPath() %>/MemberForm.do">회원가입</a><br>
<a href = "<%=request.getContextPath() %>/LoginForm.do">로그인</a><br>
</c:if>
