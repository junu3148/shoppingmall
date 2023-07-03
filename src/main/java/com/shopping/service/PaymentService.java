package com.shopping.service;



import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shopping.dao.PaymentDAO;
import com.shopping.vo.OrderVO;


@Service
public class PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;
	@Autowired
	Map<String, Object> list = new HashMap<>();
	/*결제 성공시 진행될 비즈니스 로직 --넘어온 정보는 고객 넘버와 오더 넘버임*/
	//1. order_detail 테이블에서 결제한 제품 정보 알아오기-- product배열로 받는다.
	//2. 카트 디테일에 있는 제품 삭제
	//3. 제품 재고에서도 차감
	//4. 오더 테이블의 stat를 2로 변경함
	public boolean paymentSuccess(OrderVO orderVO) {
		System.out.println("paymentSuccess Service()");
		boolean result = false;
		
		paymentDAO.getOrderList(orderVO);
		
		int result1 =0;
		int result2 =0;
		for(int i = 0; i<orderVO.getProductList().size(); i++) {
			list.put("customerNo", orderVO.getCustomerNo());
			list.put("Product",orderVO.getProductList().get(i)); 
			
			result1 += paymentDAO.deleteCartDetail(list);
			result2 += paymentDAO.updateProductEa(list);
			
		}
		
		int result3 = paymentDAO.updateOrderStat(orderVO);
		
		if(result1 > 0 && result2 >0 && result3 >0) {
			result = true;
		}
		
		return result;
	}
	
	
	
}
