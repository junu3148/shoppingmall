package com.shopping.controller;

import java.util.Map;

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
import com.shopping.vo.Criteria;
import com.shopping.vo.ProductVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;

	// ------------------- 상품 등록
	@RequestMapping(value = "/insertProduct", method = RequestMethod.POST)
	public String insertProduct(@ModelAttribute ProductVO vo, @RequestParam("file") MultipartFile file) {
		System.out.println("insertProduct()");

		productService.insertProduct(vo, file);

		return "redirect:/product/productListForm";
	}

	// ------------------- 상품정보 리스트
	@RequestMapping(value = "/productListForm", method = RequestMethod.GET)
	public String PoductListForm(Model model, @ModelAttribute Criteria cri) {
		System.out.println("productListForm()");

		Map<String, Object> map = productService.getProductList(cri);

		model.addAttribute("productList", map.get("productList"));
		model.addAttribute("pageMaker", map.get("pageMaker"));

		return "admin/productView";
	}

	// ------------------- 상품 수정
	@RequestMapping(value = "/modifyProduct", method = RequestMethod.POST)
	public String modifyPoduct(@ModelAttribute ProductVO vo, @RequestParam("file") MultipartFile file) {
		System.out.println("modifyProduct()");

		productService.modifyProduct(vo, file);

		return "redirect:/product/productListForm";
	}

	// ------------------- 상품 삭제
	@RequestMapping(value = "/deleteProduct/{no}", method = RequestMethod.GET)
	public String deletePoduct(@PathVariable("no") int productNo) {
		System.out.println("deleteProduct()");

		productService.deleteProduct(productNo);

		return "redirect:/product/productListForm";
	}

	// -------------------- 상품 검색
	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET)
	public String searchProduct(Model model, @ModelAttribute Criteria cri) {
		System.out.println("searchProduct");

		Map<String, Object> map = productService.getProductList(cri);

		model.addAttribute("productList", map.get("productList"));
		model.addAttribute("pageMaker", map.get("pageMaker"));

		return "admin/productView";
	}

}
