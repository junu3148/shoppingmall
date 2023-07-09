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
	private SqlSession session;
	
	
	/*로그인*/
	public CustomerVO selectLoginVO(CustomerVO customerVO) { 
		System.out.println("selectLoginVO DAO()");
		CustomerVO returnVO = session.selectOne("customer.selectLoginVO", customerVO);
		
		return returnVO;
	}
	
	
	/*회원가입*/
	
	public int insertCustomer(CustomerVO customerVO) { 
		System.out.println("insertCustomer DAO()");
		int row  = session.insert("customer.insertCustomer", customerVO);
		
		return row;
	}
	
	/*아이디 유효성 검사*/
	
	public CustomerVO selectSameId(CustomerVO customerVO) {  
		System.out.println("selectSameId DAO()");
		CustomerVO returnVO = session.selectOne("customer.selectSameId", customerVO);
		
		return returnVO;
	}
	

	/* 고객 총 수 */
	public int getCustomerCnt(Map<String,Object> cnt) {
		System.out.println("getCustomerCnt DAO()");
		int customerCnt = session.selectOne("customer.getCustomerCnt",cnt);
		
		return customerCnt;
	}
	
	/* 고객 리스트 불러오기*/
	public List<CustomerVO> getCustomerList(PagingVO pagingVO){ 
		System.out.println("getCustomerList DAO()");
		List<CustomerVO> customerList = session.selectList("customer.getCustomerList", pagingVO);
		
		return customerList;
	}
	
	/*고객 상세정보*/
	public CustomerVO getDetailInfo(CustomerVO customerVO) {
		System.out.println("getDetailInfo DAO()");
		CustomerVO returnVO = session.selectOne("customer.getDetailInfo", customerVO);
		
		return returnVO;
	}
	
	/*고객 정보 업데이트*/
	public int updateCustomer(CustomerVO customerVO) {
		System.out.println("updateCustomer DAO()");
		int row = session.update("customer.updateCustomerRole", customerVO);
		
		return row;
	}
	/*고객 비밀번호와 회원번호 대조하여 객체 반환*/
	public CustomerVO checkPassword(CustomerVO customerVO) {
		System.out.println("checkPassword DAO()");
		CustomerVO returnVO = session.selectOne("customer.getCustomerByPass", customerVO);
		
		return returnVO;
	}
	
	public int updateCustomerPassword(CustomerVO customerVO) {
		System.out.println("updateCustomerPassword DAO()");
		int row = session.update("customer.updatePassword", customerVO);
		
		return row;
	}
	
	/* 고객 정보 받아오기*/
	public CustomerVO getCustomerByNo(int customerNo) { 
		System.out.println("getCustomerByNo DAO()");
		CustomerVO returnVO = session.selectOne("customer.getCustomerByNo", customerNo);
		
		return returnVO;
	}
	
}