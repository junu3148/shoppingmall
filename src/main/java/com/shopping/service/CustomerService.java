package com.shopping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.CustomerDAO;
import com.shopping.vo.CustomerVO;
import com.shopping.vo.PagingVO;
import com.shopping.vo.ProductVO;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDAO customerDAO;
	
	/*로그인*/
	public CustomerVO login(CustomerVO customerVO) {
		System.out.println("login Service()");
		CustomerVO returnVO = customerDAO.selectLoginVO(customerVO);
		
		return returnVO;
	}
	
	
	/*회원가입 기능 구현*/
	public int join(CustomerVO customerVO) { 
		System.out.println("join Service()");
		int row = customerDAO.insertCustomer(customerVO);
		
		return row;
	}
	
	
	/* 아이디 유효성 체크 구현 AJAX */
	//아이디 체크 후 가입 불가인 경우 false 리턴함
	public boolean checkId(CustomerVO customerVO) { 
		System.out.println("checkId Service()");
		boolean result = false; //가입 불가 = false
		
		CustomerVO returnVO = customerDAO.selectSameId(customerVO);	//동일한 아이디 있는지 체크
		
		if(returnVO == null) { 
			result = true;
		}
		
		return result;
	}
	
	/*고객 리스트 가져오기*/
	public Map<String,Object> getCustomerList(int selectPage, String keyword, String searchOption){ 
		System.out.println("getCustomerList Service()");
		Map<String, Object> cnt = new HashMap<String, Object>();
		cnt.put("keyword", keyword);
		cnt.put("searchOption", searchOption);
		
		int totalCnt = customerDAO.getCustomerCnt(cnt);
		
		PagingVO pagingVO = new PagingVO(selectPage, totalCnt, keyword, searchOption);
		List<CustomerVO> customerList = customerDAO.getCustomerList(pagingVO);
		
		Map<String,Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("customerList", customerList);
		pageInfo.put("pagingInfo",pagingVO);
		
		return pageInfo;
	}
	
	/*고객 상세정보 가져오기*/
	public CustomerVO getDetailCInfo(CustomerVO customerVO){
		System.out.println("getDetailCInfo Service()");
		CustomerVO returnVO = customerDAO.getDetailInfo(customerVO);
		
		return returnVO;
	}
	
	/*고객 정보 수정*/
	public int modifyCustomer(CustomerVO customerVO) {
		System.out.println("modifyCustomer Service()");
		int row = customerDAO.updateCustomer(customerVO);
		
		return row;
	}
	
	
	
}
