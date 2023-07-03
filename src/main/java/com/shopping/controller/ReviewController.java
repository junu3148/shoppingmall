package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JsonResult;
import com.shopping.service.ReviewService;
import com.shopping.vo.CommentVO;
import com.shopping.vo.ReviewVO;

@RequestMapping("/review")
@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	/*리플 추가*/
	@ResponseBody
	@RequestMapping(value ="/addComment", method = RequestMethod.POST)
	public JsonResult addReple(@ModelAttribute CommentVO commentVO) {
		System.out.println("addComment()");
		JsonResult jsonResult = new JsonResult();
		
		CommentVO returnVO = reviewService.addComment(commentVO);
		jsonResult.success(returnVO);
		
		return jsonResult;
	}
	
	/*리뷰 삭제*/
	@RequestMapping(value ="/deleteReview", method = RequestMethod.GET)
	public String deleteReview(@ModelAttribute ReviewVO reviewVO) {
		System.out.println("deleteReview()");
		reviewService.deleteReview(reviewVO);

		
		return "redirect:/main/productDetal/" + reviewVO.getProductNo();
	}
	
	/*코멘트 삭제*/
	@ResponseBody
	@RequestMapping(value ="/deleteComment", method = RequestMethod.POST)
	public JsonResult deleteComment(@ModelAttribute CommentVO commentVO) {
		System.out.println("deleteComment()");
		JsonResult jsonResult = new JsonResult();

		boolean result = reviewService.deleteReviewComment(commentVO);
		jsonResult.success(result);
		
		return jsonResult;
	}
	
	/*라이크 카운트 추가*/
	@ResponseBody
	@RequestMapping(value ="/addLikeCount" , method = RequestMethod.POST)
	public JsonResult addLikeCount(@ModelAttribute ReviewVO reviewVO) {
		System.out.println("addLikeCount()");
		JsonResult jsonResult = new JsonResult();
		
		boolean result  = reviewService.addLikeCnt(reviewVO);
		jsonResult.success(result);
		
		return jsonResult;
	}
	
}
