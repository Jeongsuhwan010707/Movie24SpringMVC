<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie24</title>
        <link rel="stylesheet" href="/resources/css/myPage/Movie24_myPage.css">
    </head>
    <body>
        <div>
            <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
<main>
   <div id="up_area">
       <div id="myPage_up">
        <div id="myPage_blank"></div>
            <div id="myPage_up_1">
                <img src="/resources/images/account (2).png" alt="">
            </div>
            <div id="myPage_up_2">
                <h1>${member.memberNickname}님 환영합니다!</h1>
                <p>회원님의 등급은 "일반"입니다.
                </p>
            </div>
            <div id="myPage_up_3"></div>
       </div>
       <div id="myPage_blank2"></div>
       <div id="myPage_down">
            <div id="myPage_down_1">
                <h1>My Coupon</h1>
                <p>쿠폰 : 0개</p>
                <p>관람권 : 0개</p>
            </div>
            <div id="myPage_blank3"></div>
            <div id="myPage_down_2">
                <h1>My Point</h1>
                <p>포인트 : 500점</p>
            </div>
            <div id="myPage_blank4"></div>
            <div id="myPage_down_3">
                <h1>Vip Point</h1>
                <p>Vip 포인트 : 500점</p>
                <img src="/resources/images/bar1.png" alt="">
            </div>
            <div id="blank_1"></div>
            <div id="main_menu">
                <div id="member">
                    <h3>회원 정보</h3>
                    <ul>
                        <li><a href="/member/myUpdate.do?member-id=${member.memberId}">가입정보 수정/삭제하기</a></li>
                        <li><a href="#">닉네임 변경하기</a></li>
                        <li><a href="#">약관 확인</a></li>
                    </ul>
                    <h3>나의 포인트 관리</h3>
                    <ul>
                        <li><a href="#">포인트 적립내역</a></li>
                        <li><a href="#">포인트 받으러가기</a></li>
                        <li><a href="#">포인트 사용하기</a></li>
                    </ul>

                    <h3>VIP 등급</h3>
                    <ul>
                        <li><a href="#">VIP 포인트 적립내역</a></li>
                        <li><a href="#">VIP 혜택</a></li>
                        <li><a href="#">VIP 등업 조건</a></li>
                    </ul>
                </div>
            </div>
            <div id="main_blank"></div>
            <div id="main_area">
                <div id="area1">
                    <div id="area1_1">
                        <img src="/resources/images/cinema.png" alt="">
                        <h3>기대되는 영화</h3>
                        <p>보고싶은 영화는 미리 담아보세요!</p>
                    </div>
                    <div id="area1_2">
                        <img src="/resources/images/love-books.png" alt="">
                        <h3>좋아하는 장르</h3>
                        <p>관련 태그를 선택해서 추천을 받아보세요!</p>
                    </div>
                    <div id="area1_3">
                        <img src="/resources/images/star-rating.png" alt="">
                        <h3>내가 쓴 리뷰</h3>
                        <p>관람한 영화에 평점을 매겨주세요!</p>
                    </div>
                </div>
                <h3>나의 예매내역</h3>
                <div id="area2">
                    <p>고객님의 최근 예매내역이 존재하지 않습니다.</p> 
                </div>
                <h3>나의 문의내역</h3>
                <div id="area3">
                    <p>고객님의 1:1문의내역이 존재하지 않습니다.</p>
                </div>
            </div>
       </div>
   </div>
        <a id="next" href="/movie24/movieReservation/Movie24_time.html">예매하기</a>
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
        function outCheck(){
        	if(confirm("로그아웃 하시겠습니까?")){
        		location.href="/member/logout.do";
        	}
        }
    </script>