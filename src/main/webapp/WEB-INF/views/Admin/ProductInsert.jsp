
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>제품 수정 페이지?</title>
<!--부트 스트랩 코드-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/reset.css"
	type="text/css">
<!-- 초기화 css -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" type="text/css">
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
<!-- 서브 css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">

<!--부트 스트랩 코드-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<!--js 코드-->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<!--css 등록해야함-->
<link href="${pageContext.request.contextPath}/assets/css/app.css"
	rel="stylesheet">
<!--css 등록해야함-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 제이쿼리 최신버전 js -->

<!--컨텐츠 상단 폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">

<style>
input {
	width: 400px;
}

.content {
	margin-top: auto;
}

.footer {
	text-align: center;
}

.footer .container-fluid {
	height: 30px;
}


</style>
</head>
<body>
	<div class="wrapper">
		<!-- Top Nav Bar  include로 뺄 예정임-->
		<c:import url="/WEB-INF/views/includes/admin-header.jsp"></c:import>

		<!---------------------------------top nav----------------------------------------->
		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">
						<c:if test="${authCustomer != null}">
							<c:if test="${authCustomer.customerRole != 1}">
             		 안녕하세요! ${authCustomer.customerName}님&nbsp;&nbsp;
              		 <a class="btn btn-secondary disabled" role="button"
									aria-disabled="true"
									href="${pageContext.request.contextPath}/customer/logout">Logout</a>
							</c:if>
						</c:if>
						<c:if test="${authCustomer == null}">
            			로그인이 필요합니다.&nbsp;&nbsp;
            				<a
								href="${pageContext.request.contextPath}/customer/loginPage">Login</a>
						</c:if>
					</ul>
				</div>
			</nav>

			<!---------------------------------//top nav//----------------------------------------->


			<div class="p-3 mb-2 bg-body text-body">
				<!--배경색 start-->
				<br>
				<main id="inquiry"class="content">
					<div align="center" style="margin: 5%;">
						<h1 class="display-6">
							<b>Product Insert Page</b>
						</h1>
						<br>
						<hr>
						<br>

						<form
							action="${pageContext.request.contextPath}/product/insertProduct"
							method="POST" enctype="multipart/form-data">
							<table >
								<tr>
									<td colspan="4" bgcolor="lightgray"><b>제품등록창</b></td>
								</tr>
								<tr>
									<td colspan="2" rowspan="8" width=25%><img id="preview"
										src="https://mblogthumb-phinf.pstatic.net/MjAyMTA0MTVfMTE2/MDAxNjE4NDU0MTU0Nzc5.pHUtY9vre2Blb2nNcKSdHTdcDyOITCuiGBJg8DQYzEIg.CZS_8DFgrsm1gZFFkZpZ9zYwd-lXLfy-urxhoxwwbRYg.JPEG.jj_ssong/1216_%EC%86%8C%EB%A6%AC_%EC%A6%9D%EB%AA%85.jpg?type=w800"
										width="100%"> 사진 영역(미리보기)</td>
								</tr>

								<tr>
									<td style="text-align: center;">제품명</td>
									<td><input type="text" name="productName" required></td>
								</tr>
								<tr>
									<td style="text-align: center;">수량</td>
									<td><input type="number" name="productEa" required></td>
								</tr>
								<tr>
									<td style="text-align: center;">가격</td>
									<td><input type="number" name="price" min="3000" step="100" required></td>
								</tr>
								<tr>
									<td style="text-align: center;">상품 정보</td>
									<td><input type="text" name="productContent" required></td>
								</tr>
								<tr>
									<td style="text-align: center;">카테고리</td>
									<td><input type="text" name="category" required></td>
								</tr>
								<tr>
									<td style="text-align: center;">서브 카테고리</td>
									<td><input type="text" name="subCategory" required></td>
								</tr>
								<tr>
									<td style="text-align: center;">제품사진</td>
									<td><input id="file" type="file" name="file" required></td>
								</tr>

								<tr>
									<td colspan="4" rowspan="2" style="text-align: right;">
										<button type="submit">등록</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</main>
			</div>
			<c:import url="/WEB-INF/views/includes/admin-footer.jsp"></c:import>
		</div>
	</div>

	<!--배경색 end-->

</body>




<script>
	function updateMinRange(value) {
		document.getElementById("minRangeInput").value = value;
	}
	function updateMaxRange(value) {
		document.getElementById("maxRangeInput").value = value;
	}

	$(document).ready(function() {

		//페이징 이벤트처리 submit
		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			var pageNum = $(this).attr("href");
			$("#moveForm input[name='pageNum']").val(pageNum);
			$("#moveForm").submit();
		});
		//옵션 변경시 검색어 비우기
		$(".form-select").on('click', function() {

			$("#searchKeyword").val("");
		});

		//금액별 상품 검색일때 옵션정리
		$("#searchPrice").on("click", function() {

			$(".form-select option").first().prop("selected", true);
			$("#searchKeyword").val("");

		});

	});
</script>

</html>