package com.example.demo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// @RestController
// 1. spring4 부터 지원
// 2. @RestController = @Controller + @ResponseBody
// 3. DTO객체, List를 json으로 변환 해주는 역할을 한다.

@RestController
public class HelloController {

	@RequestMapping("/welcome")
	public String welcome() {
		return "welcome to spring boot";
	}

}
