package com.ch.hello;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

	// @RequestParam("name")
	// 1. 개별적으로 전달되는 name값을 받을 때 사용되는 어노테이션
	// 2. request.getParameter("name")과 같은 역할을 수행한다.

@Controller
public class PersonController {
	@RequestMapping("/addr")
	public String addr(	@RequestParam String name, 
						@RequestParam String addr, Model model) {
		model.addAttribute("name", name);
		model.addAttribute("addr", addr);
		return "addr";
	}

	// @ModelAttribute
	// 가입양식에서 넘어오는 값들을 DTO객체를 생성해서 저장시켜주는 어노테이션
	
	@RequestMapping("/addr2")
	public String addr2(@ModelAttribute Person p, Model model) {
		model.addAttribute("person", p);
		return "addr2";
	}
}