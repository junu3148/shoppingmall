<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/kr/event/common/event_promotion_common.css" />
<link rel="stylesheet" href="/kr/event/common/css/swiper.css" />
<script src="/kr/event/common/js/library/swiper-bundle.min.js"></script>
<div class="event-benefit-template">
    <style type="text/css">
        .event-benefit-template .summary-visual,
        .event-benefit-template .summary-visual .notice {
            position: relative;
        }

        .event-benefit-template .summary-visual img {
            width: 100%;
            image-rendering: -moz-crisp-edges;
            image-rendering: -o-crisp-edges;
            image-rendering: -webkit-optimize-contrast;
            image-rendering: crisp-edges;
        }

        .event-benefit-template .summary-visual .btn_area {
            position: relative;
            overflow: hidden;
        }

        .event-benefit-template .summary-visual .btn_area a {
            display: block;
            position: absolute;
        }

        /* tab_wrap */
        .event-benefit-template .summary-visual .tab_wrap {
            position: relative;
            overflow: hidden;
            z-index: 5;
        }

        .event-benefit-template .summary-visual .tab_wrap ul {
            position: absolute;
            top: 0;
            left: 50%;
            width: 94.1%;
            height: 100%;
            transform: translateX(-50%);
        }

        .event-benefit-template .summary-visual .tab_wrap li {
            float: left;
            width: calc(100% / 3);
            max-width: 460px;
            height: 100%;
        }

        .event-benefit-template .summary-visual .tab_wrap li a {
            width: 100%;
            height: 100%;
            display: block;
        }

        .event-benefit-template .summary-visual .tab_wrap li.active {
            background: url('https://www.lge.co.kr/kr/event/2023/06/02_stanby_me/images/tab_on.png') no-repeat 4.3% 0;
            background-size: cover;
        }

        .event-benefit-template .summary-visual .tab_wrap li:nth-child(2).active {
            background-position-x: 50%;
        }

        .event-benefit-template .summary-visual .tab_wrap li:nth-child(3).active {
            background-position-x: 95.7%;
        }


        .content_wrap {position: relative;}
        .btn01{position: absolute; width: 22.8%; height: 7%; top: 82.1%; left: 24%;}
        .btn02{position: absolute; width: 22.8%; height: 7%; top: 82.1%; left: 53.2%;}

       

        /* slide-mobile common */
        .slide-mobile {
            display: none;
        }

        @media screen and (max-width: 767px) {
            .event-benefit-template .summary-visual img {
                width: 100%;
            }

            .event-benefit-template .summary-visual .tab_wrap ul {
                position: absolute;
                top: 0;
                left: 0%;
                width: 100%;
                height: 100%;
                transform: translateX(0%);
            }

            /* tab_wrap : tab scroll common */
            .event-benefit-template .summary-visual .tab_wrap li.active {
                background: url('https://www.lge.co.krhttps://wwwstg.lge.co.kr/kr/event/2023/06/02_stanby_me/images/tab_on_m.png') 0 0 no-repeat;
                background-size: cover;
            }

            .event-benefit-template .summary-visual .tab_wrap li:nth-child(2).active {
            background-position-x: 50%;
            }

            .event-benefit-template .summary-visual .tab_wrap li:nth-child(3).active {
                background-position-x: 100%;
            }

            

            .event-benefit-template .summary-visual .tab_wrap.tab_fixed .tab_inner {
                padding: 0;
            }

            .event-benefit-template .summary-visual .tab_wrap.tab_fixed ul {
                left: 0;
                width: 100%;
            }

            /* slide-mobile common */
            .slide-mobile {
                display: block;
            }

            .swiper-wrapper{height: auto;}

            .event-benefit-template .swiper-new.slide-2-pc .swiper-wrapper .swiper-slide > div,
            .event-benefit-template .swiper-new.slide-1-pc .swiper-wrapper .swiper-slide > div {
                width: 100%;
                max-width: 657px;
            }

            .event-benefit-template .swiper-new .swiper-pagination {
                bottom: 11.25vw;
            }

            .event-benefit-template .swiper-new.slide-2-pc .swiper-wrapper .swiper-slide,
            .event-benefit-template .swiper-new.slide-2-pc .swiper-wrapper .swiper-slide:nth-child(2n),
            .event-benefit-template .swiper-new .swiper-wrapper .swiper-slide {
                margin-bottom: 6.944vw;
                padding: 0 4.72vw;
            }

            .event-benefit-template .swiper_btn_wrap {
                position: absolute;
                left: 49.9%;
                top: 44%;
                transform: translate(-50%);
                z-index: 100;
            }

            .event-benefit-template .swiper-new.slide-2-pc .swiper_btn_wrap,
            .event-benefit-template .swiper-new.slide-1-pc .swiper_btn_wrap {
                margin-top: -3.333vw;
                width: 100%;
            }

            .event-benefit-template .swiper_btn_wrap > div {
                position: relative;
                width: 100%;
            }

            .event-benefit-template .swiper-button-next,
            .event-benefit-template .swiper-button-prev {
                width: 6.67vw;
                height: 6.67vw;
                border-radius: 50%;
                box-shadow: 2px 4px 16px 0 rgb(0 0 0 / 14%);
            }

            .event-benefit-template .swiper-container-horizontal > .swiper-pagination-bullets .swiper-pagination-bullet {
                margin: 0 2.222vw 0 0;
                width: 2.222vw;
                height: 2.222vw;
                border-radius: 50%;
                background-color: #aaaaaa;
            }

            .event-benefit-template .swiper-container-horizontal > .swiper-pagination-bullets .swiper-pagination-bullet:last-child {
                margin: 0;
            }

            .event-benefit-template .swiper-container-horizontal > .swiper-pagination-bullets .swiper-pagination-bullet.swiper-pagination-bullet-active {
                width: 5vw;
                height: 2.222vw;
                border-radius: 2.222vw;
                background-color: #333333;
            }

            /* event_01_slide */
            .event-benefit-template .event_01_slide .swiper-slide {
                background-color: #ffecf2;
            }

            .event-benefit-template .event_01_slide .swiper-new {
                padding-bottom: 15.12vw;
                background-color: #ffecf2;
            }

            /* tab02 */
            .event-benefit-template .summary-visual .btn_area [class*='product_btn_pc_'] {
                display: none;
            }

            .event-benefit-template .summary-visual .btn_area [class*='product_btn_mo_'] {
                display: block;
                width: 83.3%;
                height: 8.9%;
                left: 8.3%;
                top: 85.4%;
            }

            /* event_02_slide */
            .event-benefit-template .event_02_slide .swiper-slide {
                background-color: #ffecf2;
            }

            .event-benefit-template .event_02_slide .swiper-new {
                padding-bottom: 15.12vw;
                background-color: #ffecf2;
            }

            /* tab03 */
            .event-benefit-template .summary-visual .btn_area [class*='event_btn_pc_'] {
                display: none;
            }

            .event-benefit-template .summary-visual .btn_area [class*='event_btn_mo_'] {
                display: block;
                width: 100%;
                height: 10.7%;
                left: 0;
                top: 89.3%;
            }

            .event-benefit-template .summary-visual .btn_area .event_btn_mo_02 {
                height: 7.5%;
            }

            /* event_03_slide */
            .event-benefit-template .event_03_slide .swiper-slide {
                background-color: #a7dde0;
            }

            .event-benefit-template .event_03_slide .swiper-new {
                padding-bottom: 14.34vw;
                background-color: #a7dde0;
            }

            .btn_area{position: relative;}
            .btn_m{position: absolute; top:85%; left: 9%; width: 82%; height: 10%;}
        }
    </style>
    <div class="summary-visual" style="position: relative">
        <div id="uptop" style="max-width: 1380px; width: 100%; margin: 0 auto">
            <div id="event_visual" class="event_visual">
                <img src="/kr/event/2023/06/09_LG_UP_DAY/images/event_visual.png" class="pc" alt="하단 참조" />
                <img src="/kr/event/2023/06/09_LG_UP_DAY/images/event_visual_m.png" class="mobile" alt="하단 참조" />
                <div class="blind">
                    <h3>9일 19일 29일에 만나는</h3>
                    <h2>LG UP DAY</h2>
                    <h3>가격도 상품도 더 특별한 혜택 릴레이!</h3>
                    <p>2023.6.1~6.30</p>
                </div>
            </div>

            
            <div class="container">
                <div class="content_wrap content01">
                    <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont01.png" class="pc" alt="하단 참조" />
                    <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont01_m.png" class="mobile" alt="하단 참조" />
                    <div class="blind">
                        <h3>LG UP DAY</h3>
                        <h3>9일은 맛있게 UP~</h3>
                        <ul>
                            <li>
                                <p>LG 디오스 오브제컬렉션 식기세척기</p>
                                <p>DUBJ4HL</p>
                                <p>
                                    판매가 1,260,000원
                                    7% 청구할인 88,200원
                                    포토 리뷰 작성 시 
                                    Aesop 레저렉션 아로마틱 핸드 밤 증정
                                    최대 혜택가 1,171,800원
                                    12개월 할부 시 월 97,700원
                                </p>
                            </li>
                            <li>
                                <p>LG 디오스 오브제컬렉션 광파오븐</p>
                                <p>MLJ39WW</p>
                                <p>
                                    판매가 594,000원
                                    xmrrk 399,000원
                                    포토 리뷰 작성 시 
                                    Aesop 핸드워시 500ml 증정
                                </p>
                            </li>
                        </ul>
                    </div>
                    <a href="/dishwashers/dubj4hl" class="btn01 pc"><span class="blind">식기세척기 제품보기</span></a>
                    <a href="/microwaves-and-ovens/mlj39ww" class="btn02 pc"><span class="blind">광파오븐 제품보기</span></a>
                    <div class="event_02_slide">
                        <!-- tab01 > slide 1 area // mobile -->
                        <div class="swiper-container swiper-new slide-1-pc slide-mobile">
                            <ul class="swiper-wrapper">
                                <li class="swiper-slide">
                                    <div class="btn_area">
                                        <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont01_slide01.png" class="mobile" alt="하단 참조" />
                                        <div class="blind">
                                            <p>혜택01 신한/현대/롯데/하나카드 7% 결제일 할인 (50만원 이상 결제 시 할인 제공)</p>
                                        </div>
                                        <a href="/dishwashers/dubj4hl" class="btn_m"><span class="blind">식기세척기 제품보기</span></a>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <div class="btn_area">
                                        <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont01_slide02.png" class="mobile" alt="하단 참조" />
                                        <div class="blind">
                                            <p>혜택02 신한/현대/롯데/하나카드 최대 12개월 무이자 혜택 (50만원 이상 결제 시 적용)</p>
                                        </div>
                                        <a href="/microwaves-and-ovens/mlj39ww" class="btn_m"><span class="blind">광파오븐 제품보기</span></a>
                                    </div>
                                </li>
                            </ul>
                            <div class="swiper_btn_wrap">
                                <div>
                                    <button class="swiper-button-prev"></button>
                                    <button class="swiper-button-next"></button>
                                </div>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </div>

                <div class="content_wrap content02">
                    <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont02.png" class="pc" alt="하단 참조" />
                    <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont02_m.png" class="mobile" alt="하단 참조" />
                    <div class="blind">
                        <h3>LG UP DAY 특별한 혜택</h3>
                        <p>혜택이 UP~</p>
                        <p>제품 구매 후 포토 리뷰 등록 시 사은품 전원 증정</p>
                        <p>6/9(금)</p>
                        <p>LG 디오스 오브제컬렉션 식기세척기 구매 시 Aesop 레저렉션 아로마틱 핸드 밤</p>
                        <p>LG 디오스 오브제컬렉션 광파오븐 구매 시 Aesop 핸드워시 500ml</p>
                        <p>행사 채널 : LGE.COM </p>
                        <p>행사 기간 : 2023.6.9(금)</p>
                        <p>행사 대상 : 6/9(금) 구매 시 7/9(일)까지 배송 및 포토 리뷰 작성 완료 고객</p>
                        <p>참여 방법 : 행사 기간 내 LGE.COM에서 제품 구매 후 참여 기간 내 포토 리뷰 작성</p>
                        <p>포토리뷰 작성 시 (20자 이상/제품사진 1장 업로드 필수)</p>
                        <p>리뷰 작성 시 (#이벤트참여) 필수 문구 작성</p>
                        <p>사진 도용 및 부적절한 사진 업로드 시 경품 지급 대상 제외</p>
                        <p>지급 일시 : 대상 고객 개별 안내 후 별도 지급</p>
                    </div>
                </div>

                <div class="content_wrap content09">
                    <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont03.png" class="pc" alt="하단 참조" />
                    <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont03_m.png" class="mobile" alt="하단 참조" />
                    <div class="blind">
                        <h3>혜택07</h3>
                        <h3>LGE.COM 단독 구매 혜택</h3>
                        <ul>
                            <li>
                                <p>혜택01 신규 회원가입 시 5% 웰컴 쿠폰 증정(최대 10만원 할인)</p>
                            </li>
                            <li>
                                <p>혜택02 신한/롯데/하나카드 7% 결제일 할인 (50만원 이상 결제 시 할인 제공)</p>
                            </li>
                            <li>
                                <p>혜택03 신한/롯데/하나카드 최대 12개월 무이자 혜택 (50만원 이상 결제 시 적용)</p>
                            </li>
                            <li>
                                <p>혜택04 네이버페이 결제 시 최대 7%NPAY 포인트 적립 (15만원 이상 결제 시 최대 5만원 적립)</p>
                            </li>
                        </ul>
                    </div>
                    <div class="event_02_slide">
                        <!-- tab01 > slide 1 area // mobile -->
                        <div class="swiper-container swiper-new slide-1-pc slide-mobile">
                            <ul class="swiper-wrapper">
                                <li class="swiper-slide">
                                    <div class="btn_area">
                                        <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont03_slide01.png" class="mobile" alt="하단 참조" />
                                        <div class="blind">
                                            <p>혜택01 신규 회원가입 시 5% 웰컴 쿠폰 증정(최대 10만원 할인)</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <div class="btn_area">
                                        <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont03_slide02.png" class="mobile" alt="하단 참조" />
                                        <div class="blind">
                                            <p>혜택02 신한/롯데/하나카드 7% 결제일 할인 (50만원 이상 결제 시 할인 제공)</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <div class="btn_area">
                                        <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont03_slide03.png" class="mobile" alt="하단 참조" />
                                        <div class="blind">
                                            <p>혜택03 신한/롯데/하나카드 최대 12개월 무이자 혜택 (50만원 이상 결제 시 적용)</p>
                                        </div>
                                    </div>
                                </li>
                                <li class="swiper-slide">
                                    <div class="btn_area">
                                        <img src="/kr/event/2023/06/09_LG_UP_DAY/images/cont03_slide04.png" class="mobile" alt="하단 참조" />
                                        <div class="blind">
                                            <p>혜택04 네이버페이 결제 시 최대 7%NPAY 포인트 적립 (15만원 이상 결제 시 최대 5만원 적립)</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="swiper_btn_wrap">
                                <div>
                                    <button class="swiper-button-prev"></button>
                                    <button class="swiper-button-next"></button>
                                </div>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </div>

                
            </div>

            
            
            

            <div class="event-notice-area type-dark type-toggle">
                <strong class="notice-toggle-tit">
                    <button type="button" class="btn-notice-toggle">
                        <span class="blind">유의사항 확인하기</span>
                    </button>
                </strong>
                <div class="notice-toggle-cont" style="display: none">
                    <strong class="notice-title">꼭! 알아두세요</strong>
                    <ul class="notice-list-hyphen">
                        <li>본 행사는 LGE.COM 단독 행사이며, 오프라인 매장과는 무관합니다.</li>
                        <li>행사 모델 및 혜택이 변경될 수 있으니 자세한 내용은 기획전 페이지를 확인해 주세요.</li>
                        <li>제품별 준비된 수량이 선착순 소진된 경우 조기 종료될 수 있습니다.</li>
                        <li>행사 기간 중 행사 모델이 변동될 수 있으므로 구매 전 행사 모델 해당 여부를 확인해 주시기 바랍니다.
                        <li>본 행사 내용은 당사 사정에 따라 예고 없이 변경 또는 중단될 수 있습니다.</li>
                    </ul>

                    <strong class="notice-title">포토리뷰 이벤트 유의사항</strong>
                    <ul class="notice-list-hyphen">
                        <li>행사 기간 내 (6월 9일/19일/29일) 구매 고객 중 7월 9일 (6월 9일 구매), 7월 19일(6월 19일 구매), 7월 29일(6월 29일 구매) 까지 배송 및 리뷰 작성 완료 고객 대상 익월 말 이내 일괄 지급 예정입니다.</li>   
                        <li>본 행사 참여시 직접 촬영한 이미지를 사용해 주시고, 타인의 저작권 또는 초상권 침해가 되면 당첨이 취소될 수 있습니다.</li>   
                        <li> 본 행사는 LG전자 회원 가입자 대상 이벤트로 LG전자 회원가입/로그인 후 참여하실 수 있습니다.</li>   
                        <li> 타인 명의 도용 등 비정상적인 방법으로 참여 시 당첨이 제한될 수 있습니다.</li>   
                        <li> 14세 미만 고객님의 경우, 이벤트 참여가 제한됩니다.</li>   
                        <li>이벤트 내용 및 경품 내역, 수량, 발표일 및 배송 일정은 당사 사정에 의해 예고없이 변동 또는 지연될 수 있습니다.</li>   
                        <li>사은품은 제품 배송 완료 고객 대상으로 제품 배송지로 발송되며 잘못 등록된 정보로 인해 오 발송, 반송, 분실될 경우 당사에서 책임지지 않습니다.</li>   
                        <li>사은품은 수령하신 후 교환 및 환불이 불가능합니다.</li>   
                        <li>사은품은 색상 지정이 불가하며, 색상 랜덤으로 발송 됩니다.</li>   
                        <li>제품 이미지는 이해를 돕기 위한 것으로 실제와 다를 수 있으며, 사정에 따라 변경될 수 있습니다. </li>                                                            
                    </ul>

                    <strong class="notice-title">동시구매 이벤트 유의사항</strong>
                    <ul class="notice-list-hyphen">
                        <li>행사 기간 내 (6월 9일 ~29일)  구매 고객 중 7월 15일까지 배송완료 고객 대상으로 지급 됩니다.</li>
                        <li>본 행사는 LG전자 회원 가입자 대상 이벤트로 LG전자 회원가입/로그인 후 참여하실 수 있습니다.</li>
                        <li>타인 명의 도용 등 비정상적인 방법으로 참여 시 당첨이 제한될 수 있습니다.</li>
                        <li>14세 미만 고객님의 경우, 이벤트 참여가 제한됩니다.</li>
                        <li>이벤트 내용 및 경품 내역, 수량, 발표일 및 배송 일정은 당사 사정에 의해 예고없이 변동 또는 지연될 수 있습니다.</li>
                        <li>사은품은 제품 배송 완료 고객 대상으로 제품 배송지로 발송되며 잘못 등록된 정보로 인해 오 발송, 반송, 분실될 경우 당사에서 책임지지 않습니다.</li>
                        <li>사은품은 수령하신 후 교환 및 환불이 불가능합니다.</li>                                         
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        /* swiper */
        (function () {
            var initSwiper2 = function (opt) {
                new Swiper(opt.el, {
                    slidesPerView: 1,
                    slidesPerGroup: 1,
                    loopFillGroupWithBlank: true,
                    paginationClickable: true,
                    loop: true,
                    observer : true,
                            observeParents : true,

                    allowTouchMove: false,
                    pagination: {
                        el: opt.pagination(),
                        clickable: true,
                    },
                    navigation: {
                        nextEl: opt.nextBtn(),
                        prevEl: opt.prevEl(),
                    },
                    breakpoints: {
                        767: {
                            allowTouchMove: true,
                            loopFillGroupWithBlank: false,
                            observer : true,
                            observeParents : true
                        },
                    },
                });
            };
            /* swiper pc 1개 기본 옵션 정의 */
            var swiper__opt2 = {
                el: '.event-benefit-template .slide-1-pc',
                pagination: function () {
                    return this.el + ' .swiper-pagination';
                },
                nextBtn: function () {
                    return this.el + ' .swiper_btn_wrap .swiper-button-next';
                },
                prevEl: function () {
                    return this.el + ' .swiper_btn_wrap .swiper-button-prev';
                },
            };
            initSwiper2(swiper__opt2);
        })();
        /* //swiper */

        /* toggle common */
        function toggleOpenClick(btn, area, cont) {
            var toggleBtn = $(btn);
            var toggleArea = toggleBtn.parents(area);
            var toggleCont = toggleBtn.parent().siblings(cont);
            toggleBtn.click(function (e) {
                if ($(e.target).is('.active')) {
                    toggleBtn.removeClass('active');
                    toggleArea.removeClass('active');
                    toggleCont.slideUp(300);
                } else {
                    toggleBtn.addClass('active');
                    toggleArea.addClass('active');
                    toggleCont.slideDown(300);
                }
                return false;
            });
        }
        /* // toggle common */

        /* event notice toggle */
        toggleOpenClick('.notice-toggle-tit .btn-notice-toggle', '.event-notice-area', '.notice-toggle-cont');
        /* // event notice toggle */

        
    </script>
</div>