package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.CustomerDAO;
import com.shopping.vo.CustomerVO;

@Service
public class CustomerService {
	
	@Autowired
	CustomerDAO customerDAO;
	
	//로그인 기능 구현
	public int join(CustomerVO customerVO) { 
		
		customerDAO.isertCustomer(customerVO);
		
		return 0;
	}
	
	
}
