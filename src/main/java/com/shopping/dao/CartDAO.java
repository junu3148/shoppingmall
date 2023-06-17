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
		
		System.out.println("DAO 까지 오는지 확인 할거임 고객 번호 :" + cartList);
		
		return cartList;
	}

	
	
	public CartVO checkCart(CartVO cartVO) { 
		
		
		CartVO returnVO = sqlSession.selectOne("cart.checkCart", cartVO);
		
		return returnVO;
	}

	
	/* 카트 추가 */
	public int insertCart(CartVO cartVO) { 
		
		System.out.println();
		int row = sqlSession.insert("cart.insertCart", cartVO);
		
		return row;
	}
	
	public int insertCartDetail(CartVO cartVO) { 
		
		System.out.println("insertCartDetail 넘어온 값 확인" + cartVO);
		int row = sqlSession.insert("cart.insertCartDetail", cartVO);
		
		return row;
		
	}
	
}
