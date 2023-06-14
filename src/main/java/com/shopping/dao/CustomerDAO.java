package com.shopping.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.CustomerVO;

@Repository
public class CustomerDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	/*로그인*/
	
	public CustomerVO selectLoginVO(CustomerVO customerVO) { 
		
		System.out.println("DAO까지 넘어오는지 체크" + customerVO);
		CustomerVO returnVO = sqlSession.selectOne("customer.selectLoginVO", customerVO);
		
		return returnVO;
	}
	
	
	/*회원가입*/
	
	public int isertCustomer(CustomerVO customerVO) { 
		
		System.out.println("DAO 연결 확인" + customerVO);
		int row  = sqlSession.insert("customer.insertCustomer", customerVO);
		
		return row;
	}
	
	/*아이디 유효성 검사*/
	
	public CustomerVO selectSameId(CustomerVO customerVO) {  
		
		System.out.println("유효성 검사용으로 DAO까지 오는지 확인 :" + customerVO);
		
		CustomerVO returnVO = sqlSession.selectOne("customer.selectSameId", customerVO);
		
		return returnVO;
	}
	
	
}