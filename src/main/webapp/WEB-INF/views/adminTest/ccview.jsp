<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">

<title>CATDOG!</title>

<!--css 등록해야함-->
<link href="${pageContext.request.contextPath}/assets/css/app.css" rel="stylesheet">
<!--css 등록해야함-->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 최신버전 js -->

<!--컨텐츠 상단 폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
</head>

<body>


	<!---------------------------------------------사이드 바--------------------------------------------->

	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html"> <span
					class="align-middle">CATDOG ADMIN</span>
				</a>

				<ul class="sidebar-nav">

					<li class="sidebar-header">Admin</li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/product/poductListForm"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">제품조회</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/product/insertProductForm"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">제품등록</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="${pageContext.request.contextPath}/customer/customerView"> <i
							class="align-middle" data-feather="log-in"></i> <span
							class="align-middle">고객조회</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-sign-up.html"> <i class="align-middle"
							data-feather="user-plus"></i> <span class="align-middle">매출정보</span>
					</a></li>


					<li class="sidebar-header">설정</li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="ui-forms.html"> <i class="align-middle"
							data-feather="check-square"></i> <span class="align-middle">공지사항</span>
					</a></li>

					<li class="sidebar-item"><a class="sidebar-link"
						href="ui-buttons.html"> <i class="align-middle"
							data-feather="square"></i> <span class="align-middle">관리자
								등록</span>
					</a></li>
				</ul>
			</div>
		</nav>

		<!---------------------------------//사이드 바//----------------------------------------->



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
            				<a class="btn btn-secondary disabled btn-xs" role="button"
								aria-disabled="true"
								href="${pageContext.request.contextPath}/customer/loginForm">Login</a>
						</c:if>
					</ul>
				</div>
			</nav>

			<!---------------------------------//top nav//----------------------------------------->

			<!---------------------------------------- 컨텐츠 들어갈 공간---------------------------------------------->
			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">
						<b>Product View Page</b>
					</h1>

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
		 							 <p >메인 > 고객 조회</p>
								</div>
								<div class="card-body">

									<!--제품 조회 폼-->

									<div align="center" style="margin: 5%;">
										<h1 class="display-6">
											<b>고객 조회</b>
										</h1>
										<br>
										<hr>
										<br>

										<!--키워드 검색 폼-->
										<form action="${pageContext.request.contextPath}/customer/customerView">
											<table>
												<tr>
													<td><select name="searchOption" class="form-select">
															<option value = "all">--옵션 선택--</option>
															<option value="customerName">고객명</option>
															<option value="customerId">고객아이디</option>
													</select></td>
													<td>: <input type="text" name="keyword"  value ="${pageInfo.pagingInfo.keyword}"/>
														<button type="submit" class="btn btn-secondary">Search</button>
													</td>
												</tr>

											</table>
										</form>
										<!-- 검색어 마지막-->
										<br>
									


										<bR>
										<div>
											<table class="table table-striped">
												<tr>
													<td style="width: 20%; text-align: center;">고객 아이디</td>
													<td style="width: 30%; text-align: center;">이름</td>
													<td style="width: 10%; text-align: center;">고객번호</td>
													<td style="width: 10%; text-align: center;"></td>
												</tr>
												<c:if test = "${message != null}">
													<tr>
														<td></td>
														<td style=" text-align: center;"><p>${message}</p></td>
														<td></td>								
													</tr>
												</c:if>
												
											<c:if test = "${pageInfo.customerList != null}">
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
										<c:if test = "${pageInfo.pagingInfo.selectPage >10}">
										<a class = "paging" href = "${pageContext.request.contextPath}/customer/customerView?selectPage=${pageInfo.pagingInfo.startPageNum - 1}&searchOption=${pageInfo.pagingInfo.searchOption}&keyword=${pageInfo.pagingInfo.keyword}"> ◀ </a>
										</c:if>
										
										<c:forEach begin = "${pageInfo.pagingInfo.startPageNum}" end = "${pageInfo.pagingInfo.endPageNum}"  var = "page">
											<c:if test = "${page <= pageInfo.pagingInfo.finalPage}">
											<a class = "paging" href ="${pageContext.request.contextPath}/customer/customerView?selectPage=${page}&searchOption=${pageInfo.pagingInfo.searchOption}&keyword=${pageInfo.pagingInfo.keyword}">${page}</a>
											</c:if>
										</c:forEach>
										<c:if test = "${pageInfo.pagingInfo.next == true}">
										<a class = "paging" href ="${pageContext.request.contextPath}/customer/customerView?selectPage=${pageInfo.pagingInfo.endPageNum + 1}&searchOption=${pageInfo.pagingInfo.searchOption}&keyword=${pageInfo.pagingInfo.keyword}"> ▶ </a>
										</c:if>
										
										
									</div>
								</div>
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
	
	$('.paging').on("click", function(){
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