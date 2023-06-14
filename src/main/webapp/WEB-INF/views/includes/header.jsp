<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    


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
                <li class="search"><a href="#none"><img src="images/search.png" alt="">검색</a></li>
                <li class="cart"><a href="#none"><img src="images/cart.png" alt="">장바구니</a></li>
                <li class="cart"><a href="#none"><img src="images/search.png" alt="">??</a></li>
                <li class="cart"><a href="#none"><img src="images/search.png" alt="">??</a></li>
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