package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.ReviewDAO;
import com.shopping.vo.CommentVO;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDAO reviewDAO;
	
	public CommentVO addComment(CommentVO commentVO) {
		
		System.out.println("서비스까지 넘어온 코멘트 객체 " + commentVO);
		/*insert 해서 받아온 객체 no을 이용해 다시 불러올 예정임*/
		reviewDAO.insertComment(commentVO);
		
		
		return null;
	}
	
}
