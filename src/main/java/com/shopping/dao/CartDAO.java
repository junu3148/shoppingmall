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
	SqlSession sqlSession;
	
	
	/*카트 리스트*/
	public List<ProductVO> getCartList(int customerNo){ 
			
		List<ProductVO> cartList = sqlSession.selectList("cart.getCartList", customerNo);
		
		return cartList;
	}

	
	
	public CartVO checkCart(CartVO cartVO) { 
		
		CartVO returnVO = sqlSession.selectOne("cart.checkCart", cartVO);
		
		return returnVO;
	}

	
	/* 카트 추가 */
	public int insertCart(CartVO cartVO) { 
		
		int row = sqlSession.insert("cart.insertCart", cartVO);
		
		return row;
	}
	
	public int insertCartDetail(CartVO cartVO) { 
		
		int row = sqlSession.insert("cart.insertCartDetail", cartVO);
		
		return row;
		
	}
	
	public int deleteList(CartVO cartVO) {
		
		int row = sqlSession.delete("cart.deleteList", cartVO);

		return row;
	}
	
	/*주문 중 상태인 주문건 있는지 체크*/
	/*주문 중 상태인 주문건 없음 == true 리턴(주문 테이블 추가 가능한 상태)*/
	public OrderVO checkOrder(String customerNo) {
		

		OrderVO orderVO = sqlSession.selectOne("cart.checkOrder", customerNo);

		
		return orderVO;
	}

	/////////////////////////////////////////////////////////////////////////
	
	
	/*새로운 주문 생성 selectKey로 주문번호 받아올 거임*/
	public int insertOrder(OrderVO orderVO) {
		
		System.out.println("새로운 order 생성 DAO 확인");
		int row = sqlSession.insert("cart.insertOrder",orderVO);
		
		System.out.println("들어간 row");
		
		return row;
	}
	
	public int insertOrderDetail(Map<String, Object>map) {
		
		int row = sqlSession.insert("cart.insertOrderDetail", map);
		
		return row;
	}

	
	///////////////////////////////////////////////////////////
	public int deleteOrder(int orderNo) {
		int row =0;
			
		row = sqlSession.delete("cart.deleteOrder", orderNo);
		
		return row;
	}
	
	////////////////////////////////////////////////////////////
	
	public int deleteOrderDetail(int orderNo) {
		int row = 0;
		
		row = sqlSession.delete("cart.deleteOrderDetail", orderNo);
		
		return row;
	}
	
	/////////////////////////////////////////////////////
	
	
	
	/*오더 디테일 정보를 가져옴 단, 주문상태 1이여야 함*/
	public List<ProductVO> getOrderList(OrderVO orderVO){
		
		List<ProductVO> productList = sqlSession.selectList("cart.getOrderDetail", orderVO);
		
		
		System.out.println(productList + "디테일에서 넘어오는 정보 확인");
		
		return productList;
	}
	
	public List<AddressVO> getCustomerAddress(String customerNo){
		
		System.out.println("DAO까지 오는지 확인");
		List<AddressVO> addressList = sqlSession.selectList("cart.getAddressList", customerNo);
		System.out.println("넘어온 주소 리스트 확인" + addressList);
		
		return addressList; 
	}
	
	public int addressCount(AddressVO addressVO) {
		
		int cnt = sqlSession.selectOne("cart.AddressCnt", addressVO);
		System.out.println("넘어온 cnt 확인" + cnt +"개");

		return cnt;
	}
	
	   public int deleteOldAddress(AddressVO addressVO) {
		      
		      int rows = sqlSession.delete("cart.deleteAddress",addressVO);
		      System.out.println("delete를 위해 DAO에 넘어온 객체 정보" + addressVO);
		      System.out.println("성공여부 확인 " + rows);
		      return rows;
		   }
	   
	   
	   public int insertAddress(AddressVO addressVO) {

		      int row = sqlSession.insert("cart.insertAddress", addressVO);
		      System.out.println("insert를 위해 넘어온 객체정보" + addressVO);
		      return row;
		   }
}
