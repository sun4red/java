<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<script src = "http://code.jquery.com/jquery-latest.js"></script>
	<script>
	$(document).ready(function(){
		
		// 중복 ID인 경우 닫기 클릭
		$("#close1").click(function(){
			opener.$("#id").val("").focus();
			window.close();
			
		});
		
		// 사용가능한 ID인 경우 닫기 클릭
		$("#close2").click(function(){
			opener.$("#passwd").val("").focus();
			window.close();
		});
			
		
	});
	
	</script>


<%
	String id = request.getParameter("id");

	MemberDAO dao = MemberDAO.getInstance();
	
	int result = dao.memberAuth(id);
	
	if (result == 1){ // 중복 ID : 1
		
		
		
	
%> 

<%= id %>는 중복 ID 입니다. <br><br><br>
<input type = "button" value = "닫기" id = "close1">

<% } else {  // 사용 가능한 ID : -1 %>

<%= id %>는 사용가능한 ID 입니다. <br><br><br>
<input type = "button" value = "닫기" id = "close2">

<% } %>