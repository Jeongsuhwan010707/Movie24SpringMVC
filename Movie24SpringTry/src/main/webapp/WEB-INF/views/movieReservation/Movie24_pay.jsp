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
        <link rel="stylesheet" href="/resources/css/movieReservation/Movie24_pay.css">
    </head>
    <body>
        <div>
             <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
            <!-- ---------메인 영역--------------------------- -->
		<main>
		    <div id="main-left">
		        <div id="main_text">
		            <p>관람권 및 포인트 할인적용</p>
		        </div>
		        <div class="selectsale">
		            <p>Movie24 관람권/기프티콘</p><img src="/resources/images/down-arrow.png" alt="">
		        </div>
		        <div class="selectsaleContent">
		        	<p>관람권 / 기프티콘 할인을 선택해주세요</p>
		        	<select>
		        		<option>관람권 할인</option>
		        		<option>기프티콘 할인 </option>
		        	</select>
		        </div>
		        <div class="selectsale">
		            <p>Movie24 포인트/쿠폰</p><img src="/resources/images/down-arrow.png" alt="">
		        </div>
		        <div class="selectsaleContent">
		        	<p>관람권 / 기프티콘 할인을 선택해주세요</p>
		        	<select>
		        		<option>관람권 할인</option>
		        		<option>기프티콘 할인 </option>
		        	</select>
		        </div>
		        <div class="selectsale">
		        	<p>Vip 할인</p><img src="/resources/images/down-arrow.png" alt="">
		        </div>
		        <div class="selectsaleContent">
		        	<p>관람권 / 기프티콘 할인을 선택해주세요</p>
		        	<select>
		        		<option>관람권 할인</option>
		        		<option>기프티콘 할인 </option>
		        	</select>
		        </div>
		        <div id="main_text2">
		            <p>관람권 및 포인트 할인적용</p>
		        </div>
		        <div id="purchase">
		            <ul>
		                <li><input type="radio" name="purchase">신용/체크카드</li>
		                <li><input type="radio" name="purchase">휴대폰결제</li>
		                <li><input type="radio" name="purchase">간편결제</li>
		                <li><input type="radio" name="purchase">내통장결제</li>
		            </ul>
		        </div>
		        <div id="purchase2">
		            <p>카드사 선택</p><select name="" id="">
		                <option value="">비씨카드</option>
		                <option value="">국민카드</option>
		                <option value="">신한카드</option>
		                <option value="">삼성카드</option>
		                <option value="">롯데카드</option>
		                <option value="">농협카드</option>
		                <option value="">현대카드</option>
		                <option value="">하나카드</option>
		                <option value="">우리카드</option>
		                <option value="">신협카드</option>
		            </select>
		        </div>
		    </div>
		    <div id="main-right">
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
		        <div id="price3">
		            <div id="price3-1">
		                <p id="adult">성인1</p>
		                <p>14000</p>
		            </div>
		            <div id="price3-2">
		                <h3 id="real_price">금액</h3>
		                <h3>14,000원</h3>
		                <img src="/resources/images/minus (1).png" alt="">
		            </div>
		            <div id="price3-3">
		                <h3 id="disCount">할인적용</h3>
		                <h3>0원</h3>
		            </div>
		        </div>
		        <div class="price4 price-new">
		            <p class="price4-1 price4-1-new">VIP 할인</p>
		            <p class="price4-2 price4-2-new">0원</p>
		        </div>
		        <div class="price4 price_4">
		            <div class="price4-1">
		                최종결제금액
		            </div>
		            <div class="price4-2">
		                <p class="price-number2">원</p>
		                <p id="price-number1">14,000</p>
		            </div>
		        </div>
		        <div class="price4 price-new">
		            <p class="price4-1">결제수단</p>
		            <p class="price4-2 price4-3-new">신용/체크카드</p>
		        </div>
		        <div id="price5">
		            <div id="price5-1-1"><a id="price5-1" href="/movie/seat.do">이전</a></div>
		            <div id="price5-2-2"><a id="price5-2" href="/movie/paydone.do">다음</a></div>
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
			            menuText.style.zIndex = 15;
			        });
			
			        li.addEventListener('mouseleave', () => {
			            hoverIntent = false;
			            setTimeout(() => {
			                if (!hoverIntent) {
			                    menuText.classList.remove('active');
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
			            }
			        }, 200); // Add a delay before hiding to allow time for moving to menu_text
			    });
			    
			    const selectSales = document.querySelectorAll(".selectsale");

			    selectSales.forEach((selectSale) => {
			        const p = selectSale.querySelector("p");
			        const img = selectSale.querySelector("img");
			        const content = selectSale.nextElementSibling;

			        img.addEventListener("click", function (event) {
			            event.stopPropagation(); // 이미지를 클릭할 때 부모 div의 클릭 이벤트 전파를 방지
						
			            if(content.style.height == "200px"){
			                content.style.height = "0";
			                content.style.opacity = "0";
			                content.style.zIndex = "1";
			            }else{
			            	content.style.opacity = "1";
			                content.style.height = "200px";
			                content.style.zIndex = "2";
			            }
			        });
			    });
			});
			    // 제발 되라
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