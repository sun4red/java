<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="board" class = "board.BoardBean"></jsp:useBean>
<jsp:setProperty property = "*" name = "board"></jsp:setProperty>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10번문제 게시판</title>
</head>
<body>
제목 : <%= board.getTitle() %><br>
작성자 : <%= board.getName() %><br>
비밀번호 : <%= board.getPassword() %><br>
내용 : <%= board.getContent() %><br>
</body>
</html>