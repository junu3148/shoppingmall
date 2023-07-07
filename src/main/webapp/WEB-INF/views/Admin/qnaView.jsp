
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/assets/css/sub.css"
	type="text/css">
<!--css 등록해야함-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 제이쿼리 최신버전 js -->
<!--컨텐츠 상단 폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/adminProduct.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/js/qna.js"></script>

<style>
.wrapper a{text-decoration: none;}
.pageInfo{margin-top:60px}
.pageInfo_btn a {color: black;}
.active .anum {color: #4982cf; font-weight: bold; font-size: 15px;}
.content {margin-top: auto;}
.footer {text-align: center;}
.footer .container-fluid {height: 30px;}
.table a{text-decoration: none;}
.insertQnAAdmin{ background: #4982cf; border: 1px solid #4982cf; color: #fff; padding: 6px 6px; margin: 0 5px; }
.insertQnAAdmin:hover{ color:#fff; }
.btn_wrap a{text-decoration: none;}
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
								<li>안녕하세요! ${authCustomer.customerId}님&nbsp;&nbsp; 
								<a class="btn btn-secondary" 									
									href="${pageContext.request.contextPath}/customer/logout">Logout</a>
								</li>
							</c:if>
						</c:if>
						<c:if test="${authCustomer == null}">
							<li>로그인이 필요합니다.&nbsp;&nbsp; <a
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
							<b>QnA Management Page</b>
						</h1>
						<br>
						<hr>
						<br> <br>
						<div>
							<table class="table table-striped">
								<tr>
									<td style="width: 10%; text-align: center;">No.</td>
									<td style="width: 15%; text-align: center;">제목</td>
									<td style="width: 50%; text-align: center;">내용</td>
									<td style="width: 15%; text-align: center;">작성날짜</td>
									<td style="width: 10%; text-align: center;">답글</td>
								</tr>
								<c:forEach items="${qnaList}" var="QnA">
									<tr>
										<td style="width: 10%; text-align: center;">${QnA.qnaNo}</td>
										<td style="width: 15%; text-align: center;">${QnA.title}</td>
										<td style="width: 50%; text-align: center;">${QnA.content}</td>
										<td style="width: 15%; text-align: center;">${QnA.regDate}</td>
										<td style="width: 10%; text-align: center;"><a
											href="#none" id="buttoncss" class="order_btn insertQnAAdmin"
											data-no="${QnA.qnaNo}">답글달기</a></td>
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
				</main>
			</div>

			<main id="inquiry">
				<!-- 문의 답글 창 -->
				<section id="inquiry_popup2" class="inquiry_popup"
					style="display: none;">					
					<div class="inquiry_write">
						<h3>문의에대한 답변</h3>
						<form id="moveForm2"
							action="${pageContext.request.contextPath}/QnA/insertQnAAdmin"
							method="get">
							<table>
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<tr>
									<th><label for="inquiry_cont">답변내용</label></th>
									<td><input type="hidden" name="qnaNo"
										value=""> <textarea name="content" id="inquiry_cont2"
											required></textarea>
										<div class="textLengthWrap">
											<span class="textCount">0자</span> <span class="textTotal">/
												700자</span>
										</div></td>
								</tr>
							</table>
							<div class="btn_wrap">
								<a id="submitqna2" href="#none" class="order_btn">답글등록</a> <a
									href="#none" class="shopping_btn">취소</a>
							</div>
						</form>
					</div>
				</section>
			</main>
			<!-- footer -->
			<c:import url="/WEB-INF/views/includes/admin-footer.jsp"></c:import>

		</div>
	</div>
</body>


<script>
	
</script>

</html>