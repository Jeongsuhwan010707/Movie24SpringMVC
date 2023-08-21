<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="/resources/css/login/Movie24_sign_done.css">
    </head>
    <body>
        <div>
           <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
			<main>
			    <div id="main_logo">
			        <h1>회원가입</h1>
			    </div>
			    <div id="main_content">
			        <div id="login_li">
			            <ul>
			                <li>본인인증</li>
			                <li>약관동의</li>
			                <li>정보입력</li>
			                <li><strong>가입완료</strong></li>
			            </ul>
			        </div>
			        <div id="congret">
			            <img src="/resources/images/moon.png" alt="">
			        </div>
			        <div id="main_text">
			            <h1>축하합니다!
			                <br>가입이 완료되었습니다.
			            </h1>
			            <p>앞으로도 Movie24와 함께해요</p>
			        </div>
			        <a href="/member/login.do">로그인</a>
			    </div>
			</main>
	         <!-- --------------------푸터---------------------------------- -->
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
	        function myCheck(){
	        	alert("로그인이 되어있지 않습니다.");
	        }
	
	    </script>
    </body>
</html>    