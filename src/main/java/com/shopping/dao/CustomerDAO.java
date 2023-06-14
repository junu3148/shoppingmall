package com.shopping.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.CustomerVO;

@Repository
public class CustomerDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	
	public int isertCustomer(CustomerVO customerVO) { 
		
		System.out.println("DAO 연결 확인" + customerVO);
		
		return 0;
	}
	
	public CustomerVO selectSameId(CustomerVO customerVO) {  
		
		System.out.println("유효성 검사용으로 DAO까지 오는지 확인 :" + customerVO);
		
		CustomerVO returnVO = sqlSession.selectOne("customer.selectSameId", customerVO);
		
		return returnVO;
	}
	
	
}