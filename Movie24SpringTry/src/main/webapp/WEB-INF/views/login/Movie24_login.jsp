<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie24</title>
        <link rel="stylesheet" href="/resources/css/login/Movie24_login.css">
    </head>
    <body>
        <div>
            <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
        <main>
            <div id="login_area">
                <div id="login_logo">
                    <h1>로그인</h1>
                </div>
                <div id="login_form">
                <form action="/member/login.do" method="post">
                    <input type="text" class="login id" name="member-id" placeholder="아이디를 입력해주세요.">
                    <input type="password" name="member-pw" class="login password" placeholder="비밀번호를 입력해주세요.">
                    <button type="submit" id="login_button" style="cursor:pointer">로그인</button>
<!--                     <a href=""><input type="submit" value="로그인" id="login_button"></a> -->
                    <div id="login_text">
                        <input type="checkbox" name="" id="" value="아이디저장"> 로그인 상태 유지
                    </div>
                    <div id="login_text2">
                        <a href="/member/agree.do">회원가입</a>
                        <a href="/member/searchId.do">ID / PW 찾기</a>
                    </div>
                </form>
                    <!-- <hr> -->
                    <div id="empty"></div>
                    <a href=""><img src="/resources/images/facebook.png" alt=""></a>
                    <a href=""><img src="/resources/images/google.png" alt=""></a>
                    <a href=""><img src="/resources/images/kakao-talk.png" alt=""></a>
                </div>
            </div>
            <div id="ad">
                <a href="#"><img src="/resources/images/ad.png" alt=""></a>
            </div>
        </main>
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
// -----------------------test

        // menuText.addEventListener('mouseenter', function() {
        // menuText.classList.add('active');
        // });

        // menuText.addEventListener('mouseleave', function() {
        // menuText.classList.remove('active');
        // });
        var video = document.getElementById("trailer-video");

        function playPause() {
        if (video.paused) {
            video.play();
        } else {
            video.pause();
        }
        }
        function myCheck(){
        	alert("로그인이 되어있지 않습니다.");
        }
    </script>
</body>
</html>