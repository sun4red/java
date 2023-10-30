<%@page import="reboard.BoardDataBean"%>
<%@page import="reboard.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id = "board" class = "reboard.BoardDataBean"></jsp:useBean>
<jsp:setProperty property = "*" name = "board"/>

<%
board.setIp(request.getRemoteAddr());

String nowpage = request.getParameter("page");

BoardDBBean dao = BoardDBBean.getInstance();

// db에서 비번 구해오기

BoardDataBean old = dao.getContent(board.getNum());

if(old.getPasswd().equals(board.getPasswd())){
	int result = dao.update(board);
	if(result == 1){
		
	
%>
	
	<script>
	alert("글 수정 성공");
	location.href="list.jsp?page=<%=nowpage%>";
	
	
	
	</script>
	
	
	
<%	}	
}else{ %>

<script>
alert("비번이 일치하지 않습니다.");
history.go(-1);


</script>


<%	}	%>