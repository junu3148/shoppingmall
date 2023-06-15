package com.shopping.controller;

import java.util.List;

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
			
		System.out.println("loginPage Controller()");
		
		return "customer/login";
	}
	
	
	///////////////////////////////////////////////
	
	/* 로그인 */

	@RequestMapping(value = "/login" , method = {RequestMethod.POST, RequestMethod.GET})
	public String login(@ModelAttribute CustomerVO customerVO
						,HttpSession session
						,Model model) {
		
		String message = "아이디 또는 비밀번호를 잘못입력했습니다. \n<br> 입력하신 내용을 다시 확인해주세요.";

	
		System.out.println("login Controller()" + customerVO);
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
		System.out.println("logout Controller()");
		session.removeAttribute("authCustomer");
		session.invalidate();
		
		return "redirect:/main/";
	}
	
	
	///////////////////////////////////////////////
	
	/* 회원가입 페이지 이동 */
	
	@RequestMapping(value = "/joinPage")
	public String joinForm() {
		
		System.out.println("JoinPage Controller()");
		
		return "customer/join";
	}
	
	
	///////////////////////////////////////////////

	
	/* 회원가입 */
	/* 가입 성공 후에는 로그인 페이지로 이동 */
	@RequestMapping(value = "/join" , method = {RequestMethod.POST, RequestMethod.GET})
	public String join(@ModelAttribute CustomerVO customerVO) {
		
		System.out.println("join Controller" + customerVO);
		
		int joinRow = customerService.join(customerVO);
		
		if(joinRow > 0) { 
			System.out.println("가입성공");
		}
		
		return "redirect:/customer/loginPage";
	}
	
	
	///////////////////////////////////////////////
	
	
	/*  AJAX로 회원아이디 유효성 체크*/
	
	@ResponseBody
	@RequestMapping(value ="/checkId")
	public JasonResult checkId(@ModelAttribute CustomerVO customerVO) { 
		
		JasonResult jasonResult = new JasonResult();
		
		boolean result = customerService.checkId(customerVO);
		System.out.println("Controller로 돌아온 정보" + result);
		
		jasonResult.success(result);
		
		return jasonResult;
	}
	
	///////////////////////////////////////////////
	
	
	/* 고객 정보 리스트*/
	
	
	@RequestMapping(value = "/customerView" , method = {RequestMethod.POST, RequestMethod.GET})	
	public String customerView(Model model) {
			
		
		System.out.println("customerView Controller");
		
		List<CustomerVO> customerList = customerService.selectAllCustomer();
		
		model.addAttribute("customerList", customerList);
		
		
		return "adminTest/ccview";
	}

	///////////////////////////////////////////////
	
	/*고객 검색*/
	@RequestMapping(value = "/search" , method = {RequestMethod.POST, RequestMethod.GET})	
	public String customerSearch(@RequestParam("searchOption") String searchOption
								 ,@RequestParam("keyword") String keyword
								 ,Model model) {
		
		String message = "<br>검색결과가 확인되지 않습니다. "; //검색결과 없을 시 출력될 메세지
		
		customerService.SearchCustomer(searchOption,keyword);
		
		List<CustomerVO> searchList = customerService.SearchCustomer(searchOption,keyword);
		System.out.println(searchList.size());
		
		if(searchList.size() == 0) {
			model.addAttribute("message", message);
			return "adminTest/ccview";
		}else { 
			model.addAttribute("customerList", searchList);
			return "adminTest/ccview";
		}
	}
	
	///////////////////////////////////////////////
	
	/*고객 상세정보 페이지*/
	//고객 넘버로 고객 정보 뿌려줄 예정임
	@RequestMapping(value = "/detailInfo/{customerNo}")
	public String detailView(@PathVariable("customerNo") int customerNo
							, Model model) {  
		
		System.out.println("컨트롤러로 온 고객 넘버 확인" + customerNo);
		CustomerVO selectVO = customerService.customerByNo(customerNo);
		model.addAttribute("customer",selectVO);
		
		return "adminTest/ccUpdate";
	}

	///////////////////////////////////////////////
	
	/* 회원정보 수정창 이동*/
	@RequestMapping(value ="modifyForm/{customerNo}")
	public String modifyForm(@PathVariable int customerNo
							,Model model) {  
		
		System.out.println("넘어온 값 확인 in controller" + customerNo);
		CustomerVO customerVO = customerService.customerByNo(customerNo);
		model.addAttribute("customer", customerVO);
		
		return "adminTest/CustomerModify";
	}
	
	///////////////////////////////////////////////
	
	/* 회원정보 수정*/
	@RequestMapping(value ="/modify", method = {RequestMethod.POST, RequestMethod.GET})
	public String modifyForm(@ModelAttribute CustomerVO customerVO
							,Model model) {
		System.out.println(customerVO);

		String success = "정보 수정에 성공했습니다!";
		String fail = "정보 수정에 실패했습니다.";
		
		boolean result = customerService.modifyCustomer(customerVO);
		
		if(result == true) {
			model.addAttribute("Message", success);
			return "customer/modifyForm/"+customerVO.getCustomerNo();
		}else{
			model.addAttribute("Message", fail);
			return "customer/modifyForm/"+customerVO.getCustomerNo();
		}
	}
}
