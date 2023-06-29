package com.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.CustomerVO;
import com.shopping.vo.PagingVO;
import com.shopping.vo.ProductVO;

@Repository
public class CustomerDAO {
	
	@Autowired
	private SqlSession session;
	
	
	/*로그인*/
	
	public CustomerVO selectLoginVO(CustomerVO customerVO) { 
		
		CustomerVO returnVO = session.selectOne("customer.selectLoginVO", customerVO);
		
		return returnVO;
	}
	
	
	/*회원가입*/
	
	public int insertCustomer(CustomerVO customerVO) { 
		
		int row  = session.insert("customer.insertCustomer", customerVO);
		
		return row;
	}
	
	/*아이디 유효성 검사*/
	
	public CustomerVO selectSameId(CustomerVO customerVO) {  
		
		CustomerVO returnVO = session.selectOne("customer.selectSameId", customerVO);
		
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
		
		int customerCnt = session.selectOne("customer.getCustomerCnt",cnt);
		
		System.out.println("DAO에서 결과체크" + customerCnt);
		
		return customerCnt;
	}
	
	/* 고객 리스트 불러오기*/
	public List<CustomerVO> getCustomerList(PagingVO pagingVO){ 
		
		List<CustomerVO> customerList = session.selectList("customer.getCustomerList", pagingVO);
		
		System.out.println("DAO까지 넘어오는지 페이징 확인" + customerList);
		
		return customerList;
	}
	
	public CustomerVO getDetailInfo(CustomerVO customerVO) {
		
		System.out.println("DAO까지 넘어온 customerVO + " + customerVO);
		CustomerVO returnVO = session.selectOne("customer.getDetailInfo", customerVO);
		
		System.out.println("DB에서 넘어온 customer 객체 : " + returnVO);
		
		return returnVO;
	}
	
	public int updateCustomer(CustomerVO customerVO) {
		
		System.out.println("DAO 에서 업데이트 위해 넘어온 객체 : " + customerVO);
		int row = session.update("customer.updateCustomerRole", customerVO);
		
		
		return row;
	}

}