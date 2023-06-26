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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 모달용 부트 스트랩 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
	.review_box{
  margin : 13%;
  
	}
.review_table{
	margin-top : 100px;
}
</style>

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
					<p>
						<fmt:formatNumber type="number" maxFractionDigits="3"
							value="${product.price}" />
						원
					</p>
				</div>
				<div>
					<p class="context">${product.productContent}</p>
					<ul>
						<li class="clear"><strong>배송 방법</strong> <span>택배비</span></li>
						<li class="clear"><strong>배송비</strong> <span>2,500원
								(50,000원 이상 구매 시 무료)</span></li>
						<li class="clear"><strong>배송 안내</strong> <span
							class="delivery_context"> 특수지역이나 부피가 큰 제품의 경우 배송비가 추가될 수
								있습니다.(+5,000원)</span></li>
						<li>쇼핑에 참고 부탁드립니다. ^_^</li>
					</ul>
					<input type="text" value="${product.price}" id="price">
					<!-- 금액으로 변동되는 금액 맞추기 위해서 hidden input 처리 -->

					<div class="pd_num clear">
						<p>수량</p>
						<div class="count-wrap _count">
							<button type="button" class="minus">-</button>
							<input type="text" class="inp" value="1" />
							<!-- 변경되는 숫자 -->
							<button type="button" class="plus">+</button>
						</div>


						<!--  바뀔 금액 자리 -->
						<span class="total_price"></span>
					</div>

					<div class="total_price_wrap">
						<p>
							총 상품금액(<span id="selectEA">1</span>개)
						</p>


						<!--  바뀔 금액 자리 -->
						<p class="total_price"></p>
					</div>

					<div class="btn_wrap">
						<a href="#none" class="order_btn data-set">구매하기</a> <a
							href="#none" class="shopping_btn data-set" id="cart-btn"
							data-productno="${product.productNo}"
							data-cusno="${authCustomer.customerNo}">장바구니</a>
					</div>


				</div>
				<!-- 리뷰 -->
				<div style="height: 100px"></div>
			</div>
		</section>
			<div class="review_box">
				<div class="review_list"  style = "margin : auto">
					<hr><br><h3><b>구매평</b></h3><p>상품을 구매하신 분들만 작성하신 리뷰입니다.</p><br><hr>
					<table class ="review_table">
						<tr>
							<td>아미아미아미아미암</td>
							<td>아아아아아아ㅏㅇ</td>
						</tr>
					</table>
				</div><!-- review end -->
			</div>



		<!-- 탑버튼 -->
		<a href="#none" class="top_btn"><img
			src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png"
			alt=""></a>
		<!-- /탑버튼 -->

	</main>

	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->

	<div class="modal" tabindex="-1" id="Cart-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">알림</h5>
				</div>
				<div class="modal-body">
					<span id="howAdd"></span>
				</div>
				<form action="${pageContext.request.contextPath}/cart/viewCart">
					<div class="modal-footer">
						<input type="text" value="${authCustomer.customerNo}"
							name="customerNo">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" id="more_see">좀 더 둘러보기</button>
						<button type="submit" class="btn btn-primary">장바구니 이동하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>






</body>

<script>
	$(window).on("load", function() {

		updateTotalPrice();

		//플러스 버튼을 클릭했을 때 수량 증가
		$(".plus").on("click", function() {
			var EA = $(".inp");
			var EAval = Number(EA.val()); // EAval을 숫자로 변환

			EA.val(EAval + 1); // 증가된 값을 input 요소에 설정

			updateTotalPrice();
		}); //plus btn event end

		// 마이너스 버튼을 클릭했을 때 수량 감소
		$(".minus").on("click", function() {
			var EA = $(".inp");
			var EAval = Number(EA.val()); // EAval을 숫자로 변환

			if (EAval > 1) {
				EA.val(EAval - 1); // 감소된 값을 input 요소에 설정
				updateTotalPrice();
			}
		}); //minus btn event end

		/*장바구니 모달 만들거임*/

		$('#cart-btn').on("click", function() {
			//장바구니 버튼이 눌리면 고객 no, productNo, productCnt 들어가야함
			var cnt = Number($(".inp").val()); //제품 수량 가져오기
			var proNo2 = $(this).data('productno')//제품 번호 가져오기
			var cusNo = $(this).data('cusno');//로그인 중인고객 넘버

			if (cusNo == '') {
				alert('로그인 후 구매 가능합니다.')
			} /*모달창으로 변경 예정*/
			if (cusNo != '') {

				CartVO = {
					customerNo : cusNo,
					productNo : proNo2,
					productCnt : cnt
				};

				console.log(CartVO)

				$.ajax({
					//요청 세팅(보낼 때--!)
					url : "${pageContext.request.contextPath}/cart/addCart",
					type : "post", //어차피 내부 요청이라 주소창에 안 나온다.
					//  ㄴ---> 전송하는 데이터타입 지정 지금은 파라미터로 보내는 거라 사용 X
					data : CartVO, //json형식으로 변환해서 보냄

					dataType : "json",
					success : function(jasonResult) {

						var howAdd = jasonResult.data
						$('#howAdd').text(howAdd + '개의 제품을 성공적으로 카트에 추가했습니다.');
						$('#Cart-modal').modal('show');
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				}); //ajax end	
			}
			;//if~login user addcart end
		}); //addcart btn click event end

		/* 좀 더 둘러보기 클릭 시 modal 닫힘 */
		$('#more_see').on("click", function() {

			$('#Cart-modal').modal('hide');

		});

	}); //window load event end

	//변동되는 숫자에 따라 금액을 조정하고, 조정된 금액에 ','와 '원'을 더해주는 function 
	function updateTotalPrice() {
		var EAval = Number($(".inp").val());
		var price = $("#price").val()

		var total_price = EAval * price;
		var set_price = total_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g,
				',')
				+ '원';

		$(".total_price").text(set_price);
	}
</script>

</html>










