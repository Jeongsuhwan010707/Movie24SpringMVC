<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>메인 페이지</title>
        <link rel="stylesheet" href="/resources/css/include/header.css">
        <link rel="stylesheet" href="/resources/css/include/nav.css">
        <link rel="stylesheet" href="/resources/css/include/footer.css">
        <link rel="stylesheet" href="/resources/css/main/Movie24.css">
    </head>
    <body>
        <div>
            <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
            <!-- ---------메인 영역--------------------------- -->
            <main>
                <div class="trailer">
                    <h1 id="h1-1">[트랜스포머] : 비스트의 서막</h1>
                    <h2 id="h2-1">트랜스포머 시리즈 중 역대급 스케일! <br>2023년 6월 6일 대개봉!</h2>
                    <h1 id="h1-2">[마블] : 플래시</h1>
                    <h2 id="h2-2">초광속 액션 블록버스터!<br>차원이 다른 히어로가 온다!</h2>
                    <!-- <img id="main_trailer" src="/resources/images/marvel_trailer.png" alt=""> -->
                    <video id="trailer-video1" class="video" src="/resources/videos/트렌스포머.mp4"></video>
                    <video id="trailer-video2" class="video" src="/resources/videos/플래시.mp4"></video>
                </div>
                    <div id="stop_area"><a href="javascript:void(0)" onclick="playPause()"><img src="/resources/images/stop.png" alt=""></a></div>
                    <div id="next2"><a href="#" onclick="nextVideo();"><img src="/resources/images/next2.png" alt=""></a></div>
                    <div id="next1"><a href="#" onclick="nextVideo();"><img src="/resources/images/next1.png" alt=""></a></div>
                    <div class="dot"></div>
                    <!-- 테스트--------------------------------------------------- -->
                  <div class="popular_title">
                      <button class="popularBtn" onclick="showPopular();" style="cursor:pointer">인기차트</button>
                      <button class="trailerMovieBtn" onclick="showComing();" style="cursor:pointer">상영예정작</button>
                      <a href="/movie24/movieList.do" style="cursor:pointer"><img src="/resources/images/더하기.png" alt=""></a>
                  </div>
                  <div class="popular">
                    <div class="popular_image">
                        <ul>
                            <li>
                                <a href="/movie/info.do?movieNum=1">
                                	<img id="mainImg1" class="popularPoster"  src="/resources/images/87090_320.jpg" alt="">
                                	<button id="lookDetail1" class="lookDetail" style="cursor:pointer">상세보기</button>
                               	</a>
                                <h4><span class="popularSpan">1) </span><img class="age1" src="/resources/images/12세.png" alt=""> 플래시</h4>
                                <p>예매율 : 99% | 평점 4.5</p>
                                
                            </li>
                            <li>
                                <a href="/movie/info.do?movieNum=2">
                                	<img id="mainImg2" class="popularPoster" src="/resources/images/범죄도시.png" alt="" >
	                                <button id="lookDetail2" class="lookDetail" style="cursor:pointer">상세보기</button>
                               	</a>
                                <h4><span class="popularSpan">2) </span><img class="age2" src="/resources/images/15세.png" alt=""> 범죄도시3</h4>
                                <p>예매율 : 99% | 평점 4.5</p>
                            </li>
                            <li>
                                <a href="/movie/info.do?movieNum=3">
                                	<img id="mainImg3" class="popularPoster" src="/resources/images/분노의질주.png" alt="" >
	                                <button id="lookDetail3" class="lookDetail" style="cursor:pointer">상세보기</button>
                                </a>
                                <h4><span class="popularSpan">3)<img class="age3" src="/resources/images/15세.png" alt=""> </span> 분노의 질주</h4>
                                <p>예매율 : 99% | 평점 4.5</p>
                            </li>
                            <li>
                                <a href="/movie/info.do?movieNum=4">
                                	<img id="mainImg4" class="popularPoster" src="/resources/images/가디언즈오브갤럭시.png" alt="" >
                            		<button id="lookDetail4" class="lookDetail" style="cursor:pointer">상세보기</button>
                                </a>
                                <h4><span class="popularSpan">4) </span><img class="age4" src="/resources/images/12세.png" alt=""> 가디언즈 오브 ...</h4>
                                <p>예매율 : 99% | 평점 4.5</p>
                            </li>
                            <li>
                                <a href="/movie/info.do?movieNum=5">
	                                <img id="mainImg5" class="popularPoster" src="/resources/images/위대한쇼맨.jpg" alt="" >
	                                <button id="lookDetail5" class="lookDetail" style="cursor:pointer">상세보기</button>
                                </a>
                                <h4><span class="popularSpan">5) </span><img class="age5" src="/resources/images/12세.png" alt=""> 위대한쇼맨</h4>
                                <p>예매율 : 99% | 평점 4.5</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="popular2">
                    <div class="popular_image">
                        <ul>
                            <li>
                                <a href="/movie/info.do?movieNum=6">
                                	<img id="mainImg6" class="popularPoster" src="/resources/images/엘리멘탈.jpg" alt="">
                                	<button id="lookDetail6" class="lookDetail" style="cursor:pointer">상세보기</button>
                                </a>
                                <h4><span class="popularSpan">1) </span><img class="age1" src="/resources/images/전체이용가.png" alt=""> 엘리멘탈</h4>
                                <p>예매율 : 99% | 평점 4.5</p>
                            </li>
                           <li>
                                <a href="/movie/info.do?movieNum=7">
                                	<img id="mainImg7" class="popularPoster" src="/resources/images/바비.jpg" alt="">
	                                <button id="lookDetail7" class="lookDetail" style="cursor:pointer">상세보기</button>
                                	</a>
                                <h4><span class="popularSpan">2) </span><img class="age2" src="/resources/images/12세.png" alt=""> 바비</h4>
                                <p>예매율 : 99% | 평점 4.5</p>
                            </li>
                            <li>
                                <a href="/movie/info.do?movieNum=8">
	                                <img id="mainImg8" class="popularPoster" src="/resources/images/콘크리트 유토피아.jpg" alt="">
	                                <button id="lookDetail8" class="lookDetail" style="cursor:pointer">상세보기</button>
                                </a>
                                <h4><span class="popularSpan">3) </span><img class="age3" src="/resources/images/15세.png" alt=""> 콘크리트 유토...</h4>
                                <p>예매율 : 99% | 평점 4.5</p>
                            </li>
                            <li>
                                <a href="/movie/info.do?movieNum=9">
                                	<img id="mainImg9" class="popularPoster" src="/resources/images/밀수.jpg" alt="">
                                	<button id="lookDetail9" class="lookDetail" style="cursor:pointer">상세보기</button>
                               	</a>
                                <h4><span class="popularSpan">4) </span><img class="age4" src="/resources/images/15세.png" alt=""> 밀수</h4>
                                <p>예매율 : 99% | 평점 4.5</p>
                            </li>
                            <li>
                                <a href="/movie/info.do?movieNum=10">
    	                            <img id="mainImg10" class="popularPoster" src="/resources/images/인어공주.png" alt="">
	                                <button id="lookDetail10" class="lookDetail" style="cursor:pointer">상세보기</button>
   	                            </a>
                                <h4><span class="popularSpan">5) </span><img class="age5" src="/resources/images/전체이용가.png" alt=""> 인어공주</h4>
                                <p>예매율 : 99% | 평점 4.5</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- 이벤트----------------------------------------------------------------------------------- -->
                <div id="event_area">
                    <div id="event_main">
                        <h2>이벤트</h2>
                        <a href="/movie24/eventList.do" id="plus"><img src="/resources/images/더하기.png" alt=""></a>
                    </div>
                    <div id="event_left">
                        <div id="event_up">
                            <ul>
                                <li>
                                    <a href="/movie24/event.do?eventSrcNum=1"><img src="/resources/images/이벤트1열1번.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="/movie24/event.do?eventSrcNum=2"><img src="/resources/images/이벤트1열2번.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="/movie24/event.do?eventSrcNum=3"><img src="/resources/images/이벤트1열3번.jpg" alt=""></a>
                                </li>
                            </ul>
                        </div>
                        <div id="event_down">
                            <ul>
                                <li>
                                    <a href="/movie24/event.do?eventSrcNum=5"><img id="downImg1" src="/resources/images/이벤트2열1번.jpg" alt=""></a>
                                </li>
                                <li>
                                    <a href="/movie24/event.do?eventSrcNum=6"><img id="downImg2" src="/resources/images/이벤트2열2번.jpg" alt=""></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div id="event_right">
                        <ul>
                            <li>
                                <a href="/movie24/event.do?eventSrcNum=4"><img src="/resources/images/이벤트맨끝.jpg" alt=""></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="blue"></div>
                <!-- ----------------빠른 메뉴------------------- -->
                <div id="blue_area">
                    <div id="blue_image">
                        <a href="/movie24/movieReservation/Movie24_time.html"><img src="/resources/images/시간표.png" alt=""></a>
                        <a href="/movie24/store/Movie24_store.html"><img src="/resources/images/free-icon-shopping-cart-5381441.png" alt=""></a>
                        <a href=""><img src="/resources/images/근처영화관.png" alt=""></a>
                        <a href=""><img src="/resources/images/이벤트.png" alt=""></a>
                        <a href=""><img src="/resources/images/VIP.png" alt=""></a>
                    </div>
                    <div id="blue_text">
                        <p id="time_text"><a href="/movie24/movieReservation/Movie24_time.html">상영시간표</a></p>
                        <p id="store_text"><a href="/movie24/store/Movie24_store.html">스토어</a></p>
                        <p id="near_text"><a href="">근처영화관</a></p>
                        <p id="event_text"><a href="">이벤트</a></p>
                        <p id="vip_text"><a href="">VIP혜택</a></p>
                    </div>
                </div>
            </main>
            <!-- <footer> ----------------------------</footer> -->
            <jsp:include page="/include/footer.jsp"></jsp:include>
        </div>
        <!-- 스크립트 -->
        <script>
            var ulElement = document.getElementById('nav_ul');
            var liElements = ulElement.querySelectorAll('li');
            var menuText = document.getElementById('menu_text');
            var menuArea = document.getElementById('menuArea');
            
			document.querySelectorAll(".popularPoster").forEach(function(item,index) {
				item.addEventListener("mouseenter", () => {
// 					item.nextElementSilbing.style.display = "block";
					document.querySelector("#lookDetail"+(index+1)).style.display="block";
		            item.style.opacity = 0.4;
		            item.style.border = "2px solid #999797";
				})
			});
			document.querySelectorAll(".popularPoster").forEach(function(item, index) {
				item.addEventListener("mouseleave", () => {
					document.querySelector("#lookDetail"+(index+1)).style.display="none";
		            item.style.opacity = 1;
		            item.style.border = "none";
				})
			});
			document.querySelectorAll(".lookDetail").forEach(function(item,index) {
				item.addEventListener("mouseenter", () => {
					item.style.display="block";
		            document.getElementById('mainImg'+(index+1)).style.opacity = 0.4;
		            document.getElementById('mainImg'+(index+1)).style.border = "3px solid #999797";
				})
			});
			
            liElements.forEach(li => {
		        li.addEventListener('mouseenter', () => {
	                menuText.classList.add('active');
	                menuText.style.zIndex= 5000;
	            });
	        });
	        document.getElementById("menu_text").addEventListener('mouseleave', () => {
	            menuText.classList.remove('active');
	            menuText.style.zIndex= -1;
	            
// 	            liElements.forEach(li => {
// 			        li.addEventListener('mouseleave', () => {
// 		                menuText.classList.remove('active');
// 		                menuText.style.zIndex= 5000;
// 		            });
// 		        });
	        });
	        
// 	        $(document).ready(function () {
// 	            $('.nav_menu > li > h2 > a').on({
// 	                mouseenter: function (e) {
// 	                    var target = e.target;
// 	                    $(target).parents('.nav_menu').find('.nav_overMenu').slideDown(function () {
// 	                        $('.nav').addClass('active');
// 	                    });
// 	                },
// 	                click: function (e) {
// 	                    var target = e.target;
// 	                    if (!$('.nav').hasClass('active')) {
// 	                        $(this).trigger('mouseenter');
// 	                    } else {
// 	                        $('.nav').trigger('mouseleave');
// 	                    }
// 	                }
// 	            });
        /////////////////////
        
// -----------------------test
        var video1 = document.querySelector("#trailer-video1");
        var video2 = document.querySelector("#trailer-video2");

        const showTrailer = () =>{
            video2.style.display = "none";
        }
        showTrailer();

            function playPause() {
            if (video1.paused) {
                video1.play();
            } else {
                video1.pause();
            }
            if (video2.paused) {
                video2.play();
            } else {
                video2.pause();
            }
            }
            
            function nextVideo(){
                
                if(video1.style.display == "none"){
                    video1.style.display = "";
                    video2.style.display = "none";
                    document.querySelector("#h1-1").style.display = "block";
                    document.querySelector("#h2-1").style.display = "block";
                    document.querySelector("#h1-2").style.display = "none";
                    document.querySelector("#h2-2").style.display = "none";
                }
                 else if(video2.style.display == "none"){
                    video1.style.display = "none";
                    video2.style.display = "";
                    document.querySelector("#h1-1").style.display = "none";
                    document.querySelector("#h2-1").style.display = "none";
                    document.querySelector("#h1-2").style.display = "block";
                    document.querySelector("#h2-2").style.display = "block";
                }
                };

            var p1 = document.getElementsByClassName("popular");
            var p2 = document.getElementsByClassName("popular2");
            function showPopular(){
	        	document.querySelector(".popularBtn").style.fontWeight = "900";
	        	document.querySelector(".popularBtn").style.textDecoration = "underline";
	        	document.querySelector(".trailerMovieBtn").style.fontWeight = "500";
	        	document.querySelector(".trailerMovieBtn").style.textDecoration = "none";
	            document.querySelector(".popular2").style.display = "none";
	            document.querySelector(".popular").style.display = "block";
	        };
	        function showComing(){
	        	document.querySelector(".trailerMovieBtn").style.fontWeight = "900";
	        	document.querySelector(".trailerMovieBtn").style.textDecoration = "underline";
	        	document.querySelector(".popularBtn").style.fontWeight = "500";
	        	document.querySelector(".popularBtn").style.textDecoration = "none";
	            document.querySelector(".popular").style.display = "none";
	            document.querySelector(".popular2").style.display = "block";
	        };
            function myCheck(){
            	alert("로그인이 되어있지 않습니다.");
            }
            function outCheck(){
            	if(confirm("로그아웃 하시겠습니까?")){
            		location.href="/member/logout.do";
            	}
            }
        </script>
    </body>
</html>