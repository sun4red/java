<%@page import="board.BoardDataBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id = "board" class = "board.BoardDataBean"></jsp:useBean>
<jsp:setProperty property = "*" name = "board"></jsp:setProperty>

<%
String nowpage = request.getParameter("page");

BoardDBBean dao = BoardDBBean.getinstance();

// db에서 비번 구해오기


BoardDataBean old = dao.getContent(board.getNum());

// 비번 비교 

if(old.getPasswd().equals(board.getPasswd())){	// 비번 일치 시 
	int result = dao.delete(board.getNum());

if(result == 1){
	%>
	
	<script>
	alert("글삭제 성공");
	location.href="list.jsp?page=<%=nowpage%>";
	
	</script>
	
	<%
}
%>	



<%
}else{	// 비번 불일치 시
%>
><script>
alert("비번이 일치하지 않습니다.");
history.go(-1);


</script>


<% } %>

