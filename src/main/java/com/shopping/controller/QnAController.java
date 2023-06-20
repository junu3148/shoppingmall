package com.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.QnAService;
import com.shopping.vo.QnAVO;

@Controller
@RequestMapping("/QnA")
public class QnAController {

	@Autowired
	private QnAService qnAService;

	@RequestMapping(value = "/QnAForm", method = RequestMethod.GET)
	public String QnAForm() {
		System.out.println("QnAForm()");

		return "qna/qna";
	}

	@RequestMapping(value = "/insertQnA", method = RequestMethod.GET)
	public String insertQnA(@ModelAttribute QnAVO vo) {
		System.out.println("insertQnA()");
		
		int result = qnAService.insertQnA(vo);

		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteQnA", method = RequestMethod.POST)
	public JasonResult deleteQnA(@ModelAttribute QnAVO vo) {
		System.out.println("deleteQnA()");
		
		int result =0;
				
		JasonResult jasonResult = new JasonResult();
		
		jasonResult.success(result);
		
		return jasonResult;
		
	}
	
	@RequestMapping(value = "/insertQnAAdmin" , method = RequestMethod.POST)
	public String insertQnAAdmin(@ModelAttribute QnAVO vo) {
		System.out.println("insertQnAAdmin()");
		
		
		  
		return "";
	}

}









