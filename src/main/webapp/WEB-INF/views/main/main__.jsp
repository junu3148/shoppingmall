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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/style.css" type="text/css"> <!-- 공통부분 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/main.css" type="text/css"> <!-- 메인 css -->

    <script src="http://code.jquery.com/jquery-latest.min.js"></script> <!-- 제이쿼리 최신버전 js -->
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script> <!-- 스와이퍼 js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script> <!-- 슬릭슬라이더 js -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/script.js"></script> <!-- js -->

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
                <li><a href="#none">전체메뉴</a></li>
                <li><a href="#none">사료</a></li>
                <li><a href="#none">간식</a></li>
                <li><a href="#none">미용</a></li>
                <li><a href="#none">장난감/스크래쳐</a></li>
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
            <ul>
                <li><a href="#none">로그인</a></li>
                <li><a href="#none">장바구니</a></li>
                <li><a href="#none">검색</a></li>
                <li><a href="#none">커뮤니티</a></li>
            </ul>
            <ul>
                <li><a href="#none">전체메뉴</a></li>
                <li><a href="#none">사료</a></li>
                <li><a href="#none">간식</a></li>
                <li><a href="#none">미용</a></li>
                <li><a href="#none">장난감/스크래쳐</a></li>
                <li><a href="#none">가구</a></li>
            </ul>
        </div>
    </header>
    <!-- /헤더 -->

    <main>
        <!-- 메인 롤링배너 (KV) -->
        <div class="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide banner01"><a href="#none"></a></div>
                <div class="swiper-slide banner02"><a href="#none"></a></div>
                <div class="swiper-slide banner03"><a href="#none"></a></div>
            </div>

            <div class="swiper-pagination"></div>

            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
        <!-- /메인 롤링배너 (KV) -->

        <!-- 베스트셀러 -->
        <section id="best_seller">
            <h2 class="en">best seller</h2>
            <div class="best_kv">
                <h3>자연으로 빚은 그릇 <span>청송백자</span></h3>
                <p>
                    오백년 전통의 생활자기라는 가치를 계승하며 과거 청송백자의 형태에서<br>
                    착안한 디자인으로 현대인들의 식탁에서도 자연스럽게 어우러지는 기품 있는<br>
                    생활 자기로 거듭나고 있습니다.
                </p>
            </div>
            <div id="best_seller_div">
                <div class="cont">
                    <a href="#none">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/168231592390378275.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" alt="">
                        <span class="tit">반려동물 대리석</span>
                        <span class="price">30,000원</span>
                    </a>
                </div>   
                <div class="cont">
                    <a href="#none">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/168231592390378275.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" alt="">
                        <span class="tit">반려동물 대리석</span>
                        <span class="price">30,000원</span>
                    </a>
                </div>  
                <div class="cont">
                    <a href="#none">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/168231592390378275.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" alt="">
                        <span class="tit">반려동물 대리석</span>
                        <span class="price">30,000원</span>
                    </a>
                </div>  
                <div class="cont">
                    <a href="#none">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/168231592390378275.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" alt="">
                        <span class="tit">반려동물 대리석</span>
                        <span class="price">30,000원</span>
                    </a>
                </div>  
                <div class="cont">
                    <a href="#none">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/168231592390378275.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" alt="">
                        <span class="tit">반려동물 대리석</span>
                        <span class="price">30,000원</span>
                    </a>
                </div>  
                <div class="cont">
                    <a href="#none">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/168231592390378275.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" alt="">
                        <span class="tit">반려동물 대리석</span>
                        <span class="price">30,000원</span>
                    </a>
                </div>  
                <div class="cont">
                    <a href="#none">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/168231592390378275.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" alt="">
                        <span class="tit">반려동물 대리석</span>
                        <span class="price">30,000원</span>
                    </a>
                </div>  
                <div class="cont">
                    <a href="#none">
                        <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/168231592390378275.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" alt="">
                        <span class="tit">반려동물 대리석</span>
                        <span class="price">30,000원</span>
                    </a>
                </div>  
            </div>
        </section>
        <!-- /베스트셀러 -->

        <!-- SNS -->
        <section id="sns" class="en">
            <h2>sns</h2>
            <ul class="clear">
                <li><a href="#none"><img src="${pageContext.request.contextPath }/assets/images/sns01.jpg" alt=""></a></li>
                <li><a href="#none"><img src="${pageContext.request.contextPath }/assets/images/sns02.jpg" alt=""></a></li>
                <li><a href="#none"><img src="${pageContext.request.contextPath }/assets/images/sns03.jpg" alt=""></a></li>
                <li><a href="#none"><img src="${pageContext.request.contextPath }/assets/images/sns04.jpg" alt=""></a></li>
                <li><a href="#none"><img src="${pageContext.request.contextPath }/assets/images/sns05.jpg" alt=""></a></li>
            </ul>
        </section>
        <!-- /SNS -->

        <a href="#none" class="top_btn">Top</a>

    </main>


    <footer>
        <div id="footer" class="clear">
            <div class="logo"><img src="${pageContext.request.contextPath }/assets/images/logo.png"></div>
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
    





</body>

</html>