package com.shopping.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.PaymentService;
import com.shopping.vo.CustomerVO;
import com.shopping.vo.OrderVO;
import com.shopping.vo.ProductVO;

@RequestMapping("/payment")
@Controller
public class PaymentController {

	@Autowired
	PaymentService paymentService;
	
	

	
	
	
	@ResponseBody
	@RequestMapping(value ="/paymentSuccess", method= RequestMethod.POST)
	public JasonResult pay(@ModelAttribute OrderVO orderVO) {
		JasonResult jsonResult  = new JasonResult();
		
		boolean result = paymentService.paymentSuccess(orderVO);
		jsonResult.success(result);
		
		
		return jsonResult;
	}
	
}
