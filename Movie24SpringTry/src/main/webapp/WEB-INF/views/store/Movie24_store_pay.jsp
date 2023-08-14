<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie24</title>
        <link rel="stylesheet" href="/resources/css/store/Movie24_bag_pay.css">
    </head>
    <body>
        <div>
            <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
<main>
    <div id="main_logo">
        <div class="logo">
            <img src="/resources/images/shopping-cart (1).png" alt="">
            <h1>장바구니</h1>
        </div>
        <img src="/resources/images/right-arrow (2).png" alt="">
        <div class="logo">
            <img src="/resources/images/credit-card.png" alt="">
            <h1 id="h11">결제하기</h1>
        </div>
        <img src="/resources/images/right-arrow (2).png" alt="">
        <div class="logo">
            <img src="/resources/images/popcorn.png" alt="">
            <h1>구매완료</h1>
        </div>
    </div>
    <div id="purchase">
        <div id="purchase_up">
            <ul>
                <li id="name">상품명</li>
                <li>판매금액</li>
                <li>수량</li>
                <li>구매금액</li>
                <li>선택</li>
            </ul>
        </div>
        <div id="purchase_down">
            <div id="product">
                <img src="/resources/images/cgv팝콘-removebg-preview.png" alt="">
                <span><h2>팝콘 패키지 1</h2></span>
                <p>팝콘(1), 음료(1), 관람권(1)</p>
            </div>
            <div class="product">
                <p>12,000원</p>
            </div>
            <div class="product">
                <select name="" id="">
                    <option value="">1</option>
                    <option value="">2</option>
                    <option value="">3</option>
                    <option value="">4</option>
                    <option value="">5</option>
                    <option value="">6</option>
                </select>
            </div>
            <div class="product">
                <p>12,000원</p>
            </div>
            <div class="product">
                <img src="/resources/images/select.png" alt="">
            </div>
        </div>
    </div>
    <div id="purchase2">

        <div id="purchase_up2">
            <ul>
                <li>총 상품금액</li>
                <li>할인금액</li>
                <li>총 결제 예상금액</li>
            </ul>
        </div>
        <div id="purchase_down2">
            <ul>
                <li>12,000원</li>
                <li id="img1"><img width="50px" src="/resources/images/minus (2).png" alt=""></li>
                <li>0원</li>
                <li id="img2"><img width="50px" src="/resources/images/equal (1).png" alt=""></li>
                <li id="blue">12,000원</li>
            </ul>
        </div>
    </div>
    <div class="h2_area">
        <h2>주문자 정보확인</h2>
    </div>
    <div class="h2_text">
        <span><p>이름</p><input type="text" placeholder="이름을 입력해주세요."></span>
        <span><p>전화번호</p><input type="text" placeholder="전화번호를 입력해주세요."></span>
    </div>
    <div class="no">
        <p>*구매하신 CGV 기프트콘은 주문자 정보에 입력된 휴대전화 번호로 MMS로 발송됩니다.
           <br> 입력된 휴대전화 번호가 맞는지 꼭 확인하세요.</p>
    </div>
    <div class="h2_area">
        <h2>결제수단</h2>
    </div>
    <div class="h2_text">
        <span><input type="radio" name="purchase"><p>신용카드</p></span>
        <span><input type="radio" name="purchase"><p>Kakaopay</p></span>
    </div>
    <div id="h2-area2">
        <img src="/resources/images/select.png" alt="">
        <h2>주문정보/결제 대행 서비스 약관 모두 동의</h2>
    </div>
    <div id="h2_text2">

    </div>

    <div id="main_select">
        <a href="/movie24/store/Movie24_bag.html"><button>뒤로</button></a>
        <a href="/movie24/store/Movie24_pay_done2.html"><button>구매하기</button></a>
    </div>
</main>
         <!-- --------------------푸터---------------------------------- -->
         <footer class="footer">
            <div class="footer-container">
              <ul class="footer-list">
                <li><a href="">이용약관</a></li>
                <li><a href="">개인정보처리방침</a></li>
                <li><a href="">회사소개</a></li>
                <li><a href="">광고/제휴/출점문의</a></li>
                <li><a href="">법적고지</a></li>
                <li><a href="">채용정보</a></li>
                <li><a href="">편성기준</a></li>
              </ul>
              <div class="footer-content">
                <hr class="footer-line">
                <p>저작권 © 2023 My Website. All rights reserved.</p>
              </div>
            </div>
            <p>()경기도 의정부시 상금로 102-37, 스페셜빌딩(금오동)
                <br>대표이사 : 정모씨 | 사업자 등록번호 : 010-7777-7777 | 통신판매업신고번호 : 2023-의정부시-0527
                <br>COPYRIGHT @ Movie24.by_suhwan.All rights reserved
            </p>
          </footer>
    </div>
    <!-- 스크립트 -->
    <script>
        var ulElement = document.getElementById('nav_ul');
        var liElements = ulElement.querySelectorAll('li');
        var menuText = document.getElementById('menu_text');

        liElements.forEach(li => {
        li.addEventListener('mouseenter', () => {
                menuText.classList.add('active');
                menuText.style.zIndex= 5000;
            });

        });
        document.getElementById("menu_text").addEventListener('mouseleave', () => {
            menuText.classList.remove('active');
            menuText.style.zIndex= -1;
        });

    </script>