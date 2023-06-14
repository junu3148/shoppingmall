package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shopping.dao.ProductDAO;
import com.shopping.vo.ProductVO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;

	// -------------- 상품 등록
	public int insertProduct(ProductVO vo, MultipartFile file) {
		System.out.println("insertProduct Service()");

		return productDAO.insertProduct(vo);
	}

}
