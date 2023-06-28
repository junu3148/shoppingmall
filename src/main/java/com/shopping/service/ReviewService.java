package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.ReviewDAO;
import com.shopping.vo.CommentVO;
import com.shopping.vo.ReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDAO reviewDAO;
	
	public CommentVO addComment(CommentVO commentVO) {
		
		System.out.println("서비스까지 넘어온 코멘트 객체 " + commentVO);
		/*insert 해서 받아온 객체 no을 이용해 다시 불러올 예정임*/
		reviewDAO.insertComment(commentVO);
		CommentVO returnVO = reviewDAO.getReviewComment(commentVO);
		
		return returnVO;
	}
	
	public int deleteReview(ReviewVO reviewVO) {
		
		int row  = reviewDAO.deleteReview(reviewVO);
		
		System.out.println("");
		
		return row;
	}
	
	public boolean deleteReviewComment(CommentVO commentVO) {
		
		boolean result = false;
		
		System.out.println(" 컨트롤 까지 넘어온 코멘트 객체  " + commentVO);
		int row = reviewDAO.deleteReviewComment(commentVO);
		
		if (row > 0 ) {result = true; }
		
		return result;
	}
	
	public boolean addLikeCnt(ReviewVO reviewVO) {
		
		boolean result = false;
		
		System.out.println("서비스에서 확인하는 리뷰 객체 정보 " + reviewVO);
		int row = reviewDAO.addLikeCnt(reviewVO);
		
		if(row>0) {result = true;}
		
		return result;
	}
}
