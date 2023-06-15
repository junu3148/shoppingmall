package com.shopping.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shopping.dao.ProductDAO;
import com.shopping.vo.ProductVO;

@Service
public class ProductService {

	String saveDir = "C:/shopping/img/upload/";
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ProductVO productVO;
	private Map<String, Object> prdouctImgMap = new HashMap<>();
	private List<ProductVO> productList = new ArrayList<>();

	// -------------- 상품 등록 & 상품이미지 등록
	public int insertProduct(ProductVO vo, MultipartFile file) {
		System.out.println("insertProduct Service()");

		int result = productDAO.insertProduct(vo);

		fileCheck(vo, file);
		if (!file.isEmpty()) {
			productDAO.insertProductImg(prdouctImgMap);
		}
		return result;
	}

	// ----------------- 상품 삭제
	public int deleteProduct(int productNo) {
		System.out.println("deleteProduct Service");

		productDAO.deleteProductImg(productNo);

		return productDAO.deleteProduct(productNo);
	}

	// ---------------- 상품 리스트 가져오기
	public List<ProductVO> getProductList(String category, String subCategory) {
		System.out.println("getProductList Service");

		if (category.equals("all") && subCategory.equals("all")) {

			productList = productDAO.getAllProductList();

		} else if (!category.equals("all") && subCategory.equals("all")) {

			productVO(category, subCategory);

		} else if (category.equals("all") && !subCategory.equals("all")) {

			productVO(category, subCategory);

		} else if (!category.equals("all") && !subCategory.equals("all")) {

			productVO(category, subCategory);

		}

		return productList;
	}
	
	// ----------------- productSearch
	public List<ProductVO> productSearch(String keyword){
		System.out.println("productSearch Service()");
					
		return productDAO.productSearch(keyword); 
	}

	
	// ----------------- productVO 
	public void productVO(String category, String subCategory) {

		productVO.setCategory(category);
		productVO.setSubCategory(subCategory);
		
		productList = productDAO.getCategoryProductList(productVO);
	}

	// ---------------- 상품 정보 가져오기
	public ProductVO getProduct(ProductVO vo) {
		System.out.println("getProduct Service");

		return productDAO.getProduct(vo);
	}

	// -------------- 상품 수정 & 상품이미지 수정
	public int modifyProduct(ProductVO vo, MultipartFile file) {
		System.out.println("insertProduct Service()");

		int result = productDAO.modifyProduct(vo);

		fileCheck(vo, file);

		if (!file.isEmpty()) {
			productDAO.modifyProductImg(prdouctImgMap);
		}

		return result;
	}

	// ------------- 파일체크 & 맵 치환
	public void fileCheck(ProductVO vo, MultipartFile file) {

		if (!file.isEmpty()) {
			// 오리지널파일
			String orgName = file.getOriginalFilename();
			System.out.println("orgName: " + orgName);

			// 확장자
			String exName = orgName.substring(orgName.indexOf("."));
			System.out.println("exName: " + exName);

			// 저장파일 이름
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			System.out.println(saveName);

			// 파일패스
			String filePath = saveDir + saveName;
			System.out.println(filePath);

			try {
				file.transferTo(new File(filePath));
				// 파일이름 상품번호 map으로 만들어 보내기

				prdouctImgMap.put("productNo", vo.getProductNo());
				prdouctImgMap.put("imageNo", vo.getImageNo());
				prdouctImgMap.put("saveName", saveName);

			} catch (IOException e) {
				// 파일 처리 중 예외가 발생한 경우 예외 처리 로직을 추가합니다.
				System.out.println("Error occurred while uploading file.");
				e.printStackTrace();
			}
		} else {
			// 업로드된 파일이 없는 경우에 대한 처리를 수행합니다.
			System.out.println("No file uploaded.");
		}
	}

}
