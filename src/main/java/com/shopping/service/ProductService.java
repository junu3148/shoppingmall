package com.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shopping.dao.ProductDAO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;

}
