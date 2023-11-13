package com.example.demo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SampleController {

@RequestMapping("/")
public String hello() {
	return "Hell Yeah!";
}

	
	
}
