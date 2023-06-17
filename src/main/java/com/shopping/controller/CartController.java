package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.CartService;
import com.shopping.vo.CartVO;

@RequestMapping("/cart")
@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	@ResponseBody
	@RequestMapping(value ="/addCart", method = RequestMethod.POST )
	public JasonResult addCart(@ModelAttribute CartVO cartVO) {
		
		JasonResult jasonResult = new JasonResult();
		System.out.println("카트추가 넘어오는 거 확인" + cartVO);
		
		/* insert 성공 시 true, 실패 시 false 넘어옴*/
		boolean result = cartService.addCart(cartVO);
		
		
		jasonResult.success(result);
		System.out.println("컨트롤러로 넘어오는지 다시 확인" + result);
		
		return jasonResult;
		
	}
	
	
	
}
