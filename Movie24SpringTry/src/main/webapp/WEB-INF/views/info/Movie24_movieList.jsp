<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		                 <li>
		                     <a href="/movie/info.do?movieNum=1">
		                     	<img id="mainImg1" class="popularPoster1"  src="/resources/images/87090_320.jpg" alt="">
		                     	<button id="lookDetail1" class="lookDetail" style="cursor:pointer">상세보기</button>
		                    	</a>
		                     <h4><img class="age" alt="" src="/resources/images/12세.png"> 플래시</h4>
		                     <p>🕒 130분</p>
		                     
		                 </li>
		                 <li>
		                     <a href="/movie/info.do?movieNum=2">
		                     	<img id="mainImg2" class="popularPoster1" src="/resources/images/범죄도시.png" alt="" >
		                      <button id="lookDetail2" class="lookDetail" style="cursor:pointer">상세보기</button>
		                    	</a>
		                     <h4><img class="age" alt="" src="/resources/images/15세.png"> 범죄도시3</h4>
		                     <p>예매율 : 99% | 평점 4.5</p>
		                 </li>
		                 <li>
		                     <a href="/movie/info.do?movieNum=3">
		                     	<img id="mainImg3" class="popularPoster1" src="/resources/images/분노의질주.png" alt="" >
		                      <button id="lookDetail3" class="lookDetail" style="cursor:pointer">상세보기</button>
		                     </a>
		                     <h4><img class="age" alt="" src="/resources/images/15세.png"> 분노의 질주</h4>
		                     <p>예매율 : 99% | 평점 4.5</p>
		                 </li>
		                 <li>
		                     <a href="/movie/info.do?movieNum=4">
		                     	<img id="mainImg4" class="popularPoster1" src="/resources/images/가디언즈오브갤럭시.png" alt="" >
		                 		<button id="lookDetail4" class="lookDetail" style="cursor:pointer">상세보기</button>
		                     </a>
		                     <h4><img class="age" alt="" src="/resources/images/12세.png"> 가디언즈 ...</h4>
		                     <p>예매율 : 99% | 평점 4.5</p>
		                 </li>
		                 <li>
		                     <a href="/movie/info.do?movieNum=5">
		                      <img id="mainImg5" class="popularPoster1" src="/resources/images/위대한쇼맨.jpg" alt="" >
		                      <button id="lookDetail5" class="lookDetail" style="cursor:pointer">상세보기</button>
		                     </a>
		                     <h4><img class="age" alt="" src="/resources/images/12세.png"> 위대한쇼맨</h4>
		                     <p>예매율 : 99% | 평점 4.5</p>
		                 </li>
		             </ul>
		         </div>
			</div>
			<div class="popular">
			    <div class="popular_image">
			        <ul>
			            <li>
			                <a href="/movie/info.do?movieNum=1">
			                	<img id="mainImg6" class="popularPoster1"  src="/resources/images/87090_320.jpg" alt="">
			                	<button id="lookDetail6" class="lookDetail" style="cursor:pointer">상세보기</button>
			               	</a>
			                <h4><img class="age" alt="" src="/resources/images/12세.png"> 플래시</h4>
			                <p>예매율 : 99% | 평점 4.5</p>
			                
			            </li>
			            <li>
			                <a href="/movie/info.do?movieNum=2">
			                	<img id="mainImg7" class="popularPoster1" src="/resources/images/범죄도시.png" alt="" >
			                 <button id="lookDetail7" class="lookDetail" style="cursor:pointer">상세보기</button>
			               	</a>
			                <h4><img class="age" alt="" src="/resources/images/15세.png"> 범죄도시3</h4>
			                <p>예매율 : 99% | 평점 4.5</p>
			            </li>
			            <li>
			                <a href="/movie/info.do?movieNum=3">
			                	<img id="mainImg8" class="popularPoster1" src="/resources/images/분노의질주.png" alt="" >
			                 <button id="lookDetail8" class="lookDetail" style="cursor:pointer">상세보기</button>
			                </a>
			                <h4><img class="age" alt="" src="/resources/images/15세.png"> 분노의 질주</h4>
			                <p>예매율 : 99% | 평점 4.5</p>
			            </li>
			            <li>
			                <a href="/movie/info.do?movieNum=4">
			                	<img id="mainImg9" class="popularPoster1" src="/resources/images/가디언즈오브갤럭시.png" alt="" >
			            		<button id="lookDetail9" class="lookDetail" style="cursor:pointer">상세보기</button>
			                </a>
			                <h4><img class="age" alt="" src="/resources/images/12세.png"> 가디언즈 ...</h4>
			                <p>예매율 : 99% | 평점 4.5</p>
			            </li>
			            <li>
			                <a href="/movie/info.do?movieNum=5">
			                 <img id="mainImg10" class="popularPoster1" src="/resources/images/위대한쇼맨.jpg" alt="" >
			                 <button id="lookDetail10" class="lookDetail" style="cursor:pointer">상세보기</button>
			                </a>
			                <h4><img class="age" alt="" src="/resources/images/12세.png"> 위대한쇼맨</h4>
			                <p>예매율 : 99% | 평점 4.5</p>
			            </li>
			        </ul>
			    </div>
			</div>
<!--          /////////////////////////////////////////////////////////////상영예정작 -->
		     <div class="popular2">
		         <div class="popular_image">
		             <ul>
		                 <li>
		                     <a href="/movie/info.do?movieNum=6">
		                     	<img id="mainImg6" class="popularPoster1" src="/resources/images/엘리멘탈.jpg" alt="">
		                     	<button id="lookDetail6" class="lookDetail" style="cursor:pointer">상세보기</button>
		                     </a>
		                     <h4>1) 엘리멘탈</h4>
		                     <p>예매율 : 99% | 평점 4.5</p>
		                 </li>
		                <li>
		                     <a href="/movie/info.do?movieNum=7">
		                     	<img id="mainImg7" class="popularPoster1" src="/resources/images/바비.jpg" alt="">
		                      <button id="lookDetail7" class="lookDetail" style="cursor:pointer">상세보기</button>
		                     	</a>
		                     <h4>2) 바비</h4>
		                     <p>예매율 : 99% | 평점 4.5</p>
		                 </li>
		                 <li>
		                     <a href="/movie/info.do?movieNum=8">
		                      <img id="mainImg8" class="popularPoster1" src="/resources/images/콘크리트 유토피아.jpg" alt="">
		                      <button id="lookDetail8" class="lookDetail" style="cursor:pointer">상세보기</button>
		                     </a>
		                     <h4>3) 콘크리트 유토피아</h4>
		                     <p>예매율 : 99% | 평점 4.5</p>
		                 </li>
		                 <li>
		                     <a href="/movie/info.do?movieNum=9">
		                     	<img id="mainImg9" class="popularPoster1" src="/resources/images/밀수.jpg" alt="">
		                     	<button id="lookDetail9" class="lookDetail" style="cursor:pointer">상세보기</button>
		                    	</a>
		                     <h4>4) 밀수</h4>
		                     <p>예매율 : 99% | 평점 4.5</p>
		                 </li>
		                 <li>
		                     <a href="/movie/info.do?movieNum=10">
		                      <img id="mainImg10" class="popularPoster1" src="/resources/images/인어공주.png" alt="">
		                      <button id="lookDetail10" class="lookDetail" style="cursor:pointer">상세보기</button>
		                     </a>
		                     <h4>5) 인어공주</h4>
		                     <p>예매율 : 99% | 평점 4.5</p>
		                 </li>
		             </ul>
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
	        document.querySelectorAll(".popularPoster1").forEach(function(item,index) {
				item.addEventListener("mouseenter", () => {
	//					item.nextElementSilbing.style.display = "block";
					document.querySelector("#lookDetail"+(index+1)).style.display="block";
		            item.style.opacity = 0.4;
		            item.style.border = "2px solid #999797";
				})
			});
			document.querySelectorAll(".popularPoster1").forEach(function(item, index) {
				item.addEventListener("mouseleave", () => {
					document.querySelector("#lookDetail"+(index+1)).style.display="none";
		            item.style.opacity = 1;
		            item.style.border = "1px solid #ccc";
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
	        });
	        var p1 = document.getElementsByClassName("popular");
	        var p2 = document.getElementsByClassName("popular2");
	        function showPopular(){
	        	document.querySelector(".popularBtn").style.fontWeight = "900";
	        	document.querySelector(".popularBtn").style.textDecoration = "underline";
	        	document.querySelector(".trailerMovieBtn").style.fontWeight = "500";
	        	document.querySelector(".trailerMovieBtn").style.textDecoration = "none";
	            document.getElementsByClassName("popular2").style.display = "none";
	            document.getElementsByClassName("popular").style.display = "block";
	        };
	        function showComing(){
	        	document.querySelector(".trailerMovieBtn").style.fontWeight = "900";
	        	document.querySelector(".trailerMovieBtn").style.textDecoration = "underline";
	        	document.querySelector(".popularBtn").style.fontWeight = "500";
	        	document.querySelector(".popularBtn").style.textDecoration = "none";
	            document.getElementsByClassName("popular").style.display = "none";
	            document.getElementsByClassName("popular2").style.display = "block";
	        };
	    </script>
	</body>
</html>    