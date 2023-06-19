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
	
}
