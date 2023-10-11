<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDBBean"%>
<%@page import="board.BoardDataBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 이게 제일 어렵댔음 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>
	<%
	
	// 검색 항목과 검색어를 받는 부분
	
	String sel = request.getParameter("sel");
	String find = request.getParameter("find");
	
	
	// 1. 한 페이지에 출력할 데이터 갯수
	int page_size = 10;

	String pageNum = request.getParameter("page");
	if (pageNum == null) {
		// null값이 되는 경우 : list.jsp를 그냥 실행하여 불러볼 값이 없던 것,
		// writePro.jsp에서 넘어올 때 어떤 페이지를 불러올지 모르는 경우
		pageNum = "1"; //1page : 최근 글이 보이는 페이지
	}

	// 2. 현재 페이지 번호
	int currentPage = Integer.parseInt(pageNum);

	// 3. 총 데이터 갯수
	int count = 0;

	BoardDBBean dao = BoardDBBean.getinstance();
	count = dao.getCount(sel, find);
	System.out.println("count : " + count);

	// startrow? 을 정할꺼 endrow ?????????????????????????????????

	// startRow : 각 page에 추출할 데이터의 시작번호
	// endRow : 각 page에 추출할 데이터의 끝번호

	int startRow = (currentPage - 1) * page_size + 1;
	int endRow = currentPage * page_size;

	List<BoardDataBean> list = null;
	if (count > 0) {
		list = dao.getlist(startRow, endRow, sel, find);
		// getlist가 가장 어렵다고함
	}
	System.out.println("list : " + list);

	if (count == 0) {
	%>
	작성된 글이 없습니다.
	<%
	} else {
	%>
	<a href="writeForm.jsp">글작성</a> 글갯수 :
	<%=count%>
	<table border=1 width=700 align=center>
		<caption>게시판 목록</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>IP주소</th>
		</tr>

		<%
		// number : 브라우저의 각 페이지에 출력될 시작 번호
		int number = count - (currentPage - 1) * page_size;

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		for (int i = 0; i < list.size(); i++) {
			BoardDataBean board = list.get(i);
			// 리스트 자료구조는 Object로 값을 반환해주지만 제네릭이 있기 때문에 그냥 써도 괜찮다.
			// 원래는 다운캐스팅 해줘야한다.
		%>
		<tr>
			<td><%=number--%></td>
			<td>	<!-- 두개 이상의 값을 가져갈때는 '&' 사용 -->
			<a href="content.jsp?num=<%=board.getNum()%>&page=<%=currentPage%>">
			<%=board.getSubject()%>
			</a></td>
			<td><%=board.getWriter()%></td>
			<td><%=sd.format(board.getReg_date())%></td>
			<td><%=board.getReadcount()%></td>
			<td><%=board.getIp()%></td>
		</tr>



		<%
		}
		%>


	</table>

	<%
	}
	%>

	<!-- 페이지 링크 -->

	<center>
		<%
		if (count > 0) {

			// pageCount : 총 페이지 수
			int pageCount = count / page_size + ((count % page_size == 0) ? 0 : 1);

			// startPage : 각 블럭의 시작 페이지 번호 : 1, 11, 21, ...
			// endPage : 각 블럭의 끝 페이지 번호 : 10, 20, 30, 40, ...

			int startPage = ((currentPage - 1) / 10) * 10 + 1;
			int block = 10; // 1개의 블럭의 크기 : 10개의 페이지로 구성
			int endPage = startPage + block - 1;

			// 가장 마지막 블럭에 endPage값을 PageCounts로 수정

			if (endPage > pageCount) {
				endPage = pageCount;
			}
		%>

		<!-- 1page로 이동 -->
		<a href="list.jsp?page=1&sel=<%=sel%>&find=<%=find%>" style="text-decoration: none"> << </a>


		<%
		// 이전 블록으로 이동

		if (startPage > 10) {
		%>
		<a href="list.jsp?page=<%=startPage - 10%>&sel=<%=sel%>&find=<%=find%>">[이전]</a>
		<%
		}
		%>

		<%
		// 각 블럭당 10개의 페이지 출력
		for (int i = startPage; i <= endPage; i++) {
			if (i == currentPage) { // 현재 페이지
		%>
		[<%=i%>]

		<%
		} else {
		%>
		<a href="list.jsp?page=<%=i%>&sel=<%=sel%>&find=<%=find%>">[<%=i%>]
		</a>
		<%
		}
		}

		// 다음 블록으로 이동
		if (endPage < pageCount) {
		%>

		<a href="list.jsp?page=<%=startPage + 10%>&sel=<%=sel%>&find=<%=find%>"
			style="text-decoration: none">[다음]</a>

		<%
		}
		%>

		<!-- 마지막 페이지로 이동 -->
		<a href="list.jsp?page=<%=pageCount%>&sel=<%=sel%>&find=<%=find%>" style="text-decoration: none">
			>> </a>
		<%
		}
		%>

	</center>
	
	<br><br><br>
	
	<script src = "http://code.jquery.com/jquery-latest.js">
	
	</script>
	
	<script>
	$(document).ready(function(){
		$("form").submit(function(){
			if($("select").val()==""){
				alert("검색할 항목을 선택 하세요");
				return false;
			}
			if($("#find").val()==""){
				alert("검색어를 입력하세요");
				$("#find").focus();
				return false;
			}
		});
	});
	</script>
	
	
	<form action = "list.jsp">
	<select name = "sel">
	<option value = "">검색</option>
	<option value = "writer">작성자</option>
	<option value = "subject">제목</option>
	<option value = "content">내용</option>
	</select>
	<input type = "text" name = "find">
	<input type = "submit" value = "검색">
	</form>

</body>
</html>