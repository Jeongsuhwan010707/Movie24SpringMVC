<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Movie24</title>
        <link rel="stylesheet" href="/resources/css/include/header.css">
        <link rel="stylesheet" href="/resources/css/include/nav.css">
        <link rel="stylesheet" href="/resources/css/include/footer.css">
        <link rel="stylesheet" href="/resources/css/movieReservation/Movie24_seat.css">
    </head>
    <body>
        <div>
            <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
            <!-- ---------메인 영역--------------------------- -->
		<main>
	        <div id="main_button">
	            <button>ENGLISH</button>
	            <a href="/movie24/movieReservationMovie24_time.html"><button>상영시간표</button></a>
	            <a href="/movie24/movieReservationMovie24_time.html"><button>취소하기</button></a>
	        </div>
	        <h1>예매하기</h1>
	        <div id="select">
	            <div id="select_logo"><p>관람인원선택</p></div>
	            <div id="select_per">
	                <div>
	                    <p>성인</p>
	                    <ul>
	                        <li>1</li>
	                        <li>2</li>
	                        <li>3</li>
	                        <li>4</li>
	                        <li>5</li>
	                        <li>6</li>
	                        <li>7</li>
	                        <li>8</li>
	                    </ul>
	                    <p>청소년</p>
	                    <ul>
	                        <li>1</li>
	                        <li>2</li>
	                        <li>3</li>
	                        <li>4</li>
	                        <li>5</li>
	                        <li>6</li>
	                        <li>7</li>
	                        <li>8</li>
	                    </ul>
	                </div>
	            </div>
	                <div id="select_img">
	                    <img src="/resources/images/좌석배치.png" alt="">
	                </div>
	        </div>
	        <div id="price">
	            <div id="price1">
	                <img src="/resources/images/15.png" alt="">
	                <h3>범죄도시3(2D)</h3>
	            </div>
	            <div id="price2">
	                <div id="price2-1">
	                    <p>강남</p><p>3관</p><p>2023.06.09</p><p>17:30~19:15</p> 
	                </div>
	                <div id="price2-2">
	                    <img src="/resources/images/범죄도시.png" alt="">
	                </div>
	            </div>
	            <div id="price3"><img src="/resources/images/스크린샷(99).png" alt=""></div>
	            <div id="price4">
	                <div id="price4-1">
	                    최종결제금액
	                </div>
	                <div id="price4-2">
	                    <p id="price-number2">원</p>
	                    <p id="price-number1">0</p>
	                </div>
	            </div>
	            <div id="price5">
	                <div id="price5-1-1"><a id="price5-1" href="/movie24/movieReservationMovie24_time.html">이전</a></div>
	                <div id="price5-2-2"><a id="price5-2" href="/movie24/movieReservationMovie24_pay.html">다음</a></div>
	            </div>
	        </div>
		</main>
         <!-- --------------------푸터---------------------------------- -->
         <!-- <footer> ----------------------------</footer> -->
            <jsp:include page="/include/footer.jsp"></jsp:include>
	    </div>
	    <!-- 스크립트 -->
	    <script>
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
		    function myCheck(){
	        	const memberId = "${memberId}";
				if(memberId === ""){
					alert("로그인 후 이용가능한 기능입니다.");
	            	if(confirm("로그인 페이지로 이동하시겠습니까?")){
	            		location.href="/member/login.do";
	            	}
				}else{
					    modal.style.display = "block";
				}
	        }
	    </script>
	</body>
</html>