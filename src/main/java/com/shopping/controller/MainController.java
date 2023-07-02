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

	// --------------- Main 페이지
	@RequestMapping(value = "/")
	public String main(Model model) {
		System.out.println("main()");
		
		List<ProductVO> productList = productService.mainProductList();
		
		model.addAttribute("productList", productList);

		return "main/main";
	}

	// --------------- all 페이지
	@RequestMapping(value = "/all", method = RequestMethod.GET)
	public String all(Model model, @ModelAttribute Criteria cri,
			@RequestParam(value = "category", required = false, defaultValue = "all") String category,
			@RequestParam(value = "subCategory", required = false, defaultValue = "all") String subCategory) {
		System.out.println("all()");

		Map<String, Object> map = productService.getProductList(category, subCategory, cri);

		model.addAttribute("pageMaker", map.get("pageMaker"));
		model.addAttribute("productList", map.get("productList"));
		model.addAttribute("view", "all");
		model.addAttribute("category", category);
		model.addAttribute("Criteria.subCategory", subCategory);

		return "product/product";

	}

	// -------------- 카테고리 페이지
	@RequestMapping(value = "/category/{subCategory}", method = RequestMethod.GET)
	public String category(Model model, @ModelAttribute Criteria cri,
			@RequestParam(value = "category", required = false, defaultValue = "all") String category,
			@PathVariable("subCategory") String subCategory) {
		System.out.println("category()");

		Map<String, Object> map = productService.getProductList(category, subCategory, cri);

		model.addAttribute("pageMaker", map.get("pageMaker"));
		model.addAttribute("productList", map.get("productList"));
		model.addAttribute("view", "category");
		model.addAttribute("category", category);//카테고리 유지
		model.addAttribute("subCategory", subCategory);//all페이지 서브카테고리 없이표현하기위한장치
		model.addAttribute("CriteriaSubCategory", subCategory);//페이징을 위한 장치

		return "product/product";
	}

	// -------------------- 상품 상세페이지
	@RequestMapping(value = "/productDetal/{productNo}", method = RequestMethod.GET)
	public String productDetal(Model model, @PathVariable("productNo") int productNo
								,@RequestParam(value ="selectReviewPage", required =false, defaultValue ="1")int selectReviewPage) {
		System.out.println("productDetail()");
		productVO.setProductNo(productNo);

		
		Map<String, Object> detailViewInfo = productService.productPageInfo(productVO,selectReviewPage);

		System.out.println("디테일 뷰에 넘어오는 거 확인 : " +  detailViewInfo);
		model.addAttribute("product", detailViewInfo.get("product"));
		model.addAttribute("paging", detailViewInfo.get("paging"));
		model.addAttribute("review", detailViewInfo.get("review"));
		
		return "product/pd_detail";

	}

	// -------------------- 상품 검색
	@RequestMapping(value = "/productSearch", method = RequestMethod.GET)
	public String productSearch(Model model, @ModelAttribute Criteria cri) {
		System.out.println("productSearch()");

		List<ProductVO> productList = productService.productSearch(cri.getKeyword());

		model.addAttribute("productList", productList);
		model.addAttribute("view", "all");
		model.addAttribute("Search", "Search");
		model.addAttribute("keyword", cri.getKeyword());//키워드 유지

		return "product/product";
	}

}
