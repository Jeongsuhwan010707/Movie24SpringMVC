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
        <link rel="stylesheet" href="/resources/css/movieReservation/Movie24_pay.css">
    </head>
    <body>
        <div>
             <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------�׺������ ����----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
            <!-- ---------���� ����--------------------------- -->
		<main>
		    <div id="main-left">
		        <div id="main_text">
		            <p>������ �� ����Ʈ ��������</p>
		        </div>
		        <div class="main select1">
		            <p>Movie24 ������/����Ƽ��</p><img src="/resources/images/down-arrow.png" alt="">
		        </div>
		        <div class="main select2">
		            <p>Movie24 ����Ʈ/����</p><img src="/resources/images/down-arrow.png" alt="">
		        </div>
		        <div class="main select3"><img src="/resources/images/down-arrow.png" alt="">
		            <p>Vip ����</p>
		        </div>
		        <div id="main_text2">
		            <p>������ �� ����Ʈ ��������</p>
		        </div>
		        <div id="purchase">
		            <ul>
		                <li><input type="radio" name="purchase">�ſ�/üũī��</li>
		                <li><input type="radio" name="purchase">�޴�������</li>
		                <li><input type="radio" name="purchase">�������</li>
		                <li><input type="radio" name="purchase">���������</li>
		            </ul>
		        </div>
		        <div id="purchase2">
		            <p>ī��� ����</p><select name="" id="">
		                <option value="">��ī��</option>
		                <option value="">����ī��</option>
		                <option value="">����ī��</option>
		                <option value="">�Ｚī��</option>
		                <option value="">�Ե�ī��</option>
		                <option value="">����ī��</option>
		                <option value="">����ī��</option>
		                <option value="">�ϳ�ī��</option>
		                <option value="">�츮ī��</option>
		                <option value="">����ī��</option>
		            </select>
		        </div>
		    </div>
		    <div id="main-right">
		        <div id="price1">
		            <img src="/resources/images/15.png" alt="">
		            <h3>���˵���3(2D)</h3>
		        </div>
		        <div id="price2">
		            <div id="price2-1">
		                <p>����</p><p>3��</p><p>2023.06.09</p><p>17:30~19:15</p> 
		            </div>
		            <div id="price2-2">
		                <img src="/resources/images/���˵���.png" alt="">
		            </div>
		        </div>
		        <div id="price3">
		            <div id="price3-1">
		                <p id="adult">����1</p>
		                <p>14000</p>
		            </div>
		            <div id="price3-2">
		                <h3 id="real_price">�ݾ�</h3>
		                <h3>14,000��</h3>
		                <img src="/resources/images/minus (1).png" alt="">
		            </div>
		            <div id="price3-3">
		                <h3 id="disCount">��������</h3>
		                <h3>0��</h3>
		            </div>
		        </div>
		        <div class="price4 price-new">
		            <p class="price4-1 price4-1-new">VIP ����</p>
		            <p class="price4-2 price4-2-new">0��</p>
		        </div>
		        <div class="price4 price_4">
		            <div class="price4-1">
		                ���������ݾ�
		            </div>
		            <div class="price4-2">
		                <p class="price-number2">��</p>
		                <p id="price-number1">14,000</p>
		            </div>
		        </div>
		        <div class="price4 price-new">
		            <p class="price4-1">��������</p>
		            <p class="price4-2 price4-3-new">�ſ�/üũī��</p>
		        </div>
		        <div id="price5">
		            <div id="price5-1-1"><a id="price5-1" href="/movie24/movieReservation/Movie24_seat.html">����</a></div>
		            <div id="price5-2-2"><a id="price5-2" href="/movie24/movieReservation/Movie24_pay_done.html">����</a></div>
		        </div>
		    </div>
		</main>
         <!-- --------------------Ǫ��---------------------------------- -->
         <!-- <footer> ----------------------------</footer> -->
            <jsp:include page="/include/footer.jsp"></jsp:include>
	    </div>
	    <!-- ��ũ��Ʈ -->
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
					alert("�α��� �� �̿밡���� ����Դϴ�.");
	            	if(confirm("�α��� �������� �̵��Ͻðڽ��ϱ�?")){
	            		location.href="/member/login.do";
	            	}
				}else{
					    modal.style.display = "block";
				}
	        }
            function outCheck(){
            	if(confirm("�α׾ƿ� �Ͻðڽ��ϱ�?")){
            		location.href="/member/logout.do";
            	}
            }
	    </script>
	</body>
</html>	    