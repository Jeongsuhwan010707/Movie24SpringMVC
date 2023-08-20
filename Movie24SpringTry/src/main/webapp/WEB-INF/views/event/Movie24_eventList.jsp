<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>메인 페이지</title>
        <link rel="stylesheet" href="/resources/css/main/Movie24_eventList.css">
    </head>
    <body>
        <div>
             <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
<main>
    <div id="main_logo">
        <h1>전체 이벤트</h1>
    </div>
    <div class="eventArea">
    	<div class="eventAreaForm">
	    	<div><h2>영화</h2></div>
	        <ul>
	        	<li>
		        	<img alt="" src="/resources/images/밀수event.jpg">
		        	<div>2023.08.18 ~ 2023.08.24</div>
	        	</li>
	        	<li class="centerEvent">
		        	<img alt="" src="/resources/images/오펜하이머event.jpg">
		        	<div>2023.08.15 ~ 2023.08.21</div>
	        	</li>
	        	<li>
		        	<a href="#"><img alt="" src="/resources/images/치킨의비밀event.jpg"></a>
		        	<div>2023.08.08 ~ 2023.08.22</div>
	        	</li>
	        </ul>
    	</div>
    	<div class="eventAreaForm">
	    	<div><h2>HOT</h2></div>
	        <ul>
	        	<li>
		        	<img alt="" src="/resources/images/eventHot1.jpg">
		        	<div>2023.08.17 ~ 2023.09.13</div>
	        	</li>
	        	<li class="centerEvent">
		        	<img alt="" src="/resources/images/eventHot2.jpg">
		        	<div>2023.08.07 ~ 2023.08.31</div>
	        	</li>
	        	<li>
		        	<a href="#"><img alt="" src="/resources/images/eventHot3.jpg"></a>
		        	<div>2023.08.03 ~ 2023.09.15</div>
	        	</li>
	        </ul>
    	</div>
    	<div class="eventAreaForm">
	    	<div><h2>제휴할인</h2></div>
	        <ul>
	        	<li>
		        	<img alt="" src="/resources/images/eventSale1.jpg">
		        	<div>2023.08.08 ~ 2023.08.31</div>
	        	</li>
	        	<li class="centerEvent">
		        	<img alt="" src="/resources/images/eventSale2.jpg">
		        	<div>2023.08.01 ~ 2023.08.31</div>
	        	</li>
	        	<li>
		        	<a href="#"><img alt="" src="/resources/images/eventSale3.jpg"></a>
		        	<div>2023.07.01 ~ 2023.09.30</div>
	        	</li>
	        </ul>
    	</div>
    	<div id="advertise">
    		<a><img alt="" src="/resources/images/event광고.jpg"></a>
    	</div>
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