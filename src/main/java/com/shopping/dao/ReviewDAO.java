package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.CommentVO;
import com.shopping.vo.PagingVO;
import com.shopping.vo.ProductVO;
import com.shopping.vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession session;
	
	public int getReviewCnt(ProductVO productVO) {
		
		int cnt = session.selectOne("review.getReviewCnt", productVO);

		return cnt;
	}
	
	public List<ReviewVO> getReviewList(PagingVO pagingVO){
			
		List<ReviewVO> reviewList = session.selectList("review.getReviewList", pagingVO);
		System.out.println("넘어온 리뷰 리스트 확인" + reviewList);
		return reviewList;
	}
	
	public List<CommentVO> getReviewComment(ReviewVO reviewVO){
		
		System.out.println("전달된 reviewVO 확인하기 : " + reviewVO);
		List<CommentVO> commentList = session.selectList("review.getCommentList",reviewVO);
		System.out.println("넘어온 코멘트 리스트 확인하기" + commentList);
		
		return commentList;
//		return null;
	}
	
	public void insertComment(CommentVO commentVO) {
		
		int row = session.insert("review.insertReview", commentVO);
		System.out.println("여기까지 넘어오나요 확인? " + commentVO);
		System.out.println("인서트 성공했나요 확인 : " + row);
	}
	
	public CommentVO getReviewComment(CommentVO commentVO) {
		
		System.out.println("리뷰 코멘트 가져올 객체 정보 확인 : " + commentVO);
		CommentVO returnVO = session.selectOne("review.getReviewComment", commentVO);
		
		System.out.println("에이잭스로 그릴 코멘트 객체 정보 확인 : " + returnVO);
		
		return returnVO;
	}
	
	public int deleteReview(ReviewVO reviewVO) {
		
		System.out.println("DAO까지객체 오는지 호가인함 : " + reviewVO);
		
		int rows = session.delete("review.deleteReview", reviewVO);

		return rows;
	}
	
	public int deleteReviewComment(CommentVO commentVO) {
		
		int   row = 0;
		
		System.out.println("DAO까지 넘어오는 객체값 확인 코멘트 : " +commentVO);
		row = session.delete("review.deleteComment", commentVO);	
		
		return row;
	}
	
	public int addLikeCnt(ReviewVO reviewVO) {
		
		System.out.println("라이크카운트 DAO 넘어온 객체 정보" + reviewVO);
		
		int  row = session.update("review.addLikeCnt", reviewVO);
		return row;
	}
}
