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
        <link rel="stylesheet" href="/resources/css/main/Movie24_eventList.css">
    </head>
    <body>
        <div>
             <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
		<main>
		    <div id="main_logo">
		        <h1>전체 이벤트</h1>
		    </div>
		    <div class="eventArea">
		    	<div class="eventAreaForm">
			    	<div><h2>영화</h2></div>
			        <ul>
			        	<li>
			        		<div class="event-img">
					        	<a href="/movie24/event.do?eventSrcNum=7">				        	
						        	<img alt="" src="/resources/images/밀수event.jpg">
					        	</a>
			        		</div>
				        	<div class="event-text">2023.08.18 ~ 2023.08.24</div>
			        	</li>
			        	<li class="centerEvent">
			        		<div class="event-img"> 
				        		<a href="/movie24/event.do?eventSrcNum=8">				        	
						        	<img alt="" src="/resources/images/오펜하이머event.jpg">
					        	</a>
			        		</div>
				        	<div class="event-text">2023.08.15 ~ 2023.08.21</div>
			        	</li>
			        	<li>
			        		<div class="event-img"> 
				        		<a href="/movie24/event.do?eventSrcNum=9">				        	
					        		<img alt="" src="/resources/images/치킨의비밀event.jpg">
					        	</a>
			        		</div>
				        	<div class="event-text">2023.08.08 ~ 2023.08.22</div>
			        	</li>
			        </ul>
		    	</div>
		    	<div class="eventAreaForm">
			    	<div><h2>HOT</h2></div>
			        <ul>
			        	<li>
			        		<div class="event-img"> 
				        		<a href="/movie24/event.do?eventSrcNum=10">				        	
						        	<img alt="" src="/resources/images/eventHot1.jpg">
					        	</a>
			        		</div>
				        	<div class="event-text">2023.08.17 ~ 2023.09.13</div>
			        	</li>
			        	<li class="centerEvent">
			        		<div class="event-img">
				        		<a href="/movie24/event.do?eventSrcNum=11">				        	
						        	<img alt="" src="/resources/images/eventHot2.jpg">
					        	</a>
							</div>					        	
				        	<div class="event-text">2023.08.07 ~ 2023.08.31</div>
			        	</li>
			        	<li>
			        		<div class="event-img">
				        		<a href="/movie24/event.do?eventSrcNum=12">				        	
					        		<img alt="" src="/resources/images/eventHot3.jpg">
					        	</a>
				        	</div>
				        	<div class="event-text">2023.08.03 ~ 2023.09.15</div>
			        	</li>
			        </ul>
		    	</div>
		    	<div class="eventAreaForm">
			    	<div><h2>제휴할인</h2></div>
			        <ul>
			        	<li>
			        		<div class="event-img">
				        		<a href="/movie24/event.do?eventSrcNum=13">				        	
						        	<img alt="" src="/resources/images/eventSale1.jpg">
					        	</a>
							</div>					        	
				        	<div class="event-text">2023.08.08 ~ 2023.08.31</div>
			        	</li>
			        	<li class="centerEvent">
			        		<div class="event-img">
				        		<a href="/movie24/event.do?eventSrcNum=14">				        	
						        	<img alt="" src="/resources/images/eventSale2.jpg">
					        	</a>
				        	</div>
				        	<div class="event-text">2023.08.01 ~ 2023.08.31</div>
			        	</li>
			        	<li>
			        		<div class="event-img">
				        		<a href="/movie24/event.do?eventSrcNum=15">				        	
						        	<img alt="" src="/resources/images/eventSale3.jpg">
					        	</a>
					       	</div>
				        	<div class="event-text">2023.07.01 ~ 2023.09.30</div>
			        	</li>
			        </ul>
		    	</div>
		    	<div id="advertise">
		    		<a><img alt="" src="/resources/images/event광고.jpg"></a>
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
            function outCheck(){
            	if(confirm("로그아웃 하시겠습니까?")){
            		location.href="/member/logout.do";
            	}
            }
	    </script>
   </body>  
</html>    