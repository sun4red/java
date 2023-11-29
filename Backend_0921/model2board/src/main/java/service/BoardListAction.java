package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model.BoardBean;

public class BoardListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("BoardListAction");
		
		int page = 1;			// 1. 현재 페이지 번호
		int limit = 10;			// 2. 한 페이지에 출력할 데이터 갯수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		// 3. 총 데이터 갯수
		int listcount = dao.getCount();
		System.out.println("listcount : " + listcount);
		
		
		// start end
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		
		// 게시판 목록 10개 구하기
		List<BoardBean> boardlist = dao.getList(startRow, endRow);
		System.out.println("boardlist : " + boardlist);
		
		
		
		
		// 총 페이지 수
		int pageCount = listcount/limit+((listcount%limit==0)?0:1);
		int startPage = ((page-1)/10) * limit +1;
		int endPage = startPage +10 - 1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		// 공유 설정
		request.setAttribute("page",page);
		request.setAttribute("listcount",listcount);
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("pageCount",pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		// request 객체로 공유한 경우에는 dispatcher 방식으로 포워딩 해야 공유 가능
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);		// dispatcher 방식으로 포워딩
		forward.setPath("./board/board_list.jsp");
		
		
				
		
		return forward;
	}

}
