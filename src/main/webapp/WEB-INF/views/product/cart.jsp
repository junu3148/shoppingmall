<!-- 카트 jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">

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
</head>

<body>
  
  	<!-- 헤더 -->
	<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
	<!-- //헤더 -->
  

    <main id="cart">
        
        <section class="pc">
            <h3>장바구니</h3>

            <table>
                <tr>
                    <th><label for="cbx_chkAll"><input type="checkbox" id="cbx_chkAll" /></label></th>
                    <th>상품 정보</th>
                    <th>수량</th>
                    <th>주문 금액</th>
                    <th>배송 정보</th>
                </tr>
                
                <c:forEach items = "${cartList}" var = "product"> 
                
                <tr id = "p${product.productNo}" data-no ="${product.productNo}">
                    <td><label for="check01"><input type="checkbox" name="chk" id="check01" ></label></td>
                    <td>
                   <input type ="hidden" name  ="product_price" value ="${product.price}">
                        <a href="${pageContext.request.contextPath}/main/productDetal/${product.productNo}">
                            <img src="${pageContext.request.contextPath}/upload/${product.saveName}" class="cart_pd" alt="">
                            <span>${product.productName}</span>
                        </a>
                    </td>
                    <td>
                        <div class="count-wrap _count">
                            <button type="button" class="minus">-</button>
                            <input type="text"  class="inp"  name = "product_count" value="${product.productEa}"/>
                            <button type="button" class="plus">+</button>
                        </div>
                    </td>
                    <td>					
                        <span title = "order-price"><fmt:formatNumber type="number" maxFractionDigits="3"
							value="${product.price * product.productEa}" />원</span>
                    </td>
                    <td>
                        <span>무료</span>(택배)
                    </td>
                </tr>
                
                </c:forEach>
                
            </table>

            <a href="#none" class="del">선택 상품 삭제</a>
            

          <form action ="${pageContext.request.contextPath}/order/${authCustomer.customerNo}" method = "get">
            <div class="total_order">
                <p class="total">총 주문 상품 <span id = "total_ea">0개</span></p>
                <ul>
                    <li>
                        <p class = "total_price">0원</p>
                        <span>상품 금액</span>
                    </li>
                    <li><p>+</p></li>
                    <li>
                        <p>0원</p>
                        <span>배송비</span>
                    </li>
                    <li><p>=</p></li>
                    <li>
                        <p class="total_price">0원</p>
                        <span>총 주문 금액</span>
                        <input type="text" name = "totalPrice">
                    </li>
                </ul>
            </div>
            <div class="btn_wrap">
            		<!-- 원래 a 태그였는데 제출 위해서 변경함 -->
                <a class="order_btn" id = "order_btn">주문하기</a>
                <a href="#none" class="shopping_btn">쇼핑하기</a>
            </div>
	      </form>
        </section>





        



        <!-- 탑버튼 -->
        <a href="#none" class="top_btn"><img src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png" alt=""></a>
        <!-- /탑버튼 -->

    </main>

 	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->


</body>

<script>

/*주문하기 버튼 눌리면*/
$('#order_btn').on("click", function(){
	
		var productList = [];
	
	/*값을 가져감*/
	 $('input[name="chk"]:checked').each(function() {

		 var productEa =  parseInt($(this).closest('tr').find('input[name = "product_count"]').val());
		 var price =  parseInt($(this).closest('tr').find('input[name  ="product_price"]').val());
		 var productPrice = price*productEa;
		 var productNo =  parseInt($(this).closest('tr').data('no'));
  
		 console.log(productEa +' 와 ' + productNo + '가격값 :' + productPrice);
		 
		 /*productNo, productEA, product total price */
		 var ProductVO = {
				 productNo : productNo,
				 productEa : productEa,
				 price : productPrice 
		 }
		 
		 
		 productList.push(ProductVO);
		 

	 });//값 받아오기
	
	 /* 객체 배열을 JSON으로 받기 위한 메서드 --> 배열을 String 으로 변환하기에 controller에서 string으로 받아야 함*/
	 var ProductData = JSON.stringify(productList);
	    jQuery.ajaxSettings.traditional = true;
	 
	 $.ajax({
         
         //요청 세팅
         url : "${pageContext.request.contextPath}/cart/addOrder",      
         type : "post",
         data : {"jsonData" : ProductData},
         
         //응답 관련 세팅
         dataType : "json",
         success : function(jsonResult){
         
			if(jsonResult.data == true){
				window.location.href = "${pageContext.request.contextPath}/cart/orderPage/${authCustomer.customerNo}";
			}
        	 
         },
         error : function(XHR, status, error) {
         console.error(status + " : " + error);
         }
				            
      });//ajax end
}); //주문하기 버튼 클릭 end

$('.del').on("click", function(){
    /* 총 주문 금액 업데이트하는 식*/
  	var productNoList = [];
  
  $('input[name="chk"]:checked').each(function() {
    var tr = $(this).closest('tr');
    var productNo = parseInt(tr.data('no'));
	
	/* 선택된 제품의 금액과 수량 체크*/
    productNoList.push(productNo);
 	console.log(productNoList);
 	
 	
  }); //체크된 체크 박스 값 가져오기

 	for(var i=0; i<productNoList.length; i++ ){
 		
 		var productNo = productNoList[i];
 		
 		CartVO = { 
 			customerNo : ${authCustomer.customerNo},
 			productNo : productNo
 		}
 		
 		console.log(CartVO)
 		
 		 $.ajax({
	            
	            //요청 세팅
	            url : "${pageContext.request.contextPath}/cart/deleteList",      
	            type : "post", //어차피 내부 요청이라 주소창에 안 나온다.
	            data : CartVO,
	            
	            //응답 관련 세팅
	            dataType : "json",
	            success : function(jsonResult){
	            
	            	var data = jsonResult.data;
					console.log(data)
					if(data == true ){ 
						alert('선택한 상품을 삭제했습니다.')
						$('#p'+CartVO.productNo).remove();
					}else{
						alert('잠시후 다시 시도해주세요.')
					}
	            },
	            error : function(XHR, status, error) {
	            console.error(status + " : " + error);
	            }
					            
	         });//ajax end
 	}; //반복문 수행
});// 선택 상품 삭제 버튼 클릭 이벤트



$("#cbx_chkAll").click(function() {
  if($("#cbx_chkAll").is(":checked")) {
    $("input[name=chk]").prop("checked", true);
    updateValues();
  } else {
    $("input[name=chk]").prop("checked", false);
    updateValues();
  }
});

$("input[name=chk]").click(function() {
  var total = $("input[name=chk]").length;
  var checked = $("input[name=chk]:checked").length;
  
  if(total != checked) {
    $("#cbx_chkAll").prop("checked", false);
    updateValues();
  } else {
    $("#cbx_chkAll").prop("checked", true);
    updateValues();
  }
});



   //장바구니페이지 수량 체크
    //수량 체크하여 해당하는 제품 가격을 구해와 다시 값에 넣을 예정
    $('._count :button').on({
      'click' : function(e){
          e.preventDefault();
          var $count = $(this).parent('._count').find('.inp');
          var now = parseInt($count.val());
          var min = 1;
          var max = 999;
          var num = now;
          if($(this).hasClass('minus')){
              var type = 'm';
          }else{
              var type = 'p';
          }
          if(type=='m'){
              if(now>min){
                  num = now - 1;
              }
          }else{
              if(now<max){
                  num = now + 1;
              }
          }
          if(num != now){
              $count.val(num);
          }
          
           var hiddenValue = $(this).closest('tr').find('input[type="hidden"]').val(); //가격 가져오기
          
          var setPrice = hiddenValue * num;
          $(this).closest('tr').find('span[title="order-price"]').text(setPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',')+ '원');
  
  			updateValues();
      }
    });
    

/* 총 주문 금액 업데이트하는 식*/
function updateValues() {
var quantities = [];
var prices = [];

$('input[name="chk"]:checked').each(function() {
var checkbox = $(this);
var row = checkbox.closest('tr');
var hiddenValue = row.find('input[type="hidden"]').val();
var inputValue = row.find('input[type="text"]').val();
quantity = parseInt(inputValue);
price = parseInt(hiddenValue);
totalprice = price * quantity;


/* 선택된 제품의 금액과 수량 체크*/
quantities.push(quantity);
prices.push(totalprice);   
});


var totalQuantity = quantities.reduce(function(acc, val) {
return acc + val;
}, 0);

var totalPrice = prices.reduce(function(acc, val) {
return acc + val;
}, 0);


$('.total_price').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',') + "원");
$('[name = "totalPrice"]').val(totalPrice);
$('#total_ea').text(totalQuantity + "개");
}


</script>


</html>