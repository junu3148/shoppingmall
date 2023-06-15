<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<link
	href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.js"></script>

<!-- 헤더 -->
<header class="pc">
	<!--웹에서의 헤더-->
	<div id="lnb">
		<ul class="lnb">
		<c:choose>
			<c:when test ="${authCustomer != null}" >
			<li class="login"><a href="#none">로그아웃</a></li>
			<li class="notice"><a href="${pageContext.request.contextPath }/customer/modifyForm/${authCustomer.customerNo}">마이페이지</a></li>
			</c:when>
			<c:otherwise><li class="login"><a href="${pageContext.request.contextPath }/customer/loginPage">로그인</a></li></c:otherwise>
			</c:choose>
			<li class="cart"><a href="#none">장바구니</a></li>
			<li class="search"><a href="#none">검색</a></li>
			<li class="notice"><a href="#none">커뮤니티</a></li>
		</ul>
	</div>
	<div id="header">
		<h1>
			<a href="${pageContext.request.contextPath}/main/">로고이미지</a>
		</h1>
		<!-- 메뉴 (gnb) -->
		<ul id="nav">
			<li class="on"><a
				href="${pageContext.request.contextPath}/main/all">All</a></li>
			<li><a
				href="${pageContext.request.contextPath}/main/category/간식">사료/간식</a></li>
			<li><a
				href="${pageContext.request.contextPath}/main/category/배변용품">배변용품</a></li>
			<li><a
				href="${pageContext.request.contextPath}/main/category/미용">미용</a></li>
			<li><a
				href="${pageContext.request.contextPath}/main/category/장난감">장난감</a></li>
			<li><a
				href="${pageContext.request.contextPath}/main/category/가구">가구</a></li>
		</ul>
		<!-- /메뉴 (gnb) -->
	</div>
</header>

<header class="mo">
	<!--테블릿/모바일에서의 헤더-->
	<h1>
		<a href="#none">로고이미지</a>
	</h1>
	<input type="checkbox" id="icon"> <label for="icon"> <span></span>
		<span></span> <span></span>
	</label>
	<div id="header">
		<h1>
			<a href="#none">로고이미지</a>
		</h1>
		<p class="who">로그인이 필요합니다.</p>
		<!-- 사용자 로그인 시 ooo(id)님 으로 변경 -->
		<ul class="top_menu clear">
			<li class="login"><a href="#none">로그인</a></li>
			<!-- 사용자 로그인 시 로그아웃으로 변경 -->
			<li class="join"><a href="#none">회원가입</a></li>
			<!-- 사용자 로그인 시 마이페이지로 변경 -->
		</ul>
		<ul class="icon_menu">
			<li class="search"><a href="#none"><img
					src="images/search.png" alt="">검색</a></li>
			<li class="cart"><a href="#none"><img src="images/cart.png"
					alt="">장바구니</a></li>
			<li class="cart"><a href="#none"><img
					src="images/search.png" alt="">??</a></li>
			<li class="cart"><a href="#none"><img
					src="images/search.png" alt="">??</a></li>
		</ul>
		<ul class="middle_menu">
			<li class="dir"><a href="#none" class="en">All</a></li>
			<li><a href="#none" class="en">DOG</a>
				<ul>
					<li><a href="#none">사료</a></li>
					<li><a href="#none">간식</a></li>
					<li><a href="#none">미용</a></li>
					<li><a href="#none">장난감</a></li>
					<li><a href="#none">가구</a></li>
				</ul></li>
			<li><a href="#none" class="en">CAT</a>
				<ul>
					<li><a href="#none">사료</a></li>
					<li><a href="#none">간식</a></li>
					<li><a href="#none">미용</a></li>
					<li><a href="#none">장난감</a></li>
					<li><a href="#none">가구</a></li>
				</ul></li>
			<li><a href="#none" class="en">COMMUNITY</a>
				<ul>
					<li><a href="#none">공지사항</a></li>
					<li><a href="#none">FAQ</a></li>
					<li><a href="#none">Q&A</a></li>
					<li><a href="#none">이벤트</a></li>
				</ul></li>
		</ul>
	</div>
</header>
<!-- /헤더 -->




<!-- 이미지등록 팝업(모달)창 -->
<div class="modal fade" id="addModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">상품검색</h4>
			</div>

			<form method="POST" action="${pageContext.request.contextPath}/main/productSearch">
				<div class="modal-body">
					<input type="text" name="keyword">
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn" id="btnUpload">검색</button>
				</div>
			</form>


		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<script>
	$(window).ready(function() {

		$(".search").on("click", function() {
			console.log("검색");

			$("#addModal").modal("show");

		});

	});
</script>