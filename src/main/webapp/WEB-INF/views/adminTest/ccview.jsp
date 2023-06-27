<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">

<title>CATDOG!</title>
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
.content {
	margin-top: 20px;
}
</style>
</head>

<body>
	<div class="wrapper">
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

			<!---------------------------------------- 컨텐츠 들어갈 공간---------------------------------------------->
			<main class="content">
				<div class="container-fluid p-0">

					<div class="row">
						<div class="col-12">



							<!--제품 조회 폼-->

							<div align="center" style="margin: 5%;">
								<h1 class="display-6">
									<b>고객 조회</b>
								</h1>
								<br>
								<hr>
								<br>

								<!--키워드 검색 폼-->
								<form
									action="${pageContext.request.contextPath}/customer/customerView">
									<table>
										<tr>
											<td><select name="searchOption" class="form-select">
													<option value="all">--옵션 선택--</option>
													<option value="customerName">고객명</option>
													<option value="customerId">고객아이디</option>
											</select></td>
											<td>: <input type="text" name="keyword"
												value="${pageInfo.pagingInfo.keyword}" />
												<button type="submit" class="btn btn-secondary">Search</button>
											</td>
										</tr>

									</table>
								</form>
								<!-- 검색어 마지막-->
								<br> <bR>
								<div>
									<table class="table table-striped">
										<tr>
											<td style="width: 20%; text-align: center;">고객 아이디</td>
											<td style="width: 30%; text-align: center;">이름</td>
											<td style="width: 10%; text-align: center;">고객번호</td>
											<td style="width: 10%; text-align: center;"></td>
										</tr>
										<c:if test="${message != null}">
											<tr>
												<td></td>
												<td style="text-align: center;"><p>${message}</p></td>
												<td></td>
											</tr>
										</c:if>

										<c:if test="${pageInfo.customerList != null}">
											<c:forEach items="${pageInfo.customerList}" var="customer">
												<tr>
													<td style="width: 20%; text-align: center;">${customer.customerId}</td>
													<td style="width: 30%; text-align: center;">${customer.customerName}</td>
													<td style="width: 10%; text-align: center;">${customer.customerNo}</td>
													<td style="width: 10%; text-align: center;"><a
														href="${pageContext.request.contextPath}/customer/detailInfo/${customer.customerNo}"
														class="btn btn-primary">상세정보</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
								</div>
								<!-- 여기다가 넘버링할 거임 -->
								<c:if test="${pageInfo.pagingInfo.selectPage >10}">
									<a class="paging"
										href="${pageContext.request.contextPath}/customer/customerView?selectPage=${pageInfo.pagingInfo.startPageNum - 1}&searchOption=${pageInfo.pagingInfo.searchOption}&keyword=${pageInfo.pagingInfo.keyword}">
										◀ </a>
								</c:if>

								<c:forEach begin="${pageInfo.pagingInfo.startPageNum}"
									end="${pageInfo.pagingInfo.endPageNum}" var="page">
									<c:if test="${page <= pageInfo.pagingInfo.finalPage}">
										<a class="paging"
											href="${pageContext.request.contextPath}/customer/customerView?selectPage=${page}&searchOption=${pageInfo.pagingInfo.searchOption}&keyword=${pageInfo.pagingInfo.keyword}">${page}</a>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.pagingInfo.next == true}">
									<a class="paging"
										href="${pageContext.request.contextPath}/customer/customerView?selectPage=${pageInfo.pagingInfo.endPageNum + 1}&searchOption=${pageInfo.pagingInfo.searchOption}&keyword=${pageInfo.pagingInfo.keyword}">
										▶ </a>
								</c:if>


							</div>
						</div>
					</div>


				</div>
			</main>

			<!----------------------------------------// 컨텐츠 들어갈 공간 //---------------------------------------------->



			<!--footer-->
			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="https://adminkit.io/"
									target="_blank"><strong>AdminPage</strong></a> - <a
									class="text-muted" href="https://adminkit.io/" target="_blank"><strong>CATDOG</strong></a>
								&copy;
							</p>
						</div>
						<div class="col-6 text-end"></div>
					</div>
				</div>
			</footer>
			
		</div>
	</div>
	<!--footer-->


</body>

<script>
	$('.paging').on("click", function() {
		$('.paging').removeClass('active');

		$(this).addClass('active');

	})

	function updateMinRange(value) {
		document.getElementById("minRangeInput").value = value;
	}
	function updateMaxRange(value) {
		document.getElementById("maxRangeInput").value = value;
	}
</script>
</html>