package com.shopping.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shopping.service.MyPageService;
import com.shopping.vo.CustomerVO;
import com.shopping.vo.ProductVO;
import com.shopping.vo.ReviewVO;


@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
	
	@Autowired
	MyPageService myPageService;
	
	/* 회원정보 수정창 이동*/
	@RequestMapping(value ="/{customerNo}")
	public String modifyForm(@PathVariable int customerNo
							,@RequestParam (value ="selectPage",  required = false, defaultValue = "1") int selectPage
							,Model model) {  
		
		Map<String, Object> myPageInfo = myPageService.myPageInfoByNo(customerNo, selectPage);
		
		model.addAttribute("customerInfo", myPageInfo.get("customerInfo"));
		model.addAttribute("orderList", myPageInfo.get("orderList"));
		model.addAttribute("paging", myPageInfo.get("paging"));
		
		return "myPage/myPage";
	}

	
	@RequestMapping(value = "/writeReview/{productNo}")
	public String reviewForm(@PathVariable int productNo
							,Model model) {
			
		System.out.println("넘어온 넘버 확인" + productNo);
		ProductVO productVO = myPageService.getProductInfo(productNo);
		
		model.addAttribute("reviewProduct", productVO);
		
		return "myPage/reviewForm";
	}
	
	@RequestMapping(value = "/writeReview", method = RequestMethod.POST)
	public String writeReview(@RequestParam("file") MultipartFile file
							,@ModelAttribute ReviewVO reviewVO ) {
		System.out.println("넘어온 값 : " + file +"  " +  reviewVO );
		myPageService.addReview(file, reviewVO);
		
		
		return "redirect:/myPage/" + reviewVO.getCustomerNo();
	}
	@RequestMapping(value ="/myReview/{customerNo}")
	public String myReviewPage(@PathVariable String customerNo
								,@RequestParam (value ="selectPage", required =false, defaultValue ="1") int selectPage
								,Model model) {
		
		Map<String, Object> reviewList = myPageService.getReviewList(customerNo,selectPage);
		model.addAttribute("reviewList", reviewList.get("reviewList"));
		model.addAttribute("paging",reviewList.get("pagingVO"));
		
		
		return "myPage/reviewView";
	}

	
}


