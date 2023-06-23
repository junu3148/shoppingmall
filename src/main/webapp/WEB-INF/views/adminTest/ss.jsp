<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <title>portfolio</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/reset.css" type="text/css"> <!-- 초기화 css -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" type="text/css"> <!-- 스와이퍼 css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css"> <!-- 슬릭슬라이더 css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css"> <!-- 슬릭슬라이더 css -->
    <link rel="preconnect" href="https://fonts.googleapis.com"> <!-- 구글폰트 -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <!-- 구글폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet"> <!-- 구글폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&family=Gowun+Dodum&family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/sub.css" type="text/css"> <!-- 서브 css -->

    <script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 최신버전 js -->
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script> <!-- 스와이퍼 js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script> <!-- 슬릭슬라이더 js -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/script3.js"></script> <!-- js -->
<style>
#wrap { width: 80%; height: 100%; margin-left:10%; margin-right:10%; margin-top: 10%;display: flex; font-size: 20px; }
#address-form { width: 20%; margin-top: 3%; margin-bottom: 3%; margin-right: 0%;}
#pay-form { border: #999 1px solid; width: 100%;  margin-top: 10%; margin-left: 0%; margin-bottom: 3%; margin-right: 0%; background-color:  white ;padding-left:15%; padding-right:15%; }
td { padding: 1%; }
#order-heading{ text-align: center; font-size:50px;}
.pay-button {display: block; margin: 0 auto;}
.address-form{background-color :  white; width: 30%; text-align: center;margin-top: 10%; margin-bottom: 3%;  border: 1px #999 solid;}
.address-box{background-color:  #4982cf; border: 1px #999 solid; padding:5%;}
option { width:20%;}
.input-width-control{width:10%;}
.input-width-control2, #email{width:15%;}
#roadAddress, #detailAddress{width:90%}
.product-img{ width:15%; height:15%;}
.pay-button{background: #4982cf; border: 1px solid #4982cf; color: #fff; width: 100px;  height: 40px; font-size:17px;}
</style>

</head>

<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->

<div id="wrap">
		<div id="pay-form"><!--결제 정보창-->
		<br>
			<h1 id="order-heading"><b>Order</b></h1><br><br><br>

			<table id="payment-form">
				<tr>
					<td>받는 사람 : <input type="text" name = "" class="input-width-control2">
					</td>
				</tr>
				<tr>
					<td>휴대전화 <select id="tel-front">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="018">018</option>
					</select> - <input type="text" class="input-width-control"> - <input
						type="text" class="input-width-control"> <input id="tel-Val"
						type="text" value="핸드폰번호">
					</td>
				</tr>
				<tr>
					<td colspan="2">배송지 정보</td>
				</tr>
				<tr>
					<td><input type="text" id="postcode"
						placeholder="우편번호"> <input type="button"
						id="btn-postnum" value="우편번호 찾기"><br></td>
				</tr>
				<tr>			
					<td><input type="text" id="roadAddress"
						placeholder="도로명주소" ></td>
				</tr>
				<tr>
					<td><span id="guide" style="color: #999; display: none"></span>
						<input type="text" id="detailAddress" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<td>이메일 : <input type="text" name="email" id="email"
						maxlength="100" />@ <select name="email_domain"
						id="email_domain" onchange="change_email_domain(this.value);">
							<option value="">선택하세요</option>
							<option value="input">직접입력</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="naver.com">naver.com</option>
							<option value="empal.com">empal.com</option>
							<option value="paran.com">paran.com</option>
							<option value="nate.com">nate.com</option>
							<option value="korea.com">korea.com</option>
							<option value="hitel.net">hitel.net</option>
							<option value="unitel.co.kr">unitel.co.kr</option>
							<option value="nownuri.net">nownuri.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="lycos.co.kr">lycos.co.kr</option>
							<option value="hanafos.com">hanafos.com</option>
							<option value="dreamwiz.com">dreamwiz.com</option>
							<option value="hanmir.com">hanmir.com</option>
							<option value="freechal.com">freechal.com</option>
							<option value="chollian.net">chollian.net</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="hotmail.com">hotmail.com</option>
					</select>
					<input type="text" name="input_email_domain"
						id="input_email_domain" style="display: none" />

					</td>
				</tr>
				<tr>
					<td>
						<hr>
					</td>
				</tr>
				<tr>
					<td>주문상품</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;<img src= "https://s0.2mdn.net/simgad/4842667183422335987" class = "product-img"> 냥냥이.. 외 1건</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;<img src= "https://s0.2mdn.net/simgad/4842667183422335987" class = "product-img"> 냥냥이.. 외 1건</td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;&nbsp;<img src= "https://s0.2mdn.net/simgad/4842667183422335987" class = "product-img"> 냥냥이.. 외 1건</td>
				</tr>
				<tr>
					<td>
						<hr>총 개 원
						<hr>
					</td>
				</tr>
				<tr>
				<td>
			<button class="pay-button">결제하기</button>
				
				</td>
				</tr>
			</table>
		</div><!--결제 정보창 끝-->
		<div class="address-form"><!--주소 정보창 반복문으로 돌릴 거임-->
				<div class ="address-box">
					회원 주소 1<br>
					<input type="text"> <!--받는 사람-->
					<input type="text"> <!--전화번호-->
					<input type="text"> <!--우편번호-->
					<input type ="text"> <!-- 도로명 주소-->
					<input type ="text"> <!-- 상세 주소-->
				</div>

		</div><!--주소 정보창 완료-->
	</div>
	 	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	$('#btn-postnum').on("click", function(){
		DaumPostcode();
	});

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function DaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						
						console.log('우편번호' + data.zonecode);
						console.log('우편번호' + roadAddr);
						
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						$('#postcode').val(data.zonecode);
						$('#roadAddress').val(roadAddr);

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							$("#extraAddress").value = extraRoadAddr;
						} else {
							$("#extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}

	/* 이메일 뒷주소 관련 selector 선택 시 발생할 이벤트 처리*/
	$('#email').on("keyup", function() {
		change_email_domain($(this).val());
	})

	/*이메일 입력 스크립트*/
	function change_email_domain(val) {
		if (val == "input") {
			document.getElementById("input_email_domain").style.display = "inline";
			document.getElementById("input_email_domain").focus();
		} else {
			document.getElementById("input_email_domain").style.display = "none";
			document.getElementById("input_email_domain").value = "";
		}
	}
</script>

</html>