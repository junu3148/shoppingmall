<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

			<div id="aside">
				<ul>
					<li><a href=""></a></li>
					<li><a href="${pageContext.request.contextPath}/myPage/${authCustomer.customerNo}?selectPage=1">마이페이지</a></li>
					<li><a href="${pageContext.request.contextPath}/myPage/myReview/${authCustomer.customerNo}?selectPage=1">My리뷰</a></li>
					<li><a href="${pageContext.request.contextPath}/myPage/checkPasswordForm">정보 수정</a></li>
				</ul>
			</div>
			