package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.ReviewDAO;
import com.shopping.vo.CommentVO;
import com.shopping.vo.ReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	/*코멘트 추가*/
	public CommentVO addComment(CommentVO commentVO) {
		System.out.println("addComment Service()");
		
		/*insert 해서 받아온 객체 no을 이용해 다시 불러올 예정임*/
		reviewDAO.insertComment(commentVO);
		CommentVO returnVO = reviewDAO.getReviewComment(commentVO);
		
		return returnVO;
	}
	
	
	/*리뷰 삭제*/
	public int deleteReview(ReviewVO reviewVO) {
		System.out.println("deleteReview Service()");
		int row  = reviewDAO.deleteReview(reviewVO);
		
		return row;
	}
	
	/*리뷰에 달린 댓글 삭제*/
	public boolean deleteReviewComment(CommentVO commentVO) {
		System.out.println("deleteReviewComment Service()");
		boolean result = false;
		
		int row = reviewDAO.deleteReviewComment(commentVO);
		if (row > 0 ) {result = true; }
		
		return result;
	}
	
	/*라이크 버튼 +1 */
	public boolean addLikeCnt(ReviewVO reviewVO) {
		System.out.println("addLikeCnt Service()");
		boolean result = false;
		
		int row = reviewDAO.addLikeCnt(reviewVO);
		if(row>0) {result = true;}
		
		return result;
	}
}
