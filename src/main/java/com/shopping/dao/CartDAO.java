package com.shopping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.CartVO;
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
	
	
}
