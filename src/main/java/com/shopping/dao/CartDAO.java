package com.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.AddressVO;
import com.shopping.vo.CartVO;
import com.shopping.vo.OrderVO;
import com.shopping.vo.ProductVO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	/*장바구니 리스트*/
	public List<ProductVO> getCartList(int customerNo){ 
		System.out.println("getCartList DAO()");			
		List<ProductVO> cartList = sqlSession.selectList("cart.getCartList", customerNo);
		
		return cartList;
	}

	
	/*장바구니 체크*/
	public CartVO checkCart(CartVO cartVO) { 
		System.out.println("checkCart DAO()");	
		CartVO returnVO = sqlSession.selectOne("cart.checkCart", cartVO);
		
		return returnVO;
	}

	
	/* 장바구니 추가 */
	public int insertCart(CartVO cartVO) { 
		System.out.println("insertCart DAO()");	
		int row = sqlSession.insert("cart.insertCart", cartVO);
		
		return row;
	}
	
	/*장바구니 상세내역 추가*/
	public int insertCartDetail(CartVO cartVO) { 
		System.out.println("insertCartDetail DAO()");	
		int row = sqlSession.insert("cart.insertCartDetail", cartVO);
		
		return row;
		
	}
	/*장바구니 내역 삭제*/
	public int deleteList(CartVO cartVO) {
		System.out.println("deleteList DAO()");	
		int row = sqlSession.delete("cart.deleteList", cartVO);

		return row;
	}
	
	/*주문 중 상태인 주문건 있는지 체크*/
	/*주문 중 상태인 주문건 없음 == true 리턴(주문 테이블 추가 가능한 상태)*/
	public OrderVO checkOrder(String customerNo) {
		System.out.println("checkOrder DAO()");	
		OrderVO orderVO = sqlSession.selectOne("cart.checkOrder", customerNo);

		
		return orderVO;
	}
	
	
	/*새로운 주문 생성 selectKey로 주문번호 받아올 거임*/
	public int insertOrder(OrderVO orderVO) {
		System.out.println("insertOrder DAO()");	
		int row = sqlSession.insert("cart.insertOrder",orderVO);
		
		return row;
	}
	
	/*주문 상세내역 추가*/
	public int insertOrderDetail(Map<String, Object>map) {
		System.out.println("insertOrderDetail DAO()");	
		int row = sqlSession.insert("cart.insertOrderDetail", map);
		
		return row;
	}

	
	/*주문 삭제*/
	public int deleteOrder(int orderNo) {
		System.out.println("deleteOrder DAO()");	
		int row = sqlSession.delete("cart.deleteOrder", orderNo);
		
		return row;
	}
	
	/*주문 상세내역 삭제*/
	public int deleteOrderDetail(int orderNo) {
		System.out.println("deleteOrderDetail DAO()");	
		int row = sqlSession.delete("cart.deleteOrderDetail", orderNo);
		
		return row;
	}
	
	
	/*주문 상태 1인 오더 디테일 정보를 가져옴*/
	public List<ProductVO> getOrderList(OrderVO orderVO){
		System.out.println("getOrderList DAO()");	
		List<ProductVO> productList = sqlSession.selectList("cart.getOrderDetail", orderVO);
		
		return productList;
	}
	
	/*저장된 고객 주소 가져오기*/
	public List<AddressVO> getCustomerAddress(String customerNo){
		System.out.println("getCustomerAddress DAO()");	
		List<AddressVO> addressList = sqlSession.selectList("cart.getAddressList", customerNo);
		
		return addressList; 
	}
	/*저장된 고객의 주소 수량 세기(최대 3개 저장 가능)*/
	public int addressCount(AddressVO addressVO) {
		System.out.println("addressCount DAO()");	
		int cnt = sqlSession.selectOne("cart.AddressCnt", addressVO);

		return cnt;
	}
	
	/*오래된 주소 삭제*/
	public int deleteOldAddress(AddressVO addressVO) {		      
		System.out.println("deleteOldAddress DAO()");
	    int rows = sqlSession.delete("cart.deleteAddress",addressVO);
	    
		return rows;
	}
	   
	/*주소 추가*/
	public int insertAddress(AddressVO addressVO) {
		System.out.println("insertAddress DAO()");
		int row = sqlSession.insert("cart.insertAddress", addressVO);

		return row;
	}
	
	
}
