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
        <link rel="stylesheet" href="/resources/css/help/Movie24_help.css">
    </head>
    <body>
        <div>
            <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
		<main>
	      
	        <div id="blank_1"></div>
	        <div id="main_menu">
	            <div id="member">
	                <h3>1:1 문의사항</h3>
	                <ul>
	                    <li><a href="#">문의하기</a></li>
	                    <c:if test="${sessionScope.memberId ne null }">
	                     	<li><a href="/member/myPage.do">문의내역보기</a></li>
	                     </c:if>
	                    <li><a href="#">약관 확인</a></li>
	                </ul>
	                <h3>공지사항</h3>
	                <ul>
	                    <li><a href="/notice/post.do">공지사항목록</a></li>
	                </ul>
	                <h3>자주 찾는 질문</h3>
	                <ul>
	                    <li><a href="#">자주 찾는 질문</a></li>
	                </ul>
	
	                <h3>건의사항</h3>
	                <ul>
	                    <li><a href="#">건의사항</a></li>
	                    <li><a href="#">개선사항</a></li>
	                    <li><a href="#">도움말</a></li>
	                </ul>
	                <h3>검색</h3>
	                <ul>
	                    <li><a href="#">검색하기</a></li>
	                </ul>
	
	                <h3>환불문의</h3>
	                <ul>
	                    <li><a href="#">환불문의하기</a></li>
	                    <c:if test="${sessionScope.memberId ne null }">
	                     	<li><a href="/member/myPage.do">환불문의 내역보기</a></li>
	                     </c:if>
	                </ul>
	            </div>
	        </div>
	        <div id="main_blank"></div>
	        <div id="main_area">
	            <div class="area1">
	                <div class="area1_1">
	                    <img src="/resources/images/help.png" alt="">
	                    <h3>1:1 문의사항</h3>
	                </div>
	                <div class="area1_2">
	                    <a href="/notice/post.do"><img src="/resources/images/notice.png" alt=""></a>
	                    <h3><a href="/notice/post.do">공지사항</a></h3>
	                </div>
	                <div class="area1_3">
	                    <img src="/resources/images/list.png" alt="">
	                    <h3>자주 찾는 질문</h3>
	                </div>
	            </div>
	            <div class="area1">
	                <div class="area1_1">
	                    <img src="/resources/images/dislike.png" alt="">
	                    <h3>건의사항</h3>
	                </div>
	                <div class="area1_2">
	                    <img src="/resources/images/search.png" alt="">
	                    <h3>검색</h3>
	                </div>
	                <div class="area1_3">
	                    <img src="/resources/images/money-back.png" alt="">
	                    <h3>환불 문의</h3>
	                </div>
	            </div>
	            <!-- -------------------네모영역----------- -->
	            <div id="blankmini"></div>
	            <h3>나의 문의내역</h3>
	            <div id="area2">
	                <p>&nbsp; 고객님의 최근 문의내역이 존재하지 않습니다.</p> 
	            </div>
	        </div>
	        <a id="next" href="/movie/time.do">예매하기</a>
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
	        function outCheck(){
	        	if(confirm("로그아웃 하시겠습니까?")){
	        		location.href="/member/logout.do";
	        	}
	        }
	    </script>
	</body>
</html>    