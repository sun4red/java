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
		model.addAttribute("listcount", page);
		model.addAttribute("boardlist", page);
		model.addAttribute("pageCount", page);
		model.addAttribute("startPage", page);
		model.addAttribute("endPage", page);
		
		
		
		return "board/boardlist";
	}
	
	
	
}
