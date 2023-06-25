package com.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.OrderVO;
import com.shopping.vo.ProductVO;

@Repository
public class PaymentDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public void getOrderList(OrderVO orderVO){
		
		List<ProductVO> orderList = sqlSession.selectList("payment.getOrderList", orderVO);
		orderVO.setProductList(orderList);
	}
	
	public int deleteCartDetail(Map<String, Object> list) {
		
		System.out.println("넘어온 map의 정보 : " + list);
		int row = sqlSession.delete("payment.deleteCartDetail", list);
		System.out.println("카트 디테일 삭제 성공 여부 확인 " + row);
		
		return row;
	}
	
	public int updateProductEa(Map<String, Object> list) {
		
		
		int row = sqlSession.update("payment.updateProductEa", list);
		System.out.println("업데이트될 제품 정보" + list.get("Product"));
		System.out.println("업데이트된 제품 갯수 " + row);
		return row;
	}
	
	public int updateOrderStat(OrderVO orderVO) {
		
		sqlSession.update("payment.updateOrderStat", orderVO);
		
		return 0;
	}
}
