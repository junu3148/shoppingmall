package com.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.CustomerVO;
import com.shopping.vo.PagingVO;

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
	
	
//	/*고객 전체 리스트*/
//	
//	public List<CustomerVO> getAllCustomer(){ 
//		
//		List<CustomerVO> Customerlist = sqlSession.selectList("customer.customerAllList");
//		
//		return Customerlist;
//	}
	
	/* 고객 총 수 */
	public int getCustomerCnt(Map<String,Object> cnt) {
		
		int customerCnt = sqlSession.selectOne("customer.getCustomerCnt",cnt);
		
		System.out.println("DAO에서 결과체크" + customerCnt);
		
		return customerCnt;
	}
	
	/* 고객 리스트 불러오기*/
	public List<CustomerVO> getCustomerList(PagingVO pagingVO){ 
		
		List<CustomerVO> customerList = sqlSession.selectList("customer.getCustomerList", pagingVO);
		
		System.out.println("DAO까지 넘어오는지 페이징 확인" + customerList);
		
		return customerList;
	}
	
	
	
//	/* 고객 리스트 검색 */ 삭제 예쩡
//	
//	public List<CustomerVO> getCustomerList(Map<String, Object> searchInfo){ 
//		
//		List<CustomerVO> list = sqlSession.selectList("customer.getCustomerList", searchInfo);
//		
//		return list;
//	}
	
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