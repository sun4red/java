package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.Board;
import com.example.demo.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	// @RequestMapping("boardform")
	@RequestMapping("/")
	public String main() {
		return "boardform";
	}
	
	@RequestMapping("boardinsert")
	public String boardinsert(Board board) {
		int result = service.insert(board);
		
		if(result == 1)System.out.println("글작성 성공");
		
		return "redirect:boardlist";
	}
	
	@RequestMapping("boardlist")
	public String boardlist(Model model) {

		List<Board> list = service.list();
		model.addAttribute("list", list);
		
		
		return "boardlist";
	}

}
