package com.shopping.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JsonResult;
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
		System.out.println("loginForm()");
		
		return "customer/login";
	}
	
	
	/* 로그인 */
	@RequestMapping(value = "/login" , method = {RequestMethod.POST, RequestMethod.GET})
	public String login(@ModelAttribute CustomerVO customerVO
						,HttpSession session
						,Model model) {
		System.out.println("login()");
		String message = "아이디 또는 비밀번호를 잘못입력했습니다. \n<br> 입력하신 내용을 다시 확인해주세요.";

		CustomerVO authCustomer = customerService.login(customerVO);
		
		if(authCustomer == null) {
			model.addAttribute("message", message);
			return "customer/login";
		}
		else {
			if(authCustomer.getCustomerRole().equals("99")) {
				return "redirect:/product/productListForm";
			}else {
				session.setAttribute("authCustomer", authCustomer);
				session.setMaxInactiveInterval(6000);
				return "redirect:/main/";
			}
		}
	}

	
	/* 로그아웃 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) { 
		System.out.println("logout()");
		
		session.removeAttribute("authCustomer");
		session.invalidate();
		
		return "redirect:/main/";
	}
	

	/* 회원가입 페이지 이동 */
	@RequestMapping(value = "/joinPage")
	public String joinForm() {
		System.out.println("joinForm()");
		
		return "customer/join";
	}
	
	
	/* 회원가입 */
	/* 가입 성공 후에는 로그인 페이지로 이동 */
	@RequestMapping(value = "/join" , method = {RequestMethod.POST, RequestMethod.GET})
	public String join(@ModelAttribute CustomerVO customerVO) {
		System.out.println("join()");

		customerService.join(customerVO);

		
		return "redirect:/customer/loginPage";
	}
	
	
	/*  AJAX로 회원아이디 유효성 체크*/
	@ResponseBody
	@RequestMapping(value ="/checkId")
	public JsonResult checkId(@ModelAttribute CustomerVO customerVO) { 
		System.out.println("checkId()");
		JsonResult jasonResult = new JsonResult();
		
		boolean result = customerService.checkId(customerVO);
		jasonResult.success(result);
		
		return jasonResult;
	}
	
	
	/* 고객 정보 리스트*/
	@RequestMapping(value = "/customerView" , method = {RequestMethod.POST, RequestMethod.GET})	
	public String customerView(@RequestParam( value = "selectPage", required = false, defaultValue = "1")int selectPage
							,@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword
							,@RequestParam(value ="searchOption", required = false, defaultValue ="all") String searchOption
							,Model model) {
		System.out.println("customerView()");	
		
		Map<String, Object> pageInfo = customerService.getCustomerList(selectPage, keyword,searchOption);
		model.addAttribute("pageInfo", pageInfo);
		
		
		return "Admin/CustomerView";
	}
	
	/*고객 상세 정보*/
	@ResponseBody
	@RequestMapping(value ="/customerDetailInfo", method = RequestMethod.POST)
	public JsonResult customerDetailInfo(@ModelAttribute CustomerVO customerVO) {
		System.out.println("customerDetailInfo()");
		JsonResult jsonResult = new JsonResult();

		CustomerVO returnVO = customerService.getDetailCInfo(customerVO);
		jsonResult.success(returnVO);
		
		return jsonResult;
	}
	
	/*고객 정보 수정*/
	@RequestMapping(value ="/modify", method = RequestMethod.GET)
	public String modifyCustomer(@ModelAttribute CustomerVO customerVO) {
		System.out.println("modifyCustomer()");
		customerService.modifyCustomer(customerVO);
		
		return "redirect:/customer/customerView";
	}

}
