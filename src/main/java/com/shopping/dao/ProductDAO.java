package com.shopping.dao;

import java.util.List;
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

	// --------------- 상품 이미지 등록
	public int insertProductImg(Map<String, Object> prdouctImgMap) {
		System.out.println("insertProduct DAO()");

		return sqlSession.insert("image.insertProductImage", prdouctImgMap);
	}

	// --------------- 상품 삭제
	public int deleteProduct(int productNo) {
		System.out.println("deleteProduct DAO");

		return sqlSession.delete("product.deleteProduct", productNo);
	}

	// --------------- 상품 이미지 삭제
	public int deleteProductImg(int productNo) {
		System.out.println("deleteProductImg DAO");

		return sqlSession.delete("image.deleteProductImg", productNo);
	}
	
	// ---------------- 상품 리스트 가지고오기
	public List<ProductVO> getProductList(){
		System.out.println("getProductList DAO");
		
		return sqlSession.selectList("product.getProductList");
	}

}












