<%@page import="upload.BoardDataBean"%>
<%@page import="upload.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id = "board" class = "upload.BoardDataBean"/>
<jsp:setProperty property = "*" name = "board"/>


<% 

String nowpage = request.getParameter("page"); 

String path = request.getRealPath("upload");

System.out.println("path : " + path);

BoardDBBean dao = BoardDBBean.getInstance();
BoardDataBean db = dao.getContent(board.getNum());		// ???????

// 비번 비교

if(db.getPasswd().equals(board.getPasswd())){	// 비번 일치 시
	int result = dao.delete(db, path);		// 글삭제, 첨부파일 삭제
	if(result == 1){
%>
	<script>
	alert("글삭제 성공");
	location.href="list.jsp?page=<%=nowpage%>";
	</script>
<%
	}
}else{
%>
<script>
alert("비번이 일치하지않음");
history.go(-1);
</script>
<%
}
%>
