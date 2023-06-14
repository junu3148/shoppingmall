package com.shopping.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.ProductVO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	// -------------- 상품 등록
	public int insertProduct(ProductVO vo) {
		System.out.println("insertProduct DAO()");
		
		return sqlSession.insert("product.insertProduct", vo);
	}
	
	public int insertProductImg(Map<String, Object> prdouctImgMap) {
		System.out.println("insertProduct DAO()");
				
		return sqlSession.insert("image.insertProductImage",prdouctImgMap);
	}
	

}






