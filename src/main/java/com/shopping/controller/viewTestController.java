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
	
	@RequestMapping(value = "/main1")
	public String main() {
		
		System.out.println("하하하하");
		
		return "main/main";
	}

	@RequestMapping(value = "/main11")
	public String mai1n() {
		
		System.out.println("하하하하");
		
		return "main/main__";
	}
	
	@RequestMapping(value = "/cart")
	public String mai11n() {
		
		System.out.println("하하하하");
		
		return "product/cart";
	}
	
	@RequestMapping(value = "/pd_detail")
	public String mai1sn() {
		
		System.out.println("하하하하");
		
		return "product/pd_detail";
	}
	@RequestMapping(value = "/product")
	public String mai1sdsn() {
		
		System.out.println("하하하하");
		
		return "product/product";
	}
	
	
	
}
