<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 헤더 -->
<header class="pc">
	<!--웹에서의 헤더-->
	<div id="lnb">
		<ul class="lnb">
			<c:if test="${authCustomer.customerRole == 99}">
			<li class="admin"><a href="${pageContext.request.contextPath }/product/productListForm"><b>관리페이지</b></a></li>
			</c:if>
			<c:choose>
				<c:when test="${authCustomer != null}">
					<li class="login"><a href="${pageContext.request.contextPath }/customer/logout">로그아웃</a></li>
					<li class="notice"><a href="${pageContext.request.contextPath }/myPage/${authCustomer.customerNo}">마이페이지</a></li>
					<li class="cart"><a href="${pageContext.request.contextPath }/cart/viewCart?customerNo=${authCustomer.customerNo}">장바구니</a></li>
				</c:when>
				<c:otherwise>
					<li class="login"><a
						href="${pageContext.request.contextPath }/customer/loginPage">로그인</a></li>
				</c:otherwise>
			</c:choose>			
			<li class="search"><a href="#none">검색</a></li>
			<c:choose>
			<c:when test="${!empty authCustomer}">
			<li class="notice"><a href="${pageContext.request.contextPath }/QnA/QnAList">커뮤니티</a></li>
			</c:when>
			<c:otherwise>
			<li class="notice"><a href="${pageContext.request.contextPath }/customer/loginPage">커뮤니티</a></li>
			</c:otherwise>
			</c:choose>	
		</ul>
	</div>
	<div id="header">
		<h1>
			<a href="${pageContext.request.contextPath}/main/">로고이미지</a>
		</h1>
		<!-- 메뉴 (gnb) -->
		<ul id="nav">
			<li ><a
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
			<li class="search"><a href="#none">
			<img src="${pageContext.request.contextPath}/assets/images/search.png" alt="">검색</a></li>
			<li class="cart"><a href="#none"><img src="${pageContext.request.contextPath}/assets/images/cart.png"
					alt="">장바구니</a></li>
			<li class="cart"><a href="#none"><img
					src="${pageContext.request.contextPath}/assets/images/search.png" alt="">??</a></li>
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

<!-- 검색창 -->
<div class="search_popup" style="display: none;">
	<a href="#none" class="search_close"><img
		src="${pageContext.request.contextPath}/assets/images/ver02/search_x.png" alt=""></a>
	<div>
		<form id="searchForm"
			action="${pageContext.request.contextPath}/main/productSearch"
			method="get">
			<input type="search" name="keyword" placeholder="검색어를 입력해주세요">
			<button type="submit">
				<img
					src="${pageContext.request.contextPath}/assets/images/ver02/search_w.png"
					alt="">
			</button>
		</form>
	</div>
</div>


<script>
	//검색
	$('header .search').click(function() {
		$('.search_popup').show();
	});
	$('.search_close').click(function() {
		$('.search_popup').hide();
		$('.search_popup #search').val(''); //검색창 닫았을 때 검색어 초기화
	});
</script>