
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

	<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/customer.css" type="text/css">
<style>
.content a{text-decoration: none;}
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
             		 안녕하세요!  ${authCustomer.customerId}님&nbsp;&nbsp;
              		 <a class="btn btn-secondary" 
									href="${pageContext.request.contextPath}/customer/logout">Logout</a>
							</c:if>
						</c:if>
						<c:if test="${authCustomer == null}">
            			로그인이 필요합니다.&nbsp;&nbsp;
            				<a class="btn btn-secondary" 
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
									<td style="width: 20%; text-align: center;"><b>고객 아이디</b></td>
									<td style="width: 30%; text-align: center;"><b>이름</b></td>
									<td style="width: 10%; text-align: center;"><b>고객번호</b></td>
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
											<td style="width: 10%; text-align: center;"><button type ="button"
												class="btn btn-primary detail_Info" data-customerno = "${customer.customerNo}">상세정보</button></td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
						</div>
						<!-- 여기다가 넘버링할 거임 -->
						<c:if test="${pageInfo.pagingInfo.selectPage >10}">
							<a class="paging_"
								href="${pageContext.request.contextPath}/customer/customerView?selectPage=${pageInfo.pagingInfo.startPageNum - 1}&searchOption=${pageInfo.pagingInfo.searchOption}&keyword=${pageInfo.pagingInfo.keyword}">
								◀ </a>
						</c:if>

						<c:forEach begin="${pageInfo.pagingInfo.startPageNum}"
							end="${pageInfo.pagingInfo.endPageNum}" var="page">
							<c:if test="${page <= pageInfo.pagingInfo.finalPage}">
								<a class="paging_"
									href="${pageContext.request.contextPath}/customer/customerView?selectPage=${page}&searchOption=${pageInfo.pagingInfo.searchOption}&keyword=${pageInfo.pagingInfo.keyword}">${page}</a>
							</c:if>
						</c:forEach>
						<c:if test="${pageInfo.pagingInfo.next == true}">
							<a class="paging_"
								href="${pageContext.request.contextPath}/customer/customerView?selectPage=${pageInfo.pagingInfo.endPageNum + 1}&searchOption=${pageInfo.pagingInfo.searchOption}&keyword=${pageInfo.pagingInfo.keyword}">
								▶ </a>
						</c:if>
					</div>
				</main>
			</div>

			<c:import url="/WEB-INF/views/includes/admin-footer.jsp"></c:import>

		</div>
	</div>

<!-- 회원정보 조회용 -->

					<!-- 상품 등록 -->
					<section class="inquiry_popup"
						style="display: none;">
						<a href="#none" class="inquiry_close"><img
							src="images/ver02/close.png" alt=""></a>
						<div class="inquiry_write inquiry_write2">
							<h3>상세 정보</h3>
							<form action = "${pageContext.request.contextPath}/customer/modify" id = "modify_form">
								<table class= "customer_info">

									<tr>
										<td style="text-align: center;" colspan ="2">
										<img src ="${pageContext.request.contextPath}/assets/images/people.png" class= "user_img">
										<input type ="hidden" name = "customerNo" id ="cus_no" value ="">
										</td>
									</tr>
									<tr>
										<td style="text-align: center;" colspan = "2" class = "cus_name">김세영님(아이디)</td>
									</tr>

									<tr>
										<td style="text-align: center;" >등급</td>
										<td style="text-align: center;" class ="cus_role">
											<select class ="cus_role" name ="customerRole">
    										<option value ="1">일반회원</option>
    										<option value ="2">운영자</option>
											</select>
										</td>
									</tr>
									<tr>
										<td style="text-align: center;">누적 구매 금액</td>
										<td style="text-align: center;" class= "totalPayment" ></td>
									</tr>
								</table>
								<div class="btn_wrap">
									<button  class="order_btn" >수정</button> <a
									
										href="#none" class="shopping_btn">취소</a>
								</div>

							</form>
						</div>
					</section>


<!-- 회원정보 조회용 -->
</body>


<script>

$('#modify_form').on("submit", function(){
	
	 var result = confirm('정말 수정하시겠습니까?');
		
	 if(result){
		return true;		 
	 }else{
		$('.inquiry_popup').hide();
	 }
	 return false;
}); //modify_form submit end


$('.shopping_btn').on("click", function(){
	$('.inquiry_popup').hide();
});

$('.detail_Info').on("click", function(){
	
	var customerNo = $(this).data('customerno');
	$('.inquiry_popup').show();
	
	CustomerVO = {
			
			customerNo : customerNo
	}
	
	detail_info_view(CustomerVO);
	
	
}); //상세정보 클릭 시 end


	$('.paging_').on("click", function() {
		$('.paging_').removeClass('active');

		$(this).addClass('active');

	})

	function updateMinRange(value) {
		document.getElementById("minRangeInput").value = value;
	}
	function updateMaxRange(value) {
		document.getElementById("maxRangeInput").value = value;
	}
	
	/* 디테일한 고객 정보 불러오기*/
	function detail_info_view(CustomerVO){
		
		$.ajax({
			//요청 세팅(보낼 때--!)
			url : "${pageContext.request.contextPath}/customer/customerDetailInfo",
			type : "post", 
			data : CustomerVO,
			dataType : "json",
			success : function(jsonResult) {
				/*돌아온 정보*/
				console.log(jsonResult.data);
				
				var customer = jsonResult.data;
				var customerRole = "";
				var totalPayment  = (customer.totalPayment.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',') + "원");

				console.log(customerRole);
				
				$('.cus_name').html("<b>" +  customer.customerName + '(' + customer.customerId + ')님' + "</b>"  );
				$('.cus_role').val(customer.customerRole);
				$('.totalPayment').text(totalPayment);
				$('#cus_no').val(CustomerVO.customerNo);
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		}); //ajax end	
		
		}
	
</script>
</html>