package com.shopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shopping.service.ProductService;
import com.shopping.vo.ProductVO;

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

		return "Admin/ProductUpdate";
	}

	// ----------------- 상품 등록
	@RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
	public String insertProduct(@ModelAttribute ProductVO vo, 
								@RequestParam("file") MultipartFile file) {
		System.out.println("insertProduct()");
		
		int result = productService.insertProduct(vo, file);
		
		return "Admin/ProductView";
	}

	// ------------------- 상품정보 수정
	@RequestMapping(value = "/modifyPoductForm", method = RequestMethod.GET)
	public String modifyPoductForm(Model model) {
		System.out.println("modifyPoductForm()");
		
		List<ProductVO> productList = productService.getProductList();
		
		System.out.println(productList.get(0));
		
		model.addAttribute("productList", productList);
				
		return "Admin/ProductView";
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
