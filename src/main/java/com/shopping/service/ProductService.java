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
import com.shopping.vo.Criteria;
import com.shopping.vo.PageMakerDTO;
import com.shopping.vo.ProductVO;

@Service
public class ProductService {
	//String saveDir = "Users/yangjun-u/upload/";
	String saveDir = "C:/shopping/img/upload/"; 
	@Autowired
	private ProductDAO productDAO;
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
		System.out.println("deleteProduct Service()");

		productDAO.deleteProductImg(productNo);

		return productDAO.deleteProduct(productNo);
	}

	// ---------------- 메인 롤링 리스트 가져오기
	public List<ProductVO> mainProductList() {
		System.out.println("mainProductList Service()");

		return productDAO.mainProductList();
	}

	// ---------------- 관리자 페이지 상품 리스트 가져오기
	public Map<String, Object> getProductList(Criteria cri) {
		System.out.println("getProductList Service()");
		
		Map<String, Object> map = new HashMap<>();
		
		int total = productDAO.getTotal(cri);
	
		productList = productDAO.getAllProductList2(cri);
		
		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		map.put("pageMaker", pageMaker);
		map.put("productList", productList);

		return map;
	}

	// ---------------- 상품 리스트 가져오기
	public Map<String, Object> getProductList(String category, String subCategory, Criteria cri) {
		System.out.println("Test Service()");

		int total = 0;
		List<ProductVO> productList = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();

		// --------------- 상품 전체 리스트
		if (category.equals("all") && subCategory.equals("all")) {
			System.out.println("1.상품 전체 리스트");

			total = productDAO.getTotal(cri);

			productList = productDAO.getAllProductList(cri);

			// --------------- 카테고리 상품 전체 리스트
		} else if (!category.equals("all") && subCategory.equals("all")) {
			System.out.println("2.카테고리 상품 전체 리스트");

			total = productDAO.getTotal(cri);

			productList = productDAO.getAllProductList(cri);

			// ---------------- 서브 카테고리 전체 리스트
		} else if (category.equals("all") && !subCategory.equals("all")) {
			System.out.println("3.서브 카테고리 전체 리스트");

			total = productDAO.getTotalSubCategory(cri);

			productList = productDAO.getCategoryProductList(cri);

			// ---------------- 서브카테고리별 카테고리 상품 리스트
		} else if (!category.equals("all") && !subCategory.equals("all")) {
			System.out.println("4.서브카테고리별 카테고리 상품 리스트");

			total = productDAO.getTotalSubCategory(cri);

			productList = productDAO.getCategoryProductList(cri);

		}

		PageMakerDTO pageMaker = new PageMakerDTO(cri, total);
		map.put("pageMaker", pageMaker);
		map.put("productList", productList);

		return map;
	}

	// ----------------- 상품 검색
	public List<ProductVO> productSearch(String keyword) {
		System.out.println("productSearch Service()");

		return productDAO.productSearch(keyword);
	}

	// ---------------- 상품 정보 가져오기
	public ProductVO getProduct(ProductVO vo) {
		System.out.println("getProduct Service()");

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
