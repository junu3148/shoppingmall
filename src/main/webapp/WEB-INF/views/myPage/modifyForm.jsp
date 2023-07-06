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
    <link href="${pageContext.request.contextPath}/assets/css/myPage.css" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/myPage.js"></script>
            <link href="${pageContext.request.contextPath}/assets/css/customer.css" rel="stylesheet">
</head>
<style>
.modify_Form_table{width: 60%;height:100%;margin: auto;margin-top : 5%;font-size: 20px;border: 1px solid black;}
.modify_Form_table td {height:40px;padding: 2%;}
.modify_btn{ bottom: 3px;background: #4982cf;border: 1px solid #4982cf;color: #fff;width: 80px; font-size: 16px; }
.user_img{width: 150px;}
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
				<h3>개인정보 수정</h3>
			</div>
		</div>
		<div id="board">
			<div id="list">

			<form action ="${pageContext.request.contextPath}/myPage/modifyCustomerInfo" method ="POST" class="modify_form">
				<table class="modify_Form_table">
						<tr>
							<td><input type = "hidden" value ="${authCustomer.customerNo}"  name = "customerNo"></td>
						</tr>
						<tr>
							<td colspan ="2"><img src ="${pageContext.request.contextPath}/assets/images/user.png" class="user_img"></td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<td>이름 : </td>
							<td>${customer.customerName}</td>
						</tr>
						<tr>
							<td>아이디 : </td>
							<td>${customer.customerId}</td>
						</tr>
						<tr>
							<td>고객 등급 : </td>
							<td>${customer.customerRole}</td>
						</tr>
						<tr>
							<td>비밀번호 : </td>
							<td><input type ="password" value = "${customer.customerPassword}" name = "customerPassword"/>
							<button type="submit" class= "modify_btn">바꾸기</button></td>
						</tr>
						<tr>
							<td>총 구매액 :</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${customer.totalPayment}" />원</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
						</tr>
				</table>
			</form>
				


			</div>
		</div>
	</div>


	<!-- 탑버튼 -->
	<a href="#none" class="top_btn"><img src="${pageContext.request.contextPath}/assets/images/ver02/top_btn.png"
			alt=""></a>
	<!-- /탑버튼 -->


</body>
<script>
$('.modify_form').on("submit", function(){
	var result = confirm('정말 변경하시겠습니까?');
	if(result){
		return true;
	}else{
		return false;
	}
});
</script>


</html>