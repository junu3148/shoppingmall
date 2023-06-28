package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.ReviewService;
import com.shopping.vo.CommentVO;
import com.shopping.vo.ReviewVO;

@RequestMapping("/review")
@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@ResponseBody
	@RequestMapping(value ="/addComment", method = RequestMethod.POST)
	public JasonResult addReple(@ModelAttribute CommentVO commentVO) {
		JasonResult jsonResult = new JasonResult();
		System.out.println("리플 달기 넘어오는 값 확인" + commentVO);
		
		CommentVO returnVO = reviewService.addComment(commentVO);
		
		jsonResult.success(returnVO);
		
		return jsonResult;
	}
	
	@RequestMapping(value ="/deleteReview", method = RequestMethod.GET)
	public String deleteReview(@ModelAttribute ReviewVO reviewVO) {
		
		System.out.println("들어온 리뷰VO 확인 : " + reviewVO );
		reviewService.deleteReview(reviewVO);
		
		return "redirect:/main/productDetal/" + reviewVO.getProductNo();
	}
	
	@ResponseBody
	@RequestMapping(value ="/deleteComment", method = RequestMethod.POST)
	public JasonResult deleteComment(@ModelAttribute CommentVO commentVO) {
		JasonResult jsonResult = new JasonResult();
		
		System.out.println("넘어온 코멘트 객체 확인 : " + commentVO);
		boolean result = reviewService.deleteReviewComment(commentVO);
		
		jsonResult.success(result);
		
		return jsonResult;
	}
	
	@ResponseBody
	@RequestMapping(value ="/addLikeCount" , method = RequestMethod.POST)
	public JasonResult addLikeCount(@ModelAttribute ReviewVO reviewVO) {
		JasonResult jsonResult = new JasonResult();
		
		
		System.out.println("넘어온 리뷰 객체 정보 확인 like cnt " + reviewVO);
		boolean result  = reviewService.addLikeCnt(reviewVO);
		
		jsonResult.success(result);
		
		return jsonResult;
	}
}
