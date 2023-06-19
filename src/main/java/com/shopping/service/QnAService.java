package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.QnADAO;
import com.shopping.vo.QnAVO;

@Service
public class QnAService {

	@Autowired
	private QnADAO qnADAO;

	public int insertQnA(QnAVO vo) {
		System.out.println("insertQnA Service()");

		return qnADAO.insertQnA(vo);
	}
}
