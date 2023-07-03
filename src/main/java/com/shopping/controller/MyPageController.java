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

import com.shopping.service.MyPageService;
import com.shopping.vo.CustomerVO;
import com.shopping.vo.ProductVO;
import com.shopping.vo.ReviewVO;


@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
	
	@Autowired
	private MyPageService myPageService;
	
	/* 마이페이지 이동 */
	@RequestMapping(value ="/{customerNo}")
	public String modifyForm(@PathVariable int customerNo
							,@RequestParam (value ="selectPage",  required = false, defaultValue = "1") int selectPage
							,Model model) {  
		System.out.println("modifyForm()");
		Map<String, Object> myPageInfo = myPageService.myPageInfoByNo(customerNo, selectPage);
		
		model.addAttribute("customerInfo", myPageInfo.get("customerInfo"));
		model.addAttribute("orderList", myPageInfo.get("orderList"));
		model.addAttribute("paging", myPageInfo.get("paging"));
		
		return "myPage/myPage";
	}

	/* 리뷰 작성 양식*/
	@RequestMapping(value = "/writeReview/{productNo}")
	public String reviewForm(@PathVariable int productNo
							,Model model) {
		System.out.println("reviewForm()");
		ProductVO productVO = myPageService.getProductInfo(productNo);
		
		model.addAttribute("reviewProduct", productVO);
		
		return "myPage/reviewForm";
	}
	
	/*리뷰 작성*/
	@RequestMapping(value = "/writeReview", method = RequestMethod.POST)
	public String writeReview(@RequestParam("file") MultipartFile file
							,@ModelAttribute ReviewVO reviewVO ) {
		System.out.println("writeReview()");
		myPageService.addReview(file, reviewVO);
		
		
		return "redirect:/myPage/" + reviewVO.getCustomerNo();
	}
	
	/*내가 작성한 리뷰 보기 페이지*/
	@RequestMapping(value ="/myReview/{customerNo}")
	public String myReviewPage(@PathVariable String customerNo
								,@RequestParam (value ="selectPage", required =false, defaultValue ="1") int selectPage
								,Model model) {
		System.out.println("myReviewPage()");
		Map<String, Object> reviewList = myPageService.getReviewList(customerNo,selectPage);
		model.addAttribute("reviewList", reviewList.get("reviewList"));
		model.addAttribute("paging",reviewList.get("pagingVO"));
		
		return "myPage/reviewView";
	}
	
	/*고객 정보 수정 전 비밀번호 체크*/
	@RequestMapping(value ="/checkPasswordForm", method = RequestMethod.GET)
	public String modifyCheckPage() {
		System.out.println("modifyCheckPage()");
		
		return "myPage/checkPassword";
	}
	
	/*정보 수정 폼*/	
	@RequestMapping(value = "/checkPassword")
	public String modifyForm(@ModelAttribute CustomerVO customerVO
							,Model model) {
		System.out.println("modifyForm()");

		CustomerVO returnVO = myPageService.checkPassword(customerVO);
		
		model.addAttribute("customer", returnVO);
		
		return "myPage/modifyForm";
	}
	
	@RequestMapping(value ="/modifyCustomerInfo", method = RequestMethod.POST)
	public String modifyCustomerInfo(@ModelAttribute CustomerVO customerVO) {
		
		System.out.println("modifyCustomerInfo()");
		myPageService.updateCustomerPassword(customerVO);
		
		
		return "redirect:/myPage/" + customerVO.getCustomerNo();
	}
	
}


