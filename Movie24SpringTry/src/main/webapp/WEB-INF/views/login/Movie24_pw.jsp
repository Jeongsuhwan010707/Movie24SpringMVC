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
        <link rel="stylesheet" href="/resources/css/login/Movie24_pw.css">
    </head>
    <body>
        <div>
            <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
			<main>
			    <div id="main_logo">
			        <h1>아이디 / 비밀번호 찾기</h1>
			    </div>
			    <div id="main_content">
			        <div id="login_li">
			        	<a id="id" href="/member/searchId.do">아이디 찾기</a>
			           	<a id="pw" href="/member/searchPw.do">비밀번호 찾기</a>
			        </div>
			        <p><b>비밀번호가 기억나지 않으세요?</b><br><br> 원하시는 방법을 선택하여 비밀번호를 확인하실 수 있습니다. <br>
			            본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</p>
			        <div id="empty"></div>
			        <div id="img_area">
			            <div id="main_image1">
			                <img src="/resources/images/휴대폰인증.png" alt="">
			                <div id="main_image1_text"><p>휴대폰 인증</p></div>
			            </div>
			            <div id="main_image2">
			                <img src="/resources/images/아이핀인증.png" alt="">
			                <div id="main_image2_text"><p>아이핀 인증</p></div>
			            </div>
			        </div>
			        <div id="main_button">
			            <a href="/member/login.do">로그인</a>
			        </div>
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