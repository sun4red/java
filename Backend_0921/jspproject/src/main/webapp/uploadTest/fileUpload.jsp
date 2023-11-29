<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%

String na = request.getParameter("name");
out.println("name : " + na);	// name : null (값전달 안됨)


	String uploadPath=request.getRealPath("upload");
	System.out.println("path="+uploadPath);	

	int size = 10*1024*1024;
	String name="";
	String subject="";
	String filename1="";
	String filename2="";
	String origfilename1="";
	String origfilename2="";
	
	try{
		// 첨부파일은 MultipartRequest 객체를 생성하면서 업로드가 수행 
		MultipartRequest multi=new MultipartRequest(request,
													uploadPath,	// 업로드할 디렉토리 위치
													size, 		// 첨부파일의 크기 10MB
													"utf-8",	// 인코딩
								new DefaultFileRenamePolicy());	// 중복문제 해결

		name=multi.getParameter("name");
		subject=multi.getParameter("subject");
		
		Enumeration files=multi.getFileNames();
		
//	    String file1 = "fileName1";
		String file1 =(String)files.nextElement();
		// 실제 서버에 저장된 파일명 Koala1.jpg
		filename1=multi.getFilesystemName(file1);
		// 클라이언트가 업로드한 파일명 : Koala.jpg
		origfilename1= multi.getOriginalFileName(file1);

// 	    String file2 = "fileName2";		
		String file2 =(String)files.nextElement();
		filename2=multi.getFilesystemName(file2);
		origfilename2=multi.getOriginalFileName(file2);
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html>
<body>
<form name="filecheck" action="fileCheck.jsp" method="post">
	<input type="hidden" name="name" value="<%=name%>">
	<input type="hidden" name="subject" value="<%=subject%>">
	<input type="hidden" name="filename1" value="<%=filename1%>">
	<input type="hidden" name="filename2" value="<%=filename2%>">
	<input type="hidden" name="origfilename1" value="<%=origfilename1%>">
	<input type="hidden" name="origfilename2" value="<%=origfilename2%>">
</form>
<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>
