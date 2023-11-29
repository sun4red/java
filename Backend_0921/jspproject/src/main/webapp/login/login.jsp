<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%
   request.setCharacterEncoding("utf-8");
   %>
   
   <jsp:useBean id = "member" class = "member.MemberDataBean"></jsp:useBean>
   <jsp:setProperty property = "*" name = "member" />
   
   ID : <%=member.getId() %> <br>
   비밀번호 : <%=member.getPasswd()%> <br>