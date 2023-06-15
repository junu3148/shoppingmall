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
	href="${pageContext.request.contextPath }/assets/css/reset.css"
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
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">
<!-- 서브 css -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 제이쿼리 최신버전 js -->
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<!-- 스와이퍼 js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<!-- 슬릭슬라이더 js -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/script3.js"></script>
<!-- js -->
</head>

<body>


	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->


	<main id="product">
		<section id="kv"></section>

		<ul class="category">
			<li class="on"><a
				href="${pageContext.request.contextPath}/main/${view}">전체</a></li>
			<li><a
				href="${pageContext.request.contextPath}/main/${view}/${subCategory}?category=강아지&subCategory=${subCategory}">강아지</a></li>
			<li><a
				href="${pageContext.request.contextPath}/main/${view}/${subCategory}?category=고양이&subCategory=${subCategory}">고양이</a></li>
		</ul>

		<section>
			<ul>
				<c:forEach items="${productList}" var="product">
					<li><a href="#none"> <img
							src="${pageContext.request.contextPath}/upload/${product.saveName}">
							<span class="tit">${product.productName}</span> 
							<span class="price jb">${product.price}원</span>
					</a></li>
				</c:forEach>
			</ul>
		</section>

		<ul class="paging">
			<li class="first"><a href="#none"></a></li>
			<li class="pre"><a href="#none"></a></li>
			<li class="on"><a href="#none">1</a></li>
			<li><a href="#none">2</a></li>
			<li><a href="#none">3</a></li>
			<li><a href="#none">4</a></li>
			<li><a href="#none">5</a></li>
			<li><a href="#none">6</a></li>
			<li><a href="#none">7</a></li>
			<li><a href="#none">8</a></li>
			<li><a href="#none">9</a></li>
			<li><a href="#none">10</a></li>
			<li class="next"><a href="#none"></a></li>
			<li class="last"><a href="#none"></a></li>
		</ul>



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

<script>

	/* $(document).ready(function() {
		
	      $( document ).ready( function() {
	          $( '.jb' ).text( $( '.jb' ).text().replace( /\,/g, '' ).replace( /(\d)(?=(?:\d{3})+(?!\d))/g, '$1,' ) );
	        } );
	});  */
	
</script>

</html>


















