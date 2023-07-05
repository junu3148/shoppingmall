package com.shopping.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopping.service.QnAService;
import com.shopping.vo.Criteria;
import com.shopping.vo.QnAVO;

@Controller
@RequestMapping("/QnA")
public class QnAController {

	@Autowired
	private QnAService qnAService;

	// ------------------- 문의리스트
	@RequestMapping(value = "/QnAList", method = RequestMethod.GET)
	public String QnAList(Model model, Criteria cri) {
		System.out.println("QnAList()");

		Map<String, Object> map = qnAService.getQnAList(cri);

		model.addAttribute("qnAList", map.get("qnAList"));
		model.addAttribute("pageMaker", map.get("pageMaker"));
	
		return "qna/qnaList";
	}

	// ------------------- 문의 등록
	@RequestMapping(value = "/insertQnA", method = RequestMethod.GET)
	public String insertQnA(@ModelAttribute QnAVO vo) {
		System.out.println("insertQnA()");

		qnAService.insertQnA(vo);

		return "redirect:/QnA/QnAList";

	}
	
	// ------------------- 문의리스트
	@RequestMapping(value = "/addminQnA", method = RequestMethod.GET)
	public String addminQnA(Model model, Criteria cri) {
		System.out.println("addminQnA()");
		
		Map<String, Object> map = qnAService.adminGetQnAList(cri);
		
		model.addAttribute("qnAList", map.get("qnAList"));
		model.addAttribute("pageMaker", map.get("pageMaker"));
		
		return "Admin/ProductView2";
		
	}

	// ------------------- 문의 답글 등록
	@RequestMapping(value = "/insertQnAAdmin", method = RequestMethod.GET)
	public String insertQnAAdmin(@ModelAttribute QnAVO vo) {
		System.out.println("insertQnAAdmin()");

		qnAService.insertQnAAdmin(vo);

		return "redirect:/QnA/QnAList";
	}

}
