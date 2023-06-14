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
				<img src="https://cdn.imweb.me/thumbnail/20210402/deeb895a674e3.jpg"
					alt="">
			</div>
			<div class="info_wrap">
				<div class="title">
					<h4>선문밥그릇</h4>
					<p>42,000원</p>
				</div>
				<div>
					<p class="context">선문라인의 선문밥그릇은 뚜껑을 포함한 제품입니다. 뚜껑상단의 원형홈과 청화의
						간결한 한줄 선이 잘어우러 지는 밥그릇으로 아래부분의 바닥이 넓어 안정적이고 풍성한 형태미를 갖추고 있습니다.</p>
					<ul>
						<li class="clear"><strong>사이즈</strong> <span>선문밥그릇
								105x75mm / 300cc</span></li>
						<li class="clear"><strong>배송 방법</strong> <span>택배비</span></li>
						<li class="clear"><strong>배송비</strong> <span>2,500원
								(50,000원 이상 구매 시 무료)</span></li>
						<li class="clear"><strong>배송 안내</strong> <span
							class="delivery_context"> 청송백자는 경북 청송의 한적한 산골에서 제작하고 있는
								지리적 특성으로 일반택배와 달리 조금 느리게 보내드릴 수 밖에 없습니다. 청송백자만의 느린 배송을 여유로운 마음으로
								이해해 주시면 감사하겠습니다. </span></li>
					</ul>

					<div class="pd_num clear">
						<p>수량</p>
						<div class="count-wrap _count">
							<button type="button" class="minus">-</button>
							<input type="text" class="inp" value="1" />
							<button type="button" class="plus">+</button>
						</div>
						<span>42,000원</span>
					</div>

					<div class="total_price_wrap">
						<p>
							총 상품금액(<span>1</span>개)
						</p>
						<p class="total_price">42,000원</p>
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

</html>