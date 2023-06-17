package com.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shopping.vo.Criteria;
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
		System.out.println("insertProductImg DAO()");

		return sqlSession.insert("image.insertProductImage", prdouctImgMap);
	}

	// -------------- 상품 수정
	public int modifyProduct(ProductVO vo) {
		System.out.println("modifyProduct DAO()");

		return sqlSession.update("product.modifyProduct", vo);
	}

	// --------------- 상품 이미지 수정
	public int modifyProductImg(Map<String, Object> prdouctImgMap) {
		System.out.println("modifyProductImg DAO()");

		return sqlSession.update("image.modifyProductImg", prdouctImgMap);
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

	// ---------------- 상품 전체리스트 가져오기
	public List<ProductVO> getAllProductList() {
		System.out.println("getAllProductList DAO");

		return sqlSession.selectList("product.getAllProductList");
	}

	// ---------------- 상품 전체리스트 가져오기 테스트----------------------------
	public List<ProductVO> getAllProductList(Criteria cri) {
		System.out.println("Test DAO()");

		return sqlSession.selectList("product.getAllProductListTest", cri);
	}

	// ---------------- 카테고리 상품 리스트 가져오기
	public List<ProductVO> getCategoryProductList(ProductVO productVO) {
		System.out.println("getCategoryProductList DAO");

		return sqlSession.selectList("product.getCategoryProductList", productVO);
	}
	// ---------------- 카테고리 상품 리스트 가져오기
	public List<ProductVO> getCategoryProductListTest(Criteria cri) {
		System.out.println("getCategoryProductListTest DAO");

		return sqlSession.selectList("product.getCategoryProductListTest", cri);
	}

	// ----------------- productSearch
	public List<ProductVO> productSearch(String keyword) {
		System.out.println("productSearch DAO()");

		return sqlSession.selectList("product.productSearch", keyword);
	}

	// ---------------- 상품 정보 가져오기
	public ProductVO getProduct(ProductVO vo) {
		System.out.println("getProduct DAO");

		return sqlSession.selectOne("product.getProduct", vo);
	}

	// ----------------- getTotal
	public int getTotal(Criteria cri) {
		System.out.println("getTotal DAO()");

		return sqlSession.selectOne("product.getTotal", cri);

	}

	// ----------------- getTotalSubCategory
	public int getTotalSubCategory(Criteria cri) {
		System.out.println("getTotalSubCategory DAO()");

		return sqlSession.selectOne("product.getTotalSubCategory", cri);

	}

}
