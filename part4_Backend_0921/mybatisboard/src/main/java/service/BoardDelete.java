package service;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model.BoardBean;

public class BoardDelete implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardDelete");
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_pass = request.getParameter("board_pass");
		int page = Integer.parseInt(request.getParameter("page"));
		
		String path = request.getRealPath("boardupload");
		System.out.println("path : " + path);
		
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardBean db = dao.getDetail(board_num);
		
		
		if(db.getBoard_pass().equals(board_pass)) {	// 비번 일치
			int result = dao.delete(board_num);
			if(result == 1) {
				System.out.println("글 삭제 성공");
			}
			// 첨부파일이 있는 경우에 첨부파일 삭제
			if(db.getBoard_file()!=null) {
				
				File file = new File(path);
				file.mkdir();
				
				// boardupload 디렉토리의 모든 첨부파일 구하기
				File[] f = file.listFiles();
				for (int i = 0; i<f.length; i++) {
					if(f[i].getName().equals(db.getBoard_file())) {
						f[i].delete();	// 첨부파일 삭제
					}
				}
				
			}
			
			response.sendRedirect("./board/delete.jsp?page="+page);
			return null;
			
			
			
			
			
		}else {	// 불일치
			
			out.println("<script>");
			out.println("alert('비번이 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			
			return null;
			
		}
		
		/*
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("/BoardListAction.do?page="+page);
		
		return forward;
		*/
	}
}
