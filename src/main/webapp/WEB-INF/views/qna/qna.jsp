<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<!-- 초기화 css -->
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

<style>
form {
	margin-left: auto;
	margin-right: auto;
	width: 600px;
}
</style>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->

	<section class="pc">
		<br> <br>
		<h3>문의</h3>
		<form action="${pageContext.request.contextPath}/QnA/insertQnA"
			method="GET">
			<input type="text" name="customerNo" value="${authCustomer.customerNo}"><br> 
			<label name="boardType">비밀글</label><input type="checkbox" name="boardType" value="1"> 
			<br> 제목: <input type="text" name="title"><br>
			내용: 
			<br> 
			<textarea name="content" style="width: 580px; height: 100px;"></textarea>

			<div class="btn_wrap">
				<!-- 제출을 위해 <a> 태그 대신 <button>으로 변경했습니다 -->
				<button type="submit" class="order_btn">문의하기</button>
				<a href="#none" class="shopping_btn">취소</a>
			</div>
		</form>
	</section>

	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->


</body>
</html>