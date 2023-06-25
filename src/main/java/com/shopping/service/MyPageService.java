package com.shopping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.MyPageDAO;
import com.shopping.vo.CustomerVO;
import com.shopping.vo.PagingVO;
import com.shopping.vo.ProductVO;

@Service
public class MyPageService {

	@Autowired
	MyPageDAO myPageDAO;
	
	
	/* 고객넘버로 고객 정보 가져오기*/
	/*구매 내역 페이징 위한 pageNo*/
	public Map<String, Object> myPageInfoByNo(int customerNo, int pageNo) { 
		Map<String, Object> myPageInfo = new HashMap<>();
		CustomerVO returnVO = myPageDAO.getCustomerByNo(customerNo); //고객 아이디와 이름 권한 번호 가져옴
		int orderCnt = myPageDAO.getOrderCnt(customerNo);
		System.out.println("오더 갯수 확인 : " + orderCnt);
		PagingVO pagingVO = new PagingVO(pageNo, orderCnt, customerNo+"", null);
		List<ProductVO> orderList = myPageDAO.getOrderList(pagingVO);
		/*페이징 해야함*/
		myPageInfo.put("customerInfo", returnVO);
		myPageInfo.put("orderList", orderList);
		myPageInfo.put("paging", pagingVO);
		
		return myPageInfo;
	}
}
