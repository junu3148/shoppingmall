package com.shopping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.CustomerDAO;
import com.shopping.vo.CustomerVO;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDAO customerDAO;
	
	
	public CustomerVO login(CustomerVO customerVO) {
		
		CustomerVO returnVO = customerDAO.selectLoginVO(customerVO);
		
		return returnVO;
	}
	
	
	//회원가입 기능 구현
	public int join(CustomerVO customerVO) { 
		
		int row = customerDAO.insertCustomer(customerVO);
		
		return row;
	}
	
	
	/* 아이디 유효성 체크 구현 AJAX */
	//아이디 체크 후 가입 불가인 경우 false 리턴함
	public boolean checkId(CustomerVO customerVO) { 
			
		boolean result = false; //가입 불가 = false
		
		System.out.println("service로 아이디유효성 체크 오는지 확인 : " + customerVO);
		CustomerVO returnVO = customerDAO.selectSameId(customerVO);	//동일한 아이디 있는지 체크
		
		if(returnVO == null) { 
			result = true;
		}
		
		return result;
	}
	
	
	/*고객 전체 리스트*/
	
	public List<CustomerVO> selectAllCustomer() {
		
		
		List<CustomerVO> customerList = customerDAO.getAllCustomer();
		
		
		return customerList;
	}
	
	/* 고객 검색 */
	
	public List<CustomerVO> SearchCustomer(String searchOption,String keyword){ 
		
		Map<String, Object> searchInfo = new HashMap<>();
		
		searchInfo.put("searchOption", searchOption);
		searchInfo.put("keyword", keyword);
		
		List<CustomerVO> Searchlist = customerDAO.getCustomerList(searchInfo);
		
		
		return Searchlist;
	}
	
	/* 고객넘버로 고객 정보 가져오기*/
	
	public CustomerVO customerForModi(int customerNo) { 
		
		CustomerVO returnVO = customerDAO.getCustomerByNo(customerNo);
		
		return returnVO;
	}
	
}
