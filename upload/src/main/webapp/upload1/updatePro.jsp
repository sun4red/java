<%@page import="upload.BoardDBBean"%>
<%@page import="upload.BoardDataBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); 

// 업로드할 디렉토리 path 구하기

String path = request.getRealPath("upload");
System.out.println("path : " + path);


// 첨부파일의 크기(단위:Byte) : 1MB

int size = 1024 * 1024;


// 첨부파일은 MultipartRequest 클래스로 객체를 생성하면서 업로드가 수행된다.
MultipartRequest multi = 
	new MultipartRequest(
		request,
		path,
		size,
		"utf-8",
		new DefaultFileRenamePolicy()
		);


int num = Integer.parseInt(multi.getParameter("num"));


String nowpage = multi.getParameter("page");

String writer = multi.getParameter("writer");
String subject = multi.getParameter("subject");
String email = multi.getParameter("email");
String content = multi.getParameter("content");
String passwd = multi.getParameter("passwd");

// 오리지널 파일명 : 클라이언트가 업로드한 파일명
String upload0 = multi.getOriginalFileName("upload");

// 실제 서버에 저장된 파일명
String upload = multi.getFilesystemName("upload");

BoardDataBean board = new BoardDataBean();

board.setNum(num);
board.setWriter(writer);
board.setSubject(subject);
board.setEmail(email);
board.setContent(content);
board.setPasswd(passwd);
board.setIp(request.getRemoteAddr());	// 클라이언트의 IP주소
// board.setUpload(upload);		// 첨부파일을 수정하지 않으면 null값이 저장된다.

BoardDBBean dao = BoardDBBean.getInstance();

BoardDataBean db = dao.getContent(num);

if(upload != null){		// 첨부파일을 수정한 경우
	board.setUpload(upload);
	
	
}else{					// 첨부파일을 수정하지 않은 경우
	board.setUpload(db.getUpload());
	// 이렇게 처리하지않으면 기존의 첨부파일이 사라져버린다.
	
}

// 비번 비교
if(db.getPasswd().equals(passwd)){		// 비번이 일치가 되는 경우
	int result = dao.update(board);
	if(result == 1){
%>

	<script>
		alert("글수정 성공");
		location.href="list.jsp?page=<%=nowpage%>";
	</script>
	
	<%
	}
}else{		// 비번 불일치시
	 %>

	 <script>
	 alert("비번이 일치하지 않습니다.");
	 history.go(-1);
	 </script>
	 
	 
<%
	}
%>


