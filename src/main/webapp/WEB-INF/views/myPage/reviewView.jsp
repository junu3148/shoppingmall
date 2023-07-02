<!-- 카트 jsp -->

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
<link rel="preconnect" href="https://fonts.gstatic.com">
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
<!-- 부트스트랩 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>
<!-- js -->
</head>
<style>
#wrap {
	float: left;
	width: 80%;
	background-color: #FFFFFF;
	margin-top: 200px;
	justify-content: center;
	margin-left: 10%;
	margin-right: 10%;
}

#aside {
	text-align: center;
	float: left;
	width: 180px;
	height: 300px;
	background-color: #FFFFFF;
}

.customer_profile {
	text-align: center;
	text-align: center;
	padding: 30px;
	background-color: aliceblue;
}

#customer_img {
	width: 70px;
}

#board {
	height: 2000px;
	margin: 0 auto;
}

.review_product {
	text-align: center;
	width: 1100px;
	margin-left: 5px;
	margin: 0 auto;
	margin-top: 10px;
	border-collapse: separate;
	border: 1px solid #eee;
}


table td {
	vertical-align: middle;
}
review_table{ height:70px;}
.category {
	background-color: #eee;
}


#aside ul {
	list-style: none;
	padding: 10px;
}

#aside ul li a {
	text-decoration: none;
}

#aside ul li {
	margin-bottom: 10px;
}

.product-img {
	width: 80px;
}

.review_btn {
	background: #4982cf;
	border: 1px solid #4982cf;
	color: #fff;
	width:140px;
	height: 60px;
	font-size :20px;
}
.review_content{
	height : 50px;
	display:none;
	text-align: center;
}
.review_content td{
height:100%;
}
.review_img{
height : 15px;
}
.review_list td {
	height:50px;
}
.content_img {
	width:200px;
}
</style>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->



	<div id="wrap">



		<!-- aside-bar -->
		<c:import url="/WEB-INF/views/includes/myPage-aside.jsp"></c:import>

		<div class=customer_info>
			<div class="customer_profile">
				<h3>내가 쓴 리뷰 확인하기</h3>
			</div>
		</div>
		<div id="board">
			<div id="list">


				<table class="review_product table">
					<thead>
						<tr class="category">
							<th>리뷰 번호</th>
							<th>리뷰 제목</th>
							<th>작성일</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<c:forEach items = "${reviewList}" var = "review">
					<tbody>
						<tr class="review_list">
							<td>${review.reviewNo}</td>
							<td>
							<c:if test ="${review.saveName != null}">
							<img src ="${pageContext.request.contextPath }/assets/images/photo.png" class = "review_img">
							</c:if>${review.title}
							</td>
							<td>${review.regDate}</td>
							<td>${review.likeCnt}</td>
						</tr>
						<tr class= "review_content">
							<td  colspan="4">${review.content}</td>
						</tr>
					</tbody>
						</c:forEach>
				</table>
												<!-- 페이징 -->
										<c:if test = "${paging.selectPage >10}">
										<a class = "paging" href = "${pageContext.request.contextPath}/myPage/myReview/${authCustomer.customerNo}?selectPage=${paging.startPageNum - 1}"> ◀ </a>
										</c:if>
										
										<c:forEach begin = "${paging.startPageNum}" end = "${paging.endPageNum}"  var = "page">
											<c:if test = "${page <= paging.finalPage}">
											<a class = "paging" href ="${pageContext.request.contextPath}/myPage/myReview/${authCustomer.customerNo}?selectPage=${page}">${page}</a>
											</c:if>
										</c:forEach>
										<c:if test = "${paging.next == true}">
										<a class = "paging" href ="${pageContext.request.contextPath}/myPage/myReview/${authCustomer.customerNo}?selectPage=${paging.endPageNum + 1}"> ▶ </a>
										</c:if>
			
			
			</div>
		</div>
	</div>


	<!-- 탑버튼 -->
	<a href="#none" class="top_btn"><img
		src="${pageContext.request.contextPath}/assets/images/ver02/top_btn.png"
		alt=""></a>
	<!-- /탑버튼 -->


</body>
<script>
$('.review_list').on("click", function(){
 
	var content	=	$(this).parent().find('.review_content');
	
	if(content.css('display')== "none"){
		content.css('display', 'block');

	}else{
		content.css('display', 'none');

	}
}); //content 클래스 클릭 이벤트 발생



</script>


</html>