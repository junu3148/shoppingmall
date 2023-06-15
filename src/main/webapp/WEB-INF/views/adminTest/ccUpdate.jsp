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


<!--컨텐츠 상단 폰트-->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap"
	rel="stylesheet">

<style>
#formArea{
    text-align: center;
    margin-left: 10%;
    margin-right: 10%;
}
#modifyForm{ width: 100%}
input{
	border : none;
	width : 100%;
}    
    
    
</style>

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
		

					<h1 class="h3 mb-3">
						<b>Product View Page</b>
					</h1>

					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
                                    <p >메인 > 고객정보</p>
								</div>
								<div class="card-body">
									<div align="center" style="margin: 5%;">
										<h3 class="display-6">
											<b>고객 정보</b>
										</h3>
										<br>
										<hr>
										<br>

        <!---수정 폼 시작-->

            <div id = "formArea">
            <form action="${pageContext.request.contextPath}/product/modifyPoduct"
				method="POST" enctype="multipart/form-data">
								
					<input type="hidden" name="productNo" value="${product.productNo}" />
				<table id = "modifyForm" class="table table-bordered ">
					<tr>
						<td colspan="4" bgcolor="lightgray"><b>고객 정보</b></td>
					</tr>
					<tr>
						<td colspan="2" rowspan="8" width=30%><img id="preview"
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKLYtkaHut2_Xctb0hUZGZk7pbCbIzcoMSNA&usqp=CAU"
							width="100%"> 사진 영역(미리보기) <input type="hidden"
							name="imageNo" value="${product.imageNo}"></td>
					</tr>
					
					<tr>
						<td style="text-align: center;">고객명</td>
						<td>${customer.customerName}</td>
					</tr>
					<tr>
						<td style="text-align: center;">아이디</td>
						<td>${customer.customerId}</td>
					</tr>
					
					<tr>
						<td style="text-align: center;">권한</td>
						<c:if test = "${customer.customerRole  == 1}">
						<td>일반회원</td>
						</c:if>
					</tr>
					<tr></tr>
					<tr></tr>
				</table>
			</form>
        </div>



        <!---수정 폼 끝-->


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

	// 파일 미리보기 이벤트
	$("#file").on("change", function(event) {
		console.log("파일 체인지");

		var file = event.target.files[0];

		// 확장자 확인
		if (!isImageFile(file)) {
			alert("사진 파일만 올려주세요");

			// 파일 사이즈 확인
			if (isOverSize(file)) {
				alert("파일 사이즈가 너무 큽니다.");

			}
		} else {
			var reader = new FileReader();

			reader.onload = function(e) {

				$("#preview").attr("src", e.target.result);
			};
			reader.readAsDataURL(file);
		}
	});

	// 확장자가 이미지 파일인지 확인
	function isImageFile(file) {
		var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
		return [ "jpg", "jpeg", "gif", "png" ].includes(ext);
	}

	// 파일의 최대 사이즈 확인
	function isOverSize(file) {
		var maxSize = 3 * 1024 * 1024; // 3MB로 제한
		return file.size > maxSize;
	}


</script>
</html>