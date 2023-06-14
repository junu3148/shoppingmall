package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.shopping.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;

	// ----------------- 상품 페이지
	@RequestMapping(value = "/category/{no}", method = RequestMethod.GET)
	public String product(@PathVariable("no") int no) {
		System.out.println("product()");

		return "";
	}

	// ----------------- 상품 등록 폼
	@RequestMapping(value = "/insertProductForm", method = RequestMethod.GET)
	public String insertProductForm() {
		System.out.println("insertProductForm()");

		return "/Admin/ProductUpdate";
	}

	// ----------------- 상품 등록
	@RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
	public String insertProduct() {
		System.out.println("insertProduct()");

		return "";
	}

	// ------------------- 상품정보 수정
	@RequestMapping(value = "/modifyPoductForm", method = RequestMethod.GET)
	public String modifyPoductForm() {
		System.out.println("modifyPoductForm()");

		return "";
	}

	// ------------------- 상품 수정
	@RequestMapping(value = "/modifyPoduct", method = RequestMethod.POST)
	public String modifyPoduct() {
		System.out.println("modifyPoduct()");

		return "";
	}

	// ------------------- 상품 삭제
	@RequestMapping(value = "/deletePoduct", method = RequestMethod.POST)
	public String deletePoduct() {
		System.out.println("deletePoduct()");

		return "";
	}
	
}




