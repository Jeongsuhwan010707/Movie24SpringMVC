<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie24</title>
        <link rel="stylesheet" href="/resources/css/main/Movie24_movie_info.css">
    </head>
    <body>
        <div>
             <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
<main>
    <section>
        <div id="img_area"><img src="${mInfo.movieSrc }" alt=""></div>
        <div id="image_left">
            <div id="main_title">
                <h2>${mInfo.movieName }</h2>
                <span id="span1">예매중</span><span id="span2">D-10</span>
            </div>
            <div id="main_text1">
                <p>예매율 90%</p>
            </div>
            <div id="main_text2">
                <p>감독 : ${mInfo.director } / 배우 : 
                    ${mInfo.actor }
                    <br>장르 : ${mInfo.genre } / 기본 정보 : 
                    ${mInfo.basicInfo }
                    <br>개봉 : 
                    ${mInfo.openDate }</p>
            </div>
            <button id="btn1">❤ 찜하기</button>
            <button id="btn2">⭐ 평점보기</button>
        </div>
    </section>
    <div id="main_menu">
        <ul>
            <li><a href="">주요정보</a></li>
            <li><a href="">예고편</a></li>
<!--             <li><a href="">스틸컷</a></li> -->
            <li><a href="">평점/리뷰</a></li>
            <li><a href="/movieReservation/Movie24_time.html">상영시간표</a></li>
        </ul>
    </div>
    <div class="title_movie">
        <p>주요정보</p>
    </div>
    <div id="title_text">
			<p id="movieExpl">
				<br><br>${mInfo.contentInfo }<br><br><br>
			</p>
        </div>
        <div id="img_area2">
            <img id="status" src="/resources/images/표.png" alt="">
        </div>
        <a id="next" href="/movieReservation/Movie24_time.html">예매하기</a>
        <div class="title_movie">
            <p>예고편</p>
        </div>
        <div id="video_area">
            <video src="${mInfo.video }" controls></video>
        </div>
<!--         <div class="title_movie"> -->
<!--             <p>스틸컷</p> -->
<!--         </div> -->
        <div class="title_movie">
            <p>관람평</p>
        </div>
        <div id="review">
            <h2>등록된 감상평이 아직 없습니다.</h2>
            <h1>첫 번째 감상평을 남겨주세요!</h1>
        </div>
        <div id="review_btn">
            <button onclick="goReview()">리뷰 작성</button>
        </div>
        <div id="img_area3">
            <img src="/resources/images/review2.png" alt="">
        </div>
        <div id="bottomBlank"></div>
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
		
        var btn1 = document.getElementById("btn1");
        document.getElementById("btn1").style.backgroundColor = 'white';
		document.getElementById("btn1").style.border = '3px solid #FF9292';
		document.getElementById("btn1").style.color = '#f44a4a';
		
        document.getElementById("btn1").addEventListener('click', () => {
       		if(document.getElementById("btn1").style.color == 'rgb(244, 74, 74)'){
       			document.getElementById("btn1").style.backgroundColor = "rgb(244, 74, 74)";
       			document.getElementById("btn1").style.color = "white";
       			document.getElementById("btn1").style.border = '3px solid rgb(244, 74, 74)';
        	}else if(document.getElementById("btn1").style.color == 'white'){
       			document.getElementById("btn1").style.backgroundColor = 'white';
       			document.getElementById("btn1").style.border = '3px solid rgb(255, 146, 146)';
       			document.getElementById("btn1").style.color = 'rgb(244, 74, 74)';
        	} 
        })
        
        function goReview(){
        	location.href="/movie/review.do";
        }
    </script>