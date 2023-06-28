package com.shopping.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shopping.ajax.JasonResult;
import com.shopping.service.QnAService;
import com.shopping.vo.Criteria;
import com.shopping.vo.QnAVO;

@Controller
@RequestMapping("/QnA")
public class QnAController {

	@Autowired
	private QnAService qnAService;

	
	@RequestMapping(value="/QnAList", method = RequestMethod.GET)
	public String QnAList2(Model model,Criteria cri) {
		System.out.println("QnAList()");
			
		Map<String, Object> map = qnAService.getQnAList(cri);
		
		model.addAttribute("qnAList", map.get("qnAList"));
		model.addAttribute("pageMaker", map.get("pageMaker"));
			
		return "qna/qnaList";
	}
	
	@RequestMapping(value = "/QnAForm", method = RequestMethod.GET)
	public String QnAForm() {
		System.out.println("QnAForm()");

		return "qna/qnaInsert";
	}

	@RequestMapping(value = "/insertQnA", method = RequestMethod.GET)
	public String insertQnA(@ModelAttribute QnAVO vo) {
		System.out.println("insertQnA()");
		System.out.println(vo);
	
		int result = qnAService.insertQnA(vo);
		
		return "redirect:/QnA/QnAList";
		
	}

	@ResponseBody
	@RequestMapping(value = "/deleteQnA", method = RequestMethod.POST)
	public JasonResult deleteQnA(@ModelAttribute QnAVO vo) {
		System.out.println("deleteQnA()");

		int result = 0;

		JasonResult jasonResult = new JasonResult();

		jasonResult.success(result);

		return jasonResult;

	}

	@RequestMapping(value = "/insertQnAAdmin", method = RequestMethod.GET)
	public String insertQnAAdmin(@ModelAttribute QnAVO vo) {
		System.out.println("insertQnAAdmin()");
		
		int result = qnAService.insertQnAAdmin(vo);

		return "redirect:/QnA/QnAList";
	}

}





