<%@page import="upload.BoardDataBean"%>
<%@page import="upload.BoardDBBean"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ include file="color.jsp"%>

<%

int num = Integer.parseInt(request.getParameter("num"));
String nowpage = request.getParameter("page");


%>

<html>
<head>
	<title>게시판</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="check.js"></script>
</head>   

<body bgcolor="<%=bodyback_c%>">  
<center><b>글삭제</b>
<br>
<form method="post" name="deleteform" action="deletePro.jsp"> 
<!-- enctype="multipart/form-data" 넘길 파일이 없으므로 내용 제거-->
<input type = "hidden" name = "num" value = "<%=num %>">
<input type = "hidden" name = "page" value = "<%=nowpage %>">
<table width="430" border="1" cellspacing="0" cellpadding="0"  bgcolor="<%=bodyback_c%>" align="center">
   <tr>
    <td align="right" colspan="2" bgcolor="<%=value_c%>">
	    <a href="list.jsp?page=<%=nowpage %>.jsp">글목록</a> 
   </td>
   </tr>

  <tr>
    <td  width="100"  bgcolor="<%=value_c%>" align="center" >비밀번호</td>
    <td  width="330" >
     <input type="password" size="8" maxlength="12" id="passwd" name="passwd"> 
	 </td>
  </tr>
<tr>      
 <td colspan=2 bgcolor="<%=value_c%>" align="center"> 
  <input type="submit" value="글삭제" >  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="location.href='list.jsp'">
</td></tr></table>    
   
</form>      
</body>
</html>
