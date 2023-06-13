package com.shoppingmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {

	
	@RequestMapping("/test")
	public String test() {
		
		System.out.println("test입니다...");
		
		return "";
	}
	
	
}
