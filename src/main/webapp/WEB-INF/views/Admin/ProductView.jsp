
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
.pageInfo_btn a {
	color: black;
}
.active .anum {
	color: #4982cf;
	font-weight: bold;
	font-size: 15px;
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
				<main class="content">
					<div align="center" style="margin: 5%;">
						<h1 class="display-6">
							<b>Product Management Page</b>
						</h1>
						<br>
						<hr>
						<br>

						<!--키워드 검색 폼-->
						<form
							action="${pageContext.request.contextPath}/product/searchProduct"
							method="get">
							<table>
								<tr>
									<td><select name="type" class="form-select">
											<option
												<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>선택</option>
											<option value="name"
												<c:out value="${pageMaker.cri.type eq 'name'?'selected':'' }"/>>제품명</option>
											<option value="code"
												<c:out value="${pageMaker.cri.type eq 'code'?'selected':'' }"/>>제품코드</option>
									</select></td>
									<td>: <input type="text" id="searchKeyword" name="keyword"
										value="${pageMaker.cri.keyword}" />
										<button type="submit" class="btn btn-secondary">Search</button>
									</td>
									<td><a class="btn btn-primary"
										href="${pageContext.request.contextPath}/product/insertProductForm"
										role="button">Insert</a></td>
								</tr>

							</table>
						</form>
						<!-- 검색어 마지막-->
						<br>
						<!--금액대별 검색폼-->
						<div id="searchPrice">
							<form
								action="${pageContext.request.contextPath}/product/searchProduct"
								method="GET">
								<table style="margin: 0 auto; width: 90%;">
									<tr align="center">
										<!--
                        <td>가격대 검색 : <input type ="number">원 ~ <input type="number">원</td>
                        <td><button type = "submit">조회</button></td>
                        -->
										<td><input type="range" min="1000" max="50000" value="0"
											step="1000" onchange="updateMinRange(this.value)"
											style="width: 20%"> <input type="number" min="1000"
											max="50000" step="1000" id="minRangeInput" step="1000"
											name="minPrice" value="${pageMaker.cri.minPrice}"
											onchange="updateMinRange(this.value)">원 ~ <input
											type="range" min="10000" max="500000" step="1000" value="0"
											onchange="updateMaxRange(this.value)" style="width: 20%">
											<input type="number" min="10000" max="500000" step="1000"
											id="maxRangeInput" name="maxPrice" style="width: 12.5%"
											value="${pageMaker.cri.maxPrice}"
											onchange="updateMaxRange(this.value)">원
											<button type="submit" class="btn btn-secondary">Search</button></td>
									</tr>
								</table>
							</form>
						</div>
						<!--금액대별 검색 end-->


						<bR>
						<div>
							<table class="table table-striped">
								<tr>
									<td style="width: 20%; text-align: center;">제품코드</td>
									<td style="width: 30%; text-align: center;">제품명</td>
									<td style="width: 10%; text-align: center;">개수</td>
									<td style="width: 30%; text-align: center;">가격</td>
									<td style="width: 10%; text-align: center;"></td>
								</tr>
								<c:forEach items="${productList}" var="product">
									<tr>
										<td style="width: 20%; text-align: center;">${product.productNo}</td>
										<td style="width: 30%; text-align: center;">${product.productName}</td>
										<td style="width: 10%; text-align: center;">${product.productEa}</td>
										<td style="width: 30%; text-align: center;"><fmt:formatNumber
												value="${product.price}" pattern="#,##0원" /></td>
										<td style="width: 10%; text-align: center;"><a
											href="${pageContext.request.contextPath}/product/modifyProductForm?productNo=${product.productNo}"
											class="btn btn-primary">수정</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>


						<ul class="paging pageInfo">
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous"><a
									href="${pageMaker.startPage - 1}">◀</a></li>
							</c:if>

							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }">
									<a class="anum" href="${num}">${num}</a>
								</li>
							</c:forEach>

							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next"><a
									href="${pageMaker.endPage + 1}">▶</a></li>
							</c:if>
						</ul>

						<form id="moveForm"
							action="${pageContext.request.contextPath}/product/productListForm"
							method="get">
							<input type="hidden" name="pageNum"
								value="${pageMaker.cri.pageNum}"> <input type="hidden"
								name="amount" value="${pageMaker.cri.amount}"> <input
								type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
							<input type="hidden" name="type" value="${pageMaker.cri.type}">
							<input type="hidden" name="minPrice"
								value="${pageMaker.cri.minPrice}"> <input type="hidden"
								name="maxPrice" value="${pageMaker.cri.maxPrice}">
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