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
	
	/*리뷰 갯수 확인*/
	public int getReviewCnt(ProductVO productVO) {
		System.out.println("getReviewCnt DAO()");
		int cnt = session.selectOne("review.getReviewCnt", productVO);

		return cnt;
	}
	
	/*리뷰 리스트 가져오기*/
	public List<ReviewVO> getReviewList(PagingVO pagingVO){
		System.out.println("getReviewList DAO()");
		List<ReviewVO> reviewList = session.selectList("review.getReviewList", pagingVO);

		return reviewList;
	}
	
	/*리뷰에 달린 댓글 가져오기*/
	public List<CommentVO> getReviewComment(ReviewVO reviewVO){
		System.out.println("getReviewComment DAO()");
		List<CommentVO> commentList = session.selectList("review.getCommentList",reviewVO);
		
		return commentList;
	}
	
	/*댓글 등록*/
	public void insertComment(CommentVO commentVO) {
		System.out.println("insertComment DAO()");
		int row = session.insert("review.insertReview", commentVO);

	}
	
	/*리뷰에 달린 댓글 가져오기*/
	public CommentVO getReviewComment(CommentVO commentVO) {
		System.out.println("getReviewComment DAO()");
		CommentVO returnVO = session.selectOne("review.getReviewComment", commentVO);
		
		return returnVO;
	}
	
	/*리뷰 삭제하기*/
	public int deleteReview(ReviewVO reviewVO) {
		System.out.println("deleteReview DAO()");
		int rows = session.delete("review.deleteReview", reviewVO);

		return rows;
	}
	
	/*리뷰에 달린 댓글 삭제*/
	public int deleteReviewComment(CommentVO commentVO) {
		System.out.println("deleteReviewComment DAO()");
		int row = session.delete("review.deleteComment", commentVO);	
		
		return row;
	}
	
	/*라이크 버튼 카운트 추가*/
	public int addLikeCnt(ReviewVO reviewVO) {
		System.out.println("addLikeCnt DAO()");
		int  row = session.update("review.addLikeCnt", reviewVO);
		
		return row;
	}
}
