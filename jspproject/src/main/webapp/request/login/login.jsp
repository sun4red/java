<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    request.setCharacterEncoding("utf-8");
    
    String id = request.getParameter("id");
    String passwd = request.getParameter("passwd");
    
    
    
    %>
    
    id : <%= id %> <br>
    passwd : <%= passwd %> <br>