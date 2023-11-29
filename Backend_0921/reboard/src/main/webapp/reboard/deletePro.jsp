<%@page import="reboard.BoardDataBean"%>
<%@page import="reboard.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id = "board" class = "reboard.BoardDataBean"/>
<jsp:setProperty property = "*" name = "board"></jsp:setProperty>

<%

String nowpage = request.getParameter("page");

BoardDBBean dao = BoardDBBean.getInstance();

// db에서 비번 구해오기

BoardDataBean old = dao.getContent(board.getNum());

// 비번 비교

if(old.getPasswd().equals(board.getPasswd())){	// 비번 일치 시
	int result = dao.delete(board);
	if(result == 1){
%>
	<script>
	alert("글삭제 성공");
	location.href="list.jsp?page=<%=nowpage%>";
	
	</script>
	
	
<%}
}else{	// 비번 불일치시  %>
	
	<script>
	alert("비번이 일치하지 않습니다.");
	history.go(-1);
	
	</script>
	
	
<%}  %>
