<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="member.MemberDTO" />
<jsp:setProperty property="*" name="member" />


<%
String[] hobby = request.getParameterValues("hobby");

String h = ""; // String h = "공부-게임-쇼핑-'

for (String h1 : hobby) {
	h += h1 + "-";
	}

	member.setHobby(h);

	MemberDAO dao = MemberDAO.getInstance();

// 한 사람의 상세정보(비번) 구하기
	MemberDTO old = dao.getMember(member.getId());

// 비번 비교

		if (old.getPasswd().equals(member.getPasswd() ) ) { // 비번 일치 시
			int result = dao.update(member);
			if (result == 1) {
%>
<script>
				alert("회원정보 수정 성공");
				location.href = "main.jsp";
</script>
<%
			}
		} else { // 비번 불일치 시
%>
<script>
		alert("비번이 일치되지 않습니다.");
		history.go(-1);
</script>


<%
		}
%>