<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String jumin1 = request.getParameter("jumin1");
String jumin2 = request.getParameter("jumin2");
String mailid = request.getParameter("mailid");
String domain = request.getParameter("domain");
String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String post = request.getParameter("post");
String address = request.getParameter("address");
String gender = request.getParameter("gender");

String[] hobby = request.getParameterValues("hobby");
String h = "";	// String h = "공부-게임-등산" 구분문자로 이어붙여 Split
for(String hy : hobby)
	h += hy + "-";

String intro = request.getParameter("intro").replace("\n","<br>");

%>

ID : <%=id%><br>
PW : <%=passwd%><br>
이름 : <%=name%><br>
주민번호 : <%=jumin1%> - <%=jumin2%><br>
이메일 : <%=mailid%> @ <%=domain%><br>
전화번호 : <%=tel1%> - <%=tel2%> - <%=tel3%><br>
핸드폰 : <%=phone1%> - <%=phone2%> - <%=phone3%><br>
우편번호 : <%=post%><br>
주소 : <%=address%><br>
성별 : <%=gender%><br>
취미 : <%=h%><br>
자기소개 : <%=intro%><br>

