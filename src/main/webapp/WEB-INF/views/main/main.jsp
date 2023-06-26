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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/reset.css"
	type="text/css">
<!-- 초기화 css -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" type="text/css">
<!-- 스와이퍼 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<!-- 슬릭슬라이더 css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<!-- 슬릭슬라이더 css -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- 구글폰트 -->
<link
	href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style3.css"
	type="text/css">
<!-- 메인 css -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 제이쿼리 최신버전 js -->
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 스와이퍼 js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<!-- 슬릭슬라이더 js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/script3.js"></script>
<!-- js -->

<style>
.i img{
	width: 100%;
    height: 100%;
    object-fit: cover;
    }
</style>
</head>

<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->




	<main>
		<!-- 메인 롤링배너 (KV) -->
		<div class="swiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide banner01">
					<a href="#none"></a>
				</div>
				<div class="swiper-slide banner02">
					<a href="#none"></a>
				</div>
				<div class="swiper-slide banner03">
					<a href="#none"></a>
				</div>
				<div class="swiper-slide banner04">
					<a href="#none"></a>
				</div>
			</div>

			<div class="swiper-pagination"></div>

			<!--<div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>-->
		</div>
		<!-- /메인 롤링배너 (KV) -->

		<!-- 베스트셀러 -->
		<section id="best_seller">
			<h2 class="en">best seller</h2>
			<div class="best_kv" style="background-image: url(${pageContext.request.contextPath}/assets/images/ver02/a.jpg); background-size: 100%;">
				<h3>
					 <span>CATDOG</span>
				</h3>
				<p>
				반려 동물을 위한 프리미엄 쇼핑<br>
				</p>
			</div>
			<div id="best_seller_div">
				<c:forEach items="${productList}" var="product">
				<div class="cont">
					<a href="${pageContext.request.contextPath}/main/productDetal/${product.productNo}"> <img
						src="${pageContext.request.contextPath}/upload/${product.saveName}" alt=""> <span class="tit">${product.productName}</span> <span
						class="price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${product.price}" />원</span>
					</a>
				</div>
				</c:forEach>
			</div>
		</section>
		<!-- /베스트셀러 -->

		<!-- 메뉴 버튼 -->
		<section id="menu_link">
			<ul class="i">
				<li><a href="${pageContext.request.contextPath}/main/category/간식" ><span style="background-image: url(${pageContext.request.contextPath}/assets/images/ver02/category간식.png); background-size: cover; background-position: right;">사료/간식</span></a></li>
				<li><a href="${pageContext.request.contextPath}/main/category/배변용품"><span style="background-image: url(${pageContext.request.contextPath}/assets/images/ver02/category배변용품.png); background-size: cover; background-position: right;">배변용품</span></a></li>
				<li><a href="${pageContext.request.contextPath}/main/category/미용"><span style="background-image: url(${pageContext.request.contextPath}/assets/images/ver02/category미용.png); background-size: cover; background-position: right;">미용</span></a></li>
				<li><a href="${pageContext.request.contextPath}/main/category/장난감"><span style="background-image: url(${pageContext.request.contextPath}/assets/images/ver02/category장난감.png); background-size: cover; background-position: right;">장난감</span></a></li>
				<li><a href="${pageContext.request.contextPath}/main/category/가구"><span style="background-image: url(${pageContext.request.contextPath}/assets/images/ver02/category가구.png); background-size: cover; background-position: right;">가구</span></a></li>
			</ul>
		</section>
		<!-- /메뉴 버튼 -->

		<!-- SNS -->
		<section id="sns">
			<h2 class="en">sns</h2>
			<ul class="clear">
				<li><a href="https://www.instagram.com/p/Ct6vJ5CPalQ/?igshid=YzcxN2Q2NzY0OA=="><img
						src="${pageContext.request.contextPath }/assets/images/sns1.png"
						alt=""></a></li>
				<li><a href="https://www.instagram.com/p/Ct6vJluv3AM/?igshid=YzcxN2Q2NzY0OA=="><img
						src="${pageContext.request.contextPath }/assets/images/sns2.png"
						alt=""></a></li>
				<li><a href="https://www.instagram.com/p/Ct6vLeYvc2v/?igshid=YzcxN2Q2NzY0OA=="><img
						src="${pageContext.request.contextPath }/assets/images/sns3.png"
						alt=""></a></li>
				<li><a href="https://www.instagram.com/p/Ct6vK37vZ3k/?igshid=YzcxN2Q2NzY0OA=="><img
						src="${pageContext.request.contextPath }/assets/images/sns4.png"
						alt=""></a></li>
				<li><a href="https://www.instagram.com/p/Ct6vKbnPOWW/?igshid=YzcxN2Q2NzY0OA=="><img
						src="${pageContext.request.contextPath }/assets/images/sns5.png"
						alt=""></a></li>
			</ul>
		</section>
		<!-- /SNS -->

		<!-- 탑버튼 -->
		<a href="#none" class="top_btn"><img
			src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png"
			alt=""></a>
		<!-- /탑버튼 -->

	</main>




	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->




</body>


</html>