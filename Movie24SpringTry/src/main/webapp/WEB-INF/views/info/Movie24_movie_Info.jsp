<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
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
        <link rel="stylesheet" href="/resources/css/main/Movie24_movie_info.css">
<!--         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"> -->
    </head>
    <body>
        <div>
             <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
			<jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
		<main> 
		    <section>
		        <div id="img_area"><img src="${mInfo.movieSrc }" alt=""></div>
				<div id="image_left">
				    <div id="main_title">
				        <h2><img class="movie-age" alt="" src="${mInfo.ageImage }"> ${mInfo.movieName }(${mInfo.movieEnName })</h2>
				    <span id="span1">예매중</span><span id="span2">D-10</span>
					</div>
					<div id="main_text1">
					    <p>예매율 90%</p>
					</div>
					<div id="main_text2">
					    <p>감독 : ${mInfo.director } / 배우 : ${mInfo.actor }
						<br>장르 : ${mInfo.genre } / 기본 정보 : ${mInfo.filmRating }, ${mInfo.runningTime }, ${mInfo.country }
						<br>개봉 : ${mInfo.openDate }</p>
					</div>
					<c:if test="${memberId ne null }"> 
						<c:if test="${mHeart.movieName eq null }"> 
							<button id="btn1" onclick="heartInsert();">❤ 찜하기 ${heartCount}</button>
						</c:if>
					</c:if>
					<c:if test="${mHeart.movieName eq mInfo.movieName}"> 
						<button id="btn1-1" onclick="heartDelete();">❤ 찜하기 ${heartCount}</button>
					</c:if>
			        <button id="btn2">⭐ 평점보기</button>
		    	</div>
			</section>
			<div id="main_menu">
			    <ul>
			        <li><a href="#movie-info">주요정보</a></li>
			        <li><a href="#movie-trailer">예고편</a></li>
			<!--             <li><a href="">스틸컷</a></li> -->
			         <li><a href="#movie-review">평점/리뷰</a></li>
			         <li><a href="/movieReservation/Movie24_time.html">상영시간표</a></li>
			     </ul>
			 </div>
			 <div class="title_movie" id="movie-info">
			     <p>주요정보</p>
			 </div>
			 <div id="title_text">
				<p id="movieExpl">
					<br><br>${mInfo.contentInfo }<br><br><br>
				</p>
			    </div>
			    <div id="img_area2">
			         <img id="status" src="/resources/images/표.png" alt="">
			    </div>
			    <a id="next" href="/movieReservation/Movie24_time.html">예매하기</a>
			    <div class="title_movie" id="movie-trailer">
			        <p>예고편</p>
			    </div>
			    <div id="video_area">
			        <video src="${mInfo.video }" controls></video>
			</div>
		<!--         <div class="title_movie"> -->
		<!--             <p>스틸컷</p> -->
		<!--         </div> -->
			<div class="title_movie" id="movie-review">
			    <p>관람평</p>
			</div>
			<div id="review">
			    <h2>등록된 감상평이 아직 없습니다.</h2>
			    <h1>첫 번째 감상평을 남겨주세요!</h1>
			</div>
			<form name="replyForm" action="/reply/add.do" method="post">
				<div>
					<c:if test="${memberId ne null}">
					    <button type="button" id="review_btn" class="review_btn" onclick="myCheck();">리뷰 작성</button>
					</c:if>
					<c:if test="${memberId eq null}">
					    <button type="button" class="review_btn" onclick="myCheck();" style="cursor:pointer;">리뷰 작성</button>
					</c:if>
				</div>
				<div id="img_area3">
				    <img src="/resources/images/review2.png" alt="">
				</div>
				<div id="bottomBlank"></div>
				<!-- 모달 -->
				<div id="myModal" class="modal">
				    <div class="modal-content">
					    <span class="close-btn" id="closeModalBtn">&times;</span>
						<h2>리뷰 등록하기!</h2>
						<p>[별점]</p>
							<input type="hidden" name="refMovieNo" value="${mInfo.movieNum}">
						  	<div class="stars" id="starContainer">
						  		<div class="starBlank"></div>
							    <span class="star" star-count="1">&#9733;</span>
							    <span class="star" star-count="2">&#9733;</span>
							    <span class="star" star-count="3">&#9733;</span>
							    <span class="star" star-count="4">&#9733;</span>
							    <span class="star" star-count="5">&#9733;</span>
							    <input type="hidden" name="starNo" id="starNo" value="">
							    <input type="hidden" name="movieName" value="${mInfo.movieName}">
							    <div class="starBlank"></div>
						  	</div>
							<p>[리뷰 댓글]</p>
						  	<textarea id="comment" placeholder="리뷰를 남겨주세요!" name="replyContent"></textarea>
						  	<button id="submitBtn" type="button">등록하기</button>
						  	<button id="reviewBackBtn">취소하기</button>
					</div>				
				</div>
			</form>
			<h2 id="replyTitle">리뷰</h2>
			<table class="reviewTable">
			  <c:forEach var="reply" items="${rList}" varStatus="i">
			    <tr class="reviewRow">
			      <td class="reviewCell">
			        <div class="replyImg">
			          <img src="/resources/images/account (2).png" alt="">
			        </div>
			        <div class="reply">
			          <h4>${reply.replyWriter}</h4>
			          <div class="starArea">
			          	<c:choose>
			              <c:when test="${reply.starRating eq '★'}">⭐</c:when>
			              <c:when test="${reply.starRating eq '★★'}">⭐⭐</c:when>
			              <c:when test="${reply.starRating eq '★★★'}">⭐⭐⭐</c:when>
			              <c:when test="${reply.starRating eq '★★★★'}">⭐⭐⭐⭐</c:when>
			              <c:when test="${reply.starRating eq '★★★★★'}">⭐⭐⭐⭐⭐</c:when>
			            </c:choose>
			          </div>
			          <p>${reply.replyContent}</p>
			          <span>
			            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${reply.rCreateDate}" />&nbsp;
			            <c:if test="${memberId eq reply.replyWriter}">
				            <a href="javascript:void(0);" onclick="showModifyForm(this);">수정하기</a>&nbsp;
							<a href="javascript:void(0);" onclick="deleteReview();" data-reply-no="${reply.replyNo}" data-movie-name="${mInfo.movieName}">삭제하기</a>
			            </c:if>
			          </span>
			        </div>
			      </td>
			    </tr>
<!-- 			    수정폼 -->
				<tr id="replyModifyForm" class="reviewRow" style="display:none;">
				    <td class="reviewCell">
				        <div class="replyImg">
				          <img src="/resources/images/account (2).png" alt="">
				        </div>
				        <div class="reply">
				          <h4>${reply.replyWriter}</h4>
				          <textarea id="replyContent" class="contentTextarea">${reply.replyContent}</textarea>
			              <a href="javascript:void(0);" onclick="replyModify(this, '${reply.replyNo}', '${reply.refMovieNo }');" class="modifyReply">수정하기</a>
						  <a href="javascript:void(0);" onclick="modifyback();" class="modifyReply">뒤로가기</a>
				        </div>
				    </td>
				</tr>
			  </c:forEach>
			</table>
			<div class="reply_blank"></div>
	  	</main>
         <!-- --------------------푸터---------------------------------- -->
	         <!-- <footer> ----------------------------</footer> -->
            <jsp:include page="/include/footer.jsp"></jsp:include>
	    </div>
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
			
	        function goReview(){
	        	location.href="/movie/review.do";
	        }
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
            function heartInsert(){
            	location.href = "/movie/heartInsert.do?movieName=${mInfo.movieName}";
            }
            function heartDelete(){
            	location.href = "/movie/heartDelete.do?movieName=${mInfo.movieName}";
            }
         	// 버튼과 모달 요소 가져오기
// 			var reviewBtn = document.getElementById("review_btn");
			var closeModalBtn = document.getElementById("closeModalBtn");
			var backModalBtn = document.getElementById("reviewBackBtn");
			var modal = document.getElementById("myModal");
			
			// 모달 열기 함수
// 			reviewBtn.onclick = function() {
				
// 			}
			
			// 모달 닫기 함수
			closeModalBtn.onclick = function() {
			  modal.style.display = "none";
			}
			backModalBtn.onclick = function() {
			  modal.style.display = "none";
			}
			
			// 모달 외부 클릭 시 닫기
// 			window.onclick = function(event) {
// 			  if (event.target == modal) {
// 			    modal.style.display = "none";
// 			  }
// 			}
			// 별점 관련
			var stars = document.querySelectorAll(".star");
			var starContainer = document.getElementById("starContainer");
			var rating = 0;
			
			// 별점 선택 시 처리
			stars.forEach(function(star) {
			  star.addEventListener("click", function() {
			    rating = parseInt(star.getAttribute("star-count"));
			    updateStars(rating);
			  });
			});
			
			// 별점 갱신
			function updateStars(selectedRating) {
			  stars.forEach(function(star) {
			    var starRating = parseInt(star.getAttribute("star-count"));
			    if (starRating <= selectedRating) {
			      star.classList.add("active");
			    } else {
			      star.classList.remove("active");
			    }
			  });
			}
			
			// 댓글 작성 버튼 클릭 시 처리
			var submitBtn = document.getElementById("submitBtn");
			submitBtn.addEventListener("click", function() {
			  var comment = document.getElementById("comment").value;
			  if(confirm("리뷰작성을 완료하시겠습니까?")){
				  if (rating > 0 && comment.trim() !== "") {
			          document.getElementById('starNo').value = rating;
				      alert("별점: " + rating + "\n댓글: " + comment);
				      const form = document.replyForm;
					  form.submit();
				    // 여기에 댓글 전송 등의 로직을 추가할 수 있습니다.
				  } else {
				      alert("별점과 댓글을 모두 입력해주세요.");
				  }
			  }
			});
			// 댓글 수정
			function showModifyForm(obj){
					obj.parentElement.parentElement.parentElement.parentElement.nextElementSibling.style.display="";
				}
			function modifyback(){
				document.getElementById("replyModifyForm").style.display = "none";
			}
			function replyModify(obj, replyNo, refMovieNo){
				const form = document.createElement("form");
				const movieName = "${mInfo.movieName}";
				form.action = "/reply/update.do?movieName="+movieName;
				form.method = "post";
				const input = document.createElement("input");
				input.type="hidden";
				input.value= replyNo;
				input.name="replyNo";
				const input2 = document.createElement("input");
				input2.type = "hidden";
				input2.value = refMovieNo;
				input2.name = "refMovieNo";
				const input3 = document.createElement("input");
				input3.type = "text";
				// 여기를 this를 이용하여 수정해주세요
//					input3.value = obj.parentElement.previousElementSibling.childNodes[1].value
				input3.value = obj.parentElement.children[1].value
				// children도 사용 가능함.
				input3.name = "replyContent";
				form.appendChild(input);
				form.appendChild(input2);
				form.appendChild(input3);
				
				
				form.appendChild(input);
				
				document.body.appendChild(form);
				form.submit();
			}
			function deleteReview() {
			    var button = event.target; // 클릭된 버튼 요소
			    var replyNo = button.getAttribute("data-reply-no");
			    var movieName = button.getAttribute("data-movie-name");

			    if (confirm("리뷰를 삭제하시겠습니까?")) {
			        location.href = "/reply/delete.do?replyNo=" + replyNo + "&movieName=" + movieName;
			    }
			}
	    </script>
	</body>
</html>    