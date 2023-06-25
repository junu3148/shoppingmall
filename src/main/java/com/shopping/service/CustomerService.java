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
		
		CustomerVO returnVO = customerDAO.selectSameId(customerVO);	//동일한 아이디 있는지 체크
		
		if(returnVO == null) { 
			result = true;
		}
		
		return result;
	}
	
	
//	/*고객 전체 리스트*/
//	
//	public List<CustomerVO> selectAllCustomer() {
//		
//		
//		List<CustomerVO> customerList = customerDAO.getAllCustomer();
//		
//		
//		return customerList;
//	}
//	/* 고객 검색 */
//	
//	public List<CustomerVO> SearchCustomer(String searchOption,String keyword){ 
//		
//		Map<String, Object> searchInfo = new HashMap<>();
//		
//		searchInfo.put("searchOption", searchOption);
//		searchInfo.put("keyword", keyword);
//		
//		List<CustomerVO> Searchlist = customerDAO.getCustomerList(searchInfo);
//		
//		
//		return Searchlist;
//	}
	
	
	public Map<String,Object> getCustomerList(int selectPage, String keyword, String searchOption){ 
		
		Map<String, Object> cnt = new HashMap<String, Object>();
		cnt.put("keyword", keyword);
		cnt.put("searchOption", searchOption);
		
		int totalCnt = customerDAO.getCustomerCnt(cnt);
		
		PagingVO pagingVO = new PagingVO(selectPage, totalCnt, keyword, searchOption);
		List<CustomerVO> customerList = customerDAO.getCustomerList(pagingVO);
		
		Map<String,Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("customerList", customerList);
		pageInfo.put("pagingInfo",pagingVO);
		
		System.out.println("Service에서 확인 :" + pageInfo);
		
		return pageInfo;
	}
	
	
	
}
