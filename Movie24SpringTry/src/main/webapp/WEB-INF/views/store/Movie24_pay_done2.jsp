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
        <link rel="stylesheet" href="/resources/css/store/Movie24_pay_done2.css">
    </head>
    <body>
        <div>
           <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
			<main>
			    <div id="main_logo">
			        <div class="logo">
			            <img src="/resources/images/shopping-cart (1).png" alt="">
			            <h1>장바구니</h1>
			        </div>
			        <img src="/resources/images/right-arrow (2).png" alt="">
			        <div class="logo">
			            <img src="/resources/images/credit-card.png" alt="">
			            <h1>결제하기</h1>
			        </div>
			        <img src="/resources/images/right-arrow (2).png" alt="">
			        <div class="logo">
			            <img src="/resources/images/popcorn.png" alt="">
			            <h1 id="h11">구매완료</h1>
			        </div>
			    </div>
			        <div id="congret">
			            <img src="/resources/images/cinema (1).png" alt="">
			        </div>
			        <div id="main_text">
			            <h1>감사합니다!
			                <br>결제가 완료되었습니다.
			            </h1>
			            <p>마이페이지에서 구매내역을 확인해보세요~</p>
			        </div>
			        <a href="/">Home</a>
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
	
	    </script>
	</body>	    
</html>