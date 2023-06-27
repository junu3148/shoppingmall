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
		
		return jsonResult;
	}
	
}
