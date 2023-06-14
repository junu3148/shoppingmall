<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script type="${pageContext.request.contextPath }/assets/text/javascript" src="js/script3.js"></script> <!-- js -->
</head>

<body>



    <!-- 헤더 -->
    <header class="pc"> <!--웹에서의 헤더-->
        <div id="lnb">
            <ul class="lnb">
                <li class="login"><a href="#none">로그인</a></li>
                <li class="cart"><a href="#none">장바구니</a></li>
                <li class="search"><a href="#none">검색</a></li>
                <li class="notice"><a href="#none">커뮤니티</a></li>
            </ul>
        </div>
        <div id="header">
            <h1><a href="#none">로고이미지</a></h1>
            <!-- 메뉴 (gnb) -->
            <ul id="nav">
                <li class="on"><a href="#none">All</a></li>
                <li><a href="#none">사료</a></li>
                <li><a href="#none">간식</a></li>
                <li><a href="#none">미용</a></li>
                <li><a href="#none">장난감</a></li>
                <li><a href="#none">가구</a></li>
            </ul>
            <!-- /메뉴 (gnb) -->
        </div>
    </header>

    <header class="mo"> <!--테블릿/모바일에서의 헤더-->
        <h1><a href="#none">로고이미지</a></h1>
        <input type="checkbox" id="icon">
        <label for="icon"> 
            <span></span>
            <span></span>
            <span></span>
        </label>
        <div id="header">
            <h1><a href="#none">로고이미지</a></h1>
            <p class="who">로그인이 필요합니다.</p><!-- 사용자 로그인 시 ooo(id)님 으로 변경 -->
            <ul class="top_menu clear">
                <li class="login"><a href="#none">로그인</a></li><!-- 사용자 로그인 시 로그아웃으로 변경 -->
                <li class="join"><a href="#none">회원가입</a></li><!-- 사용자 로그인 시 마이페이지로 변경 -->
            </ul>
            <ul class="icon_menu">
                <li class="search"><a href="#none"><img src="${pageContext.request.contextPath }/assets/images/search.png" alt="">검색</a></li>
                <li class="cart"><a href="#none"><img src="${pageContext.request.contextPath }/assets/images/cart.png" alt="">장바구니</a></li>
                <li class="cart"><a href="#none"><img src="${pageContext.request.contextPath }/assets/images/search.png" alt="">??</a></li>
                <li class="cart"><a href="#none"><img src="${pageContext.request.contextPath }/assets/images/search.png" alt="">??</a></li>
            </ul>
            <ul class="middle_menu">
                <li class="dir"><a href="#none" class="en">All</a></li>
                <li>
                    <a href="#none" class="en">DOG</a>
                    <ul>
                        <li><a href="#none">사료</a></li>
                        <li><a href="#none">간식</a></li>
                        <li><a href="#none">미용</a></li>
                        <li><a href="#none">장난감</a></li>
                        <li><a href="#none">가구</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#none" class="en">CAT</a>
                    <ul>
                        <li><a href="#none">사료</a></li>
                        <li><a href="#none">간식</a></li>
                        <li><a href="#none">미용</a></li>
                        <li><a href="#none">장난감</a></li>
                        <li><a href="#none">가구</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#none" class="en">COMMUNITY</a>
                    <ul>
                        <li><a href="#none">공지사항</a></li>
                        <li><a href="#none">FAQ</a></li>
                        <li><a href="#none">Q&A</a></li>
                        <li><a href="#none">이벤트</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </header>
    <!-- /헤더 -->

    <main id="pd_detail">
        
        <section class="detail_wrap clear">
            <div class="img_wrap">
                <img src="https://cdn.imweb.me/thumbnail/20210402/deeb895a674e3.jpg" alt="">
            </div>
            <div class="info_wrap">
                <div class="title">
                    <h4>선문밥그릇</h4>
                    <p>42,000원</p>
                </div>
                <div>
                    <p class="context">
                        선문라인의 선문밥그릇은 뚜껑을 포함한 제품입니다.
                        뚜껑상단의 원형홈과 청화의 간결한 한줄 선이 잘어우러 지는 밥그릇으로 
                        아래부분의 바닥이 넓어 안정적이고 풍성한 형태미를 갖추고 있습니다. 
                    </p>
                    <ul>
                        <li class="clear">
                            <strong>사이즈</strong>
                            <span>선문밥그릇 105x75mm / 300cc</span>
                        </li>
                        <li class="clear">
                            <strong>배송 방법</strong>
                            <span>택배비</span>
                        </li>
                        <li class="clear">
                            <strong>배송비</strong>
                            <span>2,500원 (50,000원 이상 구매 시 무료)</span>
                        </li>
                        <li class="clear">
                            <strong>배송 안내</strong>
                            <span class="delivery_context">
                                청송백자는 경북 청송의 한적한 산골에서 제작하고 있는 지리적 특성으로 일반택배와 달리 조금 느리게 보내드릴 수 밖에 없습니다. 청송백자만의 느린 배송을 여유로운 마음으로 이해해 주시면 감사하겠습니다.
                            </span>
                        </li>
                    </ul>

                    <div class="pd_num clear">
                        <p>수량</p>
                        <div class="count-wrap _count">
                            <button type="button" class="minus">-</button>
                            <input type="text" class="inp" value="1" />
                            <button type="button" class="plus">+</button>
                        </div>
                        <span>42,000원</span>
                    </div>

                    <div class="total_price_wrap">
                        <p>총 상품금액(<span>1</span>개)</p>
                        <p class="total_price">42,000원</p>
                    </div>

                    <div class="btn_wrap">
                        <a href="#none" class="order_btn">구매하기</a>
                        <a href="#none" class="shopping_btn">장바구니</a>
                    </div>
                    
                    
                </div>
            </div>
        </section>
        

        



        <!-- 탑버튼 -->
        <a href="#none" class="top_btn"><img src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png" alt=""></a>
        <!-- /탑버튼 -->

    </main>

    <!-- 푸터 -->
    <footer>
        <div id="footer" class="clear">
            <div class="logo"><img src="${pageContext.request.contextPath }/assets/images/ver02/logo_blue.png"></div>
            <div class="customer">
                <h4>고객센터</h4>
                <p class="tel">054-873-7749</p>
                <p class="time">
                    화~일 : AM 10:00 ~ PM 05:00 (점심시간 : PM 12:00 ~ PM 01:00)<br>
                    매주 월요일 / 1월1일 / 설날·추석 당일 휴무
                </p>
                <p></p>
            </div>
            <div class="address">
                <h4>반품주소 안내</h4>
                <p>경북 청송군 주왕산면 주왕산로 494 청송백자전수관</p>
            </div>
        </div>

        <div class="footer">
            <p>copyright</p>
        </div>
    </footer>
    <!-- /푸터 -->
    





</body>

</html>