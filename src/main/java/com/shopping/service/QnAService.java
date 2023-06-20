package com.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.QnADAO;
import com.shopping.vo.QnAVO;

@Service
public class QnAService {

	@Autowired
	private QnADAO qnADAO;
	
	// ----------------- 문의 리스트
		public List<QnAVO> getQnAList() {
			System.out.println("getQnAList DAO()");

			return qnADAO.getQnAList();
		}


	// ----------------- 문의 등록
	public int insertQnA(QnAVO vo) {
		System.out.println("insertQnA Service()");

		return qnADAO.insertQnA(vo);
	}

	// ----------------- 문의 삭제
	public int deleteQnA(QnAVO vo) {
		System.out.println("deleteQnA Service()");

		return qnADAO.deleteQnA(vo);

	}

	// ----------------- 관리자 문의 등록
	public int insertQnAAdmin(QnAVO vo) {
		System.out.println("insertQnAAdmin Service()");

		return qnADAO.insertQnAAdmin(vo);
	}

}
