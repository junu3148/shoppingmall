package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.CartService;
import com.shopping.vo.CartVO;

@RequestMapping("/cart")
@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	
	@RequestMapping(value ="/viewCart")
	public String viewCart(@RequestParam("customerNo") int customerNo) { 
		
		System.out.println("고객 넘버 잘 넘어오는지 확인" + customerNo);
		cartService.viewCart(customerNo);
		
		return "";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value ="/addCart", method = RequestMethod.POST )
	public JasonResult addCart(@ModelAttribute CartVO cartVO) {
		
		JasonResult jasonResult = new JasonResult();
		System.out.println("카트추가 넘어오는 거 확인" + cartVO);
		
		/* 추가한 제품 수량 리턴*/
		int productCnt = cartService.addCart(cartVO);
		
		
		jasonResult.success(productCnt);
		System.out.println("컨트롤러로 넘어오는지 다시 확인" + productCnt);
		
		return jasonResult;
		
	}
	
	
	
	
}
