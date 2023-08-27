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
        <link rel="stylesheet" href="/resources/css/main/Movie24_movieList.css">
    </head>
    <body> 
        <div>
             <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
		<main>
		    <div id="main_logo">
		        <h1>전체 영화</h1>
		    </div>
		    <div class="popular_title">
		        <button class="popularBtn" onclick="showPopular();" style="cursor:pointer">인기차트</button>
		        <button class="trailerMovieBtn" onclick="showComing();" style="cursor:pointer">상영예정작</button>
		    </div>
		    <div class="popular">
		         <div class="popular_image">
		             <ul>
		             	<c:forEach var="movies" items="${miYList}" varStatus="i"> 
							<li>
								<div class="movieImgs"> 
	                            	<a href="/movie/info.do?movieName=${movies.movieName }">
			                            <img id="mainImg${i.count }" class="popularPoster1" src="${movies.movieSrc }" alt="">
			                            <button id="LookDetail${i.count }" class="lookDetail" style="cursor:pointer">상세보기</button>
		                            </a>
		                            <h4>
		                            	<img class="age" src="${mInfo.ageImage }" alt="">
		                            	${movies.movieEnName }
	                            	</h4>
		                            <p>🕒${movies.runningTime}</p>
	                         	</div> 
							</li>
						</c:forEach>	
		             </ul>
		         </div>
			</div>
			
<!--          /////////////////////////////////////////////////////////////상영예정작 -->
		     <div class="popular2">
		         <div class="popular_image">
		             <ul>
						<c:forEach var="movies" items="${miNList}" varStatus="i"> 
							<li>
								<div class="movieImgs"> 
	                            	<a href="/movie/info.do?movieName=${movies.movieName }">
			                            <img id="preImg${i.count }" class="popularPoster2" src="${movies.movieSrc }" alt="">
			                            <button id="preLookDetail${i.count }" class="preLookDetail" style="cursor:pointer">상세보기</button>
		                            </a>
		                            <h4>
		                            	<img class="age" src="${mInfo.ageImage }" alt="">
<%-- 		                            	${movies.movieName } --%>
										${movies.movieEnName }
	                            	</h4>
		                            <p>🕒${movies.runningTime}</p>
	                         	</div> 
							</li>
						</c:forEach>						
		             </ul>
	         	</div>
		     </div>
		 </main>
         <!-- <footer> ----------------------------</footer> -->
            <jsp:include page="/include/footer.jsp"></jsp:include>
		</div>
	    <!-- 스크립트 -->
	    <script>
		    var menuText = document.getElementById('menu_text');
			
			document.addEventListener("DOMContentLoaded", function() {
		    const liElements = document.querySelectorAll('#nav_ul li');
		    const menuText = document.getElementById('menu_text');
		
		    let hoverIntent = false;
		
		    liElements.forEach(li => {
		        li.addEventListener('mouseenter', () => {
		            hoverIntent = true;
		            menuText.classList.add('active');
		            menuText.style.zIndex = 5000;
		        });
		
		        li.addEventListener('mouseleave', () => {
		            hoverIntent = false;
		            setTimeout(() => {
		                if (!hoverIntent) {
		                    menuText.classList.remove('active');
		                    menuText.style.zIndex = -1;
			                }
			            }, 200); // Add a delay before hiding to allow time for moving to menu_text
			        });
			    });
		
		    menuText.addEventListener('mouseenter', () => {
		        hoverIntent = true;
		    });
		
		    menuText.addEventListener('mouseleave', () => {
		        hoverIntent = false;
		        setTimeout(() => {
		            if (!hoverIntent) {
		                menuText.classList.remove('active');
		                menuText.style.zIndex = -1;
			            }
			        }, 200); // Add a delay before hiding to allow time for moving to menu_text
			    });
			});
			
			//// 인기 차트
			document.querySelectorAll(".popularPoster1").forEach(function(item,index) {
				item.addEventListener("mouseenter", () => {
					document.querySelector("#LookDetail"+(index+1)).style.display="block";
		            item.style.opacity = 0.4;
				})
			});
			document.querySelectorAll(".popularPoster1").forEach(function(item, index) {
				item.addEventListener("mouseleave", () => {
					document.querySelector("#LookDetail"+(index+1)).style.display="none";
		            item.style.opacity = 1;
				})
			});
			document.querySelectorAll(".lookDetail").forEach(function(item,index) {
				item.addEventListener("mouseenter", () => {
					item.style.display="block";
		            document.getElementById('mainImg'+(index+1)).style.opacity = 0.4;
				})
			});
			/////// 상영 예정작
			document.querySelectorAll(".popularPoster2").forEach(function(item,index) {
				item.addEventListener("mouseenter", () => {
					document.querySelector("#preLookDetail"+(index+1)).style.display="block";
		            item.style.opacity = 0.4;
				})
			});
			document.querySelectorAll(".popularPoster2").forEach(function(item, index) {
				item.addEventListener("mouseleave", () => {
					document.querySelector("#preLookDetail"+(index+1)).style.display="none";
		            item.style.opacity = 1;
				})
			});
			document.querySelectorAll(".preLookDetail").forEach(function(item,index) {
				item.addEventListener("mouseenter", () => {
					item.style.display="block";
		            document.getElementById('preImg'+(index+1)).style.opacity = 0.4;
				})
			});
	        
	        // 상영예정작 인기차트 구분 JS
	        var p1 = document.getElementsByClassName("popular");
	        var p2 = document.getElementsByClassName("popular2");
	        function showPopular(){
	        	document.querySelector(".popularBtn").style.fontWeight = "900";
	        	document.querySelector(".popularBtn").style.textDecoration = "underline";
	        	document.querySelector(".trailerMovieBtn").style.fontWeight = "500";
	        	document.querySelector(".trailerMovieBtn").style.textDecoration = "none";
	        	document.querySelectorAll(".popular2").forEach(function (item, index) {
	                item.style.display = "none";
	            });
	        	document.querySelectorAll(".popular").forEach(function (item, index) {
	        		item.style.display = "block";
	            });
	        };
	        function showComing(){
	        	document.querySelector(".trailerMovieBtn").style.fontWeight = "900";
	        	document.querySelector(".trailerMovieBtn").style.textDecoration = "underline";
	        	document.querySelector(".popularBtn").style.fontWeight = "500";
	        	document.querySelector(".popularBtn").style.textDecoration = "none";
	        	document.querySelectorAll(".popular2").forEach(function (item, index) {
	                item.style.display = "block";
	            });
	        	document.querySelectorAll(".popular").forEach(function (item, index) {
	        		item.style.display = "none";
	            });
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