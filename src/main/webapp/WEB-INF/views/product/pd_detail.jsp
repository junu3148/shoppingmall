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
<script
	type="${pageContext.request.contextPath }/assets/text/javascript"
	src="js/script3.js"></script>
<!-- js -->
</head>

<body>


	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->


	<main id="pd_detail">

		<section class="detail_wrap clear">
			<div class="img_wrap">
				<img
					src="${pageContext.request.contextPath}/upload/${product.saveName}"
					alt="${product.productName}">
			</div>
			<div class="info_wrap">
				<div class="title">
					<h4>${product.productName}</h4>
					<p>${product.price}</p>
				</div>
				<div>
					<p class="context">${product.productContent}</p>
					<ul>
						<li class="clear"><strong>배송 방법</strong> <span>택배비</span></li>
						<li class="clear"><strong>배송비</strong> <span>2,500원
								(50,000원 이상 구매 시 무료)</span></li>
						<li class="clear"><strong>배송 안내</strong> <span
							class="delivery_context"> 특수지역이나 부피가 큰 제품의 경우 배송비가 추가될 수 있습니다.(+5,000원)</span></li>
							<li>쇼핑에 참고 부탁드립니다. ^_^</li>
					</ul>

					<div class="pd_num clear">
						<p>수량</p>
						<div class="count-wrap _count">						
							<button type="button" class="minus">-</button>
							<input type="text" class="inp" value="1" />
							<button type="button" class="plus">+</button>
						</div>
						<span id="price">${product.price}</span>
					</div>

					<div class="total_price_wrap">
						<p>
							총 상품금액(<span>1</span>개)
						</p>
						<p class="total_price">${product.price}</p>
					</div>

					<div class="btn_wrap">
						<a href="#none" class="order_btn">구매하기</a> <a href="#none"
							class="shopping_btn">장바구니</a>
					</div>


				</div>
			</div>
		</section>






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
	//플러스 버튼을 클릭했을 때 수량 증가
	$(".plus").on("click", function() {
		var EA = $(".inp");
		var EAval = Number(EA.val()); // EAval을 숫자로 변환

		EA.val(EAval + 1); // 증가된 값을 input 요소에 설정

		updateTotalPrice();
	});

	// 마이너스 버튼을 클릭했을 때 수량 감소
	$(".minus").on("click", function() {
		var EA = $(".inp");
		var EAval = Number(EA.val()); // EAval을 숫자로 변환

		if (EAval > 1) {
			EA.val(EAval - 1); // 감소된 값을 input 요소에 설정
			updateTotalPrice();
		}
	});

	function updateTotalPrice() {
		var EAval = Number($(".inp").val());
		var price = Number($("#price").text());
		var total_price = EAval * price;
		$(".total_price").text(total_price);
	}
</script>

</html>










