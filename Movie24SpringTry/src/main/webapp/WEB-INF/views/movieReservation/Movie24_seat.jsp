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
            <!-- -----------�׺������ ����----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
            <!-- ---------���� ����--------------------------- -->
		<main>
	        <div id="main_button">
	            <button style="cursor:pointer;">ENGLISH</button>
	            <a href="/movie/time.do" style="cursor:pointer;"><button>�󿵽ð�ǥ</button></a>
	            <a href="/" style="cursor:pointer;"><button>����ϱ�</button></a>
	        </div>
	        <h1>�����ϱ�</h1>
	        <div id="select">
	            <div id="select_logo"><p>�����ο�����</p></div>
	            <div id="select_per">
	                <div>
	                    <p>����</p>
	                    <ul>
	                        <c:forEach begin="1" end="8" varStatus="i">
	                    		<li>${i.count}</li>
	                    	</c:forEach>
	                    </ul>
	                    <p>û�ҳ�</p>
	                    <ul>
	                    	<c:forEach begin="1" end="8" varStatus="i">
	                    		<li>${i.count}</li>
	                    	</c:forEach>
	                    </ul>
	                </div>
	            </div>
                <div id="select_img">
                	<div>
	                	<img src="/resources/images/screen.png" alt="">
                	</div>
                	<div>
	                	<div class="seat-number" style="width: 40px;height: 100%;float: left">
	                		<a class="seatR">A</a>
	                		<a class="seatR">B</a>
	                		<a class="seatR">C</a>
	                		<a class="seatR">D</a>
	                		<a class="seatR">E</a>
	                		<a class="seatR">F</a>
	                		<a class="seatR">G</a>
	                		<a class="seatR">H</a>
	                		<a class="seatR">I</a>
	                		<a class="seatR">J</a>
	                	</div>
	                	<div class="seat-container" style="margin-top: 30px;">
	                		<div style="width: 54%;margin: 0px auto;">
	                			<c:forEach var="column" begin="1" end="10">
						            <c:forEach var="column" begin="1" end="15">
						            	<c:if test="${column eq 5}">						            	
							                <div class="seat A" style="float:left;">${column}</div>
							                <div class="seatblank" style="float:left;"></div>
						            	</c:if>
						            	<c:if test="${column ne 5}">						            	
							                <div class="seat A" style="float:left;">${column}</div>
						            	</c:if>
						            </c:forEach>
						        </c:forEach>
	                		</div>
					    </div>
	                </div>
               	</div>
	        </div>
	        <div id="price">
	            <div id="price1">
	                <img alt="����������" src="/resources/images/15���̻������.png">
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
<!-- 	            	<img src="/resources/images/��ũ����(99).png" alt=""> -->
					<div style="width: 300px;height:250px;border: 1px solid #5c5c5c;margin:0 auto;border-radius:5px;margin-top:10px;">
						<div style="width:58%;height:100%;float:left;border-right: 1px solid #5c5c5c;">
							<div class="seat-menu">
								<div class="seat-shape"><div class="shape-menu shape-A"></div><p class="shape-text">����</p></div>
							</div>
							<div class="seat-menu">
								<div class="seat-shape"><div class="shape-menu shape-B">X</div><p class="shape-text">���ſϷ�</p></div>
							</div>
							<div class="seat-menu">
								<div class="seat-shape"><div class="shape-menu shape-C"></div><p class="shape-text">���úҰ�</p></div>
							</div>
							<div class="seat-menu">
								<div class="seat-shape"><div class="shape-menu shape-D"></div><p class="shape-text">�Ϲ�</p></div>
							</div>
							<div class="seat-menu">
								<div class="seat-shape"><div class="shape-menu shape-E"></div><p class="shape-text">����μ�</p></div>
							</div>
						</div>
						<div style="width:42%;height:100%;float:left;">
							<div style="font-family: 'Pretendard-Regular';padding: 15px;">�����¼�</div>
							<div class="seatbox">-</div>
							<div class="seatbox">-</div>
							<div class="seatbox">-</div>
							<div class="seatbox">-</div>
							<div class="seatbox">-</div>
							<div class="seatbox">-</div>
							<div class="seatbox">-</div>
							<div class="seatbox">-</div>
						</div>
					</div>
            	</div>
	            <div id="price4">
	                <div id="price4-1">
	                    ���������ݾ�
	                </div>
	                <div id="price4-2">
	                    <p id="price-number2">��</p>
	                    <p id="price-number1">0</p>
	                </div>
	            </div>
	            <div id="price5">
	                <div id="price5-1-1"><a id="price5-1" href="/movie/time.do">����</a></div>
	                <div id="price5-2-2"><a id="price5-2" href="/movie/pay.do">����</a></div>
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
	    </script>
	</body>
</html>