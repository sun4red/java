<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
// 3. Calendar 클래스
Calendar c = Calendar.getInstance();

int y = c.get(Calendar.YEAR);
int m = c.get(Calendar.MONTH) + 1;
int d = c.get(Calendar.DATE);

int h1 = c.get(Calendar.HOUR);
int h2 = c.get(Calendar.HOUR_OF_DAY);

String h = "";
if (c.get(Calendar.AM_PM) == 0) {
	h = "오전";
} else {
	h = "오후";
}

int mm = c.get(Calendar.MINUTE);
int s = c.get(Calendar.SECOND);
int week = c.get(Calendar.DAY_OF_WEEK);
System.out.println("week:" + week);

String[] weekend = {"일","월","화","수","목","금","토"};

%>

<!-- 12시간제 -->

<%=y %>-<%=m %>-<%=d %> <%=h %><%=h1 %>:<%=mm %>:<%=s %>
<br>

<!-- 24시간제 -->
<%=y%>-<%=m %>-<%=d %> <%=h2 %>:<%=mm %>:<%=s %>
<br>
