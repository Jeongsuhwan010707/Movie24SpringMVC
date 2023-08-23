<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie24</title>
        <link rel="stylesheet" href="/resources/css/include/header.css">
        <link rel="stylesheet" href="/resources/css/include/nav.css">
        <link rel="stylesheet" href="/resources/css/include/footer.css">
        <link rel="stylesheet" href="/resources/css/main/Movie24_movie_info.css">
<!--         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
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
		                <h2><img class="movie-age" alt="" src="${mInfo.ageImage }"> ${mInfo.movieName }</h2>
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
		            <c:if test="${mHeart.movieName eq null }"> 
		            	<c:if test="${memberId ne null }"> 
			            	<button id="btn1" onclick="heartInsert();">❤ 찜하기</button>
		            	</c:if>
		            </c:if>
		            <c:if test="${mHeart.movieName eq mInfo.movieName}"> 
			            <button id="btn1-1" onclick="heartDelete();">❤ 찜하기</button>
		            </c:if>
		            <button id="btn2">⭐ 평점보기</button>
		        </div>
		    </section>
		    <div id="main_menu">
		        <ul>
		            <li><a href="#movie-info">주요정보</a></li>
		            <li><a href="#movie-trailer">예고편</a></li>
		<!--             <li><a href="">스틸컷</a></li> -->
		            <li><a href="#movie-review">평점/리뷰</a></li>
		            <li><a href="/movieReservation/Movie24_time.html">상영시간표</a></li>
		        </ul>
		    </div>
		    <div class="title_movie" id="movie-info">
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
	        <div class="title_movie" id="movie-trailer">
	            <p>예고편</p>
	        </div>
	        <div id="video_area">
	            <video src="${mInfo.video }" controls></video>
	        </div>
	<!--         <div class="title_movie"> -->
	<!--             <p>스틸컷</p> -->
	<!--         </div> -->
	        <div class="title_movie" id="movie-review">
	            <p>관람평</p>
	        </div>
	        <div id="review">
	            <h2>등록된 감상평이 아직 없습니다.</h2>
	            <h1>첫 번째 감상평을 남겨주세요!</h1>
	        </div>
	        <div>
	            <button id="review_btn" onclick="goReview()">리뷰 작성</button>
	        </div>
	        <div id="img_area3">
	            <img src="/resources/images/review2.png" alt="">
	        </div>
	        <div id="bottomBlank"></div>
	    </main>
         <!-- --------------------푸터---------------------------------- -->
	         <!-- <footer> ----------------------------</footer> -->
            <jsp:include page="/include/footer.jsp"></jsp:include>
	    </div>
	    <!-- 스크립트 -->
<!-- 	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script> -->
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
			
	        function goReview(){
	        	location.href="/movie/review.do";
	        }
	        function myCheck(){
            	alert("로그인이 되어있지 않습니다.");
            }
            function outCheck(){
            	if(confirm("로그아웃 하시겠습니까?")){
            		location.href="/member/logout.do";
            	}
            }
            function heartInsert(){
            	location.href = "/movie/heartInsert.do?movieName=${mInfo.movieName}&movieNum=${mInfo.movieNum}";
            }
            function heartDelete(){
            	location.href = "/movie/heartDelete.do?movieName=${mInfo.movieName}&movieNum=${mInfo.movieNum}";
            }
	    </script>
	</body>
</html>    