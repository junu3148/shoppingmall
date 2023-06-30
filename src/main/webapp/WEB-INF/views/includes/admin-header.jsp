<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav id="sidebar" class="sidebar js-sidebar">
	<div class="sidebar-content js-simplebar">
		<a class="sidebar-brand"
			href="${pageContext.request.contextPath}/product/productListForm">
			<span class="align-middle">CATDOG ADMIN</span>
		</a>
		<ul class="sidebar-nav">
			<li class="sidebar-item"><a class="sidebar-link"
				href="${pageContext.request.contextPath}/main/"> <i
					class="align-middle" data-feather="sliders"></i> <span
					class="align-middle">메인페이지</span>
			</a></li>
			<li class="sidebar-header">Admin</li>
			<li class="sidebar-item"><a class="sidebar-link"
				href="${pageContext.request.contextPath}/product/productListForm">
					<i class="align-middle" data-feather="sliders"></i> <span
					class="align-middle">제품조회</span>
			</a></li>
			<li class="sidebar-item"><a class="sidebar-link"
				href="${pageContext.request.contextPath}/customer/customerView">
					<i class="align-middle" data-feather="log-in"></i> <span
					class="align-middle">고객조회</span>
			</a></li>
			<li class="sidebar-item"><a class="sidebar-link" href="#"> <i
					class="align-middle" data-feather="user-plus"></i> <span
					class="align-middle">매출정보</span>
			</a></li>
			<li class="sidebar-header">설정</li>
			<li class="sidebar-item"><a class="sidebar-link" href="#"> <i
					class="align-middle" data-feather="check-square"></i> <span
					class="align-middle">공지사항</span>
			</a></li>

			<li class="sidebar-item"><a class="sidebar-link" href="#"> <i
					class="align-middle" data-feather="square"></i> <span
					class="align-middle">관리자 등록</span>
			</a></li>
		</ul>
	</div>
</nav>





