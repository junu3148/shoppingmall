package com.shopping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.QnADAO;
import com.shopping.vo.Criteria;
import com.shopping.vo.PageMakerDTO;
import com.shopping.vo.QnAVO;

@Service
public class QnAService {

	@Autowired
	private QnADAO qnaDAO;


	// ----------------- 문의 리스트
	public Map<String, Object> getQnAList(Criteria cri) {
		System.out.println("getQnAList Service()");

		Map<String, Object> map = new HashMap<>();
	
		int total = qnaDAO.getTotal(cri);
	
		List<QnAVO> qnaList = qnaDAO.getQnAList(cri);

		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		map.put("pageMaker", pageMaker);
		map.put("qnaList", qnaList);

		return map;
	}
	
	// ----------------- 관리자페이지 문의 리스트
		public Map<String, Object> adminGetQnAList(Criteria cri) {
			System.out.println("adminGetQnAList Service()");

			Map<String, Object> map = new HashMap<>();
		
			int total = qnaDAO.adminGetTotal(cri);
		
			List<QnAVO> qnaList = qnaDAO.adminGetQnAList(cri);
		
			PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
			map.put("pageMaker", pageMaker);
			map.put("qnaList", qnaList);

			return map;
		}

	// ----------------- 문의 등록
	public int insertQnA(QnAVO vo) {
		System.out.println("insertQnA Service()");

		return qnaDAO.insertQnA(vo);
	}

	// ----------------- 관리자 문의 등록
	public int insertQnAAdmin(QnAVO vo) {
		System.out.println("insertQnAAdmin Service()");

		return qnaDAO.insertQnAAdmin(vo);
	}

}
