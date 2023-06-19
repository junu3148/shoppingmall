package com.shopping.dao;

import java.util.List;
import java.util.Map;

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
		
		CustomerVO returnVO = sqlSession.selectOne("customer.selectLoginVO", customerVO);
		
		return returnVO;
	}
	
	
	/*회원가입*/
	
	public int insertCustomer(CustomerVO customerVO) { 
		
		int row  = sqlSession.insert("customer.insertCustomer", customerVO);
		
		return row;
	}
	
	/*아이디 유효성 검사*/
	
	public CustomerVO selectSameId(CustomerVO customerVO) {  
		
		CustomerVO returnVO = sqlSession.selectOne("customer.selectSameId", customerVO);
		
		return returnVO;
	}
	
	
	/*고객 전체 리스트*/
	
	public List<CustomerVO> getAllCustomer(){ 
		
		List<CustomerVO> Customerlist = sqlSession.selectList("customer.customerAllList");
		
		return Customerlist;
	}
	
	/* 고객 리스트 검색 */
	
	public List<CustomerVO> getCustomerList(Map<String, Object> searchInfo){ 
		
		List<CustomerVO> list = sqlSession.selectList("customer.getCustomerList", searchInfo);
		
		return list;
	}
	
	/* 고객 정보 받아오기*/
	public CustomerVO getCustomerByNo(int customerNo) { 
		
		CustomerVO returnVO = sqlSession.selectOne("customer.getCustomerByNo", customerNo);
		
		return returnVO;
	}
	
	/*고객정보 업데이트*/
	
	public int updateCustomer(CustomerVO customerVO) { 
		
		int row = sqlSession.update("customer.updateInfo", customerVO);
		
		return row;
	}
	
	
}