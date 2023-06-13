package com.shoppingmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {

	
	@RequestMapping("/test")
	public String test() {
		
		System.out.println("test입니다...");
		System.out.println("수정했습니다.");
		
		return "";
	}
	
	
}
