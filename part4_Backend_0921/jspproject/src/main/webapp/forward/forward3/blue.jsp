<%@ page contentType="text/html;charset=utf-8"%>

<%
   String name = request.getParameter("name");
   String selectedColor = request.getParameter("selectedColor");
%>

<h2>포워딩되는 페이지 - <%=selectedColor+".jsp"%></h2>

<b><%=name%></b>님의 좋아하는 색은 "<%=selectedColor%>"이고
자기탐구와 내적성장을 상징하는 색입니다.<br><br>

<img src="<%=selectedColor+".jpg"%>" border="0" width="70" height="30">