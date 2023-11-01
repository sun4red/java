package com.ch.hello;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class JoinController {
	@RequestMapping("/joinForm")
	public String joinForm() {
		return "joinForm";
	}

	
	// @ModelAttribute : 가입 양식에서 넘어온 값을 DTO 객체를 생성해서 값을 받을 때! 사용 되는 어노테이션
	@RequestMapping("/join")	// 모델어트리븃 어노테이션 생략해도됨, dto에서 갖고올때 주로 사용
	public String join(@ModelAttribute Member member, Model model) {
		
		System.out.println("id : " + member.getId());
		// 모델2보다 코드가 간결해진다.
		
		model.addAttribute("member", member);
		return "joinResult";
	}
}