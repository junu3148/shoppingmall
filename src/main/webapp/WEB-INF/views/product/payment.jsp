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

table td {
	padding: 10px;
	text-align: center;
}
blockquote {
    margin: 0px 0px 1.75em 0px;
    position: relative;
    padding: 20px 55px;
  background: #f9f9f9;
}

blockquote:after {
    content: "\201C";
    font-size: 76px;
    position: absolute;
    top: -15px;
  left: 10px;
    color: #0d689c;
}

.entry-content blockquote p {
    max-width: 100%;
  padding: 0;
  margin: 0 0 15px;
  font-size: 20px;
}


</style>
</head>
<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->

	<section class="pc">
		<br> <br>
		<blockquote>
		<h3>문의</h3>
			<p>It is a long road ahead and it’s not something that is gonna
				be able to take place in one election cycle. I am hoping that we
				will be able to build a more broader consensus on such issues, there
				is not that space at the moment</p>
			<cite>&mdash; Someone, Somwhere</cite>
		</blockquote>


	</section>

	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->


</body>
</html>