package com.shopping.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.shopping.dao.CustomerDAO;
import com.shopping.dao.MyPageDAO;
import com.shopping.vo.CustomerVO;
import com.shopping.vo.PagingVO;
import com.shopping.vo.ProductVO;
import com.shopping.vo.ReviewVO;

@Service
public class MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;
	@Autowired
	private CustomerDAO customerDAO;
	
	/* 고객넘버로 고객 정보 가져오기*/
	/*구매 내역 페이징 위한 pageNo*/
	public Map<String, Object> myPageInfoByNo(int customerNo, int pageNo) { 
		System.out.println("myPageInfoByNo Service()");
		Map<String, Object> myPageInfo = new HashMap<>();
		
		CustomerVO returnVO = myPageDAO.getCustomerByNo(customerNo); //고객 아이디와 이름 권한 번호 가져옴
		int orderCnt = myPageDAO.getOrderCnt(customerNo);
		PagingVO pagingVO = new PagingVO(pageNo, orderCnt, customerNo+"", null);
		
		List<ProductVO> orderList = myPageDAO.getOrderList(pagingVO);
		myPageInfo.put("customerInfo", returnVO);
		myPageInfo.put("orderList", orderList);
		myPageInfo.put("paging", pagingVO);
		
		return myPageInfo;
	}
	
	/*주문한 제품 정보 가져오기*/
	public ProductVO getProductInfo(int productNo) {
		System.out.println("getProductInfo Service()");
		ProductVO productVO = myPageDAO.getProductInfo(productNo);
		
		return productVO;
	}
	
	/*리뷰 등록*/
	public void addReview(MultipartFile file, ReviewVO reviewVO) {
		System.out.println("addReview Service()");
		String saveName = "";	
		String orgName = file.getOriginalFilename();
		
		if(!file.isEmpty()) {
			String exName = orgName.substring(orgName.indexOf("."));
			saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			reviewVO.setSaveName(saveName);
		}
		
		String filePath = "C:/shopping/img/upload/" +  saveName;
		
		try {
			file.transferTo(new File(filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		/*key로 review 넘버 받아와서 review 이미지 테이블에 세이브 네임 저장*/
		myPageDAO.insertReview(reviewVO);

		if(!file.isEmpty()) {
			myPageDAO.insertReviewImage(reviewVO);
		}
		
	}
		
	/*고객이 쓴 리뷰 갯수 확인하고 페이징 처리 리뷰 번호 리뷰 제목 작성일 좋아요 불러오기*/
		public Map<String, Object> getReviewList(String customerNo, int selectPage){
			System.out.println("getReviewList Service()");
			
			int totalCnt = myPageDAO.getMyReviewCnt(customerNo);
			PagingVO pagingVO = new PagingVO(selectPage, totalCnt, customerNo , null);
			List<ReviewVO> reviewList = myPageDAO.getMyReviewList(pagingVO);
			
			Map<String, Object> reviewListPage = new HashMap<String, Object>();
			
			reviewListPage.put("pagingVO", pagingVO);
			reviewListPage.put("reviewList", reviewList);
			
			return reviewListPage;
		}
		
	/*고객 번호와 패스워드 대조하여 맞으면 객체 반환함*/
		public CustomerVO checkPassword(CustomerVO customerVO) {
			
			CustomerVO returnVO = customerDAO.checkPassword(customerVO);
			
			return returnVO;
		}
		
		/*고객의 비밀번호 업데이트*/
		public int updateCustomerPassword(CustomerVO customerVO) {
			
			int row = customerDAO.updateCustomerPassword(customerVO);
			
			return row;
		}
	
}
