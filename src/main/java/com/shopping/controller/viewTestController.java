package com.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class viewTestController {

	@RequestMapping(value = "/test1")
	public String test() {
		
		System.out.println("하하하하");
		
		return "product/pd_detail";
	}
	
	@RequestMapping(value = "/test2")
	public String test2() {
		
		System.out.println("하하하하");
		
		return "Admin/ProductUpdate";
	}
	
}
