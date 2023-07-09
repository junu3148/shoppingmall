package com.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.OrderVO;
import com.shopping.vo.PagingVO;
import com.shopping.vo.ProductVO;

@Repository
public class OrderDAO {

	@Autowired
	SqlSession session;
	
	/*주문 중 상태인 주문건 있는지 체크*/
	/*주문 중 상태인 주문건 없음 == true 리턴(주문 테이블 추가 가능한 상태)*/
	public OrderVO checkOrder(String customerNo) {
		System.out.println("checkOrder DAO()");	
		OrderVO orderVO = session.selectOne("order.checkOrder", customerNo);

		
		return orderVO;
	}
	
	
	/*새로운 주문 생성 selectKey로 주문번호 받아올 거임*/
	public int insertOrder(OrderVO orderVO) {
		System.out.println("insertOrder DAO()");	
		int row = session.insert("order.insertOrder",orderVO);
		
		return row;
	}
	
	/*주문 상세내역 추가*/
	public int insertOrderDetail(Map<String, Object>map) {
		System.out.println("insertOrderDetail DAO()");	
		int row = session.insert("order.insertOrderDetail", map);
		
		return row;
	}

	
	/*주문 삭제*/
	public int deleteOrder(int orderNo) {
		System.out.println("deleteOrder DAO()");	
		int row = session.delete("order.deleteOrder", orderNo);
		
		return row;
	}
	
	/*주문 상세내역 삭제*/
	public int deleteOrderDetail(int orderNo) {
		System.out.println("deleteOrderDetail DAO()");	
		int row = session.delete("order.deleteOrderDetail", orderNo);
		
		return row;
	}
	
	/*오더 디테일 리스트 확인 후 재고보다 많이 선택하면 재고에 맞춰서 수량 조절함*/
	public int checkOrderDetailList(OrderVO orderVO) {
		System.out.println("오더 리스트 확인할 때 넘어올 값 : " + orderVO);
		session.update("order.checkOrderDetailList", orderVO);
		
		return 0;
	}
	
	/*주문 상태 1인 오더 디테일 정보를 가져옴*/
	public List<ProductVO> getOrderList(OrderVO orderVO){
		System.out.println("getOrderList DAO()");	
		List<ProductVO> productList = session.selectList("order.getOrderDetail", orderVO);
		
		return productList;
	}
	
	
	/*총 구매수량 확인*/
	public int getOrderCnt(int customerNo) {
		System.out.println("getOrderCnt DAO()");
		int totalCnt = session.selectOne("order.getOrderCnt", customerNo);
		
		return totalCnt;
	}
	
	/*결제한 주문내역 확인*/
	public List<ProductVO> getOrderList(PagingVO pagingVO){
		System.out.println("getOrderList DAO()");
		List<ProductVO> orderList = session.selectList("order.getOrderList", pagingVO);
		
		return orderList;
	}
	
	
}
