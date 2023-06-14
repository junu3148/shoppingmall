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

    <main id="product">
        <section id="kv">
            
        </section>

        <ul class="category">
            <li class="on"><a href="#none">전체</a></li>
            <li><a href="#none">강아지</a></li>
            <li><a href="#none">고양이</a></li>
        </ul>

        <section>
            <ul>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
                <li>
                    <a href="#none">
                        <img src="${pageContext.request.contextPath }/assets/images/sns01.jpg">
                        <span class="tit">전통라인 잎새문 다기 세트</span>
                        <span class="price">20,000원</span>
                    </a>
                </li>
            </ul>
        </section>

        <ul class="paging">
            <li class="first"><a href="#none"></a></li>
            <li class="pre"><a href="#none"></a></li>
            <li class="on"><a href="#none">1</a></li>
            <li><a href="#none">2</a></li>
            <li><a href="#none">3</a></li>
            <li><a href="#none">4</a></li>
            <li><a href="#none">5</a></li>
            <li><a href="#none">6</a></li>
            <li><a href="#none">7</a></li>
            <li><a href="#none">8</a></li>
            <li><a href="#none">9</a></li>
            <li><a href="#none">10</a></li>
            <li class="next"><a href="#none"></a></li>
            <li class="last"><a href="#none"></a></li>
        </ul>



        <!-- 탑버튼 -->
        <a href="#none" class="top_btn"><img src="${pageContext.request.contextPath }/assets/images/ver02/top_btn.png" alt=""></a>
        <!-- /탑버튼 -->

    </main>

    <!-- 푸터 -->
  		<!-- header -->
		<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
		<!-- //header -->
    <!-- /푸터 -->
    





</body>

</html>