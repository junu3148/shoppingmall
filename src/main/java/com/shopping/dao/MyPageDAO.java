package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.CustomerVO;
import com.shopping.vo.PagingVO;
import com.shopping.vo.ProductVO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	/* 고객 정보 받아오기*/
	public CustomerVO getCustomerByNo(int customerNo) { 
		
		CustomerVO returnVO = sqlSession.selectOne("myPage.getCustomerByNo", customerNo);
		
		System.out.println("정보 넘어오는지 DAO에서 확인 " + customerNo);
		
		return returnVO;
	}
	/*총 구매수량 확인*/
	public int getOrderCnt(int customerNo) {
		
		System.out.println("총 total 수를 알기 위해 넘어온 no" + customerNo);
		int totalCnt = sqlSession.selectOne("myPage.getOrderCnt", customerNo);
		
		return totalCnt;
	}
	
	public List<ProductVO> getOrderList(PagingVO pagingVO){
		 
		System.out.println("페이징 위해 DAO로 넘어온 정보 : " + pagingVO);
		List<ProductVO> orderList = sqlSession.selectList("myPage.getOrderList", pagingVO);
		System.out.println("불러온 결과 확인" + orderList);
		
		return orderList;
	}
}
