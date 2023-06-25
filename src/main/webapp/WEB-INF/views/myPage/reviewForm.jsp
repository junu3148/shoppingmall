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

.category {
	background-color: #eee;
}

.product_list {
	height: 100px;
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

#review_table {
	margin: 1%;
	border: 1px solid #eee;
	width: 1100px;
	margin-left: 5px;
	margin: 0 auto;
	border-collapse: separate;
	height: 700px;
	padding: 1%;
}
#btn_area{text-align : center;}
[name="content"] {width: 100%; height:550px;}
[name="title"] { width:100%;  height:30px;}
input.reviewForm {
  border-color: #eee; /* 원하는 테두리 색상으로 변경 */
}
</style>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->



	<div id="wrap">




		<!-- //content-head -->
		<div id="aside">
			<ul>
				<li><a href=""></a></li>
				<li><a href="">My리뷰</a></li>
				<li><a href="">정보 수정</a></li>
			</ul>
		</div>

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
							<td><a
								href="${pageContext.request.contextPath}/main/productDetal/"><img
									src="${pageContext.request.contextPath}/upload/${product.saveName}"
									class="product-img"></a></td>
							<td>${product.productName}리뷰 제품명</td>
						</tr>

					</tbody>
				</table>

				<div id="review_form">
					<table id="review_table">
						<tr>
							<td><img src="" class="product-img"></td>
							<td><input type="file" class ="review_Form"></td>
						</tr>
						<tr>
							<td colspan ="2"><br><input type ="text" name ="title"class ="review_Form"></td>
						</tr>
						<tr>
							<td colspan ="2"><br><textarea name ="content" id ="content" class ="review_Form" placeholder ="20자 이상 200자 미만으로 입력하세요."></textarea></td>
						</tr>
						<tr id ="btn_area">
							<td colspan ="2"><br><button type ="submit" class="review_btn"> 리뷰 등록</button></td>
						</tr>
					</table>
				</div>

			</div>
		</div>
	</div>


	<!-- 탑버튼 -->
	<a href="#none" class="top_btn"><img
		src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png"
		alt=""></a>
	<!-- /탑버튼 -->




</body>



</html>