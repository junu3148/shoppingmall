package com.shopping.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopping.service.ProductService;
import com.shopping.vo.Criteria;
import com.shopping.vo.ProductVO;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductVO productVO;

	@RequestMapping(value = "/")
	public String main(Model model) {
		System.out.println("main()");

		return "main/main";
	}

	// --------------- all2 페이지
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String all2(Model model, @ModelAttribute Criteria cri,
			@RequestParam(value = "category", required = false, defaultValue = "all") String category,
			@RequestParam(value = "subCategory", required = false, defaultValue = "all") String subCategory) {
		System.out.println("test()");

		Map<String, Object> map = productService.getProductListTest(category, subCategory, cri);

		model.addAttribute("pageMaker", map.get("pageMaker"));
		model.addAttribute("productList", map.get("productList"));
		model.addAttribute("view", "all");
		model.addAttribute("category", category);
		model.addAttribute("Criteria.subCategory", subCategory);

		return "product/product2";

	}

	// -------------- 카테고리 페이지
	@RequestMapping(value = "/category2/{subCategory}", method = RequestMethod.GET)
	public String category2(Model model, @ModelAttribute Criteria cri,
			@RequestParam(value = "category", required = false, defaultValue = "all") String category,
			@PathVariable("subCategory") String subCategory) {
		System.out.println("category()");

		Map<String, Object> map = productService.getProductListTest(category, subCategory, cri);

		model.addAttribute("pageMaker", map.get("pageMaker"));
		model.addAttribute("productList", map.get("productList"));
		model.addAttribute("view", "category2");
		model.addAttribute("category", category);
		model.addAttribute("subCategory", subCategory);
		model.addAttribute("CriteriaSubCategory", subCategory);

		return "product/product2";
	}

	/*
	 * // --------------- all 페이지
	 * 
	 * @RequestMapping(value = "/all", method = RequestMethod.GET) public String
	 * all(Model model,
	 * 
	 * @RequestParam(value = "category", required = false, defaultValue = "all")
	 * String category,
	 * 
	 * @RequestParam(value = "subCategory", required = false, defaultValue = "all")
	 * String subCategory) { System.out.println("all()");
	 * 
	 * List<ProductVO> productList = productService.getProductList(category,
	 * subCategory);
	 * 
	 * model.addAttribute("productList", productList); model.addAttribute("view",
	 * "all");
	 * 
	 * return "product/product";
	 * 
	 * }
	 */

	// -------------- 카테고리 페이지
	@RequestMapping(value = "/category/{subCategory}", method = RequestMethod.GET)
	public String category(Model model,
			@RequestParam(value = "category", required = false, defaultValue = "all") String category,
			@PathVariable("subCategory") String subCategory) {
		System.out.println("category()");

		List<ProductVO> productList = productService.getProductList(category, subCategory);

		System.out.println(productList);

		model.addAttribute("productList", productList);
		model.addAttribute("view", "category");
		model.addAttribute("subCategory", subCategory);

		return "product/product";
	}

	// -------------------- 상품 상세페이지
	@RequestMapping(value = "/productDetal/{productNo}", method = RequestMethod.GET)
	public String productDetal(Model model, @PathVariable("productNo") int productNo) {
		System.out.println("productDetal");
		productVO.setProductNo(productNo);

		ProductVO product = productService.getProduct(productVO);

		model.addAttribute("product", product);

		return "product/pd_detail";

	}

	// -------------------- 상품 검색
	@RequestMapping(value = "/productSearch", method = RequestMethod.POST)
	public String productSearch(Model model, @RequestParam("keyword") String keyword) {
		System.out.println("productSearch()");

		List<ProductVO> productList = productService.productSearch(keyword);

		model.addAttribute("productList", productList);
		model.addAttribute("view", "all");
		model.addAttribute("Search", "Search");

		return "product/product";
	}

}
