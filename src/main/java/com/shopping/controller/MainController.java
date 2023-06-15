package com.shopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopping.service.ProductService;
import com.shopping.vo.ProductVO;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/")
	public String main(Model model) {
		System.out.println("main()");

		return "main/main";
	}

	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String all(Model model) {
		System.out.println("all()");

		List<ProductVO> productList = productService.getProductList();
		
		model.addAttribute("productList", productList);
	
		return "product/product";
		
	}
}









