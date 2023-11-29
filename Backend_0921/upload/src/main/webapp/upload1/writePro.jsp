<%@page import="upload.BoardDBBean"%>
<%@page import="upload.BoardDataBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    // 업로드 할 디렉토리 path 구하기
    
    String path = request.getRealPath("upload");
    System.out.println("path : " + path);
    
    // 첨부파일의 크기(단위 : Byte) 1MB
    
    int size = 1024 * 1024;
    
    // 첨부파일은 MultiPartRequest 클래스로 객체를 생성하면서 업로드가 수행된다.
    MultipartRequest multi = 
    		new MultipartRequest(
    				request,		// 내장됨
    				path,			// 업로드할 디렉토리
    				size,			// 첨부파일 크기
    				"utf-8",		// 인코딩 타입
    				new DefaultFileRenamePolicy()	// 파일 중복문제 처리
    				);
    String writer = multi.getParameter("writer");
    String subject = multi.getParameter("subject");
    String email = multi.getParameter("email");
    String content = multi.getParameter("content");
    String passwd = multi.getParameter("passwd");
    
    
    // 오리지널 파일명 : 클라이언트가 업로드한 파일명
    
    String upload0 = multi.getOriginalFileName("upload");
    
    // 실제 서버에 저장될 파일명
    
    String upload = multi.getFilesystemName("upload");
    
    // useBean 객체를 쓰지못함 근데 왜
    BoardDataBean board = new BoardDataBean();
	board.setWriter(writer);
	board.setSubject(subject);
	board.setEmail(email);
	board.setContent(content);
	board.setPasswd(passwd);
	board.setIp(request.getRemoteAddr());	// 클라이언트의 IP주소
	board.setUpload(upload);				// 첨부파일명
	
	BoardDBBean dao = BoardDBBean.getInstance();
	int result = dao.insert(board);
	
	if(result == 1){
%>
	<script>
	alert("글작성 성공");
	location.href="list.jsp";
	</script>	
		
<%
	}else{
%>
		<script>
		alert("글작성 실패");
		history.go(-1);
		</script>
		
		
<%
	}
%>
	
	
	
	
    %>