package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.CartDAO;
import com.shopping.vo.CartVO;

@Service
public class CartService {
	
	@Autowired	
	CartDAO cartDAO;
	
	public boolean addCart(CartVO cartVO) { 

		boolean result = false;
		CartVO returnVO = cartDAO.checkCart(cartVO);
		System.out.println("check 해서 어떻게 오나 확인" + returnVO);
		if(returnVO == null) { 
			System.out.println("체크 아이디 : null인 거 체크");
			cartDAO.insertCart(cartVO);
			System.out.println("인서트 후 넘어온 값 : " + cartVO);
			cartDAO.insertCartDetail(cartVO);
		}else { /*아이디 체크해서 갖고 있는 카트 넘버 가져오고 해당 카트에 인서트함*/
			
		}
		
		return result;
	}
	
	
	
	
}