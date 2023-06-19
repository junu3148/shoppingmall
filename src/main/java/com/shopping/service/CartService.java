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

		if(returnVO == null) { 
			cartDAO.insertCart(cartVO);
			cartDAO.insertCartDetail(cartVO);
			
		}else { /*아이디 체크해서 갖고 있는 카트 넘버를 매개변수로 넘어온 cartVO에 넣어서 카트 디테일에 인서트함*/
			cartVO.setCartNo(returnVO.getCartNo()); 
			//체크해서 해당 상품 있으면 update 없으면 insert로 넘어가게 해야함
			cartDAO.insertCartDetail(cartVO);
		}
		
		return cartVO.getProductCnt();
	}
	
	/* 카트 리스트 삭제. 고객의 카트 넘버 찾아서 삭제함*/
	public boolean deleteList(CartVO cartVO) { 
		boolean result = false;
		
		CartVO checkCartNo = cartDAO.checkCart(cartVO);
		cartVO.setCartNo(checkCartNo.getCartNo());
		
		int row = cartDAO.deleteList(cartVO);
		
		if(row>0) {
			result = true;
		}
		
		return result;
	}
	
	
}