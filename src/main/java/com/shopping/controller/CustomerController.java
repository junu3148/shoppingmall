package com.shopping.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.CustomerService;
import com.shopping.vo.CustomerVO;

@RequestMapping("/customer")
@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	/* 로그인 페이지 이동 */
	@RequestMapping(value = "/loginPage")
	public String loginForm() {
		
		return "customer/login";
	}
	
	
	///////////////////////////////////////////////
	
	/* 로그인 */
	@RequestMapping(value = "/login" , method = {RequestMethod.POST, RequestMethod.GET})
	public String login(@ModelAttribute CustomerVO customerVO
						,HttpSession session
						,Model model) {
		
		String message = "아이디 또는 비밀번호를 잘못입력했습니다. \n<br> 입력하신 내용을 다시 확인해주세요.";

		CustomerVO authCustomer = customerService.login(customerVO);
		
		if(authCustomer == null) {
			model.addAttribute("message", message);
			return "customer/login";
		}else {
			session.setAttribute("authCustomer", authCustomer);
			session.setMaxInactiveInterval(6000);
			return "redirect:/main/";
		}
	}

	///////////////////////////////////////////////
	
	/* 로그아웃 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) { 

		session.removeAttribute("authCustomer");
		session.invalidate();
		
		return "redirect:/main/";
	}
	
	
	///////////////////////////////////////////////
	
	/* 회원가입 페이지 이동 */
	
	@RequestMapping(value = "/joinPage")
	public String joinForm() {
		
		return "customer/join";
	}
	
	
	///////////////////////////////////////////////

	
	/* 회원가입 */
	/* 가입 성공 후에는 로그인 페이지로 이동 */
	@RequestMapping(value = "/join" , method = {RequestMethod.POST, RequestMethod.GET})
	public String join(@ModelAttribute CustomerVO customerVO) {
		

			customerService.join(customerVO);

		
		return "redirect:/customer/loginPage";
	}
	
	
	///////////////////////////////////////////////
	
	
	/*  AJAX로 회원아이디 유효성 체크*/
	
	@ResponseBody
	@RequestMapping(value ="/checkId")
	public JasonResult checkId(@ModelAttribute CustomerVO customerVO) { 
		
		JasonResult jasonResult = new JasonResult();
		
		boolean result = customerService.checkId(customerVO);
		
		jasonResult.success(result);
		
		return jasonResult;
	}
	
	///////////////////////////////////////////////
	
	
	/* 고객 정보 리스트*/
	@RequestMapping(value = "/customerView" , method = {RequestMethod.POST, RequestMethod.GET})	
	public String customerView(@RequestParam( value = "selectPage", required = false, defaultValue = "1")int selectPage
							,@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
							,@RequestParam(value ="searchOption", required = false, defaultValue ="all") String searchOption
							,Model model) {
			
		
		Map<String, Object> pageInfo = customerService.getCustomerList(selectPage, keyword,searchOption);
		model.addAttribute("pageInfo", pageInfo);
		
		
		return "Admin/CustomerView";
	}

	/* 고객 정보 리스트*/
	@RequestMapping(value = "/customerView2" , method = {RequestMethod.POST, RequestMethod.GET})	
	public String customerView2(@RequestParam( value = "selectPage", required = false, defaultValue = "1")int selectPage
							,@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
							,@RequestParam(value ="searchOption", required = false, defaultValue ="all") String searchOption
							,Model model) {
			
		
		Map<String, Object> pageInfo = customerService.getCustomerList(selectPage, keyword,searchOption);
		model.addAttribute("pageInfo", pageInfo);
		
		
		return "adminTest/ccview";
	}

	


}
