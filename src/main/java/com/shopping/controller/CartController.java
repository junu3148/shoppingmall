package com.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.CartService;
import com.shopping.vo.CartVO;
import com.shopping.vo.ProductVO;

@RequestMapping("/cart")
@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	
	@RequestMapping(value ="/viewCart")
	public String viewCart(@RequestParam(value = "customerNo", required = false, defaultValue= "0") int customerNo
							, Model model) { 
		 
			List<ProductVO> cartList = cartService.viewCart(customerNo);
			
			model.addAttribute("cartList", cartList);

			return "product/cart";
		}
	
	
	
	/*카트에 제품 추가*/
	@ResponseBody
	@RequestMapping(value ="/addCart", method = RequestMethod.POST )
	public JasonResult addCart(@ModelAttribute CartVO cartVO) {
		
		JasonResult jasonResult = new JasonResult();
		
		/* 추가한 제품 수량 리턴*/
		int productCnt = cartService.addCart(cartVO);
		
		jasonResult.success(productCnt);
		
		return jasonResult;
		
	}
	
	
	/* 카트에 있는 제품 삭제 */
	@ResponseBody
	@RequestMapping(value="/deleteList", method =RequestMethod.POST)
	public JasonResult deleteList(@ModelAttribute CartVO cartVO) { 
		
		JasonResult jasonResult = new JasonResult();
		
		boolean result = cartService.deleteList(cartVO);
		jasonResult.success(result);
		
		return jasonResult;
	}
	
}
