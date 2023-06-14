package com.shopping.dao;

import org.springframework.stereotype.Repository;

import com.shopping.vo.CustomerVO;

@Repository
public class CustomerDAO {
	
	public int isertCustomer(CustomerVO customerVO) { 
		
		System.out.println("DAO 연결 확인" + customerVO);
		
		
		
		
		return 0;
	}
	
	
}