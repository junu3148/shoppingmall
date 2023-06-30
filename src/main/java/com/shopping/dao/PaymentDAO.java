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
	
	/*주문한 */
	public void getOrderList(OrderVO orderVO){
		System.out.println("getOrderList DAO()");
		List<ProductVO> orderList = sqlSession.selectList("payment.getOrderList", orderVO);
		orderVO.setProductList(orderList);
	}
	
	public int deleteCartDetail(Map<String, Object> list) {
		System.out.println("deleteCartDetail DAO()");
		int row = sqlSession.delete("payment.deleteCartDetail", list);
		
		return row;
	}
	
	public int updateProductEa(Map<String, Object> list) {
		System.out.println("updateProductEa DAO()");
		int row = sqlSession.update("payment.updateProductEa", list);
		
		return row;
	}
	
	public int updateOrderStat(OrderVO orderVO) {
		System.out.println("updateOrderStat DAO()");
		sqlSession.update("payment.updateOrderStat", orderVO);
		
		return 0;
	}
}
