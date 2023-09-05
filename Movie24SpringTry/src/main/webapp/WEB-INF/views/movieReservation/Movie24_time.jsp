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
        <link rel="stylesheet" href="/resources/css/movieReservation/Movie24_time.css">
    </head>
    <body>
        <div>
            <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------�׺������ ����----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
            <!-- ---------���� ����--------------------------- -->
		<main>
		    <div id="main_select">
		        <div id="main_select_left">
		            <div id="main_select_left1">
		                <a href="javascript:void(0)" onclick="showMovieList();"><img src="/resources/images/��ȭ��grey.png" alt="">��ȭ��</a>
		            </div>
		            <div id="main_select_left2">
		                <a href="javascript:void(0)" onclick="showTheaterList();"><img src="/resources/images/���庰.png" alt="">���庰</a>
		            </div>
		        </div>
		        <div id="main_select_right">
		            <div id="main_select_right1">
		                <span class="span1">��ü ��ȭ</span>
		                <span class="span2" style="display:none;" onclick="showNList(this);">
			                <c:forEach var="regions" items="${rList}" varStatus="i">
			                	<c:if test="${i.count ne 1 }">
				                	&nbsp;&nbsp; 
			                	</c:if>
				                	<a href="#">${regions.movieRegion }</a> &nbsp;&nbsp;
			                </c:forEach>
		                </span>
		            </div>
		            <div id="main_select_right2">
		                <div class="ul">
		                	<ul>
				                <c:forEach var="movies" items="${miYList}" varStatus="i">
				                	<c:if test="${movieNo eq movies.movieNo}">
				                		<li style="background-color:#e6e4e4;">
			                            <a href="/movie/time.do?movieNo=${movies.movieNo }">
				                        	${movies.movieName }
				                        </a>
										</li>
				                	</c:if> 
				                	<c:if test="${movieNo ne movies.movieNo}">
										<li>
				                            <a href="/movie/time.do?movieNo=${movies.movieNo }">
					                        	${movies.movieName }
					                        </a>
										</li>
									</c:if>
								</c:forEach>
		                	</ul>
		                    <ul style="display:none;">
		                    	<c:set var="prevRegion" value="" scope="page" />
				                <c:forEach var="theater" items="${tnList}" varStatus="i"> 
			                    	<c:url var="theaterNameUrl" value="/movie/time.do">
										<c:param name="movieNo" value="${theater.movieNo }"></c:param>
										<c:param name="movieEnRegion" value="${theater.movieEnRegion }"></c:param>
										<c:param name="movieTheaterEnName" value="${theater.movieTheaterEnName }"></c:param>
									</c:url>
									<c:if test="${theater.movieTheaterEnName ne prevRegion}">
										<c:if test="${movieTheaterEnName eq theater.movieTheaterEnName}">
					                		<li style="background-color:#e6e4e4;">
					                            <a href="${theaterNameUrl}">
						                        	${theater.movieTheaterName }
						                        </a>
											</li>
					                	</c:if>
					                	<c:if test="${movieTheaterEnName ne theater.movieTheaterEnName}">
											<li>
					                            <a href="${theaterNameUrl}">
						                        	${theater.movieTheaterName }
						                        </a>
											</li>
										</c:if>
							            <c:set var="prevRegion" value="${theater.movieTheaterEnName}" scope="page" />
							        </c:if>
								</c:forEach>
	                		</ul>
		                </div>
		            </div>
		        </div>
		    </div>
		    <!-------------------- ����â �� ����----------------------------->
		    <div id="banner">
		        <span id="span_banner">��ȭ�̸�</span>
		        <span>�󿵽ð�ǥ</span>
		    </div>
		    <div id="number">
		        <img class="img" src="/resources/images/back.png" alt="">
		        <ul id="dateList"></ul>
		        <img class="img" src="/resources/images/next.png" alt="">
		        <img class="cal" src="/resources/images/calendar (1).png" alt="">
		    </div>
		    <div id="country">
		        <span id="seoul"><a href="#">����</a></span>
		        <span><a href="#">���</a></span>
		        <span><a href="#">��õ</a></span>
		        <span><a href="#">����/��û/����</a></span>
		        <span><a href="#">�λ�/�뱸/���</a></span>
		        <span><a href="#">����/����</a></span>
		        <span><a href="#">����</a></span>
		    </div>
		    <c:set var="printRegion" value="" scope="page" />
		    <c:set var="seat" value="" scope="page" />
		    <c:set var="time" value="" scope="page" />
		    <c:forEach var="theater" items="${tnList}" varStatus="i">
		    	<c:if test="${theater.movieTheaterEnName ne printRegion}">
				    <div class="country_text">
				        <span>${theater.movieTheaterName }</span>
				    </div>
				    <c:set var="printRegion" value="${theater.movieTheaterEnName}" scope="page" />
			        <hr>
		    	</c:if>
		    	 <c:if test="${theater.movieTheaterNo ne seat}">
			    	<div class="tNum"><h4>${theater.movieTheaterNo}</h4>��${theater.movieSeat }��</div>
			    	<div class="d2">${theater.movieTheme}</div>
				 </c:if>
				 <c:if test="${theater.movieTime ne time}">
				 	<div class="seat_text"><a href="/movie/seat.do">${theater.movieTime }<br>${theater.movieLeftSeat }��</a></div>
				 </c:if>
				 <c:if test="${theater.movieTheaterNo ne seat}">
				    <c:set var="seat" value="${theater.movieTheaterNo}" scope="page" />
			    	<hr>
				 </c:if>
				 <c:if test="${theater.movieTheaterEnName ne printRegion}">   	    
			    	<div>�����</div>
			     </c:if>
		    </c:forEach>
<!-- 		    <div class="seat"> -->
<!-- 		        <div class="tNum"><h4>1��</h4>��200�� -->
<!-- 		        </div> -->
<!-- 		        <div class="d2">2D</div> -->
<!-- 		        <div class="seat_text"><a href="/movie/seat.do">17:50<br>200��</a></div> -->
<!-- 		        <div class="seat_text"><a href="/movie/seat.do">19:00<br>200��</a></div> -->
<!-- 		    </div> -->
		        
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
			//  ��¥ ��� �ڹٽ�ũ��Ʈ
			var dateList = document.getElementById("dateList");
	        var daysOfWeek = ['��', '��', 'ȭ', '��', '��', '��', '��'];
	        // ���� ��¥ ��������
	        var currentDate = new Date();
	        // 13��ġ�� ��¥ ���
	        var dateList = document.getElementById("dateList");
			var daysOfWeek = ['��', '��', 'ȭ', '��', '��', '��', '��'];
			// ���� ��¥ ��������
			var currentDate = new Date();
			
			// 13��ġ�� ��¥ ���
			for (var i = 0; i < 13; i++) {
			    var date = new Date(currentDate);
			    date.setDate(date.getDate() + i);
			
			    var dayOfWeek = daysOfWeek[date.getDay()];
			    var formattedDate = date.getDate();
			
			    var listItem = document.createElement("li");
			    var link = document.createElement("a");
			
// 			    if(i == 0){
// 			    	dayOfWeek = "����";
// 			    }
// 			    if(i == 1){
// 			    	dayOfWeek = "����";
// 			    }
			    // ������̸� class "sat", �Ͽ����̸� class "sun" �߰�
			    if (dayOfWeek === "��") {
			        link.className = "sat";
			    } else if (dayOfWeek === "��") {
			        link.className = "sun";
			    }
			
			    link.href = "#";
			    link.innerText = formattedDate + ' ' + dayOfWeek;
			
			    listItem.appendChild(link);
			    dateList.appendChild(listItem);
			}
			// ���� ���� �ƴ��� ����
			function showMovieList(){
				document.getElementById("main_select_left1").style.backgroundColor = "white";
				document.getElementById("main_select_left2").style.backgroundColor = "#e6e4e4";
				document.querySelector(".span1").style.display = "block";
				document.querySelector(".span2").style.display = "none";
				document.querySelector(".ul").children[0].style.display = "Block"
				document.querySelector(".ul").children[1].style.display = "none";
			}
			function showTheaterList(){
				document.getElementById("main_select_left2").style.backgroundColor = "white";
 				document.getElementById("main_select_left1").style.backgroundColor = "#e6e4e4";
 				document.querySelector(".span1").style.display = "none";
				document.querySelector(".span2").style.display = "block";
				document.querySelector(".ul").children[0].style.display = "none"
				document.querySelector(".ul").children[1].style.display = "Block";
			}
	    </script>
	</body>	    
</html>