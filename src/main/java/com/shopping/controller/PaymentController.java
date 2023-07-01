package com.shopping.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.PaymentService;
import com.shopping.vo.OrderVO;

@RequestMapping("/payment")
@Controller
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	
	/*결제성공시 로직*/
	@ResponseBody
	@RequestMapping(value ="/paymentSuccess", method= RequestMethod.POST)
	public JasonResult pay(@ModelAttribute OrderVO orderVO) {
		System.out.println("pay()");
		JasonResult jsonResult  = new JasonResult();
		
		boolean result = paymentService.paymentSuccess(orderVO);
		jsonResult.success(result);
		
		
		return jsonResult;
	}
	
}
