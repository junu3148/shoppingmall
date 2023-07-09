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
import com.shopping.dao.OrderDAO;
import com.shopping.dao.ProductDAO;
import com.shopping.dao.ReviewDAO;
import com.shopping.vo.CustomerVO;
import com.shopping.vo.PagingVO;
import com.shopping.vo.ProductVO;
import com.shopping.vo.ReviewVO;

@Service
public class MyPageService {

	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private ProductDAO productDAO;
	@Autowired
	private ReviewDAO reviewDAO;
	
	
	/* 고객넘버로 고객 정보 가져오기 */
	/* 구매 내역 페이징 위한 pageNo */
	public Map<String, Object> myPageInfoByNo(int customerNo, int pageNo) {
		System.out.println("myPageInfoByNo Service()");
		Map<String, Object> myPageInfo = new HashMap<>();

		CustomerVO returnVO = customerDAO.getCustomerByNo(customerNo); // 고객 아이디와 이름 권한 번호 가져옴
		int orderCnt = orderDAO.getOrderCnt(customerNo);
		PagingVO pagingVO = new PagingVO(pageNo, orderCnt, customerNo + "", null);

		List<ProductVO> orderList = orderDAO.getOrderList(pagingVO);
		myPageInfo.put("customerInfo", returnVO);
		myPageInfo.put("orderList", orderList);
		myPageInfo.put("paging", pagingVO);

		return myPageInfo;
	}

	/* 주문한 제품 정보 가져오기 */
	public ProductVO getProductInfo(int productNo) {
		System.out.println("getProductInfo Service()");
		ProductVO productVO = productDAO.getProductInfo(productNo);

		return productVO;
	}

	/* 리뷰 등록 */
	public void addReview(MultipartFile file, ReviewVO reviewVO) {
		System.out.println("addReview Service()");
		
		reviewDAO.insertReview(reviewVO);

		if (!file.isEmpty()) {
			String orgName = file.getOriginalFilename();
			String exName = orgName.substring(orgName.indexOf("."));
			String saveName = System.currentTimeMillis() + UUID.randomUUID().toString() + exName;
			reviewVO.setSaveName(saveName);

			String filePath = "C:/shopping/img/upload/" + saveName;

			try {
				file.transferTo(new File(filePath));
			} catch (IOException e) {
				// 파일 처리 중 예외가 발생한 경우 예외 처리 로직을 추가합니다.
				System.out.println("Error occurred while uploading file.");
				e.printStackTrace();
			}
			
			reviewDAO.insertReviewImage(reviewVO);

		}
		/* key로 review 넘버 받아와서 review 이미지 테이블에 세이브 네임 저장 */

	}

	/* 고객이 쓴 리뷰 갯수 확인하고 페이징 처리 리뷰 번호 리뷰 제목 작성일 좋아요 불러오기 */
	public Map<String, Object> getReviewList(String customerNo, int selectPage) {
		System.out.println("getReviewList Service()");

		int totalCnt = reviewDAO.getMyReviewCnt(customerNo);
		PagingVO pagingVO = new PagingVO(selectPage, totalCnt, customerNo, null);
		List<ReviewVO> reviewList = reviewDAO.getMyReviewList(pagingVO);

		Map<String, Object> reviewListPage = new HashMap<String, Object>();

		reviewListPage.put("pagingVO", pagingVO);
		reviewListPage.put("reviewList", reviewList);

		return reviewListPage;
	}

	/* 고객 번호와 패스워드 대조하여 맞으면 객체 반환함 */
	public CustomerVO checkPassword(CustomerVO customerVO) {
		System.out.println("checkPassword Service()");
		CustomerVO returnVO = customerDAO.checkPassword(customerVO);

		return returnVO;
	}

	/* 고객의 비밀번호 업데이트 */
	public int updateCustomerPassword(CustomerVO customerVO) {
		System.out.println("updateCustomerPassword Service()");
		int row = customerDAO.updateCustomerPassword(customerVO);

		return row;
	}

}
