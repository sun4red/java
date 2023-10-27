package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model.BoardBean;

public class BoardReplyForm implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("BoardReplyForm");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		BoardDAO dao = BoardDAO.getInstance();
		
		// 부모글의 상세 정보 구하기
		BoardBean board = dao.getDetail(board_num);
		
		// 공유 설정
		request.setAttribute("board", board);
		request.setAttribute("page", page);
		
		ActionForward forward = new ActionForward();
		// request 방식은 dispatcher 방식으로 포워딩
		forward.setRedirect(false);
		forward.setPath("./board/board_reply.jsp");
		
		
		
		
		
		
		
		
		
		return forward;
	}
}
