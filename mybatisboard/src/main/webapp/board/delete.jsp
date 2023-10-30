<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <script>
    
    alert("글 삭제 완료");
    location.href="<%=request.getContextPath()%>/BoardListAction.do?page="+${param.page};
    
    
    
    </script>