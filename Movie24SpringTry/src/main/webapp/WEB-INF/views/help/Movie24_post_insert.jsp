<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link rel="stylesheet" href="/resources/css/help/Movie24_post_insert.css">
    </head>
    <body>
        <div>
             <jsp:include page="/include/header.jsp"></jsp:include>
            <!-- -----------네비게이터 영역----------------------------------- -->
            <jsp:include page="/include/nav.jsp"></jsp:include>
        <!-- -----------------메인--------------------------- -->
		<main>
            <div id="blank_1"></div>
            <div id="main_menu">
                <div id="member">
                    <h3>1:1 문의사항</h3>
                    <ul>
                        <li><a href="#">문의하기</a></li>
                        <c:if test="${sessionScope.memberId ne null }">
	                        <li><a href="/member/myPage.do">문의내역보기</a></li>
						</c:if>
                        <li><a href="#">약관 확인</a></li>
                    </ul>
                    <h3>공지사항</h3>
                    <ul>
                        <li><a href="/notice/post.do">공지사항목록</a></li>
                    </ul>
                    <h3>자주 찾는 질문</h3>
                    <ul>
                        <li><a href="#">자주 찾는 질문</a></li>
                    </ul>

                    <h3>건의사항</h3>
                    <ul>
                        <li><a href="#">건의사항</a></li>
                        <li><a href="#">개선사항</a></li>
                        <li><a href="#">도움말</a></li>
                    </ul>
                    <h3>검색</h3>
                    <ul>
                        <li><a href="#">검색하기</a></li>
                    </ul>

                    <h3>환불문의</h3>
                    <ul>
                        <li><a href="#">환불문의하기</a></li>
                        <c:if test="${sessionScope.memberId ne null }">
	                        <li><a href="/member/myPage.do">환불문의 내역보기</a></li>
						</c:if>
                    </ul>
                </div>
            </div>
            <div id="main_blank"></div>
	        <div id="h2">
	            <h2>공지사항</h2>
	        </div>
	         <form name="insertForm" action="/notice/postInsert.do" method="post" enctype="multipart/form-data">
		        <input type="hidden" name="noticeWriter" value="${memberNickname}">
		        <div id="titleArea">
		            <input type="text" id="postTitle" placeholder=" (작성글) 제목을 입력해주세요." name="noticeSubject">
		        </div>
		        <div id="imgArea">
		            <img src="/resources/images/postInsert.png" id="postImg" alt="">
		        </div>
		        <div id="fileArea">
			        <label>&nbsp;첨부파일&nbsp;</label>
					<input type="file" name="uploadFile">
		        </div>
		        <div id="contentArea">
		            <textarea cols="139.5" rows="30" name="noticeContent" id="postContent" placeholder=" 내용을 입력해주세요."></textarea>
		        </div>
		         <a href="/notice/post.do" id="smbtn">목록으로</a>
		       <div id="postLast"></div>
		       
		        <div id="main_button">
		        	<button type="button" onclick="checkInsert();">등록하기</button>
		        </div>
         	</form>
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
	        function outCheck(){
	        	if(confirm("로그아웃 하시겠습니까?")){
	        		location.href="/member/logout.do";
	        	}
	        }
	        function checkInsert(){
	        		const form = document.insertForm;
	        	if(confirm("게시글을 등록하시겠습니까?")){
					form.submit();
	        	}
	        }
	    </script>
   	</body>
</html>  