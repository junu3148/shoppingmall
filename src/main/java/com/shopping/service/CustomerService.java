package com.shopping.service;

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
		
		int row = customerDAO.isertCustomer(customerVO);
		
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
	
	
}
