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
		<link rel="stylesheet" href="/resources/css/help/Movie24_post.css">
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
				<form name="searchForm" action="/notice/search.do" method="get">
					<div id="post-text">
						<select name="searchCondition" id="searchOption">
							<option value="all" <c:if test="${paramMap.searchCondition == 'all'}"> selected</c:if>>전체</option>
							<option value="writer" <c:if test="${paramMap.searchCondition == 'writer'}"> selected</c:if>>작성자</option>
							<option value="title" <c:if test="${paramMap.searchCondition == 'title'}"> selected</c:if>>제목</option>
							<option value="content" <c:if test="${paramMap.searchCondition == 'content'}"> selected</c:if>>내용</option>
						</select>
						<input type="text" placeholder="검색할 내용을 입력해주세요." name="searchKeyword" value="${paramMap.searchKeyword}">
						<button type="button" id="searchPost" onclick="noticeSearch();">검색하기</button>
						<c:if test="${memberId ne null}">
							<a href="/notice/postInsert.do?memberNickname=${memberNickname }" id="postInsert">글쓰기</a>
						</c:if>
					</div>
					<div id="table">
						<table>
							<tr id="tr1">
								<th class="tr">번호</th>
								<th class="tr">글쓴이</th>
								<th id="tr">제목</th>
								<th class="tr">등록일</th>
								<th class="tr">조회수</th>
							</tr>
						</table>
					</div>
					<div id="table-1">
						<table>
							<tr id="postMain">
								<td class="tr">공지</td>
								<td class="tr">관리자</td>
								<td id="tr"><a href="/notice/postInfo.do?noticeNo=${notice0.noticeNo}">${notice0.noticeSubject}</a></td>
								<td class="tr">${notice0.noticeDate }</td>
								<td class="tr">0</td>
							</tr>
							<c:forEach var="notice" items="${sList}">
								<c:if test="${notice.noticeNo ne '0' }">
									<tr id="postList">
										<td class="tr">${notice.noticeNo }</td>
										<td class="tr">${notice.noticeWriter }</td>
										<td id="tr"><a
											href="/notice/postInfo.do?noticeNo=${notice.noticeNo}">${notice.noticeSubject}</a></td>
										<td class="tr">${notice.noticeDate }</td>
										<td class="tr">0</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</div>
					<div id="number">
						<c:if test="${pInfo.startNavi ne 1}">
							<c:url var="pageUrl" value="/notice/search.do">
								<c:param name="searchCondition" value="${paramMap.searchCondition}"></c:param>
								<c:param name="searchKeyword" value="${paramMap.searchKeyword}"></c:param>
								<c:param name="page" value="${pInfo.startNavi-1}"></c:param>
							</c:url>
							<a id="postNum" href="${pageUrl}"><</a> &nbsp;
						</c:if>
						<c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}" var="p">
							<c:url var="pageUrl" value="/notice/search.do">
								<c:param name="searchCondition" value="${paramMap.searchCondition}"></c:param>
								<c:param name="searchKeyword" value="${paramMap.searchKeyword}"></c:param>
								<c:param name="page" value="${p}"></c:param>
							</c:url>
							<a href="${pageUrl}">${p}</a>
						</c:forEach>
						<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount}">
							<c:url var="pageUrl" value="/notice/search.do">
								<c:param name="searchCondition" value="${paramMap.searchCondition}"></c:param>
								<c:param name="searchKeyword" value="${paramMap.searchKeyword}"></c:param>
								<c:param name="page" value="${pInfo.endNavi+1}"></c:param>
							</c:url>
							<a id="postNum" href="${pageUrl}">></a> &nbsp;
						</c:if>
					</div>
				</form>
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
	        function noticeSearch(){
	        	const searchValue = document.getElementById("searchPost").value;
	        	if(searchValue != null){
	        		const form = document.searchForm;
					form.submit();
	        	}else{
	        		alert("검색할 내용을 입력해주세요.");
	        	}
	        }
	    </script>
	</body>
</html>