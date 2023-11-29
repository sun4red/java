package com.example.demo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SampleController {


	@RequestMapping("/")
	@ResponseBody	// 메소드 호출한 브라우저로 돌려주겠다!
	public void hello(HttpServletResponse response) throws IOException{
		response.getWriter().print("Hello World!?");
	}
	
	
	/*
	 * @RequestMapping("/abc")
	 * 
	 * @ResponseBody public void abc() {
	 * 
	 * }
	 */
	
}
