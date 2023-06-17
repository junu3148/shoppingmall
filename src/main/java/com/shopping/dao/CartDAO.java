package com.shopping.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.CartVO;

@Repository
public class CartDAO {

	@Autowired
	SqlSession sqlSession;
	

	
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
