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
        <link rel="stylesheet" href="/resources/css/help/Movie24_post_info.css">
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
	        
	        <div id="table">
	            <table>
	                <tr id="tr1">
	                    <th id="tr">제목 : ${notice.noticeSubject}</th>
	                    <td class="tr2">작성자 : ${notice.noticeWriter}</td>
	                    <td class="tr1">등록일 : ${notice.noticeDate}</td>
	                    <td class="tr">조회수 : ${notice.viewCount}</td>
	                </tr>
                </table>
	            </div>
	        <div id="blank">
	        	<c:if test="${notice.noticeFilename ne null}">
	        		<img id="noticeConImg" alt="" src="/resources/uploadFiles/${notice.noticeFileRename }">
<%-- 	        		<a href="/resources/uploadFiles/${notice.noticeFilename }" download>${notice.noticeFilename }</a> --%>
	        		<p id="blank-img"></p>
	        	</c:if>
	            <p id="blankmsg">${notice.noticeContent}</p>
	        	<c:if test="${notice.noticeFilename eq null}">
	        		<p id="blankblank"></p>
	        	</c:if>
	        </div>
            <a id="back-btn" href="/notice/post.do">목록으로</a>
	        <div id="back">
	            <p class="b1"><strong>이전글 ▲</strong></p> 
	            <c:if test="${notice.noticeNo ne totalNum}">
	            	<c:if test="${noticeB.noticeSubject ne null}"> 
			            <p id="b2"><a href="/notice/postInfo.do?noticeNo=${noticeB.noticeNo}"><strong>${noticeB.noticeSubject }</strong></a></p>
			            <p class="b3">등록일 : ${noticeB.noticeDate }</p>
	            	</c:if>
	            </c:if>
	            <c:if test="${notice.noticeNo eq totalNum}">
		            <p id="b2">이전 글이 존재하지 않습니다.</p>
	            </c:if>
	        </div>
	        <div id="next">
	            <p class="b1"><strong>다음글 ▼</strong></p> 
	            <c:if test="${noticeN.noticeNo ne null}">
		            <p id="b2"><a href="/notice/postInfo.do?noticeNo=${noticeN.noticeNo}"><strong>${noticeN.noticeSubject}</strong></a></p>
	    	        <p class="b3">등록일 : ${noticeN.noticeDate }</p>
	            </c:if>
	            <c:if test="${noticeN.noticeNo eq null}">
	            	<p id="b2">다음 글이 존재하지 않습니다.</p>
	            </c:if>
	        </div>
	        <div id="main_button">
	            <c:if test="${memberId eq 'khuser01'}">
		            <a href="/notice/modify.do?noticeNo=${notice.noticeNo}" id="modify">수정하기</a>
		            <a href="javascript:void(0)" onclick="deleteCheck();" id="delete">삭제하기</a>
	            </c:if>
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
	        const deleteCheck = () => {
				const noticeNo = '${notice.noticeNo}';
				if(confirm("공지사항을 삭제하시겠습니까?")){
					location.href = "/notice/postDelete.do?noticeNo="+noticeNo;
				}
			}
	    </script>
    </body>
</html>    