package com.shopping.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopping.service.MyPageService;


@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
	
	@Autowired
	MyPageService myPageService;
	
	/* 회원정보 수정창 이동*/
	@RequestMapping(value ="/{customerNo}")
	public String modifyForm(@PathVariable int customerNo
							,@RequestParam (value ="selectPage",  required = false, defaultValue = "1") int selectPage
							,Model model) {  
		
		Map<String, Object> myPageInfo = myPageService.myPageInfoByNo(customerNo, selectPage);
		
		model.addAttribute("customerInfo", myPageInfo.get("customerInfo"));
		model.addAttribute("orderList", myPageInfo.get("orderList"));
		model.addAttribute("paging", myPageInfo.get("paging"));
		
		return "myPage/myPage";
	}

	
	@RequestMapping(value = "/writeReview/{productNo}")
	public String reviewForm(@PathVariable int productNo) {
			
		System.out.println("넘어온 넘버 확인" + productNo);
		
		return "myPage/reviewForm";
	}
	
}


