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

	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script><!-- iamport.payment.js -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 최신버전 js -->
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script> <!-- 스와이퍼 js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script> <!-- 슬릭슬라이더 js -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/script3.js"></script> <!-- js -->
    
<style>
#wrap { width: 80%; height: 100%; margin-left:10%; margin-right:10%; margin-top: 10%;display: flex; font-size: 20px; }
#address-form { width: 20%; margin-top: 3%; margin-bottom: 3%; margin-right: 0%;}
#address-history { border: #999 1px solid; width: 200px;  margin-top: 10%; margin-left: 0%; margin-bottom: 3%; margin-right: 0%; background-color:  white ;padding-left:15%; padding-right:15%; }
td { padding: 1%; }
#order-heading{ text-align: center; font-size:50px;}
.pay-button {display: block; margin: 0 auto;}
.address-form{background-color :  white; width: 30%;margin-top: 10%; margin-bottom: 3%;  border: 1px #999 solid;}
.address-box{background-color:  #4982cf; border: 1px #999 solid; padding:5%;}
option { width:20%;}
table{ border : 1px solid black;}
.input-width-control{width:10%;}
.input-width-control2, #email{width:15%;}
#roadAddress, #detailAddress{width:90%}
.product-img{ width:100px; height:100px;}
.pay-button{background: #4982cf; border: 1px solid #4982cf; color: #fff; width: 100px;  height: 40px; font-size:17px;}
#product_Name{ font-size = 10px;}
#order table{width: 100%;border: 1px solid #eee; border-collapse: collapse;}
#order table td, #cart table th{vertical-align: middle; border: 1px solid #eee; padding: 10px;}
#order table td .cart_pd{width: 100px; height: 100px;}
#order table td .cart_pd + span{display: block; margin-top: 3px;}
#order table td .count-wrap .inp{ width: 50px; border: 1px solid #ddd; font-size: 20px;}
#order .del{padding: 10px 20px; border: 1px solid #eee; display: inline-block; margin-top: 20px;}
#order .total_order{margin-top: 50px; border: 1px solid #333; border-left: 0; border-right: 0;}
#order .total_order .total{border-bottom: 1px solid #eee; box-sizing: border-box; padding: 10px 20px;}
#order .total_order .total span{color: #4982cf; font-weight: 900;}
#order .total_order .total + ul{display: flex; justify-content: center; margin: 10px 0;}
#order .total_order .total + ul li{margin: 10px;}
#order .total_order .total + ul li p{font-weight: bold; font-size: 20px;}
#order .total_order .total + ul li span{margin-top: 5px; font-size: 12px; color: #999; display: block;}
#order .total_order .total + ul li p.total_price{color: #4982cf; font-size: 30px}
#address-form{ text-align : left;}
#order_info{text-align: center;}
.click-btn {background: #4982cf; border: 1px solid #4982cf; color: #fff; width: 100px; height: 40px;}
#pay-btn{text-align:center; height:30px;}
#center-btn{text-align:center;}
#address-title{padding:10px; text-align:center;}
.address-table{width:100%;font-size: 18px; background-color : white; }
</style>

</head>

<body>

	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->



<div id="wrap">
    <main id="order">
        
        <section class="pc">
            <h3>주문</h3>
			
			<table id="address-form">
				<tr>
					<td colspan ="4" id = "orderNo" data-orderno ="${orderInfo.orderNo}" >
						주문번호 : ${orderInfo.orderNo}
					</td>
				</tr>
				<tr>
					<td colspan ="4">받는 사람 : <input type="text" id ="name" class="input-width-control2">
					</td>
				</tr>
				<tr>
					<td colspan ="4">휴대전화 <select id="tel-front">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="018">018</option>
					</select> - <input type="text" id = "tel-middle" class="input-width-control"> - <input
						type="text" class="input-width-control" id = "tel-last" >
					</td>
				</tr>
				<tr>
					<td colspan="4">배송지 정보</td>
				</tr>
				<tr>
					<td colspan ="4"><input type="text" id="postcode"
						placeholder="우편번호"> <input type="button"
						id="btn-postnum" value="우편번호 찾기"><br></td>
				</tr>
				<tr>			
					<td colspan ="4"><input type="text" id="roadAddress"
						placeholder="도로명주소" ></td>
				</tr>
				<tr>
					<td colspan ="4"><span id="guide" style="color: #999; display: none"></span>
						<input type="text" id="detailAddress" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<td  colspan ="4">이메일 : <input type="text" name="email" id="email"
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
					<td id = "center-btn">
						<button  type ="button" class = "click-btn newAddress-btn">신규 주소<br>저장</button>
					</td>
				</tr>
			</table>
			
            <table id = "order_info">
                <tr>
                    <th>상품 정보</th>
                    <th>수량</th>
                    <th>주문 금액</th>
                    <th>배송 정보</th>
                </tr>
                <c:forEach items = "${orderInfo.productList}" var = "product"> 
                
                <tr id = "p${product.productNo}" data-no ="${product.productNo}">
                    <td>
                        <a href="${pageContext.request.contextPath}/main/productDetal/${product.productNo}">
                            <img src="${pageContext.request.contextPath}/upload/${product.saveName}" class="cart_pd" alt="">
                            <span>${product.productName}</span>
                        </a>
                    </td>
                    <td>
						${product.productEa} 개
                    </td>
                    <td>	총 <fmt:formatNumber type="number" maxFractionDigits="3"
							value="${product.price}" />원
                    </td>
                    <td>
                        <span>무료</span>(택배)
                    </td>
                </tr>
                
                </c:forEach>
                
            </table>
            

          <form action ="${pageContext.request.contextPath}/order/${authCustomer.customerNo}" method = "get">
            <div class="total_order">
                <p class="total">총 주문 금액</span></p>
                <ul>
                    <li>
                        <p class="total_price">
                           <fmt:formatNumber type="number" maxFractionDigits="3" value="${orderInfo.totalPrice}" />원</p>
                    </li>
                </ul>
            </div>
            <div class="btn_wrap">
            		<!-- 원래 a 태그였는데 제출 위해서 변경함 -->
                <button type ="button" class="click-btn" id ="pay-btn">결제하기</button>
            </div>
	      </form>
        </section>


    </main>
  


		<div class="address-form"><!--주소 정보창 반복문으로 돌릴 거임-->
		<div id = "address-title">
				기존 주소록<br>사용하기
		</div>
				<div class ="address-box">
				<div id = "address-Area">
				<c:forEach items ="${addressList}" var ="address">
					<table class= address-table>
						<tr>
							<td class = "address-name">${address.name}</td>
						</tr>
						<tr>
							<td class = "address-tel">${address.tel}</td>
						</tr>
						<tr>
							<td class = "address-postNum">${address.postNum}</td>
						</tr>
						<tr>
							<td class = "address-address">${address.address}</td>
						</tr>
						<tr>
							<td class = "address-addressDetail">${address.addressDetail}</td>
						</tr>
						<tr>
							<td class = "address-email">${address.email}</td>
						</tr>
						
					</table>
					</c:forEach>
					</div>
				</div>

		</div><!--주소 정보창 완료-->
</div>

        <!-- 탑버튼 -->
        <a href="#none" class="top_btn"><img src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png" alt=""></a>
        <!-- /탑버튼 -->
	 	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$('#pay-btn').on("click", function(){
		iamport();

	}); //결제하기 버튼 클릭 이벤트 end


	


	$('.newAddress-btn').on("click", function(){
		console.log('test');
		var inputName = $('#name').val();
		var inputTel = $('#tel-front').val() + $('#tel-middle').val() + $('#tel-last').val()
		var inputPostNum = $('#postcode').val();
		var inputAddress = $('#roadAddress').val();
		var inputDetailAddress  = $('#detailAddress').val()
		var inputEmail = $('#email').val() + '@' + $('#email_domain').val();
		
		/*입력확인*/
		if(inputName.length <2 ){
			alert('필수 정보는 모두 입력하셔야 합니다.');
		}/*정상입력 확인 시 AJAX 진행*/
		else{
			
			
		addressVO = {
				name : inputName
				,tel : inputTel
				,postNum : inputPostNum
				,address : inputAddress
				,addressDetail : inputDetailAddress
				,email : inputEmail
				,customerNo : ${authCustomer.customerNo}
		}
		
		 $.ajax({
	         
	         //요청 세팅
	         url : "${pageContext.request.contextPath}/cart/addAddress",      
	         type : "post", //어차피 내부 요청이라 주소창에 안 나온다.
	         data : addressVO,
	         
	         //응답 관련 세팅
	         dataType : "json",
	         success : function(jsonResult){
	         	if(jsonResult.data == true){
	        	 addAddress(addressVO);	 

	         	}else{
	         		alert('주소저장에 실패했습니다.')
	         	}
	        	 
	         },
	         error : function(XHR, status, error) {
	         console.error(status + " : " + error);
	         }
					            
	      });//ajax end
		
		
		
		}/*주소 입력 else문 end */
	});//신규 주소 저장 버튼 클릭 이벤트 end


	/*기존 주소록에서 주소 클릭 시 클릭된 주소 정보가 자동으로 적히게 되는 스크립트*/
	$('.address-box').on("click", ".address-table", function(){
		var name = $(this).find('.address-name').text();
		var tel = $(this).find('.address-tel').text();
		var postNum = $(this).find('.address-postNum').text();
		var address = $(this).find('.address-address').text();
		var addressDetail = $(this).find('.address-addressDetail').text();
		var email = $(this).find('.address-email').text();
		var emailFront = email.substring(0, email.indexOf('@'));
		var emailBack = email.substring(email.indexOf('@') + 1);
		var tel1 = tel.substring(0,2);
		var tel2 = tel.substring(2,6);
		var tel3 = tel.substring(6);
		console.log(name + emailBack + tel1 + tel2 + tel3);
		
		$('#name').val(name);
		$('#postcode').val(postNum);
		$('#roadAddress').val(address);
		$('#detailAddress').val(addressDetail);
		$('#email').val(emailFront);
		$('#email_domain').val(emailBack);
		$('#tel-front').val(0 + tel1);
		$('#tel-middle').val(tel2);
		$('#tel-last').val(tel3);
		
	}); //address-box 클릭시
	
	
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
	
	function addAddress(addressVO){
		
		var str = "";
		str += "<table class= address-table>";
		str += "<tr>";
		str += "<td class = 'address-name'>" + addressVO.name + "</td>";
		str += "</tr>";
		str += "<tr>";
		str += "<td class = 'address-tel'>" + addressVO.tel + "</td>";
		str += "</tr>";
		str += "<tr>";
		str += "<td class = 'address-postNum'>" + addressVO.postNum + "</td>";
		str += "</tr>";
		str += "<tr>";
		str += "<td class = 'address-address'>" + addressVO.address + "</td>";	
		str += "</tr>";
		str += "<tr>";
		str += "<td class = 'address-addressDetail'>" +addressVO.addressDetail + "</td>";	
		str += "</tr>";
		str += "<tr>";
		str += "<td class = 'address-email'>" + addressVO.email +  "</td>";	
		str += "</tr>";
		str += "</table>";

		
		$('#address-Area').prepend(str);
	}
	
	/*결제용 function*/
	function iamport(){
		//가맹점 식별코드
		var orderNo = $('#orderNo').data('orderno');
		IMP.init('imp85336870');
		
		
		IMP.request_pay({
		    pg : 'danal_tpay',
		    pay_method : 'card',
		    merchant_uid : orderNo,
		    name : 'test용' , //결제창에서 보여질 이름
		    amount : 100, //실제 결제되는 가격
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울 강남구 도곡동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	alert('결제가 완료되었습니다.');
		    	/*AJAX처리하고 메인으로 이동해야함*/
		    			         
		         orderVO = {
		        		 orderNo : orderNo,
		        		 customerNo : ${authCustomer.customerNo}
		         }
		         
		         console.log(orderVO);
		         
				 $.ajax({
			         
			         //요청 세팅
			         url : "${pageContext.request.contextPath}/payment/paymentSuccess",      
			         type : "post", //어차피 내부 요청이라 주소창에 안 나온다.
			         data : orderVO,
			         
			         //응답 관련 세팅
			         dataType : "json",
			         success : function(jsonResult){
						
			        	 window.location.href = "${pageContext.request.contextPath}/main/";
			        	 
			         },
			         error : function(XHR, status, error) {
			         console.error(status + " : " + error);
			         }
							            
			      });//ajax end
		    	
		    	
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    	 alert(msg);

		    }//else end
		}); //request_pay end
	}//function end
	
</script>

</html>