package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopping.vo.QnAVO;

@Controller
@RequestMapping("/QnA")
public class QnAController {
	
	@Autowired
	private QnAController qnAController;
	
	@RequestMapping(value = "/QnAForm" ,method = RequestMethod.GET)
	public String QnAForm() {
		System.out.println("QnAForm()");
		
				
		return "qna/qna";
	}
	
	@RequestMapping(value="/insertQnA", method = RequestMethod.GET)
	public String insertQnA(@ModelAttribute QnAVO vo) {
		System.out.println("insertQnA()");
		System.out.println(vo);
		
		return "";
	}
	
	
	
}
