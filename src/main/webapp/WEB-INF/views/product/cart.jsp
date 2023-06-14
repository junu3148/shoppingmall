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
                <tr>
                    <td><label for="check01"><input type="checkbox" name="chk" id="check01"></label></td>
                    <td>
                        <a href="#none">
                            <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg" class="cart_pd" alt="">
                            <span>전통라인 잎새문 다기 세트</span>
                        </a>
                    </td>
                    <td>
                        <div class="count-wrap _count">
                            <button type="button" class="minus">-</button>
                            <input type="text" class="inp" value="1" />
                            <button type="button" class="plus">+</button>
                        </div>
                    </td>
                    <td>
                        <p>152,000원</p>
                    </td>
                    <td>
                        <span>무료</span>(택배)
                    </td>
                </tr>
                <tr>
                    <td><label for="check02"><input type="checkbox" name="chk" id="check02"></label></td>
                    <td>
                        <a href="#none">
                            <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg" class="cart_pd" alt="">
                            <span>전통라인 잎새문 다기 세트</span>
                        </a>
                    </td>
                    <td>
                        <div class="count-wrap _count">
                            <button type="button" class="minus">-</button>
                            <input type="text" class="inp" value="1" />
                            <button type="button" class="plus">+</button>
                        </div>
                    </td>
                    <td>
                        <p>152,000원</p>
                    </td>
                    <td>
                        <span>무료</span>(택배)
                    </td>
                </tr>
            </table>

            <a href="#none" class="del">선택 상품 삭제</a>
            

            <div class="total_order">
                <p class="total">총 주문 상품 <span>1</span>개</p>
                <ul>
                    <li>
                        <p>15,200원</p>
                        <span>상품 금액</span>
                    </li>
                    <li><p>+</p></li>
                    <li>
                        <p>0원</p>
                        <span>배송비</span>
                    </li>
                    <li><p>=</p></li>
                    <li>
                        <p class="total_price">15,200원</p>
                        <span>총 주문 금액</span>
                    </li>
                </ul>
            </div>
            <div class="btn_wrap">
                <a href="#none" class="order_btn">주문하기</a>
                <a href="#none" class="shopping_btn">쇼핑하기</a>
            </div>
        </section>

        <section class="mo">
            <h3>장바구니</h3>

            
            <div class="line_01 clear">
                <div>
                    <input type="checkbox" id="cbx_chkAll_m" /><label for="cbx_chkAll_m">전체선택</label>
                </div>
                <a href="#none" class="del">선택상품 삭제</a>
            </div>
            <div class="pd_01">
                <div class="line_02">
                    <label for="check01_m"><input type="checkbox" name="chk_m" id="check01_m"></label>
                    <br>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg" class="cart_pd" alt="">
                        <span>전통라인 잎새문 다기 세트</span>
                    </a>

                    <table>
                        <tr class="pd_price">
                            <td>주문금액</td>
                            <td>152,000원</td>
                        </tr>
                        <tr class="pd_num">
                            <td>상품갯수</td>
                            <td>
                                <div class="count-wrap _count">
                                    <button type="button" class="minus">-</button>
                                    <input type="text" class="inp" value="1" />
                                    <button type="button" class="plus">+</button>
                                </div>
                            </td>
                        </tr>
                        <tr class="pd_price">
                            <td>상품금액</td>
                            <td>152,000원</td>
                        </tr>
                        <tr class="delivery">
                            <td>배송비</td>
                        <td>무료</td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="pd_02">
                <div class="line_02">
                    <label for="check02_m"><input type="checkbox" name="chk_m" id="check02_m"></label>
                    <br>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg" class="cart_pd" alt="">
                        <span>전통라인 잎새문 다기 세트</span>
                    </a>

                    <table>
                        <tr class="pd_price">
                            <td>주문금액</td>
                            <td>152,000원</td>
                        </tr>
                        <tr class="pd_num">
                            <td>상품갯수</td>
                            <td>
                                <div class="count-wrap _count">
                                    <button type="button" class="minus">-</button>
                                    <input type="text" class="inp" value="1" />
                                    <button type="button" class="plus">+</button>
                                </div>
                            </td>
                        </tr>
                        <tr class="pd_price">
                            <td>상품금액</td>
                            <td>152,000원</td>
                        </tr>
                        <tr class="delivery">
                            <td>배송비</td>
                        <td>무료</td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <table>
                <tr class="pd_price">
                    <td>상품금액 (총<span>1</span>개)</td>
                    <td>152,000원</td>
                </tr>
                <tr class="delivery">
                    <td>배송비</td>
                    <td>무료</td>
                </tr>
                <tr class="total">
                    <td>총 주문금액</td>
                    <td>152,000원</td>
                </tr>
            </table>

            <div class="btn_wrap">
                <a href="#none" class="order_btn">주문하기</a>
                <a href="#none" class="shopping_btn">쇼핑하기</a>
            </div>
            

            
        </section>

        



        <!-- 탑버튼 -->
        <a href="#none" class="top_btn"><img src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png" alt=""></a>
        <!-- /탑버튼 -->

    </main>

 	<!-- Footer -->
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- //Footer -->




</body>

</html>