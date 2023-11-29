<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.ArrayList"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%	
	request.setCharacterEncoding("utf-8");

	String productname = request.getParameter("product");

	// ?????????????????????????????????????????
			
	ArrayList list = (ArrayList)session.getAttribute("productlist");	// 1. 있으면 불러오고 5. 세션에서 다시 불러오고

	// 만일 null 인 경우 처음 데이터를 추가한 것이므로 새로운 ArrayList 생성
	if(list == null) {
		list = new ArrayList();		// 처음에는 ArrayList 객체를 1번 생성		// 2. 없으면 만들고 6. 있으니 넘어감
	}

	
	// ArrayList 에 새로운 데이터 추가
	list.add(productname);												// 3. 7. 리스트에 새로 넣고 
	session.setAttribute("productlist",list);							// 4. 8. 세션에 넣고 

	// ?????????????????????????????????????????
%>

	<!-- 자바스크립트를 이용해 간단한 메시지 출력  -->
	<script>
		alert("<%=productname %> 이(가)추가 되었습니다.!!");
		history.go(-1);
	</script>
</body>
</html>