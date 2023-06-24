package com.shopping.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.CartDAO;
import com.shopping.vo.CartVO;
import com.shopping.vo.OrderVO;
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
	
	/* 주문상태 완료(2)인 주문 테이블만 있으면 주문하나 만듬.*/
	/* 주문상태인(1) 주문 테이블 있으면 해당 테이블에 추가 */
	public boolean addOrder(OrderVO orderVO) {
		
		boolean result = false;
		
		System.out.println("Service까지 오나요?" + orderVO);
		OrderVO ordersCheck = cartDAO.checkOrder(orderVO.getCustomerNo());
		
		/*결제 진행 중 상태인 주문건(상태 1)이 있으면~해당 주문 삭제함*/
		if(ordersCheck != null) {
			int orderNo = ordersCheck.getOrderNo();
			cartDAO.deleteOrderDetail(orderNo);
			cartDAO.deleteOrder(orderNo);
		}
			int row = cartDAO.insertOrder(orderVO); //order 만들기 + orderNo 값 받아오기
			
			List<ProductVO> productList = orderVO.getProductList();
			Map<String, Object> map = new HashMap<>();
			map.put("orderNo", orderVO.getOrderNo());
			
			for(int i =0; i<productList.size(); i ++) {
				map.put("orderProduct", productList.get(i));
				
				cartDAO.insertOrderDetail(map);	//디테일 테이블에도 물건 추가함			
			}
			if(row>0) {result = true;} //order 추가 성공하면 true 리턴함
			
			return result;
			
	}//addOrder end
	
	/*고객의 주문 페이지 정보를 불러옴*/
	/*주문 디테일 제품 리스트와 주문 정보가 들어가 있는 orderVO + 고객의 주소 정보*/
	public Map<String, Object> getOrderInfo(String customerNo){
		
		Map<String,Object> orderInfo = new HashMap<>();
		
		OrderVO orderVO = cartDAO.checkOrder(customerNo);
		List<ProductVO> orderList =  cartDAO.getOrderList(orderVO);
		orderVO.setProductList(orderList);
		
		
		
		orderInfo.put("orderInfo", orderVO);
		
		
		System.out.println("완성된 orderVO 확인 :"  +  orderVO);
		
		return orderInfo;
	}
	
}