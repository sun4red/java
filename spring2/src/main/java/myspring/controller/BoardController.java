package myspring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myspring.model.Board;
import myspring.service.BoardService;

@Controller
public class BoardController {

	
	@Autowired
	private BoardService service;
	
	
	// 글 작성 폼
	@RequestMapping("boardform.do")
	public String boardform() {
		return "board/boardform";
	}
	
	// 글작성
	@RequestMapping("boardwrite.do")
	public String boardwrite(@ModelAttribute Board board, Model model) {
		
		
		int result = service.insert(board);
		if(result == 1) System.out.println("글작성 성공");
		model.addAttribute("result", result);
		
		
		return "board/insertresult";
	}
	
	// 글목록
	@RequestMapping("boardlist.do")
	public String boardlist(@RequestParam(value = "page", defaultValue = "1") int page, 
			Model model) {
	
		// int page = 1;
		int limit = 10;
		
		
		int startRow = (page-1) * limit + 1;
		int endRow = page * limit;
		
		int listcount = service.getCount();
		System.out.println("listcount : " + listcount);
		
		
		List<Board> boardlist = service.getBoardList(page);
		System.out.println("boardlist : " + boardlist);
		
		
		// 총 페이지
		int pageCount = listcount / limit + ((listcount%10==0)?0:1);
		
		int startPage = ((page-1)/10)*limit +1;
		int endPage = startPage + 10 - 1;
		
		if(endPage > pageCount)
			endPage = pageCount;
	
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		
		
		return "board/boardlist";
	}
	
	// 상세 페이지 : 조회수 1증가 + 상세정보 구하기
	@RequestMapping("boardcontent.do")
	public String boardcontent(@RequestParam("no") int no,
			@RequestParam("page") String page,
			Model model) {
		
		service.updatecount(no);	// 조회수 1증가
		Board board = service.getBoard(no);
		String content = board.getContent().replace("\n", "<br>");
		
		model.addAttribute("board", board);
		model.addAttribute("content", content);
		model.addAttribute("page", page);
		
		return "board/boardcontent";
		
		
		
	}
	
	// 수정 폼
	
	@RequestMapping("boardupdateform.do")
	public String boardupdateform(@RequestParam("no") int no,
			@RequestParam("page") String page,
			Model model) {
	
		
		Board board = service.getBoard(no);		// 상세정보 구하기
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		
		return "board/boardupdateform";
	}
	
	// 글 수정
	@RequestMapping("boardupdate.do")
	public String boardupdate(@ModelAttribute Board board, 
			@RequestParam("page") String page, 
			Model model) {
	int result = 0;
	Board db = service.getBoard(board.getNo());
	
	if(db.getPasswd().equals(board.getPasswd())) {	// 비번 일치 시
		result = service.update(board);
	}else {	// 비번 불일치 시
		result = -1;
	
	}
	model.addAttribute("result", result);
	model.addAttribute("board", board);
	model.addAttribute("page", page);
	
	
	
		return "board/updateresult";
	}
	
	// 삭제 폼
	@RequestMapping("boarddeleteform.do")
	public String boarddeleteform() {
		return "board/boarddeleteform";
	}
	
	// 글 삭제
	
	@RequestMapping("boarddelete.do")
	public String boarddelete(@ModelAttribute Board board, 
			@RequestParam("page") String page,
			Model model){
		
	int result = 0;
	
	Board db = service.getBoard(board.getNo());
	if(db.getPasswd().equals(board.getPasswd())) {	// 비번 일치 시
		result = service.delete(board.getNo());
	}else {		// 비번 불일치
		result = -1;
	}
	
	
	model.addAttribute("result", result);
	model.addAttribute("page", page);
		
		return "board/deleteresult";
	}
	
}
