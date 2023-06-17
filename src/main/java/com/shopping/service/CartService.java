package com.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.CartDAO;
import com.shopping.vo.CartVO;
import com.shopping.vo.ProductVO;

@Service
public class CartService {
	
	@Autowired	
	CartDAO cartDAO;
	
	
	public List<ProductVO> viewCart(int customerNo) { 
		
		List<ProductVO> cartList = cartDAO.getCartList(customerNo);
		
		return cartList;
	}
	
	
	public int addCart(CartVO cartVO) { 
		
		CartVO returnVO = cartDAO.checkCart(cartVO);
		System.out.println("check 해서 어떻게 오나 확인" + returnVO);
		if(returnVO == null) { 
			System.out.println("체크 아이디 : null인 거 체크");
			cartDAO.insertCart(cartVO);
			System.out.println("인서트 후 넘어온 값 : " + cartVO);
			cartDAO.insertCartDetail(cartVO);
			
			
		}else { /*아이디 체크해서 갖고 있는 카트 넘버를 매개변수로 넘어온 cartVO에 넣어서 카트 디테일에 인서트함*/
			cartVO.setCartNo(returnVO.getCartNo()); 
			System.out.println("카트가 있을 경우 넘어갈 vo" + cartVO);
			//체크해서 해당 상품 있으면 update 없으면 insert로 넘어가게 해야함
			cartDAO.insertCartDetail(cartVO);
		}
		
		return cartVO.getProductCnt();
	}
	
	
	
	
}