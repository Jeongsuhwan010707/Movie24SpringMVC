<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
        <link rel="stylesheet" href="/resources/css/main/Movie24_event_info.css">
    </head>
    <body>
        <div>
             <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
		<main>
		    <div id="main_logo">
		        <h1>이벤트</h1>
		    </div>
		    <div id="img_area">
		        <img src="${src }" alt="">
		    </div>
		    <div id="main_button">
		        <a href="/">목록으로</a>
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
            function outCheck(){
            	if(confirm("로그아웃 하시겠습니까?")){
            		location.href="/member/logout.do";
            	}
            }
	    </script>
	</body>    
</html>    