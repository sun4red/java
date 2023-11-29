<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    
    <%
    
    Random r = new Random();
    
    int r1 = r.nextInt(10);
    
    int r2 = r.nextInt(45)+1;
     
     %>
     
난수 1: <%=r1%><br>
난수 2: <%=r2%><br>