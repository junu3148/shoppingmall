
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>product view</title>
<!--부트 스트랩 코드-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<!-- 초기화 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/sub.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css" type="text/css">

<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic:wght@400;700;800&display=swap"
	rel="stylesheet">
<!--컨텐츠 상단 폰트-->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

<!--부트 스트랩 코드-->
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
	crossorigin="anonymous"></script>
<!-- 제이쿼리 최신버전 js -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!--js 코드-->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/adminProduct.js"></script>

<style>
.wrapper a{text-decoration: none;}
.pageInfo{margin-top:60px}
.pageInfo_btn a {color: black;}
.active .anum {color: #4982cf; font-weight: bold; font-size: 15px;}
.content {margin-top: auto;}
.footer {text-align: center;}
.footer .container-fluid {height: 30px;}
#inquiry_popup input {width: 450px;}
#inquiry_popup2 input {width: 450px;}
#insertProductForm a {text-decoration: none;}
#modifyProductForm a {text-decoration: none;}
#Insert {margin-left: 10px;}
#deleteProduct {background: #e60a2f;}
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
								<li>안녕하세요! ${authCustomer.customerId}님&nbsp;&nbsp; <a
									class="btn btn-secondary"
									href="${pageContext.request.contextPath}/customer/logout">Logout</a>
								</li>
							</c:if>
						</c:if>
						<c:if test="${authCustomer == null}">
							<li>로그인이 필요합니다.&nbsp;&nbsp; <a class="btn btn-secondary"
								href="${pageContext.request.contextPath}/customer/loginPage">Login</a>
							</li>
						</c:if>
					</ul>
				</div>
			</nav>

			<!---------------------------------//top nav//----------------------------------------->
			<div class="p-3 mb-2 bg-body text-body">
				<!--배경색 start-->
				<br>
				<main id="inquiry" class="content">
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
											<option id="none"
												<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>선택</option>
											<option value="name"
												<c:out value="${pageMaker.cri.type eq 'name'?'selected':'' }"/>>제품명</option>
											<option value="code"
												<c:out value="${pageMaker.cri.type eq 'code'?'selected':'' }"/>>제품코드</option>
									</select></td>
									<td>: <input type="text" id="searchKeyword" name="keyword"
										value="${pageMaker.cri.keyword}" />
										<button type="submit" class="btn btn-secondary" id="Search">Search</button>
									</td>
									<td><a class="btn btn-primary" id="Insert" href="#none"
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
						<br>
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
											href="#none" class="btn btn-primary"
											data-no="${product.productNo}"
											data-name="${product.productName}"
											data-ea="${product.productEa}" data-price="${product.price}"
											data-content="${product.productContent}"
											data-category="${product.category}"
											data-subcategory="${product.subCategory}"
											data-savename="${product.saveName}">수정</a></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<!-- 페이징 -->
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

					<!-- 상품 등록 -->
					<section id="inquiry_popup2" class="inquiry_popup inquiry_popup2"
						style="display: none;">
						<a href="#none" class="inquiry_close"><img
							src="images/ver02/close.png" alt=""></a>
						<div class="inquiry_write inquiry_write2">
							<h3>상품 등록</h3>
							<form id="insertProductForm"
								action="${pageContext.request.contextPath}/product/insertProduct"
								method="POST" enctype="multipart/form-data">
								<table>
									<tr>
										<td rowspan="8" width="30%" style="text-align: center;"><img
											id="preview2"
											src="${pageContext.request.contextPath}/assets/images/sns4.png"
											width="100%"><br> <br> <br> <b>이미지
												미리보기</b></td>
									</tr>
									<tr>
										<td style="text-align: center;">제품명</td>
										<td><input type="text" id="productName2"
											name="productName" required></td>
									</tr>

									<tr>
										<td style="text-align: center;">수량</td>
										<td><input type="number" id="productEa2" name="productEa"
											min="1" required></td>
									</tr>
									<tr>
										<td style="text-align: center;">가격</td>
										<td><input type="number" id="price2" name="price"
											min="3000" step="100" required></td>
									</tr>
									<tr>
										<td style="text-align: center;">상품 정보</td>
										<td><input type="text" id="productContent2"
											name="productContent" required></td>
									</tr>
									<tr>
										<td style="text-align: center;">카테고리</td>
										<td><input type="text" id="category2" name="category"
											required></td>
									</tr>
									<tr>
										<td style="text-align: center;">서브 카테고리</td>
										<td><input type="text" id="subCategory2"
											name="subCategory" required></td>
									</tr>
									<tr>
										<td style="text-align: center;">제품사진</td>
										<td><input id="file2" type="file" name="file" required></td>
									</tr>
								</table>
								<div class="btn_wrap">
									<a id="insertProduct" href="#none" class="order_btn">등록</a> <a
										href="#none" class="shopping_btn">취소</a>
								</div>

							</form>
						</div>
					</section>

					<!-- 상품정보 수정 -->
					<section id="inquiry_popup" class="inquiry_popup"
						style="display: none;">
						<a href="#none" class="inquiry_close"><img
							src="images/ver02/close.png" alt=""></a>
						<div class="inquiry_write inquiry_write2">
							<h3>상품정보 수정</h3>
							<form id="modifyProductForm"
								action="${pageContext.request.contextPath}/product/modifyProduct"
								method="POST" enctype="multipart/form-data">
								<table>
									<tr>
										<td rowspan="8" width="30%" style="text-align: center;"><img
											id="preview" src="" width="100%"><br> <br> <br>
											<b>이미지 미리보기</b></td>
										<td style="text-align: center;">제품번호</td>
										<td><input type="text" id="productNo" name="productNo"
											readonly></td>
									</tr>
									<tr>
										<td style="text-align: center;">제품명</td>
										<td><input type="text" id="productName"
											name="productName" required></td>
									</tr>

									<tr>
										<td style="text-align: center;">수량</td>
										<td><input type="number" id="productEa" name="productEa"
											min="1" required></td>
									</tr>
									<tr>
										<td style="text-align: center;">가격</td>
										<td><input type="number" id="price" name="price"
											min="3000" step="100" required></td>
									</tr>
									<tr>
										<td style="text-align: center;">상품 정보</td>
										<td><input type="text" id="productContent"
											name="productContent" required></td>
									</tr>
									<tr>
										<td style="text-align: center;">카테고리</td>
										<td><input type="text" id="category" name="category"
											required></td>
									</tr>
									<tr>
										<td style="text-align: center;">서브 카테고리</td>
										<td><input type="text" id="subCategory"
											name="subCategory" required></td>
									</tr>
									<tr>
										<td style="text-align: center;">제품사진</td>
										<td><input id="file" type="file" name="file" required></td>
									</tr>
								</table>
								<div class="btn_wrap">
									<a id="modifyProduct" href="#none" class="order_btn">수정</a> <a
										id="deleteProduct" href="" class="order_btn">삭제</a> <a
										href="#none" class="shopping_btn">취소</a>
								</div>
							</form>
						</div>
					</section>
				</main>
			</div>

			<!-- footer -->
			<c:import url="/WEB-INF/views/includes/admin-footer.jsp"></c:import>

		</div>
	</div>
</body>


<script>
	// 상품 수정창 띄우기 -- 이미지경로&삭제경로 때문에 스크립트로 못뺌...
	$(".table-striped .btn-primary").on("click",function() {

		let productNo = $(this).data("no");
		let productName = $(this).data("name");
		let productEa = $(this).data("ea");
		let price = $(this).data("price");
		let productContent = $(this).data("content");
		let category = $(this).data("category");
		let subCategory = $(this).data("subcategory");
		let saveName = $(this).data("savename");

		$("#productNo").val(productNo);
		$("#productName").val(productName);
		$("#productEa").val(productEa);
		$("#price").val(price);
		$("#productContent").val(productContent);
		$("#category").val(category);
		$("#subCategory").val(subCategory);
		$("#preview").attr("src","${pageContext.request.contextPath}/upload/" + saveName);
		$("#deleteProduct").attr("href","${pageContext.request.contextPath}/product/deleteProduct/"	+ productNo);
		$("#inquiry_popup").show();

	});

	//상품 등록창 취소버튼 -- 이미지경로 때문에 스크립트로 못뺌...
	$(".btn_wrap .shopping_btn").on("click",function() {

		$('#inquiry_popup2').hide();
		$('body').removeClass('no-scroll');
		$("#productName2").val("");
		$("#productEa2").val("");
		$("#price2").val("");
		$("#productContent2").val("");
		$("#category2").val("");
		$("#subCategory2").val("");
		$("#file2").val("");
		$("#preview2").attr("src","${pageContext.request.contextPath}/assets/images/sns4.png");

	});
</script>

</html>