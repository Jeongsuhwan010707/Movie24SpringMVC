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
        <link rel="stylesheet" href="/resources/css/store/Movie24_bag.css">
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
			            <h1 id="h11">장바구니</h1>
			        </div>
			        <img src="/resources/images/right-arrow (2).png" alt="">
			        <div class="logo">
			            <img src="/resources/images/credit-card.png" alt="">
			            <h1>결제하기</h1>
			        </div>
			        <img src="/resources/images/right-arrow (2).png" alt="">
			        <div class="logo">
			            <img src="/resources/images/popcorn.png" alt="">
			            <h1>구매완료</h1>
			        </div>
			    </div>
			    <div id="purchase">
			        <div id="purchase_up">
			            <ul>
			                <li id="name">상품명</li>
			                <li>판매금액</li>
			                <li>수량</li>
			                <li>구매금액</li>
			                <li>선택</li>
			            </ul>
			        </div>
			        <div id="purchase_down">
			            <div id="product">
			                <img src="/resources/images/cgv팝콘-removebg-preview.png" alt="">
			                <span><h2>팝콘 패키지 1</h2></span>
			                <p>팝콘(1), 음료(1), 관람권(1)</p>
			            </div>
			            <div class="product">
			                <p>12,000원</p>
			            </div>
			            <div class="product">
			                <select name="" id="">
			                    <option value="">1</option>
			                    <option value="">2</option>
			                    <option value="">3</option>
			                    <option value="">4</option>
			                    <option value="">5</option>
			                    <option value="">6</option>
			                </select>
			            </div>
			            <div class="product">
			                <p>12,000원</p>
			            </div>
			            <div class="product">
			                <img src="/resources/images/select.png" alt="">
			            </div>
			        </div>
			    </div>
			    <div id="no">
			        <p><strong>장바구니에 담긴 상품은 최대 30일까지 보관됩니다.</strong></p>
			        <button>선택상품 해제</button>
			    </div>
			    <div id="purchase2">
			
			        <div id="purchase_up2">
			            <ul>
			                <li>총 상품금액</li>
			                <li>할인금액</li>
			                <li>총 결제 예상금액</li>
			            </ul>
			        </div>
			        <div id="purchase_down2">
			            <ul>
			                <li>12,000원</li>
			                <li id="img1"><img width="50px" src="/resources/images/minus (2).png" alt=""></li>
			                <li>0원</li>
			                <li id="img2"><img width="50px" src="/resources/images/equal (1).png" alt=""></li>
			                <li id="blue">12,000원</li>
			            </ul>
			        </div>
			    </div>
			    <div id="main_select">
			        <a href="/movie24.store/Movie24_store.html"><button>뒤로</button></a>
			        <a href="/movie24/store/Movie24_store_pay.html"><button>구매하기</button></a>
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