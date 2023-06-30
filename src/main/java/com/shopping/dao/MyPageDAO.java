package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.CustomerVO;
import com.shopping.vo.PagingVO;
import com.shopping.vo.ProductVO;
import com.shopping.vo.ReviewVO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	/* 고객 정보 받아오기*/
	public CustomerVO getCustomerByNo(int customerNo) { 
		System.out.println("getCustomerByNo DAO()");
		CustomerVO returnVO = sqlSession.selectOne("myPage.getCustomerByNo", customerNo);
		
		return returnVO;
	}
	
	/*총 구매수량 확인*/
	public int getOrderCnt(int customerNo) {
		System.out.println("getOrderCnt DAO()");
		int totalCnt = sqlSession.selectOne("myPage.getOrderCnt", customerNo);
		
		return totalCnt;
	}
	
	/*결제한 주문내역 확인*/
	public List<ProductVO> getOrderList(PagingVO pagingVO){
		System.out.println("getOrderList DAO()");
		List<ProductVO> orderList = sqlSession.selectList("myPage.getOrderList", pagingVO);
		
		return orderList;
	}
	
	/*주문한 제품 정보 받아오기*/
	public ProductVO getProductInfo(int productNo) {
		System.out.println("getProductInfo DAO()");
		ProductVO returnVO = sqlSession.selectOne("myPage.getProductInfo", productNo);

		return returnVO;
	}
	
	/*리뷰 추가*/
	public int insertReview(ReviewVO reviewVO) {
		System.out.println("insertReview DAO()");
		int row = sqlSession.insert("myPage.insertReview", reviewVO);
		
		return row;
	}
	
	/*리뷰 이미지 테이블에 이미지 추가*/
	public int insertReviewImage(ReviewVO reviewVO) {
		System.out.println("insertReviewImage DAO()");
		int row = sqlSession.insert("myPage.insertReviewImage", reviewVO);
		
		return row;
	}
	
	/*내가 쓴 리뷰 갯수 확인*/
	public int getMyReviewCnt(String customerNo) {
		System.out.println("getMyReviewCnt DAO()");
		int cnt = sqlSession.selectOne("myPage.cntMyReview", customerNo);
		return cnt;
	}
	
	/*내가 쓴 리뷰 리스트*/
	public List<ReviewVO> getMyReviewList(PagingVO pagingVO){
		System.out.println("getMyReviewList DAO()");
		List<ReviewVO> reviewList = sqlSession.selectList("myPage.getReviewList", pagingVO);
		
		return reviewList;
	}
}
