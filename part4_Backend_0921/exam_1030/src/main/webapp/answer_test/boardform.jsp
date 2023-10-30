<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>8번문제 게시판 양식</title>
</head>
<body>
<form  method = "post" action = "board.jsp" >
<table border = "1" align = "center">
<caption>게시판</caption>
<tr>
<th>제목</th>
<td><input type = "text" name = "title" id = "title"></td>
</tr>
<tr>
<th>작성자</th>
<td><input type = "text" name = "name" id = "name"></td>
</tr>
<tr>
<th>비밀번호</th>
<td><input type = "text" name = "password" id = "password"></td>
</tr>
<tr>
<th>내용</th>
<td><textarea name = "content" id = "content"></textarea></td>
</tr>
<tr>
<td colspan = "2" align = "center"><input type = "submit" value = "확인"></td>
</tr>
</table>
</form>
</body>
</html>