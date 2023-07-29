<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
 
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>portfolio</title>
<!-- 초기화 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<!-- 스와이퍼 css -->
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" type="text/css">
<!-- 슬릭슬라이더 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<!-- 슬릭슬라이더 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/sub.css" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/customer.css" rel="stylesheet">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">


<!-- 제이쿼리 최신버전 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 스와이퍼 js -->
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 슬릭슬라이더 js -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<!-- js -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/script3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/customer.js"></script>
</head>

<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->

	<div id="wrap">

		<!-- aside-bar -->
		<c:import url="/WEB-INF/views/includes/myPage-aside.jsp"></c:import>

		<div class=customer_info>
			<div class="customer_profile">
				<h3>리뷰 쓰기</h3>
			</div>
		</div>
		<div id="board">
			<div id="list">


				<table class="review_product table">
					<thead>
						<tr class="category">
							<th colspan="2">리뷰 제품</th>
						</tr>
					</thead>
					<tbody>

						<tr class="product_list">
							<td><a href="${pageContext.request.contextPath}/main/productDetal/"><img
										src="${pageContext.request.contextPath}/upload/${reviewProduct.saveName}" class="product-img"></a>
							</td>
							<td>${reviewProduct.productName}</td>
						</tr>

					</tbody>
				</table>
				<form action="${pageContext.request.contextPath}/myPage/writeReview" method="POST"
					enctype="multipart/form-data">
					<div id="review_form">
						<table id="review_table">
							<tr>
								<td><img src="" class="product-img"></td>
								<td><input type="file" class="review_Form" name="file"></td>
							</tr>
							<tr>
								<td colspan="2"><br><input type="text" name="title" class="review_Form" required></td>
							</tr>
							<tr>
								<td><select name="grade" class="grade">
										<option value="1">★☆☆☆☆</option>
										<option value="2">★★☆☆☆</option>
										<option value="3">★★★☆☆</option>
										<option value="4">★★★★☆</option>
										<option value="5">★★★★★</option>
									</select></td>
							</tr>
							<tr>
								<td colspan="2"><br><textarea name="content" id="content" class="review_Form"
										placeholder="20자 이상 200자 미만으로 입력하세요." required></textarea>
									<input type="hidden" name="customerNo" value="${authCustomer.customerNo}">
									<input type="hidden" name=productNo value="${reviewProduct.productNo}">
								</td>
							</tr>
							<tr id="btn_area">

								<td colspan="2"><br><button type="submit" class="review_btn"> 리뷰 등록</button></td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 탑버튼 -->
	<a href="#none" class="top_btn"><img src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png"
			alt=""></a>
	<!-- /탑버튼 -->

</body>
</html>