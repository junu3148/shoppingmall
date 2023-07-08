<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/order.css"
	type="text/css">
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
<script
	type="${pageContext.request.contextPath }/assets/text/javascript"
	src="js/script3.js"></script>
<!-- js -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- 모달용 부트 스트랩 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/pro_detail.js"></script>
<!-- js -->

<style>
#soldout {
	text-align: center;
	font-size: 20px;
	color: red;
}
</style>

</head>

<body>


	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->

	<main id="pd_detail">


		<!-- 제품 디테일 공간  -->

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
					<input type="hidden" value="${product.subCategory}"
						id="subCategory">
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
					<input type="hidden" value="${product.price}" id="price">
					<!-- 금액으로 변동되는 금액 맞추기 위해서 hidden input 처리 -->
					<form action="${pageContext.request.contextPath}/cart/addOrderOne"
						method="get" class="addOrderOne">
						<div class="pd_num clear">
							<p>수량</p>
							<div class="count-wrap _count">
								<button type="button" class="minus">-</button>
								<input type="text" class="inp" name="productEa" value="1" />
								<!-- 변경되는 숫자 -->
								<button type="button" class="plus"
									data-max="${product.productEa}">+</button>
							</div>


							<span class="total_price"></span>
						</div>

						<c:if test="${product.productEa < 10 }">
							<p class="ea_message">현재 재고가 ${product.productEa}개 남은 제품입니다.</p>
						</c:if>


						<div class="total_price_wrap">
							<p>
								총 상품금액(<span id="selectEA">1</span>개)
							</p>


							<!--  바뀔 금액 자리 -->
							<p class="total_price"></p>
							<input type="hidden" name="totalPrice" id="total_price">
							<input type="hidden" name="productNo" id="productNo"
								value="${product.productNo}"> <input type="hidden"
								name="customerNo" id="customerNo"
								value="${authCustomer.customerNo}">
						</div>
						<c:if test="${product.productEa > 0}">
							<div class="btn_wrap">
								<button type="submit" class="order_btn data-set">구매하기</button>
								<a href="#none" class="shopping_btn data-set" id="cart-btn"
									data-productno="${product.productNo}"
									data-cusno="${authCustomer.customerNo}">장바구니</a>
							</div>
						</c:if>
						<c:if test="${product.productEa <= 0}">
							<p id="soldout">
								<b>품절된 상품입니다.</b>
							</p>
						</c:if>
					</form>


				</div>
				<!-- 리뷰 -->
				<div style="height: 100px"></div>
			</div>
		</section>

		<!-- 리뷰 공간 -->
		<div class="review_box">
			<div class="black_line"></div>
			<div class="review_list">
				<br> <br>
				<p class="review_zone">
					<b>구매평</b>
				</p>
				<p>상품을 구매하신 분들만 작성하신 리뷰입니다.</p>
				<br> <br>
				<div class="black_line"></div>
			</div>

			<!-- 반복될 리뷰 창 -->

			<c:forEach items="${review}" var="review">
				<div class="review_content_box">
					<div class="content">
						<div class="left">
							<div class="review_area">
								<div>
									<c:set var="endValue" value="${review.grade-1}" />
									<c:forEach begin="0" end="${endValue}">
										<c:if test="${review.grade != 0}">
											<img
												src="${pageContext.request.contextPath}/assets/images/star.png"
												id="grade_star">
										</c:if>
									</c:forEach>
								</div>
								<h3>${review.title}</h3>
								<span class="see_more"><b>전체 보기</b></span><br>
								<hr>
								<div>
									<c:if test="${review.saveName != null}">
										<img
											src="${pageContext.request.contextPath}/upload/${review.saveName}"
											class="review_img" style="width: 100px;">
									</c:if>
								</div>
								<div>${review.content}

									<!-- 좋아요 누르기 -->

									<span class="like_cnt" data-reviewno="${review.reviewNo}">
										<img
										src="${pageContext.request.contextPath}/assets/images/heart.png"
										class="heart_icon" alt="리뷰 좋아요"> <span
										class="like_cnt_ea">${review.likeCnt}</span>
									</span>

								</div>
							</div>
							<div class="reple">
								<input type="hidden" name="review_no" value="${review.reviewNo}">
								<div class="text">
									<c:set var="commentLength" value="${fn:length(review.comment)}" />
									<p>
										댓글 <span class="comment_cnt">(${commentLength})</span>
									</p>
									<textarea class="add_comment" style="width: 70%; height: 100%"></textarea>
									<button class="add_comment_btn"
										data-authno="${authCustomer.customerNo}">등록</button>
								</div>
								<div class="reple_child">
									<c:forEach items="${review.comment}" var="comment">
										<ul id="c${comment.commentNo}">
											<li class="comment_content">${comment.customerName}:
												${comment.content} <c:if
													test="${comment.customerNo == authCustomer.customerNo}">
													<a class="comment_delete_modal_btn"
														data-commentno="${comment.commentNo}"> <img
														src="${pageContext.request.contextPath}/assets/images/delete_gray.png"
														class="delete_icon2" alt="댓글 삭제">
													</a>
												</c:if>
											</li>
										</ul>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="right">
							<p>${review.customerName}
								&nbsp; &nbsp; &nbsp;
								<c:if test="${authCustomer.customerNo == review.customerNo}">
									<!-- 리뷰 삭제하기 X 버튼  //  로그인한 유저넘버와 리뷰를 작성한 유저 넘버가 같을 때 볼 수 있다.-->
									<a class="delete_review_button"
										data-reviewno="${review.reviewNo}"
										data-productno="${review.productNo}"> <img
										src="${pageContext.request.contextPath}/assets/images/delete.png"
										class="delete_icon" alt="리뷰 삭제">
									</a>
									<!-- 리뷰 삭제하기 X 버튼 -->
								</c:if>
							</p>
							<p>${review.regDate}</p>
						</div>
					</div>
					<div class="black_line"></div>
				</div>
			</c:forEach>
			<!-- 반복될 리뷰들 end -->
			<!-- 리뷰 넣을 공간 -->

			<!-- 탑버튼 -->
			<a href="#none" class="top_btn"><img
				src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png"
				alt=""></a>
			<!-- /탑버튼 -->

			<!-- 리뷰 페이징 시작 -->
			<div class="review_paging">

				<c:if test="${paging.selectPage >10}">
					<a class="review_paging" style ="text-decoration: none"
						href="${pageContext.request.contextPath}/main/productDetal/${product.productNo}?selectReviewPage=${paging.startPageNum - 1}">
						◀ </a>
				</c:if>

				<c:forEach begin="${paging.startPageNum}" end="${paging.endPageNum}"
					var="page">
					<c:if test="${page <= paging.finalPage}">
						<a class="review_paging" style ="text-decoration: none"
							href="${pageContext.request.contextPath}/main/productDetal/${product.productNo}?selectReviewPage=${page}"
							id="P${page}">${page}</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.next == true}">
					<a class="review_paging" style ="text-decoration: none"
						href="${pageContext.request.contextPath}/main/productDetal/${product.productNo}?selectReviewPage=${paging.endPageNum + 1}">
						▶ </a>
				</c:if>
				<input type="hidden" value="${paging.selectPage}" id="select_Page">
			</div>
			<!-- 리뷰 페이징 끝 -->



		</div>
		<!-- review_box end -->








	</main>

	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->


	<!-- 장바구니 추가 모달 -->
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
						<input type="hidden" value="${authCustomer.customerNo}"
							name="customerNo">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" id="more_see">좀 더 둘러보기</button>
						<button type="submit" class="btn btn-primary">장바구니 이동하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 장바구니 추가 모달 -->

	<!-- 리뷰 삭제 확인 모달 -->
	<div class="modal" tabindex="-1" id="review_modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">알림</h5>
				</div>
				<div class="modal-body">
					<span id="howAdd">정말 삭제하시겠습니까? <br> 삭제한 리뷰는 다시 복구할 수
						없습니다.
					</span>
				</div>
				<form
					action="${pageContext.request.contextPath}/review/deleteReview">
					<div class="modal-footer">
						<input type="text" value="" name="reviewNo" id="delete_No">
						<input type="text" value="" name="productNo" id="product_No">
						<button type="submit" class="btn btn-primary">글 삭제하기</button>
						<button type="button" class="btn btn-secondary close_modal"
							data-bs-dismiss="modal">닫기</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- 리뷰 삭제 확인 모달 -->

	<!-- 리뷰 코멘트 삭제 모달 -->
	<div class="modal" tabindex="-1" id="comment_modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">알림</h5>
				</div>
				<div class="modal-body">
					<span id="howAdd">정말 삭제하시겠습니까? <br> 삭제한 댓글은 다시 복구할 수
						없습니다.
					</span>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-primary comment_delete_btn">댓글
						삭제하기</button>
					<button type="button" class="btn btn-secondary close_modal"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 리뷰 코멘트 삭제 모달 -->


</body>

<script>



/* 리뷰 좋아요 버튼 클릭 이벤트 처리*/
$('.like_cnt').on("click", function(){
	
	var reviewNo = $(this).data('reviewno');
	var updateCnt = parseInt($(this).find('.like_cnt_ea').text()) + 1;
	var likeCnt = $(this).find('.like_cnt_ea')
	
	console.log(reviewNo);
	console.log(updateCnt);
	
	ReviewVO = {
			
			reviewNo : reviewNo
	}
	
	$.ajax({
		//요청 세팅(보낼 때--!)
		url : "${pageContext.request.contextPath}/review/addLikeCount",
		type : "post", 
		data : ReviewVO,
		dataType : "json",
		success : function(jsonResult) {
		
			if(jsonResult.data == true){
				likeCnt.text(updateCnt);
			}

		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	}); //ajax end	
	
	
});

/* ---------------------------------------코멘트 삭제 이벤트-------------------------------*/

$('.comment_delete_btn').off('click').on("click", function(){
	
	var commentNo =	$(this).data('commentno');
	
	console.log('삭제하려고 넘어온 번호 : ' + commentNo);
	
	CommentVO = {
			commentNo : commentNo
				}

	$.ajax({
		//요청 세팅(보낼 때--!)
		url : "${pageContext.request.contextPath}/review/deleteComment",
		type : "post", 
		data : CommentVO,
		dataType : "json",
		success : function(jsonResult) {
			
			if(jsonResult.data == true){
				$('#comment_modal').modal('hide');
				$('#c'+ commentNo).remove();
				alert('삭제되었습니다.');
				$('.comment_delete_btn').removeAttr("data-commentno");
			}

		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	}); //ajax end	
	
});//코멘트 삭제 이벤트



/*댓글 등록 기능*/
$('.add_comment_btn').on("click", function(){
	
	var content = $(this).siblings('.add_comment').val();
	var resetText = $(this).siblings('.add_comment');
	var  customerNo = $(this).data('authno');
	var reviewNo = $(this).closest('.reple').find('input[name="review_no"]').val();
	var reple_render = 	$(this).closest(".reple").find(".reple_child");
	var commentInput = $(this).find('.add_comment');
	
	
	resetText.val("");
	
	if(content.length < 3){
		alert('댓글은 네 글자 이상 입력해주세요.');
	}else{
		
		CommentVO = {
			content : content,
			customerNo : customerNo,
			reviewNo : reviewNo
		}
		console.log(CommentVO)
	
		$.ajax({
			//요청 세팅(보낼 때--!)
			url : "${pageContext.request.contextPath}/review/addComment",
			type : "post", 
			data : CommentVO,
			dataType : "json",
			success : function(jsonResult) {
				
				var comment = jsonResult.data;
					
				var str = "";
				str += "<ul id='c" + comment.commentNo + "' class= 'comment__list'>";		
				str += "<li>";		
				str += comment.customerName + " : " + comment.content;
				str += "<a class='comment_delete_modal_btn' data-commentno='" + comment.commentNo + "'>"; 
				str += "<img src='${pageContext.request.contextPath}/assets/images/delete_gray.png' class='delete_icon2'>";
				str += "</a>";		
				str += "</li>";		
				str += "</ul>";		
				
				reple_render.prepend(str);
				commentInput.val("");

			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		}); //ajax end	
	
	}//댓글 글자수 검증 end
}); //리플 추가 에이잭스
	

/*댓글 펼치는 기능*/
$('.see_more').on("click", function(){
		
		console.log('test');
		var img	=	$(this).parent().find('.review_img');
		var reple = $(this).parent().next('.reple');
		
		if(reple.css('display')== "none"){
			reple.css('display', 'block');
			img.css("width", '100%');
		}else{
			reple.css('display', 'none');
			img.css("width", '100px');
		}
	}); //content 클래스 클릭 이벤트 발생

	


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

		  
		 
		$('.addOrderOne').on("submit", function(){
				
			if(${authCustomer ==null}){
				alert('로그인 후 구매 가능합니다.');
				return false;
			}
		});//주문하기 버튼 누르면 일어나는 이벤트
		
		
		/* 코멘트 삭제 모달 나오게 만드는 이벤트*/
		$('.reple_child').on("click",".comment_delete_modal_btn", function(){

				$('#comment_modal').modal('show');
			    var commentNo =	$(this).data('commentno');
			    console.log('모달로 넘어가는 번호' + commentNo)
			    $('.comment_delete_btn').data("commentno",commentNo);
			    
		});
	
		
		/* 좀 더 둘러보기 클릭 시 modal 닫힘 */
		$('#more_see').on("click", function(){
			
			$('#Cart-modal').modal('hide');	
			
		});
		
		/*모달 닫는 버튼*/
		$('.close_modal').on("click", function(){
			$('#review_modal').modal('hide');
			$('#comment_modal').modal('hide');
			$('#Cart-modal').modal('hide');	
		});

</script>

</html>
