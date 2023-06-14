package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.CustomerService;
import com.shopping.vo.CustomerVO;

@RequestMapping("/customer")
@Controller
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	
	/* 로그인 페이지 이동 */

	@RequestMapping(value = "/loginPage")
	public String loginForm() {
		
		System.out.println("하하하하");
		
		return "customer/login";
	}
	
	
	///////////////////////////////////////////////
	
	/* 로그인 */

	@RequestMapping(value = "/login")
	public String login(@ModelAttribute CustomerVO customerVO) {
		
	
		System.out.println("로그인 넘어오는 값 보기 :" + customerVO);
		
		return "redirect:/main";
	}

	///////////////////////////////////////////////
	
	/* 회원가입 페이지 이동 */
	
	@RequestMapping(value = "/joinPage")
	public String joinForm(@ModelAttribute CustomerVO customerVO) {
		
		System.out.println("가입할 때 넘어오는 값 보기 :" + customerVO);
		
		return "customer/join";
	}
	
	
	///////////////////////////////////////////////

	
	/* 회원가입 */

	@RequestMapping(value = "/join")
	public String join(@ModelAttribute CustomerVO customerVO) {
		
		System.out.println("가입할 때 넘어오는 값 보기 :" + customerVO);
		
		customerService.join(customerVO);
		
//		redirect:/user/login
		return "";
	}
	
	
	///////////////////////////////////////////////
	
	
	/*  AJAX로 회원아이디 유효성 체크*/
	
	@ResponseBody
	@RequestMapping(value ="/checkId")
	public JasonResult checkId(@ModelAttribute CustomerVO customerVO) { 
		
		JasonResult jasonResult = new JasonResult();
		
		System.out.println("넘어온 유저 정보 확인" + customerVO.getCustomerId());
		
		
		return jasonResult;
	}
	
	
	
}
